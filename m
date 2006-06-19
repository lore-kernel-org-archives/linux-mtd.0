Received: from ocean.emcraft.com ([213.221.7.182])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FsEWj-0003oa-EO
	for linux-mtd@lists.infradead.org; Mon, 19 Jun 2006 03:50:38 -0400
From: Dmitry Bazhenov <dbazhenov@rambler.ru>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [JFFS2] a way to reduce memory usage
Date: Mon, 19 Jun 2006 11:50:08 +0400
References: <200606151216.23086.dbazhenov@rambler.ru>
	<1150587140.2584.32.camel@shinybook.infradead.org>
In-Reply-To: <1150587140.2584.32.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200606191150.08436.dbazhenov@rambler.ru>
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > As I understand, for the moment every reference to raw node is kept in-core,
> > even for obsoleted one. I think it is a bit excessive.
> 
> ... However, we were
> only actually doing that on NOR flash anyway, because on NAND we do need
> access to obsolete dirent nodes.
> 
The algorithm allows to leave in memory only references to those nodes, that
can affect future functionality, but to free references to all other nodes.
The algorithm is appliable for the case of NAND chips also.

--
Dmitry
