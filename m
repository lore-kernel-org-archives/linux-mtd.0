Received: from [203.115.19.131] (helo=matrix.mediasolv.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15jGHi-0000DP-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Sep 2001 09:31:17 +0100
Message-ID: <005a01c1401d$55661ff0$0203a8c0@mediasolv.com>
From: "Kugan" <kugan@mediasolv.com>
To: "Jarkko Lavinen" <jlavi@iki.fi>,
   "MTD List" <linux-mtd@lists.infradead.org>
References: <20010918111926.A22357@kosh.hut.fi>
Subject: Re: jffs & amd_flash.c
Date: Tue, 18 Sep 2001 01:37:35 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

>
> I am using happily the amd_flash.c driver with AMD 64mbit non-CFI
> flash chip.  I haven't experienced this problem.  I am using
> arm-linux kernel, which is based on Alan Cox's 2.4.8-ac8.

I am using 2.0.38 uClinux kernel on ARM7TDMI

>
> Your problem seems not to be failing erase or programming, or is it?
> Surely the debugging message would nag about timeout errors?

I have a dual plane flash , I am running the kernel from the flash(XIP) and
I bott from romfs and mount a jffs partitione in the other flash plane
respect to kernel. when I mount I can see some data being written and read
back to verify, some time it if failing,

> There were problems in sector erase and word writing code in amd_flash.c.
> The problem was that the operation status query was not made form the
> same bank and sector as being erased or written into. This was an issue
> only with chips supporting simultaneous read & write on separate banks.
> I've committed a fixes for these problems into CVS.

The flash chip I have also support simultaneous read and write on different
plane simultaneously. Is your patch in latest CVS or do i have to get and
apply???

>
> The Amd driver works nicely for me and I although I had initially
> hardware configuration related speed problems they have been now
> resolved. Using the command
>
>   dd if=/dev/zero of=/dev/mtd0 bs=1k
I will try this

Thanx and regards
Kugan
