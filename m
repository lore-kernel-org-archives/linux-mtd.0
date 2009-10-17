Received: from mail-fx0-f228.google.com ([209.85.220.228])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mz6fW-0007lH-Lx
	for linux-mtd@lists.infradead.org; Sat, 17 Oct 2009 10:37:58 +0000
Received: by fxm28 with SMTP id 28so3317402fxm.18
	for <linux-mtd@lists.infradead.org>;
	Sat, 17 Oct 2009 03:37:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20091013151049.280490@gmx.net>
References: <20091013151049.280490@gmx.net>
Date: Sat, 17 Oct 2009 13:37:32 +0300
Message-ID: <7948530910170337m14facf88sb7e6f4d50e46ee16@mail.gmail.com>
Subject: Re: mtd partitions definition
From: Mika Korhonen <mika.j.korhonen@gmail.com>
To: Philipp Boerker <philipp.boerker@gmx.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/10/13 Philipp Boerker <philipp.boerker@gmx.de>:
>
> I'm sorry if this is the wrong place for such questions. I have done a lo=
t of reading on the subject and have browsed through the kernel code for my=
 device but still could not find the desired information (I'm no programmin=
g crack, I'm afraid). The situation is this:
>
> I have an embedded device which has some mtd partitions which are control=
led by the omap2-nand driver. The exact kernel sources for the device are u=
navailable at the moment (I expect them to be published by the manufacturer=
 within the next weeks) so I collect most of the info I have from dmesg and=
 grepping through the binaries.
>
> Now I would like to install my own bootloader which in the present case r=
esides in an mtd partition that appears to be read-only (opening the device=
 rw fails). I concluded that I had to change the partition definition to be=
ing writable in order to be able to write to the partition holding the boot=
loader (I assume that making the partition read-only was a kind of security=
 measure on the side of the manufacturer). The remaining mtd partitions can=
 be written using flash_image.
>
> I have learned so far that there are (at least) three ways of defining mt=
d partitions: kernel command line ("cmdline parsing not available" in dmesg=
 so it shouldn't be this), fixed (i.e. defined somewhere in the sources, ho=
wever, a grep for the partition names listed in dmesg doesn't show anything=
) or redboot. The device does not use redboot as a bootloader but as far as=
 I understand this does not mean that it doesn't use the redboot method for=
 defining mtd partitions.
>
> I have looked through the kernel sources for the omap2-nand driver and ha=
ve come to a function called omap_nand_probe which seems to initialise (at =
least part of) the device but gets all the interesting information (i.e. pa=
rtition definition) passed as an argument. So the partition information is =
set up somewhere else. And I can't find this somewhere else...
>
> I wonder whether there is a user-space tool similar to fdisk for defining=
 mtd partitions provided that the redboot method is used. (btw, the partiti=
on holding the bootloader does not use ubi.) I know that mtd partitions can=
 be defined in redboot itself but this is some sort of a chicken-and-egg pr=
oblem: I need to have the partitions rw in order to have my own bootloader =
installed and the device uses some other kind of bootloader...
>
> Any help on this? I spend two days learning about mtd (a week ago I didn'=
t know it existed) and I start feeling that pain in my neck... :)
>
>
> Thank you for your work and time!
>
> --

You may also want to have a look at this patch :
http://lists.infradead.org/pipermail/linux-mtd/2009-September/027141.html

That should give you a clue where the partitioning comes from.

Mika
