Received: from cmsout01.mbox.net ([165.212.64.31])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C1sPB-0003Dh-7Y
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2004 16:05:30 -0400
Message-ID: <073f01c48ecc$abd3e600$fd0ba8c0@briantpc>
From: "Brian T" <btuch@usa.net>
To: <linux-mtd@lists.infradead.org>
References: <070101c48ec7$d61e69d0$fd0ba8c0@briantpc>
	<1093894808.25339.57.camel@weaponx.rchland.ibm.com>
Date: Mon, 30 Aug 2004 15:05:16 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: jffs2 file corruption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> >
> > mkfs.jffs2 -o romfs.img -U -n -p -e0x2000 -d romfs/
>
> 128KiB is 0x20000 (131072), not 0x2000 (8192).  Not sure if that was a
> typo or not.
>

Yeah typo, sorry.

> > What other info would be needed to figure out what's wrong with this
> > picture?
>
> Maybe try setting CONFIG_JFFS2_FS_DEBUG=1.

Did that.  My /var/ partition is a 512K RAMFS, and /var/log/messages rotates
after 200K.  I will probably need to up that partition a bit and make the
log rotate higher to get more debug stuff.

-Brian
