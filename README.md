# Lindsay Harris
## CS50 Winter 2023, Lab 1

GitHub username: lindsharris11

## B 
```bash
ln -s /thayerfs/home/f004h1m/cs50-dev/shared/COVID-19/data_tables/vaccine_data/us_data/hourly/vaccine_data_us.csv vaccine_data_us.csv
```


## C 

```bash
head -n 1 vaccine_data_us.csv
```

## D 

```bash
head -n 1 vaccine_data_us.csv | tr , \\n  
```

## E

```bash 
grep -e "New Hampshire" vaccine_data_us.csv
```

## F 

```bash 
grep -e "All" vaccine_data_us.csv | cut -d, -f2-2,10-10
```

## G 
```bash
grep -e "All" vaccine_data_us.csv | sort -rnt, -k 10 | head -n 10| cut -d, -f2-2,10-10 
```

## H 
```bash
grep -e "All" vaccine_data_us.csv | sort -rnt, -k 10 | head -n 10| cut -d, -f2-2,10-10 | sed  's/,/|/' | sed 's/^/|/' | sed 's/$/|/'
```


