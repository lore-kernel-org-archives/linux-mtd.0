Received: from smtp-4.hut.fi ([130.233.228.94] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173G7w-0003a0-00
	for <linux-mtd@lists.infradead.org>; Thu, 02 May 2002 13:56:04 +0100
Received: from kosh.hut.fi (kosh.hut.fi [130.233.228.10])
	by smtp-4.hut.fi (8.12.3/8.12.3) with ESMTP id g42Cu2kG001653
	for <linux-mtd@lists.infradead.org>; Thu, 2 May 2002 15:56:02 +0300
Received: (from jlavi@localhost)
	by kosh.hut.fi (8.9.3/8.9.3) id PAA21218
	for linux-mtd@lists.infradead.org; Thu, 2 May 2002 15:56:02 +0300 (EET DST)
Date: Thu, 2 May 2002 15:56:02 +0300
From: Jarkko Lavinen <jlavi@iki.fi>
To: MTD List <linux-mtd@lists.infradead.org>
Subject: Benchmarking JFFS2
Message-ID: <20020502155602.A8801@kosh.hut.fi>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I have been running simple benchmark program that is based on over 10
years old Byte Unix file-system benchmark. I have modified the program
to measure time using gettimeofday(), report throughput better, collect
latency profiles and report about memory consumption.

I have then measured the write throughput relation to the block
size. I am using embedded device with Arm9 CPU @ 120 Mhz, 8MB of ram
and Intel 4MiB NOR flash (28F320B3T) and kernel 2.4.15. My JFFS2 code
is from CVS snapshot in February 2002 and may be too old as well as
the kernel.

I am attaching the test program, sample parameters and a figure of
results seen on particular device. The figure shows two curves. In the
first curve, an upside down "V" is show. In another curve there is a
bent "S" shape.

I first tried running the benchmark runs in sequence, with random
data. The best performance 27000 bytes/s was achieved using blocks
sizes of 1024 +- 512 bytes. With block size of 4KiB the performance is
only 50% of the peak throughput.

Then I run the test using natively formatted file-system. I erased the
flash partition, then mounted it, unmounted and then again mounted
it. After that I run only single benchmark run so that the file
created didn't fill the file-system and no overwriting occurred nor
garbage was produced. The performance increased steadily and at block
size multiples of 4KiB achieved about 56000 bytes/s. The raw writing
speed through /dev/mtd0 is 67000 B/s

Question 1:

Is the lack of performance at higher block sizes normal?

Question 2:

Is the lack of performance at higher blocks sizes due to garbage
collection?


I have also tried to run the tests using linear data that compresses
easily. I have encountered repeatedly very low memory and out of
memory condition and messages like "Memory fail", "deflateInit failed"
and when the memory really runs out repeated "Out of memory". I don't
think a benchmark program should be able to bring the system to its
knwws simply by exercising the file-system. I wouldn't bet on the
stability and maturity of the embedded device either.

To bring out this behavior I run the test with blocks sizes of 1K to
128K with proportional steps. Typically somewhere around 2K I start to
see first messages and at 4 KiB the system has run out of memory. It
is not enough to run single benchmark alone but effect seems to be
cumulative and requires sustained loading of the file-system.

Regards,
Jarkko Lavinen


------------------------------------------------------------------------------
Some output from the program when memory problems occur:

Running fstime 60 seconds, 1722 byte block size, linear data, max size 17500
Write test: 61.4s elapsed, 1218 blocks, 2.00 MB @ 33.4 Kbytes/sec written.
Read test: 60.0s elapsed, 628782 blocks, 1.01 GB @ 17.2 Mbytes/sec read.
Copy test: Memory fault

Running fstime 60 seconds, 3444 byte block size, linear data, max size 17500
Write test: 61.5s elapsed, 821 blocks, 2.70 MB @ 44.9 Kbytes/sec written.
Read test: 60.0s elapsed, 330471 blocks, 1.06 GB @ 18.1 Mbytes/sec read.
Copy test: deflateInit failed
deflateInit failed
deflateInit failed
60.2s elapsed, 1086 blocks, 3.57 MB @ 60.7 Kbytes/sec copied.
# 3444 45976.000000 18969034.000000 62160.281250 1777664 5234688 24576 2445312 1908736 5103616 24576 4820992 1581056 5431296 24576 5226496 2232320 4780032 24576 4587520 2232320 4780032 24576 2392064

Running fstime 60 seconds, 4096 byte block size, linear data, max size 17500
Write test: 60.8s elapsed, 1739 blocks, 6.79 MB @ 114 Kbytes/sec written.
Read test: 60.0s elapsed, 19406 blocks, 75.8 MB @ 1.26 Mbytes/sec read.
deflateInit failed
Copy test: deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
Out of Memory: Killed process 8 (sh).
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
Out of Memory: Killed process 8 (sh).
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
deflateInit failed
Out of Memory: Killed process 8 (sh).
Out of Memory: Killed process 8 (sh).
Out of Memory: Killed process 8 (sh).

--9jxsPFA5p3P2qPhR
Content-Type: image/png
Content-Disposition: attachment; filename="combined.png"
Content-Transfer-Encoding: base64

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
AAAAAElFTkSuQmCC

--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="fstime.c"

/* fstest.c. baed on old Byte Unix filsystem bechmark */

#include <stdio.h>
#include <signal.h>
#include <errno.h>
#include <sys/time.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>

#define SECONDS      10
#define BUFF_SIZE    131072
#define BLOCK_SIZE   1024 /* default block size */
#define MAX_BLOCKS   2000  /* max number of BUFF_SIZE blocks in file */
#define MAX_SIZE     3584  /* Some default flash size limit */
#define LATENCYSCALE 6
#define FILE0        "testfile0"
#define FILE1        "testfile1"

/* Globals */
int  block_size = BLOCK_SIZE;
int  max_size =   MAX_SIZE;
int  max_blocks = MAX_BLOCKS;
int  seconds    = SECONDS;
int  sigalarm   = 0;
int  verbose    = 0;

char buf[BUFF_SIZE];
int  latencylogging = 0;
int  fd0, fd1;
unsigned w_latencies[LATENCYSCALE][100], 
  c_latencies[LATENCYSCALE][100];

struct fs_stat_st {
  float speed;
  unsigned long used[4];
} w_stat, r_stat, c_stat;

int w_test(void);
int r_test(void);
int c_test(void);
void stop_count(int);
void clean_up(int prob);

float elapsed_seconds(struct timeval *start, struct timeval *end)
{
  float secs = (end->tv_sec - start->tv_sec) + 
    (end->tv_usec - start->tv_usec) / 1000000.0;
  if (secs < 0) secs = 0.0;
  return secs;
}

static void floatprint(FILE *fp, float f, int decimals)
{
  char fmt[10];
  int intdigits;

  if (f >= 100.0)
    intdigits=3;
  else if(f >= 10.0)
    intdigits=2;
  else
    intdigits=1;
		
  decimals -= intdigits;
  if (decimals < 0)
    decimals = 0;
  sprintf(fmt, "%%.%df ", decimals);	
  fprintf(fp, fmt, f);
}

static void floatscaleprint(FILE *fp, float f, int decimals)
{
  if (f >= 1024*1024*1024.0) {
    floatprint(stderr, f/(1024*1024*1024.0), decimals);
    fputc('G', stderr);
  } else if (f >= 1024*1024.0) {
    floatprint(stderr, f/(1024*1024.0), decimals);
    fputc('M', stderr);
  } else if (f >= 1024.0) {
    floatprint(stderr, f/1024.0, decimals);
    fputc('K', stderr);
  } else floatprint(stderr, f, decimals);
}

void skipff(FILE *fp)
{
  int c;
	
  c = getc(fp);
  while (c != EOF && c != '\n')
    c = getc(fp);
}

static void freemem(unsigned long *used)
{
  FILE *fp;
  int n;
	
  if (used == NULL)
    return;

  if ((fp = fopen("/proc/meminfo", "r")) == NULL) {
    fprintf(stderr, "Cannot open /proc/meminfo\n");
    exit(10);
  }

  skipff(fp);

  n = fscanf(fp, "Mem: %*u %lu %lu %*u %lu %lu",
	     &used[0], &used[1], &used[2], &used[3]);

  if (n >= 4) {
    used[1] += used[2] + used[3];
    used[0] -= used[2] + used[3];
  }

  fclose(fp);
}

static void report(float elapsed, int n_blocks, char *opdonename,
		   struct fs_stat_st *stat)
{
  float size = ((float) n_blocks * block_size);
  float speed = size / elapsed;

  if (verbose) {
    fprintf(stderr, "%.1fs elapsed, %d blocks, ",
	    elapsed, n_blocks);

    floatscaleprint(stderr, size, 3);
    fprintf(stderr,"B @ ");

    floatscaleprint(stderr, speed, 3);
    fprintf(stderr, "bytes/sec %s.\n", opdonename);
  }

  if (stat != NULL) {
    stat->speed = speed;
    freemem(stat->used);
  }
	       
  return;
}

static void loglatency(unsigned latencies[LATENCYSCALE][100],
		       struct timeval *before,
		       struct timeval *after)
{
  long usecs = (after->tv_sec - before->tv_sec)*1000000+
    (after->tv_usec - before->tv_usec);
  unsigned ix;

  if (usecs < 0)
    usecs = 0;

  if (usecs < 1000) { /* below 1 ms */
    ix = usecs / 10; /* max 990 us => 99 */
    latencies[0][ix]++;
  } else if (usecs < 10000) { /* 1 .. 10 ms */
    ix = usecs / 100; /* min 1000 us, max 9900 us  */
    latencies[1][ix]++;
  } else if (usecs < 100000) { /* 10.0 .. 99.9 ms */
    ix = usecs / 1000; /* max 99000 us */
    latencies[2][ix]++;
  } else if (usecs < 1000000) { /* 100 .. 999 ms */
    ix = usecs / 10000; /* min 100 000 max 990 000 us */
    latencies[3][ix]++;
  } else if (usecs < 10000000) { /* 1.. 9.9s s */
    ix = usecs / 100000; /* max 9 900 000 us */
    latencies[4][ix]++;
  } else { /* 10 .. 999 s */
    ix = usecs / 1000000; /* max 99 0900 000 us */
    if (ix > 99)
      ix = 99 ;
    latencies[5][ix]++;
  }
}

void latencystats(char *name, unsigned latencies[LATENCYSCALE][100])
{
  float lat,sum = 0.0;
  float min = 1e6, max = 0.0;
  unsigned cnt = 0, medcnt = 0;
  int i, j;
  char *fmt[] = {"%.2f %u\n", "%.1f %u\n", "%.0f %u\n"};
  float mul[LATENCYSCALE] = {0.01, 0.1, 1.0, 10, 100, 1000}; 
  float prev, median=-1;
	
  printf("Latency profile for %s\n", name);

  for(j = 0; j < LATENCYSCALE; j++) {
    char *s = fmt[j < 2 ? j : 2 ];

    /* The first latency array covers 0..990 us with 10us granularity,
       the next 1.0 .. 9.9 ms with 0.1ms granularty, then 10 .. 99 ms with 1ms
       granularty, then 100 .. 990 with 10 ms and so on. */
    for(i = (j > 0 ? 10 : 0); i < 100; i++)
      if (latencies[j][i]) {
	lat = i * mul[j];
	sum += lat*latencies[j][i];
	cnt += latencies[j][i];
	if (lat < min)
	  min = lat;
	if (lat > max)
	  max = lat;

	printf(s, lat, latencies[j][i]);
      }	
  }

  if (cnt > 0) {		
    prev=0;
    for(j = 0; j < LATENCYSCALE; j++) {
      for(i = (j > 0 ? 10 : 0); i < 100; i++) {
	if ((medcnt + latencies[j][i])*2 > cnt) {
	  median = (prev*medcnt + 
		    (i+1)*mul[j]*(cnt - medcnt)) / cnt;
	  goto loopout;
	}
	medcnt += latencies[j][i];
	prev = i*mul[j];
      }
    }
  loopout:

    printf("Avg latency:     %9.3g ms\n", sum / cnt);
    printf("Median latency:  %9.3g ms\n", median);
    printf("Minimum latency: %9g ms\n", min);
    printf("Maximum latency: %9g ms\n", max);
  }
}



/******************** MAIN ****************************/

int main(int argc, char *argv[])
{
  int random = 0;
  unsigned long begin[4], end[4];
  int i, c;
  char *dir = NULL;
	
  char *usage="fstime [-t seconds] [-b blocks] [-d dir] [-m max size]\n";

  do {
    /* Use posixly correct flag '+' */
    c = getopt (argc, argv, "b:t:d:m:vrh?l");
    switch (c) {
    case -1:
      break;
    case 'v':
      verbose++;
      break;
    case 'b':
      block_size = atoi(optarg);
      break;
    case 'd':
      dir=optarg;
      break;

    case 't':
      seconds = atoi(optarg);
      break;
    case 'r':
      random=1;
      break;
    case 'm':
      max_size=atoi(optarg);
      break;
    case 'l':
      latencylogging = 1;
      break;
    case 'h':
    case '?':
      fputs(usage, stderr);
      exit(0);
	
    default:
      printf ("Unknown option '%c'\n", c);
      break;
    }
  } while (c != -1);

  /**** initialize ****/
  if (seconds <= 0) {
    fprintf(stderr, "No time given\n");
    exit(1);
  }
	
  if (dir == NULL) {
    fprintf(stderr, "No test directory given\n");
    exit(1);
  }
  if (chdir(dir) == -1) {
    perror("fstime: chdir");
    exit(1);
  }

  if (block_size <= 0 || block_size > BUFF_SIZE) {
    fprintf(stderr, 
	    "Illegal blocksize. Must be +- 1..%d\n",
	    BUFF_SIZE);
    exit(1);
  }

  max_blocks = max_size*1024 / block_size;

  freemem(&begin[0]);

  if (verbose)
    printf("Running fstime %d seconds, %d byte block size, %s data, max size %d\n",
	   seconds,
	   block_size,
	   random?"random":"linear",
	   max_size);
  
  if ((fd0 = open(FILE0, O_CREAT | O_TRUNC | O_RDWR, 0666)) == -1) {
    perror("fstime: open");
    exit(1);
  }

  if ((fd1 = open(FILE1, O_CREAT|O_TRUNC|O_RDWR, 0666)) == -1) {
    perror("fstime: open");
    exit(1);
  }

  /* fill buffer with random or linear data */
  for (i = 0; i < BUFF_SIZE; i++) {
    if (random)
      buf[i] = rand() & 0xff;
    else
      buf[i] = i & 0xff;
  }
	
  if (latencylogging) 
    for (i = 0; i < 100; i++) {
      int j;
      for(j = 0; j < LATENCYSCALE; j++) {
	w_latencies[j][i] = 0;
	c_latencies[j][i] = 0;
      }
    }
	

  signal(SIGKILL, clean_up);
  if(w_test() || r_test() || c_test()) { 
    clean_up(0);
    exit(1);
  }
  
  clean_up(0);
  freemem(&end[0]);
  
  if (verbose > 1) 
    printf("Fields:\t 1  blocksize\n"
	   "\t 2 write speed\n"
	   "\t 3 read speed\n"
	   "\t 4 copy speed\n"
			    
	   "\t 5 bytes available at begin before opening files\n"
	   "\t 6 bytes used at begin\n"
	   "\t 7 bytes buffered at begin\n"
	   "\t 8 bytes cached at begin\n"
			    
	   "\t 9 bytes used after write test\n"
	   "\t10 bytes available after write test\n"
	   "\t11 bytes buffered after write test\n"
	   "\t12 bytes cached after write test\n"
			
	   "\t13 bytes used after read test\n"
	   "\t14 bytes available after read test\n"
	   "\t15 bytes buffered after read test\n"
	   "\t16 bytes cached after read test\n"
			
	   "\t17 bytes used after copy test\n"
	   "\t18 bytes available after copy test\n"
	   "\t19 bytes buffered after copy test\n"
	   "\t20 bytes cached after copy test\n"
			
	   "\t21 bytes used at the end after closing files\n"
	   "\t22 bytes available at the end\n"
	   "\t23 bytes buffered at the end\n"
	   "\t24 bytes cached at the end\n");

  printf("# %d %f %f %f ", 
	 block_size, w_stat.speed, r_stat.speed, c_stat.speed);

  printf("%lu %lu %lu %lu ",
	 begin[0], begin[1], begin[2], begin[3]);

  printf("%lu %lu %lu %lu ",
	 w_stat.used[0],
	 w_stat.used[1],
	 w_stat.used[2],
	 w_stat.used[3]);

  printf("%lu %lu %lu %lu ",
	 r_stat.used[0],
	 r_stat.used[1],
	 r_stat.used[2],
	 r_stat.used[3]);

  printf("%lu %lu %lu %lu ",
	 c_stat.used[0],
	 c_stat.used[1],
	 c_stat.used[2],
	 c_stat.used[3]);

  printf("%lu %lu %lu %lu\n",
	 end[0], end[1], end[2], end[3]);

  if (latencylogging) {
    latencystats("write latencies in the write test", w_latencies);
    latencystats("write latencies in the copy test",  c_latencies);
  }

  exit(0);
}

/* write test */
int w_test() 
{
  long n_blocks = 0L;
  int f_blocks;
  struct timeval start, end, l0, l1;
  int status;

#ifdef USE_SYNC 
  sync();
  sleep(5); /* to insure the sync */
#endif

  if (verbose)
    fprintf(stderr, "Write test: ");
  signal(SIGALRM,stop_count);
  sigalarm = 0; /* reset alarm flag */
  alarm(seconds);
  gettimeofday(&start, NULL);
  while(!sigalarm) {
      /* On first alarm may break the loop before complete. On
	 further rounds must go through */
      for(f_blocks=0; 
	  f_blocks < max_blocks &&
	    (!sigalarm || n_blocks >= max_blocks);
	  ++f_blocks) {
	  if (latencylogging) {
	    gettimeofday(&l0, NULL);
	    status = write(fd0, buf, block_size);
	    gettimeofday(&l1, NULL);
	    loglatency(w_latencies, &l0, &l1);
	  } else
	    status = write(fd0, buf, block_size);

	  if (status < 0) {
	    if (errno != EINTR) {
	      perror("fstime: write");
	      return(-1);
	    } else stop_count(0);
	  }
	  ++ n_blocks;
	}
      lseek(fd0, SEEK_SET, 0); /* rewind */
    }
  /* stop clock */
  gettimeofday(&end, NULL);
  report(elapsed_seconds(&start, &end), n_blocks, "written",
	 &w_stat);
  return(0);
}

/* read test */
int r_test()
{
  long n_blocks = 0L;
  int n_read;
  extern int errno;
  struct timeval start, end;
  
  if (verbose)
    fprintf(stderr, "Read test: ");

  /* rewind */
#ifdef USE_SYNC
  sync();
  sleep(10+seconds/2);
#endif

  errno = 0;
  lseek(fd0, SEEK_SET, 0);

  signal(SIGALRM,stop_count);
  sigalarm = 0; /* reset alarm flag */
  alarm(seconds);
  gettimeofday(&start, NULL);
  while(!sigalarm) {
    /* read while checking for an error */
    n_read = read(fd0, buf, block_size);
    if (n_read == 0) {
      lseek(fd0, SEEK_SET, 0);  /* rewind at end of file */
      continue;
    } else if (n_read < 0)
      switch(errno) {
      case EINVAL:
	lseek(fd0, SEEK_SET, 0);  /* rewind at end of file */
	continue;
	break;
      case EINTR:
	stop_count(0);
	break;
      default:
	perror("fstime: read");
	return(-1);
	break;
      }
    ++ n_blocks;
  }
  /* stop clock */
  gettimeofday(&end, NULL);
  report(elapsed_seconds(&start, &end), n_blocks, "read", &r_stat);
  return(0);
}


/* copy test */
int c_test() 
{
  long n_blocks = 0L;
  struct timeval start, end, l0, l1;
  int n_read, n_written;

  if (verbose)
    fprintf(stderr, "Copy test: ");
  /* rewind */
#ifdef USE_SYNC
  sync();
  sleep(10+seconds/2); /* to insure the sync */
#endif
  lseek(fd0, SEEK_SET, 0);

  signal(SIGALRM,stop_count);
  sigalarm = 0; /* reset alarm flag */
  alarm(seconds);
  gettimeofday(&start, NULL);
  while(!sigalarm) {
    n_read = read(fd0, buf, block_size);
    if (n_read == 0) { /* EOF */
      lseek(fd0, SEEK_SET, 0);  /* rewind at end of file */
      lseek(fd1, SEEK_SET, 0);  /* rewind the output as well */
      continue;
    } else if (n_read < 0) {
      switch(errno) {
      case 0:
      case EINVAL:
	  lseek(fd0, SEEK_SET, 0);  /* rewind at end of file */
	  lseek(fd1, SEEK_SET, 0);  /* rewind the output as well */
	  continue;
	  break;
      case EINTR:
	stop_count(0);
	break;
      default:
	fprintf(stderr, "fstime: copy read (%d): %s\n",
		errno, strerror(errno));
	return(-1);
	break;
      }
    }

    if (latencylogging) {
      gettimeofday(&l0, NULL);
      n_written = write(fd1, buf, block_size);
      gettimeofday(&l1, NULL);
      loglatency(c_latencies, &l0, &l1);
    } else
      n_written = write(fd1, buf, block_size);
    
    if (n_written < 0) {
      if (errno == ENOSPC) {
	printf("fstime: copy write: %s at block %ld, max blocks %d.\n",
	       strerror(errno), n_blocks, max_blocks);
	system("df .");
	break; /* FS full */
      } else if (errno != EINTR) {
	fprintf(stderr, "fstime: copy write (%d): %s\n",
		errno, strerror(errno));
	return(-1);
      } else stop_count(0);
    } else
      ++ n_blocks;
  }
  /* stop clock */
  gettimeofday(&end, NULL);
  report(elapsed_seconds(&start, &end), n_blocks, "copied", &c_stat);
  return(0);
}

void stop_count(int i)
{
  sigalarm = 1;
}

void clean_up(int prob)
{  
  if (close(fd0) || close(fd1))
    perror("fstime: close");

  if (unlink(FILE0) || unlink(FILE1))
    perror("fstime: unlink");
}

--9jxsPFA5p3P2qPhR
Content-Type: application/x-sh
Content-Disposition: attachment; filename="test-rnd.sh"

# Benchmark run using linear data.
# Options 60 seconds, test directory /mnt, max filesize 1750 KiB, 
# random data, block size 1024, verbose and latency logging on.
# 413 samples, 10.3 hours 
fstime -t 60 -d /mnt -m 1750 -r -b 1 -v -l  -v
fstime -t 60 -d /mnt -m 1750 -r -b 2 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 3 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 4 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 5 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 6 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 7 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 8 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 9 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 10 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 11 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 12 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 13 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 14 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 15 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 16 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 17 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 18 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 19 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 20 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 21 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 22 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 23 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 24 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 25 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 26 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 27 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 28 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 29 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 30 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 31 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 32 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 33 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 34 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 35 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 36 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 37 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 38 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 39 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 40 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 41 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 42 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 43 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 44 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 45 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 46 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 47 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 48 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 49 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 50 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 52 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 53 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 54 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 55 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 56 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 57 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 59 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 60 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 61 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 63 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 64 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 65 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 67 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 68 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 70 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 71 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 73 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 74 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 76 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 78 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 79 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 81 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 83 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 85 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 87 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 89 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 91 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 92 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 95 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 97 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 99 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 101 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 103 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 105 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 108 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 110 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 112 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 115 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 117 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 120 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 123 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 125 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 128 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 131 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 134 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 137 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 140 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 143 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 146 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 149 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 152 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 156 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 159 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 162 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 166 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 170 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 173 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 177 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 181 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 185 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 189 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 193 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 197 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 202 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 206 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 211 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 215 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 220 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 225 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 230 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 235 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 240 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 245 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 251 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 256 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 262 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 267 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 273 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 279 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 285 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 292 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 298 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 304 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 311 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 318 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 325 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 332 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 339 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 347 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 354 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 362 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 370 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 378 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 386 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 395 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 403 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 412 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 421 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 431 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 440 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 450 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 459 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 470 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 480 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 490 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 501 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 512 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 523 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 535 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 546 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 558 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 571 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 583 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 596 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 609 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 622 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 636 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 650 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 664 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 679 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 693 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 709 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 724 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 740 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 756 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 773 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 790 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 807 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 825 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 843 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 861 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 880 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 899 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 919 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 939 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 960 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 981 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1002 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1024 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1046 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1069 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1093 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1117 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1141 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1166 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1192 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1218 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1244 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1272 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1300 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1328 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1357 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1387 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1417 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1448 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1480 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1512 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1545 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1579 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1614 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1649 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1685 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1722 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1760 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1798 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1838 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1878 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1919 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 1961 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 2004 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 2048 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 2093 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 2139 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 2186 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 2233 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 2282 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 2332 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 2383 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 2435 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 2489 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 2543 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 2599 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 2656 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 2714 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 2774 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 2834 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 2896 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 2960 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 3025 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 3091 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 3158 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 3228 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 3298 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 3371 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 3444 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 3520 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 3597 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 3676 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 3756 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 3838 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 3922 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 4008 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 4096 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 4186 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 4277 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 4371 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 4467 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 4565 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 4664 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 4767 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 4871 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 4978 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 5087 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 5198 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 5312 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 5428 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 5547 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 5668 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 5793 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 5919 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 6049 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 6182 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 6317 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 6455 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 6597 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 6741 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 6889 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 7039 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 7194 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 7351 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 7512 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 7677 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 7845 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 8016 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 8192 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 8371 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 8555 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 8742 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 8933 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 9129 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 9329 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 9533 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 9742 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 9955 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 10173 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 10396 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 10624 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 10856 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 11094 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 11337 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 11585 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 11839 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 12098 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 12363 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 12634 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 12910 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 13193 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 13482 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 13777 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 14079 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 14387 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 14702 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 15024 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 15353 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 15689 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 16033 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 16384 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 16743 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 17109 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 17484 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 17867 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 18258 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 18658 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 19066 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 19484 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 19911 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 20347 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 20792 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 21247 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 21713 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 22188 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 22674 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 23170 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 23678 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 24196 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 24726 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 25268 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 25821 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 26386 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 26964 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 27554 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 28158 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 28774 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 29405 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 30048 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 30706 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 31379 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 32066 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 32768 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 33486 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 34219 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 34968 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 35734 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 36516 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 37316 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 38133 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 38968 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 39821 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 40693 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 41584 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 42495 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 43425 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 44376 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 45348 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 46341 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 47356 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 48393 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 49452 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 50535 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 51642 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 52773 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 53928 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 55109 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 56316 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 57549 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 58809 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 60097 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 61413 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 62757 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 64132 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 65536 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 66971 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 68438 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 69936 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 71468 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 73032 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 74632 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 76266 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 77936 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 79642 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 81386 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 83169 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 84990 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 86851 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 88752 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 90696 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 92682 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 94711 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 96785 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 98905 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 101070 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 103283 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 105545 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 107856 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 110218 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 112631 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 115098 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 117618 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 120194 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 122825 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 125515 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 128263 -v -l 
fstime -t 60 -d /mnt -m 1750 -r -b 131072 -v -l 

--9jxsPFA5p3P2qPhR
Content-Type: application/x-sh
Content-Disposition: attachment; filename="test-lin.sh"

# Benchmark run using linear data.
# Options 60 seconds, test directory /mnt, max filesize 17500 KiB, 
# block size 1024, verbose and latency logging on.
fstime -t 60 -d /mnt -m 17500 -b 1024 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 1218 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 1448 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 1722 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 2048 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 2435 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 2896 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 3444 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 4096 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 4871 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 5793 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 6889 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 8192 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 9742 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 11585 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 13777 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 16384 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 19484 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 23170 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 27554 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 32768 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 38968 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 46341 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 55109 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 65536 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 77936 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 92682 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 110218 -v -l 
fstime -t 60 -d /mnt -m 17500 -b 131072 -v -l 

--9jxsPFA5p3P2qPhR--
