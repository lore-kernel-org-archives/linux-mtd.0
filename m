Received: from 207.88.121.47.ptr.us.xo.net ([207.88.121.47]
	helo=ba.realmsys.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ELCNA-00030h-Bk
	for linux-mtd@lists.infradead.org; Fri, 30 Sep 2005 00:20:00 -0400
From: Peter Grayson <pgrayson@realmsys.com>
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
In-Reply-To: <loom.20050929T193349-733@post.gmane.org>
References: <433A640D.6030200@cetrtapot.si> <433BA402.3040703@inf.u-szeged.hu>
	<20050929093433.GB18741@wohnheim.fh-wedel.de>
	<433BB979.7010904@inf.u-szeged.hu> <433BBB19.9060905@yandex.ru>
	<1128010237.6926.10.camel@localhost.localdomain>
	<loom.20050929T193349-733@post.gmane.org>
Content-Type: text/plain
Date: Thu, 29 Sep 2005 22:19:44 -0600
Message-Id: <1128053984.6926.59.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-09-29 at 17:45 +0000, Sergei Sharonov wrote:
> Plese define usable. Yes, it does make flash available for read operations
> fast but the first time you try to write to it you will be blocked for, I'd
> say, anywhere from 5 minutes to a few hours depending on how the files
> were written and assuming full 256 MByte filesystem.

This has not been my experience. By usable I mean that a 500 MB
filesystem with a couple hundred megabytes in use mounts and is usable
for reads and writes in a few seconds.

> Could you please provide time to first write for 256, 512 and 1024 MByte
> full filesystems? I presume MB stands for MByte, not Mbit ;-)

MB is megabyte.

This is the time to mount a freshly erased partition:

# time mount /mnt/mtdb2
real    0m 3.48s
user    0m 0.00s
sys     0m 1.78s

I then exploded a kernel source tarball into the partition (this took
about 2.5 minutes, but that accounts for the time to stream the tarball
to my device via ethernet over USB.

# df -h
Filesystem                Size      Used Available Use% Mounted on
/dev/mtdblock2         1020.0M    228.6M    791.4M  22% /mnt/mtdb2

# time umount /mnt/mtdb2
real    0m 0.73s
user    0m 0.00s
sys     0m 0.49s

I was a little unsure about what you meant by "time to first write".
How's this?:

# time mount /mnt/mtdb2 && \
  time echo "Hello world!" > /mnt/mtdb2/hello.txt
real    0m 1.10s
user    0m 0.00s
sys     0m 1.03s
real    0m 0.01s
user    0m 0.00s
sys     0m 0.00s

# time umount /mnt/mtdb2
real    0m 0.56s
user    0m 0.00s
sys     0m 0.29s

There is not any difference writing to an existing file:

# time mount /mnt/mtdb2 && \
  time echo "# some text" >> /mnt/mtdb2/linux-2.6.13.1/Makefile
real    0m 1.10s
user    0m 0.00s
sys     0m 1.03s
real    0m 0.01s
user    0m 0.00s
sys     0m 0.00s

I then doubled the amount of data in the filesystem.

# time cp -r /mnt/mtdb2/linux-2.6.13.1 /mnt/mtdb2/linux-2.6.13.1-2
real    2m 0.83s
user    0m 5.17s
sys     1m 7.80s

# df -h
Filesystem                Size      Used Available Use% Mounted on
/dev/mtdblock2         1020.0M    431.2M    588.8M  42% /mnt/mtdb2

This yields a linear increase in unmount time, but in absolute terms it
is still small.

# time umount /mnt/mtdb2
real    0m 1.20s
user    0m 0.00s
sys     0m 0.78s

Time to first write again. Mount time is worse:

# time mount /mnt/mtdb2 && \
  time echo "# some text" >> /mnt/mtdb2/linux-2.6.13.1/Makefile
real    0m 3.60s
user    0m 0.00s
sys     0m 3.49s
real    0m 0.01s
user    0m 0.00s
sys     0m 0.00s

Let's double the amount of data in the filesystem again. You can see
that the read and write times stay consistent:

# time cp -r /mnt/mtdb2/linux-2.6.13.1 /mnt/mtdb2/linux-2.6.13.1-3 && \
  time cp -r /mnt/mtdb2/linux-2.6.13.1 /mnt/mtdb2/linux-2.6.13.1-4
real    1m 59.50s
user    0m 4.88s
sys     1m 7.98s
real    2m 2.69s
user    0m 5.08s
sys     1m 10.57s

# df -h
Filesystem                Size      Used Available Use% Mounted on
/dev/mtdblock2         1020.0M    836.2M    183.8M  82% /mnt/mtdb2

Unmount time has stabilized. I've noticed that the garbage collector
seems to add some variance to the unmount times.

# time umount /mnt/mtdb2
real    0m 1.94s
user    0m 0.00s
sys     0m 1.21s

TTFW take 3. Mount times get worse still:

# time mount /mnt/mtdb2 && \
  time echo "# some text" >> /mnt/mtdb2/linux-2.6.13.1/Makefile
real    0m 16.74s
user    0m 0.00s
sys     0m 16.53s
real    0m 0.01s
user    0m 0.00s
sys     0m 0.00s

Hope that covers what you wanted to see. For the record, I am using the
head of mtd cvs with the centralized summary patch applied. EBS and CS
are both enabled.

> Good point.. Can you estimate speedup due to the hw controller?

We can get about 15 MB/s for raw reads and about 6 MB/s for raw writes.
By raw, I mean reading and writing via an mtd character device to/from a
raw partition. I do not know how these numbers compare to other flash
access methods; but bit-banging a flash part directly would have to be
considerably slower and probably very dependent on the CPU speed. My
device has a 384 MHz PowerPC 405 CPU, by the way.

Another advantage to this controller is that it does ECC in hardware and
is capable of doing partial page reads. This means that even thought the
nand flash part I am using has a 2048 byte page size, I can read as
little as 256 bytes (ECC chunk size) at a time. One of the things that
hurts jffs2 performance is that it very often reads small chunks that
are only a fraction of the nand page size. This is why the nand_base
driver caches pages in RAM. I implement a similar chunk caching scheme,
but keep the chunks cached in my controller's buffers; this way I avoid
extra copying of data.

> Most embedded systems cannot rely on proper shutdown. So, IMHO CS is of
> limited use in this respect.

My device is usb powered, but has a small battery so that when the
device looses bus power, it can shutdown cleanly. However, the thing to
remember about centralized summary is that in the unclean shutdown
cases, the mount time is no worse than jffs2 without CS. So even if you
only expect the filesystem to be cleanly unmounted sometimes, CS can be
worth it.

Pete
