Received: from gw1.its.umd.umich.edu ([141.215.69.136])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BMuF8-0003yh-5K
	for linux-mtd@lists.infradead.org; Sun, 09 May 2004 20:45:47 +0100
Received: from merc.its.umd.umich.edu (merc.its.umd.umich.edu [141.215.69.17])
	by gw1.its.umd.umich.edu (Postfix) with ESMTP id B71FE385CB
	for <linux-mtd@lists.infradead.org>;
	Sun,  9 May 2004 15:45:21 -0400 (EDT)
Date: Sun, 9 May 2004 15:41:05 -0400 (EDT)
From: "Jonathan M. Schlueter" <jonschl@umd.umich.edu>
To: Andre Sodermans <andreesje_werk@yahoo.com>
In-Reply-To: <20040509192651.76331.qmail@web41502.mail.yahoo.com>
Message-ID: <Pine.GSO.4.58.0405091537500.27031@login1>
References: <20040509192651.76331.qmail@web41502.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: Re: diskonchip2000 support in 2.4.22
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sun, 9 May 2004, Andre Sodermans wrote:

> hello all,
> I can't access my diskonchip2000 partitions from
> linux. I have linuxmz 2.4.18 installed on it and it
> boots fine from diskonchip.
>
> The kernel I built for LFS5.0 is based on 2.4.22.
> I compiled the kernel with:
> CONFIG_MTD = m
> CONFIG_MTD_CHAR = m
> CONFIG_NFTL = m
>
> Running modprobe docprobe, I get:
>
> DiskOnChip Millennium found at address: 0xD000
> no flash chips recognized
>
> It is actually a diskonchip2000.
> There is no entry in /proc/mtd.

Which driver are you using?

> After I installed the kernel I noticed that I was
> missing the /dev/msys/fla* so I created those. Also
> the /dev/nftl* were missing, so I downloaded the
> latest mtd snapshot and ran the MAKEDEV script.

/dev/msys/fla* are the dev files from M-Sys's custom driver

/dev/nftla  are the dev files for the mtd subsystem (this list)

They are two seperate and different methods of accessing the DiskonChip


> I tried to mount -t ext2 /dev/msys/fla1 /mnt/doc -
> result:
> mount: /dev/msys/fla1 is not a valid block device
>
> I tried to mount -t ext2 /dev/nftla
> mount: /dev/nftla1: unknown device
>
>
> Did I miss something?
>



Jon Schlueter
