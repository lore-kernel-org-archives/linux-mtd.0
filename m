Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189kqa-0005JV-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2002 11:29:16 +0000
Date: Thu, 7 Nov 2002 13:58:45 +0100 (CET)
From: Marius Groeger <mag@sysgo.de>
To: Taeil Um <tium@mail.palmpalm.com>
cc: linux-mtd list <linux-mtd@lists.infradead.org>
Subject: Re: NAND flash of EDB7312
In-Reply-To: <BDEDIOGGNJEEPBHLJLFGOEGJCDAA.tium@palmpalm.com>
Message-ID: <Pine.LNX.4.40.0211071355090.1961-100000@mag.devdep.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Tue, 5 Nov 2002, Taeil Um wrote:

> So,  Did anybody succeed to use NAND flash on EDB7312 board ?
> if somebody succeed, Could you inform me the value of MEMCFG1?

It worked ok for me using ARMboot (armboot.sf.net) and Elinos, which
uses the driver checked in on Infradead. As for MEMCFG1, see
armboot/board/ep7312/memsetup.S:

...
memcfg1_val:    .long   0x1f101710
...

Regards,
Marius

-----------------------------------------------------------------------------
Marius Groeger           SYSGO Real-Time Solutions AG       mgroeger@sysgo.de
Software Engineering     Embedded and Real-Time Software    www.sysgo.de
Voice: +49-6136-9948-0   Am Pfaffenstein 14                 www.osek.de
FAX:   +49-6136-9948-10  55270 Klein-Winternheim, Germany   www.elinos.com
