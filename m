Received: from mail-out.m-online.net ([212.18.0.9])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GNzXy-0002Vb-NE
	for linux-mtd@lists.infradead.org; Thu, 14 Sep 2006 23:19:03 +0100
To: wangbj@lzu.edu.cn
From: Wolfgang Denk <wd@denx.de>
Subject: Re: mtd failed on ppc 440GR(yosemite) while CONFIG_YOSEMITE=y 
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Fri, 08 Sep 2006 20:54:26 +0800."
	<357780444.20354@eyou.net> <1157720067.10958.25.camel@ubuntu01>
Date: Fri, 15 Sep 2006 00:18:30 +0200
Sender: wd@denx.de
Message-Id: <20060914221830.4F953353A15@atlas.denx.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

in message <357780444.20354@eyou.net> <1157720067.10958.25.camel@ubuntu01> you wrote:
> 
> I'm trying to enable mtd on the amcc 440GR yosemite evaluation board,
> but failed. here is a section from the .config of linux-2.6.16 from eldk

Please get your information right. ELDK does *not* inlcude a 2.6.16
kernel. ELDK-4.0 (the latest official release) comes with 2.6.15
instead.

> it caused Data Machine Check, attachment mtd_error.txt is the log file.

The ELDK version (2.6.15) works fine here:

	...
	AMCC440-flash: Found 1 x16 devices at 0x0 in 16-bit bank
	 Amd/Fujitsu Extended Query Table at 0x0040
	AMCC440-flash: CFI does not contain boot bank location.  Assuming top.
	number of CFI chips: 1
	cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.
	Creating 5 MTD partitions on "AMCC440-flash":
	0x00000000-0x00180000 : "kernel"
	0x00180000-0x00400000 : "root"
	0x00400000-0x03f40000 : "user"
	0x03f40000-0x03f80000 : "env"
	0x03f80000-0x04000000 : "u-boot"
	...

Also, running cuurent source (which is strongly recommended) wortks
fine for me:

a) using the latest image from the FTP server (2.6.17-rc3):
   ftp://ftp.denx.de/pub/linux/images/amcc/yosemite/uImage

	...
	AMCC440-flash: Found 1 x16 devices at 0x0 in 16-bit bank
	 Amd/Fujitsu Extended Query Table at 0x0040
	AMCC440-flash: CFI does not contain boot bank location. Assuming top.
	number of CFI chips: 1
	cfi_cmdset_0002: Disabling erase-suspend-program due to code
	brokenness.
	Creating 5 MTD partitions on "AMCC440-flash":
	0x00000000-0x00180000 : "kernel"
	0x00180000-0x00400000 : "root"
	0x00400000-0x03f40000 : "user"
	0x03f40000-0x03f80000 : "env"
	0x03f80000-0x04000000 : "u-boot"
	...

b) Using top of tree from git repo (2.6.18-rc7):

	...
	AMCC440-flash: Found 1 x16 devices at 0x0 in 16-bit bank
	 Amd/Fujitsu Extended Query Table at 0x0040
	AMCC440-flash: CFI does not contain boot bank location. Assuming
	top.
	number of CFI chips: 1
	cfi_cmdset_0002: Disabling erase-suspend-program due to code
	brokenness.
	Creating 5 MTD partitions on "AMCC440-flash":
	0x00000000-0x00180000 : "kernel"
	0x00180000-0x00400000 : "root"
	0x00400000-0x03f40000 : "user"
	0x03f40000-0x03f80000 : "env"
	0x03f80000-0x04000000 : "u-boot"
	...


In all 3 cases the yosemite default configuration (i. e. what you get
when running "make yosemite_defconfig") was used. No problems
observed.

You must be doing something wrong. Please RTFM. The  yosemite  manual
can be found at
http://www.denx.de/wiki/view/DULG/Manual?stickboard=yosemite


> config-2.6.16-5-eldk-ppc_440-yosemite is the related .config file for
> config-2.6.16-4-eldk-ppc_440-yosemite is the .config file without

2.6.16-5 does not look like a kernel from our repo, and neither does
2.6.16-4

> boot success, but it cause the system only have 1 partition of mtd, and
> when doing a: 
> # fdisk /dev/mtd0
> would cause the shell block for ever(don't return to the shell prompt).

This command is bogus anyway.  "fdisk"  cannot  be  used  with  flash
devices like this.

> how could I enable mtd in (amcc) 440GR yosemite evaluation board? thanks
> in advance!

Ummm... what are you talking about? The 'yosemite' board is  a  440EP
system; the 440GR eval board is called 'yellowstone'.

> I've tried this for days, and really get tired of that.

Maybe you just mix up configurations.

> BTW: the kernel source is different from vanilla kernel, and it can be
> found at: ftp://ftp.denx.de/pub/linux/linux-2.6.16.tar.bz2

The kernel on our FTP server / in our repo is NOT a  vanilla  kernel.
It contains patches that did not make it upstream (yet).

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
"Here's a fish hangs in the net like a poor man's right in  the  law.
'Twill hardly come out."     - Shakespeare, Pericles, Act II, Scene 1
