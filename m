Received: from natpool.ud.com ([65.112.245.211] helo=dzuylt)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17HoUa-00084r-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2002 17:27:36 +0100
Received: from infinity-studios.com (localhost.localdomain [127.0.0.1])
	by dzuylt (8.11.6/8.11.6) with ESMTP id g5BGRGN01316
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2002 11:27:16 -0500
Message-ID: <3D0624E4.5060007@infinity-studios.com>
Date: Tue, 11 Jun 2002 11:27:16 -0500
From: Dzuy Nguyen <dzuy@infinity-studios.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 and Grub
References: <Pine.LNX.4.21.0206111201030.31856-100000@server.activmedia.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

It's possible that the grub_firmware and the nftl are overlapping.  When 
run doc_loadbios,
observe the number of bytes written into DoC.  It should be the size of 
the grub_firmware.
I'd add a couple of blocks (erase size) to that as the offet in nftl_format.

Matt Vestal wrote:

>I 'm having the same problem as others who have posted, in getting the
>"Selected disk does not exist" error.  I'm using a 96MB DOC with a
>VersaLogic VSBC-8 motherboard.
>
>-using Grub 0.92
>-patched with grub-2002-02-19-doc.patch
>-ran "aclocal && automake && autoconf"   (needed automake-1.5-8)
>-./configure --enable-diskonchip-2000 --enable-ext2fs
>-../util/doc_loadbios /dev/mtd0 grub_firmware
>-./nftl_format /dev/mtd0 98304
>-fdisk /dev/nftla into multiple portions.  also tried leaving it full
>-mke2fs
>-copy over necessary files (kernel and such)
>-reboot
>
>The DOC loads Grub with no problem.  However, Grub has never been able to
>see the DOC filesystem(s).  I've tried root (dc0), root (dc0,0), root
>(dc0,1), etc, but nothing works.  I always get the "Selected disk does not
>exist, error"
>
>Any help would be greatly appreciated, as I've been pouring over this for
>days, now.
>
>Thanks,
>
>Matt
>
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
