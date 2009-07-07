Received: from ipmail04.adl2.internode.on.net ([203.16.214.57])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MO1fr-0004jP-Sg
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 03:49:02 +0000
Message-ID: <4A52C62F.2060408@call-direct.com.au>
Date: Tue, 07 Jul 2009 13:51:11 +1000
From: Iwo Mergler <iwo@call-direct.com.au>
MIME-Version: 1.0
To: venki kaps <venkiece2005@gmail.com>
Subject: Re: kernel crashing with jffs2 (32MB NAND Flash and 32MB SDRAM )
References: <6d53329e0907060413h4a2a1d64nddc8e066f2e3c2d@mail.gmail.com>
In-Reply-To: <6d53329e0907060413h4a2a1d64nddc8e066f2e3c2d@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

venki kaps wrote:
> Hi,
> 
>  We are facing some memory issues with ATMEL AT91SAM9G20 Board.
>  By changing the uboot environment variable –bootargs
> setenv bootargs console=ttyS0,115200 root=/dev/mtdblock2 rootfstype=jffs2 mem=8M
> mem=8M
> mem=16M
> mem=24M
> mem=32M
> On changing the value of mem variable the boards behaves in different way.
> 
> At 8M,16M the Linux is coming up but after the kernel prompt it is
> crashing in between.
> At 32M-the Linux is not coming up over board. Before kernel prompt
> it’s crashing.
> The size of SDRAM is 32MB.but we are not able to utilize it fully.
> 
> Is it u-boot or Kernel or jffs2 or SDRAM problem?
> 

There could be many possible explanations, including electrical board faults
(shorted address lines), bad SDRAM, unsupported SDRAM chips, etc. Is it a new
board design? Did *this* board ever work correctly? You didn't give enough
detail to comment on these things.

As for the software side, incorrectly programming the SDRAM controller can
cause the symptoms you described.

The SDRAM controller is programmed by the bootstrap code, as U-Boot needs
the SDRAM already operational to run.

Add some code to U-Boot to print out the contents of the SDRAMC Configuration
Register (see the data sheet). Make sure the number of column & row address
bits and the number of banks is set correctly to match the installed SDRAM.

Best regards,

Iwo
