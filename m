Received: from mikonos.cyclades.com.br
	([200.230.227.67] helo=firewall.cyclades.com.br ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ShxH-0001mK-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 18:42:15 +0100
Message-ID: <3D2DC576.7B87E64C@cyclades.com.br>
Date: Thu, 11 Jul 2002 14:50:46 -0300
From: Daniel Belz <danielb@cyclades.com.br>
MIME-Version: 1.0
To: Marius Groeger <mag@sysgo.de>
CC: MTD <linux-mtd@lists.infradead.org>
Subject: Re: Mounting JFFS2, Bootloader
References: <Pine.LNX.4.40.0207121738590.7172-100000@mag.devdep.sysgo.de>
Content-Type: text/plain; charset=us-ascii
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

Hi,
Marius Groeger wrote:
> 
> On Thu, 11 Jul 2002, Daniel Belz wrote:
> 
> > PS.: I don't like to use the PPCBoot!!!
> 
> May I ask why? It sure would save you a lot of work... Anyway, if you don't
> want to use PPCboot, you can always rip out and use it's JFFS support
> routines.

I need somthing more simple, and I like to use the existent code for
board init.
I think to use the JFFS2 support from PPCB, but i can't separate the
JFFS2 code
from the boards support. And have the kernel parameters...


> 
> Regards,
> Marius
> 
> -----------------------------------------------------------------------------
> Marius Groeger           SYSGO Real-Time Solutions GmbH     mgroeger@sysgo.de
> Software Engineering     Embedded and Real-Time Software    www.sysgo.de
> Voice: +49-6136-9948-0   Am Pfaffenstein 14                 www.osek.de
> FAX:   +49-6136-9948-10  55270 Klein-Winternheim, Germany   www.elinos.com


Tanks


-- 
------------------------------------------------- 
 Daniel Belz           danielb@cyclades.com.br
 Cyclades Brasil       R&D 
 Sao Paulo - Brazil    +55 (11) 5033-3393
-------------------------------------------------
