Received: from ipn36372-d52026.cidr.lightship.net ([216.204.15.186]
	helo=zeus.bittware.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JOz9i-0000aq-2l
	for linux-mtd@lists.infradead.org; Tue, 12 Feb 2008 17:43:00 +0000
Message-ID: <47B1D5A7.4000509@bittware.com>
Date: Tue, 12 Feb 2008 12:21:43 -0500
From: DMcLeod <dmcleod@bittware.com>
MIME-Version: 1.0
To: Will Wagner <will_wagner@carallon.com>
Subject: Re: First access to mounted jffs2 partition is slow
References: <47B1840D.1010702@carallon.com>
In-Reply-To: <47B1840D.1010702@carallon.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Will Wagner wrote:
> Hello,
>
> I have an ARM11 system with a JFFS2 partition in NAND flash. It works 
> but the first time it is accessed after mounting it can be very slow.
>
> These are the steps I am performing:
>
> # flash_eraseall /dev/mtd4
> Erasing 128 Kibyte @ 5fe0000 -- 99 % complete.
> # time mount /dev/mtdblock4 /flash -t jffs2
> real    0m 1.25s
> user    0m 0.01s
> sys     0m 0.13s
> # time ls flash		- with an empty filsystem, this takes no time
> real    0m 0.00s
> user    0m 0.01s
> sys     0m 0.00s
> # cp /sdcard/bigfile flash/	- bigfile is ~8MB
> # umount /flash
> # time mount /dev/mtdblock4 /flash -t jffs2
> real    0m 2.63s
> user    0m 0.01s
> sys     0m 0.50s
> # time ls flash		- first time we do this it takes a long time
> bigfile
> real    0m 11.79s
> user    0m 0.00s
> sys     0m 0.18s
> # time ls flash		- subsequent reads are fast
> bigfile
> real    0m 0.00s
> user    0m 0.01s
> sys     0m 0.00s
>
>
> It was my understanding that the only slow step should be mounting the 
> partition when it checks the entire filesystem. Is that correct? Is it 
> normal that the first file operation on the partition is slow and then 
> all others are fast? That the mount is slow is not a problem but would 
> be good if we could make the first access faster even if it means the 
> mount must get slower.
>
> This is using Linux 2.6.19.2 with uClibc 0.9.29, busybox 1.9.0 and 
> mtd-utils 1.1.0
>
> Thanks,
>
> Will.
>
>   

We fought that same exact problem for some time. It turned out being 
that we had set the verbosity (something like FS_JFFS2_DEBUG=2) to the 
highest setting. It literally took 30s or more to do an 'ls' the first 
time.

HTH


--------------------------------------------------
Dennis McLeod
dmcleod@bittware.com
http://www.bittware.com
(603) 226 0404 x514
--------------------------------------------------
