Received: from relay-5m.club-internet.fr ([194.158.104.44])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AORWC-0003J8-UX
	for <linux-mtd@lists.infradead.org>; Tue, 25 Nov 2003 00:57:28 +0000
Date: Tue, 25 Nov 2003 00:43:40 -0100 (GMT+1)
From: Jasmine Strong <jasmine@regolith.co.uk>
To: Ilguiz Latypov <ilatypov@infradead.org>
In-Reply-To: <20031125003817.GA1762@ei.homeip.net>
Message-ID: <Pine.LNX.4.53.0311250040510.2903@pink.linuxgrrls.org>
References: <20031124213552.5357c92a.lanas@t-online.de>
	<20031125003817.GA1762@ei.homeip.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: Re: DoC newbie
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Mon, 24 Nov 2003, Ilguiz Latypov wrote:

> LILO would need disk I/O int 0x13 emulation.  Such layer is offered by
> M-Sys.  I don't know if the source code for it is open.

It isn't.  Furthermore, this list isn't the right place for discussing it,
especially now that good free (and indeed Free) alternatives exist.

> I saw messages on JFFS2 on NAND driver development in the MTD mailing
> list archives.

JFFS2 may not be the most appropriate filesystem for many NAND-based
embedded applications.  yaffs is nicer in some ways, for some
applications, and the nftl code has the advantage that grub groks nftl and
so does the M-Systems DOS firmware...

-Jasmine.
