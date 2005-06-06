Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DfHSb-0008NL-1u
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2005 09:16:10 -0400
Date: Mon, 6 Jun 2005 15:15:34 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050606131534.GC31739@wohnheim.fh-wedel.de>
References: <1118062747.5629.9.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1118062747.5629.9.camel@sauron.oktetlabs.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS3 superblock search
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 6 June 2005 16:59:07 +0400, Artem B. Bityuckiy wrote:
> 
> P.S. Since the document has no description of the general approach of
> storing data in JFFS3, I'll note that I'm thinking about a Reiser4-like
> approach, i.e., storing all the FS data in one 4-level B+ tree. There
> will be a superblock containing the FS description and admitting of very
> fast JFFS3 mount.

You already know that I'm skeptical about the B+ tree.  But I'm even
more skeptical about a 4-level tree.  That could turn into a
bottleneck rather quickly.

Apart from that, I'd like to see some further details of the tree
design.

Jörn

-- 
Do not stop an army on its way home.
-- Sun Tzu
