Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16mzL9-0002RP-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Mar 2002 15:46:27 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.44.0203181034060.13911-100000@server.superbt.com> 
References: <Pine.LNX.4.44.0203181034060.13911-100000@server.superbt.com> 
To: Ilguiz Latypov <ilatypov@superbt.com>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: DOC2000 + GRUB/LILO booting problems 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 18 Mar 2002 15:57:49 +0000
Message-ID: <23171.1016467069@redhat.com>
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

ilatypov@superbt.com said:
>  I agree it might be impossible for the kernel to mount a partition
> formatted within NFTL layer if NFTL data structures in the beginning
> of the flash chip are overwritten.  But I don't know the exact details
> of the NFTL layer myself. 

It would be impossible. The two erase blocks at the beginning of the NFTL 
are required. 

>  The GRUB bootloader needs around 96K at minimum.  NFTL layer can be
> set up after the bootloader only.  It seems the start of the NFTL
> layer will be detected automatically by the kernel.  In my
> understanding, the kernel will simply search for a signature in every
> erase unit of the chip to find the beginning of NFTL layer.

Correct. The best way to do this is to use the DOS dformat program to 
reserve that 96KiB, then put Grub in afterwards. We should probably work 
out how to make the .EXB file format that DFORMAT uses, so we can actually 
use DFORMAT to program Grub too.

--
dwmw2
