From: jlavi@iki.fi (Jarkko Lavinen)
Date: Thu, 13 Feb 2003 14:38:55 +0200
Subject: Benchmarking JFFS2
In-Reply-To: <30397.1043323795@passion.cambridge.redhat.com>
References: <20021017103610.GA13795@kosh.hut.fi> <20020502155602.A8801@kosh.hut.fi> <13211.1020346858@redhat.com> <30397.1043323795@passion.cambridge.redhat.com>
Message-ID: <20030213123855.GA24720@kosh.hut.fi>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Thu, Jan 23, 2003 at 12:09:55PM +0000, David Woodhouse wrote:
> Fancy repeating the test with current CVS? I just committed the 
> oft-discussed code required to avoid decompressing and recompressing nodes 
> which haven't changed -- and to avoid even doing the iget() and building up 
> the node lists for the inodes to which they belong in that case too.

Jan 23 CVS. Latency accumulation around 1 second, after that only sporadic
long latencies. 99.99% of the 1 million writes occurs in less than
1.3 seconds.  Both frequency and time scales are logarithmic.
http://www.hut.fi/~jlavi/jffs2/refpoint_0302_60M+ID_t480w240_l1000000_linux-2.4.19_MTD2301.png

Nov 27 CVS: Latency accumulations at 1, 2, 3 seconds. http://www.hut.fi/~jlavi/jffs2/refpoint_2811_60M_+ID_t480w120_l100000_v2.4.19_CVS2711.png

Comparing November 27 snapshot to 23 January snapshot there seems to
be no difference in the average write throughput (at the block size of
4KiB) but the write latencies and the latency distribution differ. In
the new code latencies longer than 1 second (approx. the time to erase
1 sector) are less frequent. I was still able to catch latencies of
5..10 seconds, but the occurrence of less than 1:100 000.

In dirty file system the benchmark overwrites the file several times
and the overwriting is sequential: write till given file size, seek to
begin, write over till end, seek....  I think the garbage collection
likes this sequential overwriting.  There will be plenty of very dirty
erase sectors with very little live data and GC doesn't have to move
much live data to other erase sectors.

Because of sequential overwriting the cost of copying live data in GC
is negligible. I have also tried overwriting at random locations
instead on sequential order.

Here is another comparison of the results:
+--------------------+---------------+-------+--------+------+------+
|                    | Avg write spd |  Avg  | 99.9%  |  Max |      |
|                    |           B/sa|  lat  | < lat  |  lat |  Cnt |
+--------------------+---------------+-------+--------+------+------+
| Nov27, sequential  | 39000 / 39300 | 104ms | 3200ms | 3.4s | 100k |
| Nov27, seq, no gcd | 39100 / 39100 | 104ms | 3100ms | 3.1s |  10k |
| Jan23, sequential  | 38800 / 38700 | 105ms | 1000ms |  10s |   1M |
| Jan23, seq, no gcd | 38200 / 38900 | 105ms | 1200ms | 7.4s |   1M |
| Nov27, random seek | 38000 / 40000 | 102ms | 3600ms | 4.0s |  10K |
| Jan23, random seek | 38300 / 42600 |  97ms | 1200ms | 1.3s |  10k |
+--------------------+---------------+-------+--------+------+------+

There are two writing speeds mentioned in the table. The first is
without latency logging and the second is with latencies logged.
Latencies are measured by calling gettimeofday() once per loop pass.
The "Cnt" stands for how many times write() was called.

In sequential overwrite tests the error in measurement is +- 2% and if
the measurement is repeated several times the standard deviation is
1%.  With the random seek tests I haven't measured the error.

It is interesting to notice that the throughput increases about 5% if
the latencies are measured with updates@random locations.

One can grow the maximum latency in the tests by running the benchmark 
longer.  A short maximum latency means either the writes really are 
executed shorter or that the benchmark program was not run long enough.

Jarkko Lavinen
