Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KGpdm-0006uI-48
	for linux-mtd@lists.infradead.org; Thu, 10 Jul 2008 06:28:30 +0000
Date: Thu, 10 Jul 2008 08:28:17 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Frans Meulenbroeks <fransmeulenbroeks@yahoo.com>
Subject: Re: [PATCH] [MTD] NAND nand_ecc.c: rewrite for improved
 performance
In-Reply-To: <878386.94697.qm@web33610.mail.mud.yahoo.com>
Message-ID: <alpine.LFD.1.10.0807100757230.3160@apollo.tec.linutronix.de>
References: <878386.94697.qm@web33610.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Frans,

On Sun, 6 Jul 2008, Frans Meulenbroeks wrote:

> [PATCH] [MTD] NAND nand_ecc.c: rewrite for improved performance
> 

> First off upfront apologies if this is not fully according to the
> way to submit patches. Although far from new in the unix/linux world
> (yes I am the Frans Meulenbroeks from Minix for the Atari ST 1.5),
> it is the first time I try to submit a patch (so if I do things
> inappropriate, please friendly educate me and don't bash me :-) )

First off, please use a mail client which does line breaks around 78
characters.

Secondly, we only bash advisory resistant repeat offenders :)

> Details of the way the new algorithm works are in the attached file
> ecc.txt Not too sure if this txt file should be part of the patch or
> not.  I'll leave it up to the maintainers of MTD to decide.

It should go into Documentation/mtd. I read trough it and I want to
answer a question you asked there:

> Not too sure why the last invert is
> needed, but it happened also in the original code.

We want to have 0xff 0xff 0xff ECC code for a page full of 0xff's
(empty flash).

> I have included the complete nand_ecc.c file. It was derived from
> scratch so a patch would have been much bigger.

At the end, we need a patch anyway.

I'm not surprised about the effect of unrolling the loop, but it the
benefit depends on the CPU architecture as you have noticed
already. I'm curious what the speedup on ARM will be.

I have no real objections to merge that code aside of formal aspects:

1) Please keep at least a reference to the original authors of the ecc
code.

2) Try to follow Documentation/Codingstyle

3) Create a patch and use scripts/checkpatch.pl on it. The current
output is: 

total: 160 errors, 17 warnings, 482 lines checked

4) Send it as a patch preferrably inline in the mail.

Thanks,

	tglx
