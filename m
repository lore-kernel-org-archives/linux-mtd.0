Received: from pd9eb95f5.dip.t-dialin.net ([217.235.149.245] helo=thomas.tec.autronix.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175VzY-0006Im-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 May 2002 19:16:44 +0100
Message-Id: <200205081822.g48IMck11634@thomas.tec.autronix.de>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Thomas Gleixner <gleixner@autronix.de>
Reply-To: gleixner@autronix.de
To: "Pieter Grimmerink" <mailinglists@grimmerink.nl>,
   <linux-mtd@lists.infradead.org>
Subject: Re: Current status JFFS2 on DOC
Date: Wed, 8 May 2002 20:22:38 +0200
References: <MPBBIIEFELAEABNCNHMMGELBDAAA.mailinglists@grimmerink.nl>
In-Reply-To: <MPBBIIEFELAEABNCNHMMGELBDAAA.mailinglists@grimmerink.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Wednesday, 8. May 2002 18:37, Pieter Grimmerink wrote:
> From a design point of view, DiscOnChip looks nice with
> it's feature to boot from it.
> SmartMedia looks a bit cheaper, but that would require
> a separate NOR device, large enough to hold a compressed
> kernel, total price going up above the DOC prices again.
The minimum requirement is 1MB for a compressed kernel image
and a bootloader. That's affordable and working :)

> However, all that I have found so far in mailinglists and
> howto's, indicates that JFFS2 on smartmedia has been further
> investigated then JFFS2 on DOC.
JFFS2 on SmartMedia and NAND can be considered as stable.
There are some small TODO's

> But as far as I understand, there should be no physical limitation
> on a DOC to eventually host a JFFS2 filesystem.
No, DOC is NAND with some glue logic around

> Is this all true, and has someone managed to get a working
> JFFS2 filesystem on a DOC?
Thats true, but AFAIK there's no DOC / JFFS2 at the moment.

> and finaly, what are the chances of acutally booting into a
> JFFS2 root filesystem directly from a DOC?
> (I heard something about a modified GNU GRUB to replace the DOC
> firmware)
Yep, grub replaces the bootloader.

> This would eventually all have to run on a non-x86 processor.
Should work

> Is this a workable solution already, or would I have to go for
> more 'conventional' hardware to be safe?
The DOC solution is not workable, because it's not available, but you are 
heartly invited to join the club and hack the neccecary drivers. There are 
some more people around, who are interrested. 

The NAND / Smartmedia solution is working reliable.

See also http://www.linux-mtd.infradead.org/tech/nand.html
-- 
Thomas
___________________________________
autronix automation GmbH
http://www.autronix.de gleixner@autronix.de
