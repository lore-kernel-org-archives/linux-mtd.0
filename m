Received: from [195.144.108.44] (helo=mail.deltaes.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15cpd0-0000OS-00
	for <linux-mtd@lists.infradead.org>; Fri, 31 Aug 2001 15:50:38 +0100
Date: Fri, 31 Aug 2001 16:57:22 +0200 (CEST)
From: martin.kula@deltaes.cz
Reply-To: martin.kula@deltaes.cz
To: Veikko Werner <veikko.werner@logware.de>
cc: linux-mtd@lists.infradead.org
Subject: RE: DOC2000 Boot de-ja-vue
In-Reply-To: <71B37AB6576DD211AB7E008048CD4D319FA650@exchange.ten.logware.de>
Message-ID: <Pine.LNX.4.21.0108311655170.1786-100000@lxserver.deltes.cz>
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

Than I think that kernel can't read root volume at all.
Bootloader read the volume before bootting. Kernel doesn't do it.

Martin

On Fri, 31 Aug 2001, Veikko Werner wrote:

> thanks, but that doesn't work too
> 
> no way to start /bin/bash and others
> 
> Veikko
> 
> > -----Original Message-----
> > From:	martin.kula@deltaes.cz [SMTP:martin.kula@deltaes.cz]
> > Sent:	Friday, August 31, 2001 3:49 PM
> > To:	linux-mtd@lists.infradead.org
> > Subject:	RE: DOC2000 Boot de-ja-vue
> > 
> > Hi
> > Read last line in the syslog (kernel) messages.
> > .... No init found ......
> > Kernel can't found init executable ... default /sbin/init ... on root
> > volume.
> > Have you got it there? Or you can pass init=some_executable into your
> > kernel before bootting (by grub or lilo), where some_executabe can be
> > /bin/sh for example.
