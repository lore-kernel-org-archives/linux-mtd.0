Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17KEZW-0004FG-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Jun 2002 09:42:43 +0100
Date: Tue, 18 Jun 2002 10:42:31 +0200 (CEST)
From: Marius Groeger <mag@sysgo.de>
To: Jason Chan <jason@emsoftltd.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: How to configure MTD so that JFFS2 work on 7312 NandFlash?
In-Reply-To: <3D0EA22F.9050801@emsoftltd.com>
Message-ID: <Pine.LNX.4.40.0206181035410.11095-100000@mag.devdep.sysgo.de>
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

On Tue, 18 Jun 2002, Jason Chan wrote:

> Hi all,
>     I am trying to configure MTD NandFlash and JFFS2 on EP7312 NandFlash
> driver.
> However, when I try to access, it output "I/O Error".
> But when the kernel bootup, I can see that the kernel successfully find
> out the nandflash device. So how can I make the JFFS2 and MTD work on 7312?

Are you using the Cogent Evalboard (EP7312 is just the CPU)? Do you use the
latest MTD snapshot? It worked quite well over here last time I checked.
Unfortunately my EDB7312 is not available at the moment.

Regards
Marius

-----------------------------------------------------------------------------
Marius Groeger           SYSGO Real-Time Solutions GmbH     mgroeger@sysgo.de
Software Engineering     Embedded and Real-Time Software    www.sysgo.de
Voice: +49-6136-9948-0   Am Pfaffenstein 14                 www.osek.de
FAX:   +49-6136-9948-10  55270 Klein-Winternheim, Germany   www.elinos.com
