Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17plvd-0008D0-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Sep 2002 09:35:53 +0100
Date: Fri, 13 Sep 2002 10:35:47 +0200 (CEST)
From: Marius Groeger <mag@sysgo.de>
To: Karim Yaghmour <karim@opersys.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: the procedure setting up jffs2
In-Reply-To: <3D812E1F.FC5AC8E5@opersys.com>
Message-ID: <Pine.LNX.4.40.0209131025370.1575-100000@mag.devdep.sysgo.de>
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

On Thu, 12 Sep 2002, Karim Yaghmour wrote:

> So do I. Unfortunately, drivers/mtd/cmdline.c is only available in the MTD
> CVS for the time being (and Denx's kernel sources ;). Neither 2.5.34 nor

For the records, I'd like to add that obviously (since we developed
it), the cmdline partitioning is also a standard feature of our Elinos
distribution.

Regarding the main-line kernel: don't forget that updating
kernel.org's MTD is one thing -- having more mapping drivers actually
_use_ cmdline.c is another. This is the job of the corresponding
maintainers.

Regards,
Marius

-----------------------------------------------------------------------------
Marius Groeger           SYSGO Real-Time Solutions GmbH     mgroeger@sysgo.de
Software Engineering     Embedded and Real-Time Software    www.sysgo.de
Voice: +49-6136-9948-0   Am Pfaffenstein 14                 www.osek.de
FAX:   +49-6136-9948-10  55270 Klein-Winternheim, Germany   www.elinos.com
