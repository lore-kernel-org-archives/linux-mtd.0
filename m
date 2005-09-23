Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIjMe-0008M9-V5
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2005 04:57:14 -0400
Date: Fri, 23 Sep 2005 10:57:00 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050923085700.GB7522@wohnheim.fh-wedel.de>
References: <433299BA.2020104@yandex.ru>
	<BAY17-F10C500F5E809F9445B7A52E8960@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F10C500F5E809F9445B7A52E8960@phx.gbl>
Cc: dedekind@yandex.ru, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Adding eraseblock header support(revised version)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 23 September 2005 10:45:00 +0800, zhao forrest wrote:
> >
> 1 According to the later disscusion in "1:1 mapping" thread, we should
> reject mounting when detect cross-boundary. In another word, we should
> not reject mounting if we don't detect cross-boundary. Right? This is
> just what my patch implemented :)
> 
> 2 The reason why we introduce JFFS2_NODETYPE_INODE_EBH has nothing to
> do with "when an old JFFS2 image is mounted by new JFFS2 code". It's
> related with "when an new JFFS2 image is mounted by old JFFS2 code".
> Your original design mail for eraseblock header has a clear description
> of it.
> So the problem is still open:
> Whether should we set the compat flag of eraseblock_header to
> RWCOMPAT_DELETE or INCOMPAT???

That's still a problem of the virtual mapping desaster.  I refuse to
discuss it in the context of erase block headers. ;)

Jörn

-- 
ticks = jiffies;
while (ticks == jiffies);
ticks = jiffies;
-- /usr/src/linux/init/main.c
