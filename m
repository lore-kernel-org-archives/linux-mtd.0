Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A7q7n-00030F-UW
	for <linux-mtd@lists.infradead.org>; Fri, 10 Oct 2003 06:47:43 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Ingo Flaschberger <if@sil.at>
In-Reply-To: <Pine.GSO.4.56.0310100453520.19931@ikarus.sil.at>
References: <Pine.GSO.4.56.0310100453520.19931@ikarus.sil.at>
Message-Id: <1065764780.30987.333.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Fri, 10 Oct 2003 06:46:21 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: jffs-dev@axis.com
Subject: Re: kmalloc jffs2_do_mount_fs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-10-10 at 05:13 +0200, Ingo Flaschberger wrote:
> but why doe you not apply it to the source or warn because of this
> "jffs2" problem???

Partly because I'm unconvinced that we want to actually _use_ such a
small erasesize. It means you split far more page writes into two nodes
to avoid crossing block boundaries, and hence waste space.

I suspect the main reason Thomas objected to my original 'min 64KiB' was
because of the 5-erase-block threshold. Since I've just wound that
threshold _up_ on NAND because and it's also based in part on nr_blocks
now, we could perhaps rethink the minimum erasesize. I didn't manage to
tie him down on #mtd yesterday though.

-- 
dwmw2
