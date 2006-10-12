Received: from e36.co.us.ibm.com ([32.97.110.154])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GXzN2-0004Jr-Fg
	for linux-mtd@lists.infradead.org; Thu, 12 Oct 2006 08:09:11 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e36.co.us.ibm.com (8.13.8/8.12.11) with ESMTP id k9CC90Zp018973
	for <linux-mtd@lists.infradead.org>; Thu, 12 Oct 2006 08:09:00 -0400
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay04.boulder.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	k9CC90kL362440
	for <linux-mtd@lists.infradead.org>; Thu, 12 Oct 2006 06:09:00 -0600
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	k9CC8xNo006782
	for <linux-mtd@lists.infradead.org>; Thu, 12 Oct 2006 06:08:59 -0600
Subject: Re: jffs2 summary problem
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: =?ISO-8859-1?Q?Tak=E1cs_=C1ron?= <takacs.aron@infracont.hu>
In-Reply-To: <452E15C6.4000303@infracont.hu>
References: <452E15C6.4000303@infracont.hu>
Content-Type: text/plain; charset=utf-8
Date: Thu, 12 Oct 2006 07:12:56 -0500
Message-Id: <1160655176.4043.2.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-10-12 at 12:15 +0200, Takács Áron wrote:
> Hi,
> 
> I have to shorten the mount time of a jffs2 filesystem. I am working on 
> a PXA270 based board witha 2.6.18 kernel. I have the jffs2 filesystem in 
> the fourth partition of the flash  (dev/mtdblock3), its size is about 
> 10Mb. The mount time is about 1.5sec. I am doing the followings:
> 
> My kernel config looks likde this:
> 
> CONFIG_JFFS2_FS=y
> CONFIG_JFFS2_FS_DEBUG=0
> CONFIG_JFFS2_FS_WRITEBUFFER=y
> CONFIG_JFFS2_SUMMARY=y
> 
> Now I create the jffs2 image:
> 
> mkfs.jffs2 -r rootfs/adatok -o colibri.jffs2 -e 0x40000 --pad=0xa40000
> Result: colibri.jffs2 10,2Mb

Is the eraseblock size of your chip really 256KiB?  Most NOR flashes
have an eraseblock size of 128KiB ( -e 0x20000).
> 
> After that I am running sumtool:
> 
> sumtool -e 0x40000 -p 0xa40000 -v -icolibri.jffs2 -ocolibri_sum.jffs2
> Result: colibri_sum.jffs2 256kb
> 
> Now I copy the file (from filesystem on nfs) to the flash:
> 
> dd if=/colibri_sum.jffs2 of=/dev/mtdblock3 bs=256k
> 
> After all I have the following situation:
> Mount time is the same. After mounting the first "ls" takes a long time. 
> On the serial console I can se a lot of characters.

A log of the errors might be useful if verifying your eraseblock size
doesn't work.

josh
