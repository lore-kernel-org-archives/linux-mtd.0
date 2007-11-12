Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IrbJe-0003ry-CC
	for linux-mtd@lists.infradead.org; Mon, 12 Nov 2007 10:35:16 -0500
Subject: Re: Kernel memleak in jffs2_erase_block() (fs/jffs2/erase.c:78)
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Damir Shayhutdinov <lost404@gmail.com>
In-Reply-To: <679044850711120442y520253feq1f97bb30d871fe31@mail.gmail.com>
References: <679044850711120239wbf9545bxf990ceb1459c3c51@mail.gmail.com>
	<1194870649.4029.37.camel@gentoo-jocke.transmode.se>
	<679044850711120442y520253feq1f97bb30d871fe31@mail.gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Mon, 12 Nov 2007 16:35:09 +0100
Message-Id: <1194881709.4029.50.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-11-12 at 15:42 +0300, Damir Shayhutdinov wrote:
> > > So, sizeof(struct erase_info) + sizeof(struct erase_priv_struct) bytes
> > > are leaking each time block is erased successfully.
> >
> > Nope, instr is freed in jffs2_erase_callback() in this case.
> 
> Oh, I missed that part. You're right. Maybe it's worth some comments
> in source code?

Sure, if you want you can send a patch to the list/David.

 Jocke
