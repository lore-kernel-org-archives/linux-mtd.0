Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SgAi-0001Yg-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 16:48:00 +0100
Date: Fri, 12 Jul 2002 17:43:02 +0200 (CEST)
From: Marius Groeger <mag@sysgo.de>
To: Daniel Belz <danielb@cyclades.com.br>
cc: MTD <linux-mtd@lists.infradead.org>
Subject: Re: Mounting JFFS2, Bootloader
In-Reply-To: <3D2D79FE.5C54CC78@cyclades.com.br>
Message-ID: <Pine.LNX.4.40.0207121738590.7172-100000@mag.devdep.sysgo.de>
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

On Thu, 11 Jul 2002, Daniel Belz wrote:

> PS.: I don't like to use the PPCBoot!!!

May I ask why? It sure would save you a lot of work... Anyway, if you don't
want to use PPCboot, you can always rip out and use it's JFFS support
routines.

Regards,
Marius

-----------------------------------------------------------------------------
Marius Groeger           SYSGO Real-Time Solutions GmbH     mgroeger@sysgo.de
Software Engineering     Embedded and Real-Time Software    www.sysgo.de
Voice: +49-6136-9948-0   Am Pfaffenstein 14                 www.osek.de
FAX:   +49-6136-9948-10  55270 Klein-Winternheim, Germany   www.elinos.com
