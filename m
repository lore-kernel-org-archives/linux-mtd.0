Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18LlXV-0006J4-00
	for <linux-mtd@lists.infradead.org>; Tue, 10 Dec 2002 14:39:13 +0000
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H6W009WYSRJ8N@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 10 Dec 2002 16:09:19 +0100 (MET)
Date: Tue, 10 Dec 2002 16:07:06 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [DOC2000] invalid size detected
In-reply-to: <001201c2a059$27471aa0$0111010a@nexgenprivate>
To: David Girault <david@nexgen-software.fr>,
 Liste Linux Mtd <linux-mtd@lists.infradead.org>
Reply-to: tglx@linutronix.de
Message-id: <200212101607.06174.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <001201c2a059$27471aa0$0111010a@nexgenprivate>
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

On Tuesday 10 December 2002 15:33, David Girault wrote:
> The previous version I build (2.4.18) detect the correct size but lack for
> UnitSizeFactor!=1 support.
>
> I think the problem is in the NAND_IDS.C chip identification but I am not
> sure.
> As I can see, there is a name conflict beetween nand_ids.h and nand_ids.c.
nand_ids.h is not longer in the CVS. I moved the ID's into nand_ids.c and 
splitted the tables.
 
> What de you think of this problems/bug?
I should not hack, when I'm tired :)

Fixed in CVS. Could you please try and bang me, if it's not working as 
exspected.

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
