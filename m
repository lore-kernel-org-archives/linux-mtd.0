Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.sysgo.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AtrR7-0003XN-BU
	for linux-mtd@lists.infradead.org; Thu, 19 Feb 2004 16:54:05 +0000
Date: Thu, 19 Feb 2004 17:51:38 +0100 (CET)
From: Marius Groeger <mgroeger@sysgo.com>
Sender: mag@mag.sysgo.com
To: "Cruz, Maria" <maria.cruz@VITRONICS.com>
In-Reply-To: <A1F0D47583A2D711919F00600819B3A4024630@goofy.vitronics.com>
Message-ID: <Pine.LNX.4.56.0402191746340.24482@mag.sysgo.com>
References: <A1F0D47583A2D711919F00600819B3A4024630@goofy.vitronics.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: Re: building blkmtd as a module
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 19 Feb 2004, Cruz, Maria wrote:

> depmod: *** Unresolved symbols in /lib/modules/2.4.20-6mtd/kernel/drivers/mtd/devices/blkmtd.o
> depmod:         recalc_sigpending_tsk
> The function "recalc_sigpending_tsk" is in signal.o.  what is wrong?  GPL license issue? dependency issue (i do a "make dep" right after "make menuconfig").  the .config has mtd setup:

For a kernel global symbols to resolve with depmod (and insmod, of course),
it must explicitly be exported via EXPORT_SYMBOL(). Only then it will appear
in /proc/ksyms. depmod uses /proc/ksyms to resolve symols.

You may have to add a suitable EXPORT_SYMBOL() declaration somewhere in your
kernel sources.

Regards,
Marius

-- 
Marius Groeger <mgroeger@sysgo.com>
Project Manager

SYSGO Real-Time Solutions AG | Embedded and Real-Time Software
Am Pfaffenstein 14
55270 Klein-Winternheim, Germany

Voice: +49-6136-9948-0 | FAX: +49-6136-9948-10
www.sysgo.com | www.elinos.com | www.osek.de
