Received: from smtp-1.hut.fi ([130.233.228.91] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1828Sj-00035r-00
	for <linux-mtd@lists.infradead.org>; Thu, 17 Oct 2002 12:05:09 +0100
Date: Thu, 17 Oct 2002 13:36:10 +0300
From: Jarkko Lavinen <jlavi@iki.fi>
To: MTD List <linux-mtd@lists.infradead.org>, jffs-dev@axis.com
Cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Benchmarking JFFS2
Message-ID: <20021017103610.GA13795@kosh.hut.fi>
References: <20020502155602.A8801@kosh.hut.fi> <13211.1020346858@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13211.1020346858@redhat.com>
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

On Thu, May 02, 2002 at 02:40:58PM +0100, David Woodhouse wrote:

[ JFFS2 dirty fs poor performance discussd ]

> Neither of the above are valid excuses for the fact that write performance
> on a dirty file system sucks royally. There are some things we can do about
> that.

[ three optimizations suggested ]


In May I was using a prototype board running on ARM 925T (Omap). Since
then I have changed the testing to TI EVM 1510 evaluation system
available from TI. In the spring I was using 120 MHz, now 60MHz. The
flash was then 28F320B3 Strataflash chip, now it is Intel 28F128
StrataFlash. Also I am now using reasonably new snapshot of JFFS2 from
October 9th.

The performance in last spring:
http://www.hut.fi/~jlavi/jffs2/h_fstime1605combined.png

Please note the block size scale is logarithmic.  Dirty files system
performance peaked at the block size of 600 .. 700 bytes and at
singular point of 4096 bytes.

The performance now with the JFFS2 snapshot from October 9th:
http://www.hut.fi/~jlavi/jffs2/h_14102002_dirtyblocks_2.4.19_CVS0910.png

Please note the block size scale is linear.  The dirty file system
performance follows now very accurately to the clean file system
performance. This is partially due improved measurement accuracy:
longer benchmark time, using warmup pass, setting the benchmark do
equal mount of overwriting among data-points. The dirty file system
performance measured this way fluctuates +- 1% with 480 second
benchmark time.

Latencies:
http://www.hut.fi/~jlavi/jffs2/refpoint_1610_60M_+ID_t480w120_l100000_v2.4.19_CVS0910.png

This time double logarithmic chart.  I don't see over 10 second
latencies anymore. In the latency benchmark the maximum latency of
3.3s occured once among 100 000 samples.

Performance fluctuation due to GC:
http://www.hut.fi/~jlavi/jffs2/gc_10102002_scatterdirty_2.4.19_MTD0910.png

The sample is short but shows the general pattern of how the background GC 
thread does its work.

Of course measuring write throughput is just one side of performance
but I think it is fair to say JFFS2 write performane on dirty file
system with low performance CPUs has improved dramatically since last
spring.

Jarkko Lavinen
