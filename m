Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EebSW-0002bh-Vm
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2005 11:57:37 -0500
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IQD00HN28FS6F50@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 22 Nov 2005 11:57:28 -0500 (EST)
Date: Tue, 22 Nov 2005 11:57:28 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <43834421.1050509@yandex.ru>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Message-id: <Pine.LNX.4.64.0511221155400.6022@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <520AB2AD990DC04082102F77CA17263801CE70B4@dlee03.ent.ti.com>
	<43834421.1050509@yandex.ru>
Cc: linux-mtd@lists.infradead.org, "Menon, Nishanth" <x0nishan@ti.com>
Subject: Re: Jffs2 issue on latest mtd for Sibley NOR
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 22 Nov 2005, Artem B. Bityutskiy wrote:

> Menon, Nishanth wrote:
> > Hi All,
> > I have been trying Sibley NOR flash and the latest (as of today) MTD
> > tree on my kernel.
> > When I use the character device, I am able to unlock, erase, write and
> > read from it successfully. Unfortunately, when I try to use jffs2 on it,
> > I face the following issue:
> Could you please try to reproduce this on mtdram device which is just an
> emulator of NOR flash in RAM ?

That's useless in this case.

> > CONFIG_JFFS2_FS_WRITEBUFFER=y
> This is not usually needed for NOR. is 'siblay' an exception?

Yes it is.


Nicolas
