Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta03.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17nCSN-0005q4-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Sep 2002 07:19:04 +0100
Received: from sitemail.everyone.net (dsnat [216.200.145.62])
	by omta03.mta.everyone.net (Postfix) with ESMTP id E805349788
	for <linux-mtd@lists.infradead.org>; Thu,  5 Sep 2002 23:01:20 -0700 (PDT)
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Thu, 5 Sep 2002 23:01:15 -0700 (PDT)
From: Mateo Anderson <mateo@posta.star.si>
To: linux-mtd@lists.infradead.org
Subject: DOC 2000 and GRUB
Reply-To: mateo@posta.star.si
Message-Id: <20020906060115.6A1663946@sitemail.everyone.net>
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

Hi

I have some problems booting Linux form DOC 2000 using GRUB.

I am using the PC104+ (with Zfx86 processor) and I made a
custom Linux on the hard drive, with libs and 
binares required for my project.

I want to transfers this to DOC 2000 (48Mb). I followed
instructions how to build a mtd driver. The Linux boots
fine from the HD and finds my DOC, where I created one
ext2 partition and copied all the files there.

Now I want to boot the system from the DOC without any
HD. First I used LILO, but I just could not get it to work.
I used the laterst version of LILO, the patched version from
M-sys, the patched version from mtd, ...

All I got was, "L" then "LI" and finally "L 40 40 40 ...".

Because I found many messages on this list, that GRUB works
fine I decided to try with it.
Yesterday I buil GRUB 0.92 with the patches found in the MTD.

I booted the system from the HD, loaded the GRUB firmware into
the DOC and rebooted the system.

It found the DOC2000 and I got the grub> prompt (The HD was
not connected!!!).

But when I connected the HD, I got (something like):
DOC 2000 at ....
Jumping to Grub

and then hangs.
If I disconect the HD, I get the grub> prompt.

Questions:
1) How to boot Linux from HD?
   - DO I remove the DOC, boot Linux and then insert DOC?
   - Can I boot the LInux to grub> prompt, and then connect
     the disk? (Dangerous!!)
2) I said I already copied everything on DOC. How can
   I boot that kernel? I tried with 
   grub> kernel (dc0,0)/myKernel root=/dev/nftla1
   GRUB display message something about invalid disk (or something
   like that).
3) Anything else I could try?

Oh, I did not use the latest version from the CVS, but a CVS 
snapshot with the date 07.28.2002.

Thank you and best regards,
Mateo

_____________________________________________________________
Brezplacen E-mail - http://email.star.si
Brezplacen prostor 100 MB,lastna domena - http://www.slohosting.com

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
