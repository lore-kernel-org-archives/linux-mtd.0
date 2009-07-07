Received: from ipmail04.adl2.internode.on.net ([203.16.214.57])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MOK8r-0006u6-Dp
	for linux-mtd@lists.infradead.org; Tue, 07 Jul 2009 23:32:12 +0000
Message-ID: <4A53DB7E.2010205@call-direct.com.au>
Date: Wed, 08 Jul 2009 09:34:22 +1000
From: Iwo Mergler <iwo@call-direct.com.au>
MIME-Version: 1.0
To: venki kaps <venkiece2005@gmail.com>
Subject: Re: kernel crashing with jffs2 (32MB NAND Flash and 32MB SDRAM )
References: <6d53329e0907060413h4a2a1d64nddc8e066f2e3c2d@mail.gmail.com>	
	<4A52C62F.2060408@call-direct.com.au>
	<6d53329e0907070447o763f214dy2e1b179674cd26f5@mail.gmail.com>
In-Reply-To: <6d53329e0907070447o763f214dy2e1b179674cd26f5@mail.gmail.com>
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
> Thanks for the reply.
> It's a new hardware i.e, ATMEL AT91SAM9G20 Board
> and at the same first time we are using.
> 
> Did *this* board ever work correctly?
> No.
> 
> But At mem=8M and mem=16M the Linux is coming up
> but after the kernel prompt it is crashing in between.
> 
> At mem=32M the Linux is not coming up over board.
> Before kernel prompt it’s crashing.
> 
> If SDRAM is problem, Linux itself is not coming up over board.
> am i right?
> 
> is it u-boot problem?
> i.e  number of column & row address bits and the number of banks is
> set correctly to match the installed SDRAM
> 
> is it required to change u-boot or SDRAM or 2.6.27 kernel?
> 
> Could you suggest something?
> 
> Thanks & Regards,
> Venkappa
> 

Looks like you have faulty hardware. The SDRAM controller is set up
by the bootstrap code, before U-Boot. Since you have probably not
modified that code or the board, those settings are likely to be
correct.

I can't remember what the Atmel U-Boot defaults are, but typically
U-Boot gets loaded just under the 8 or 16MB offset in SDRAM. It
then loads the compressed kernel at about 4MB offset. The kernel
then decompresses itself into the first 2MB or so.

By the time you get a console prompt, a lot of the kernel code
has already run successfully. However, it is possible to get to
this point with partially broken SDRAM.

Have a close look on the board for solder bridges between the
SDRAM pins.

You could try to use SamBA to check the SDRAM memory range
for errors.

Also, you can try to reflash the board with the original Atmel
images, just in case there are transient bit errors in your flash.

Otherwise, contact Atmel.

Best regards,

Iwo
