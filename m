Received: from aboulogne-111-1-1-87.abo.wanadoo.fr ([80.11.223.87] helo=ns.nexgen-private)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Lm5V-0006Ou-00
	for <linux-mtd@lists.infradead.org>; Tue, 10 Dec 2002 15:14:23 +0000
Message-ID: <003c01c2a063$c6c682a0$0111010a@nexgenprivate>
From: "David Girault" <david@nexgen-software.fr>
To: <tglx@linutronix.de>, "Liste Linux Mtd" <linux-mtd@lists.infradead.org>
References: <001201c2a059$27471aa0$0111010a@nexgenprivate> <200212101607.06174.tglx@linutronix.de>
Subject: Re: [DOC2000] invalid size detected
Date: Tue, 10 Dec 2002 16:49:41 +0100
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

> > The previous version I build (2.4.18) detect the correct size but lack
for
> > UnitSizeFactor!=1 support.
> >
> > I think the problem is in the NAND_IDS.C chip identification but I am
not
> > sure.
> > As I can see, there is a name conflict beetween nand_ids.h and
nand_ids.c.
> nand_ids.h is not longer in the CVS. I moved the ID's into nand_ids.c and
> splitted the tables.

nand_ids.h still in include dir of kernel source (2.4.20).
I think the patchin.sh script should erase it before making links.
But your change works even if this file is in the include path.

>
> > What de you think of this problems/bug?
> I should not hack, when I'm tired :)
>
> Fixed in CVS. Could you please try and bang me, if it's not working as
> exspected.

It's now working. I can acces the DOS partition.


Many thanks
--
David
