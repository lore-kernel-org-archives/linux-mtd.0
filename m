Received: from f43.pav1.hotmail.com ([64.4.31.43] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1893zw-0008RS-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Nov 2002 13:44:04 +0000
From: "vijay vijay" <vijay_peshkar@hotmail.com>
To: joern@wohnheim.fh-wedel.de
Cc: linux-mtd@lists.infradead.org, vijay.peshkar@wipro.com
Subject: Re: mtd2 partition mapping on mtd1?...
Date: Tue, 05 Nov 2002 14:13:47 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F43HNrBBfE0q2TUniNA00011392@hotmail.com>
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

Hello Jörn,

Had tried doing all that. Do not have the log message, will
try again and get back to you. Only remember the crash happening
in cramfs_read -> bread -> ...submit_bh.

About the second query on raw operations:
Being new to Linux, am still trying to grasp the 'user/kernel'
space concepts. I tried my test using __raw_writel() operation
in inode.c itself. Guess that puts me in kernel space right?.
Should it work if tried from user space( build my code as a library,
copy it to filesystem and run from there like other utils(dd)) ?.

Thanks and Regards.
Vijay

>From: Jörn Engel <joern@wohnheim.fh-wedel.de>
>To: vijay vijay <vijay_peshkar@hotmail.com>
>CC: linux-mtd@lists.infradead.org, vijay.peshkar@wipro.com
>Subject: Re: mtd2 partition mapping on mtd1?...
>Date: Tue, 5 Nov 2002 14:28:19 +0100
>
>On Tue, 5 November 2002 11:42:14 +0000, vijay vijay wrote:
> > The fact that am hardcoding my root fs address in cramfs_read
> > instead of picking it up from mtd0(which am able to operate on after
> > bootup) still bothers me. Any (better) way of telling the kernel to
> > pick rootfs from mtd0?. Have tried with root=/dev/mtd0.
> > Am building an initrd image.
>
>Even though mtd is quite another beast, you need a block device when
>mounting an fs. Try root=/dev/mtdblock0.
>
>If this does not work, edit init/main.c or init/do_mounts.c (depending
>on kernel version). Look for root_dev_names and add your
>/dev/mtdblock? to that array.
>
> > One more query:
> > My kernel and another partition will have raw data. What api's to
> > operate on them?. Tried __raw_writel etc., but that doesn't seem
> > to change the flash location data.
>
>I don't really understand this question. Do you want to operate from
>user space or kernel space? Do you want to read, write or move the
>data?
>
>Jörn
>
>--
>You can't tell where a program is going to spend its time. Bottlenecks
>occur in surprising places, so don't try to second guess and put in a
>speed hack until you've proven that's where the bottleneck is.
>-- Rob Pike


_________________________________________________________________
Get faster connections -- switch to MSN Internet Access! 
http://resourcecenter.msn.com/access/plans/default.asp
