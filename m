Received: from sitemail3.everyone.net ([216.200.145.37] helo=omta03.mta.everyone.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17oJXd-0007UT-00
	for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2002 09:05:06 +0100
Content-Type: text/plain
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Date: Mon, 9 Sep 2002 01:04:49 -0700 (PDT)
From: Mateo Anderson <mateo@posta.star.si>
To: jay.s@sohu.com
Cc: linux-mtd@lists.infradead.org
Subject: DOC 2000 and GRUB (WORKING!!)
Reply-To: mateo@posta.star.si
Message-Id: <20020909080449.49A693968@sitemail.everyone.net>
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

Jay

>well, I've met the same problem as you before. I have choosed not to
>include the --enable-diskonchip-biosnetboot since there's no option
>for me to use in my bios.

Exactly.

>later I redo the firmware with this option enabled, and I still have
>the problem, but I plug out the doc and boot the system from hd, when
>I saw the lilo option I plug in the doc and fdisk/format the doc, cp
>the software needed into doc. 

Well, this step I did a little different.
I put the DoC into the separate socket. On this socket I removed the
pin for the CS (chip select) and connected it to a switch. The other
end of the switch I put into the socket on the board.
Then I booted the system, and when the LILO appeared I turned the 
switch on, so the Linux found the DoC.

Here I would like to thank all the good people who helped me
and probably I could not do it without their help.
Thank you all!!!

One note.
They recommended me, that id use a DOS 5.x utility DFORMAT to
transfer the GRUB firmware to DoC. 
I must say, that DFORMAT could not transfer this to DoC, it
reported some errors.
But I could use the Linux, doc_loadbios to load the firmware
and then nftl_format to format the DoC.

Then the standard fdisk, mkfs, cp, ...

>now I can boot the doc alone without problem, but I can't get it work
>along with hd, when they met, usually the grub take the first to boot
>and hangs.
>
>I don't know why the problem exists, because I have another doc
>(someone else made it for me) which can work properly with the hd. 
>so there's no concern about the bios, it must be concerned with 
>the grub firmware I built. but what's wrong. yet it can work well
>alone.

I have the same problem.
If you find the solution, please post it to the mtd mailing list.
If I find it, I'll post it here.

Thank you once again and best regards,
Mateo

_____________________________________________________________
Brezplacen E-mail - http://email.star.si
Brezplacen prostor 100 MB,lastna domena - http://www.slohosting.com

_____________________________________________________________
Promote your group and strengthen ties to your members with email@yourgroup.org by Everyone.net  http://www.everyone.net/?btn=tag
