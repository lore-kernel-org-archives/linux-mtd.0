Received: from sccrmhc01.attbi.com ([204.127.202.61])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nIJm-0006iQ-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 13:34:34 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Mark Meade <mark@lakeshoremicro.com>
To: mateo@posta.star.si,
 dwmw2@infradead.org,
 hno@marasystems.com
Subject: Re: DOC 2000 and GRUB
Date: Fri, 6 Sep 2002 08:33:13 -0400
Cc: Russ.Dill@asu.edu,
 linux-mtd@lists.infradead.org
References: <20020906112553.896FB394E@sitemail.everyone.net>
In-Reply-To: <20020906112553.896FB394E@sitemail.everyone.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020906123402.HNFT11061.sccrmhc01.attbi.com@there>
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

Mateo Anderson wrote:
> Is this modified version comitted in the cvs?

No, I just started experimenting (with Grub) yesterday.  Things appear to be 
working great on the DoC Millennium, but I haven't done enough testing to be 
confident enough to submit a patch.  

> >I'm guessing that many problems are caused by having the nftl
> >module loaded during a fdisk, nftl_format, and/or doc_loadbios.
>
> Are you referring to kernel modules?
> If so, I have these build in (no modules), as suggested by
> DOC and GRUB HOW-TO.

Yes.  I'm thinking about revising the how-to to suggest using modules for the 
development system, and built-in for the kernel booting from the DoC.  
Alternatively, you could use the built-in stuff all the time, but make sure 
to reboot often:

http://lists.infradead.org/pipermail/linux-mtd/2002-June/005123.html

Wolfgang Denk submitted a patch to address this problem; it sounds like it 
would eliminate the need to reboot:

http://lists.infradead.org/pipermail/linux-mtd/2002-August/005831.html

Being able to use DFORMAT to install GRUB and do the NFTL format eliminates 
the need to use both doc_loadbios and nftl_format, and should make the choice 
of built-in or module irrelevant.  However, Wolfgang's patch still seems to a 
very good idea.

> Steps:
> 1) Boot DOS and use DFORMAT 5.x to format the DOC, with
>    the appropriate space for the GRUB firmware (check the
>    size of the stage1 file).
> 2) Boot to Linux, use the doc_loadbios to load the GRUB
>    firmware (or use DFORMAT - what parameters??).
> 3) Format the /dev/nftla.
> 4) Copy everything to the /dev/nftla1.
> 5) Boot from DOC.
>
> Is this correct?

Close.  I've been doing the following (with some Grub modifications):

1) dformat /win:xxxx /BDKF0:grub_firmware

Use dformat 5.x to install grub, and the NFTL format.  You'll end up with one 
FAT partition on the DoC.  This eliminates the need to use "doc_loadbios" and 
"nftl_format".

2) It's necessary (on my PC) to turn it off, rather than just rebooting.  The 
howto explains why this is required.

3) boot to Linux, fdisk, mke2fs, copy everything to /dev/nftla1

4) boot from DoC
