Received: from bs1.dnx.de ([213.252.143.130] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1758rT-0004rz-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 May 2002 18:34:51 +0100
Date: Tue, 7 May 2002 19:34:30 +0200
From: Robert Schwebel <robert@schwebel.de>
To: rkaiser@sysgo.de
Cc: linux-mtd@lists.infradead.org
Subject: Re: 2.4.18-howto?
Message-ID: <20020507193430.D15258@schwebel.de>
References: <81D0D3538E3CD411AE3C00D0B7474C31C8EE37@jadran.hermes.si> <20020507150057.R16630@schwebel.de> <200205071614.g47GElw06345@dagobert.svc.sysgo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200205071614.g47GElw06345@dagobert.svc.sysgo.de>; from rob@sysgo.de on Tue, May 07, 2002 at 06:16:10PM +0200
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

Hi Robert, 

On Tue, May 07, 2002 at 06:16:10PM +0200, Robert Kaiser wrote:
> > I need the ADNP concaternation layer stuff...
> 
> Does this part cause any specific trouble ? (if so, which ?)

Yes, it doesn't work yet :-) 

# cat /proc/mtd
dev:    size   erasesize  name
# 

This is also interesting, during boot: 
DIL/Net ADNP flash: 0x400000 at 0x2000000
FLASH virtual address: 0xc180d000
CFI: Found no ADNP Flash Bank device at location zero

> > Yes, but it is nearly one year old.
> 
> .. which doesn't necessarily mean it's outdated...

<quote>
This document will attempt to describe setting up the MTD (Memory
Technology Devices), DOC, CFI and the JFFS (Journaling Flash File System)
under Linux versions 2.2.x and 2.4.x
</quote>

According to what I've read on the list it looks like it is currently more
like for 2.4 and 2.5? I've found a hint somewhere in the list archive that
ther exists an 2_4-branch, but trying to check it out results in nearly all
files being removed from my working copy. 

Is there any possibility to find out for a cvs repository which branches do
exist? However, a hint in the howto would be great how things are meant to
work for 2.4 and for 2.5. If you send me the infos I'll send a patch :-)

This: http://www.linux-mtd.infradead.org/ is also terribly outdated (latest
changelog from 2000). And there's no pointer on this page to David's page
at Red Hat, which contains a nice paper about MTD/JFFS. 

> I read in an earlier mail that your problem is with compiling the utils
> (all of them or is it just mkfs.jffs ?). Note that you don't necessarily
> need this program, even if you plan on using jffs2. The only utils you
> really need are erase and eraseall.

Don't ask - some dark magic has blown most of the problems away today, I
can compile the tools now. 

Robert
-- 
 +--------------------------------------------------------+
 | Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de |
 | Pengutronix - Linux Solutions for Science and Industry |
 |   Braunschweiger Str. 79,  31134 Hildesheim, Germany   |
 |    Phone: +49-5121-28619-0 |  Fax: +49-5121-28619-4    |
 +--------------------------------------------------------+
