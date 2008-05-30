Received: from wa-out-1112.google.com ([209.85.146.179])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K26DA-0008Ps-L7
	for linux-mtd@lists.infradead.org; Fri, 30 May 2008 15:08:09 +0000
Received: by wa-out-1112.google.com with SMTP id v33so3370507wah.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 30 May 2008 08:08:06 -0700 (PDT)
Message-ID: <5ed5c4730805300808v79f7fd7dpe3550cd8fc1b0db5@mail.gmail.com>
Date: Sat, 31 May 2008 00:08:06 +0900
From: "KeunO Park" <lastnite@gmail.com>
To: dedekind@infradead.org
Subject: Re: ubifs, ubiblk(formatted with vfat) and yaffs2 test.
In-Reply-To: <1212155390.31023.140.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <5ed5c4730805292301m558dee30o66f5dd034d594390@mail.gmail.com>
	<1212129223.31023.106.camel@sauron>
	<5ed5c4730805300015o4f757dcbn394c770c2f92566a@mail.gmail.com>
	<1212148942.31023.135.camel@sauron>
	<1212149102.31023.138.camel@sauron>
	<5ed5c4730805300600v33e9c2d1hada32b24953cfaf7@mail.gmail.com>
	<1212155390.31023.140.camel@sauron>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008/5/30, Artem Bityutskiy <dedekind@infradead.org>:
> On Fri, 2008-05-30 at 22:00 +0900, KeunO Park wrote:
> > > But I have to add that of course, YAFFS/JFFS2 are more light-weight
> > > file-system, because they do not maintain the FS index on the flash
> > > media. UBIFS does and this costs extra CPU cycles and extra I/O.
> > >
> >
> > actually I did write & fsync the file during test. :-)
> > anyway thank you for your comment.
>
> Could you please send your test? And how you measure the load average?
>

ok. here is my simple test.

1. make a random dumped file in sdram area.
# cd /dev/shm/tmp
# dd if=/dev/urandom of=test.out bs=1M count=10
because ubifs uses compressor, I made a random data file for test.

2. make another shell script.
# cat test_write.sh
#!/bin/sh
/bin/cp /dev/shm/tmp/test.out /nand_partition
/bin/sync

3. check that there is no other application running.
write down the load avg using 'top'

4. just use 'time' utility to know how long it takes.
# time ./test_write.sh

5. write down the load avg again using 'top'.

using 'top' may be inadaquate choice. but, I think that
this would be helpful more or less.



and, I have another results for you. :-)
it would be interesting.

1. ubifs(LZO) mount stability test
1.1 when ubifs is writing(copy) something in NAND, I cut off the power.
     then check ubifs is all right.
     I tested 100 times. but, ok. there is no problem.
1.2 during mounting ubifs, I cut off the power.
     then check ubifs is all right.
    I tested 100 times. but, no problem. :-)

2. mount speed test
2.1.1 ubiblk partition(90MiB size): right after formatting vfat
real 0m 0.07s
user 0m 0.00s
sys 0m 0.02s
2.1.2 ubiblk partition(90MiB size): copy 6800 files(almost 80MiB),
then check mount speed.
real 0m 0.07s
user 0m 0.00s
sys 0m 0.01s
2.2.1 ubifs(LZO, 90MiB size) : right after formatting ubifs.
real 0m 0.13s
user 0m 0.00s
sys 0m 0.13s
2.2.2 ubifs(LZO, 90MiB size) : copy 6800 files(almost 80MiB), then
check mount speed.
real 0m 0.16s
user 0m 0.00s
sys 0m 0.16s

3.1 while I run 'cp test.out /nand_partition;sync' in ubifs partition
with 6800 files, suddenly I cut off the power. then check the speed in
next mount time.
real 0m 3.64s
user 0m 0.00s
sys 0m 1.32s
3.2 while I run 'cp test.out /nand_partition;sync' in clean ubifs
partition with a few files, suddenly I cut off the power. then check
the speed in next mount time.
real 0m 1.62s
user 0m 0.00s
sys 0m 0.45s


are these results proper?
