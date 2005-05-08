Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DUcBX-00013c-7M
	for linux-mtd@lists.infradead.org; Sat, 07 May 2005 23:10:28 -0400
Date: Sun, 8 May 2005 05:10:17 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050508031017.GB32173@wohnheim.fh-wedel.de>
References: <E167ED46776D284B893BE52E888B69BC030F2125@USNVEX3.tellabs-west.tellabsinc.net>
	<1115364989.27158.5.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1115364989.27158.5.camel@sauron.oktetlabs.ru>
Cc: linux-mtd@lists.infradead.org, "Burch, John T." <John.Burch@tellabs.com>
Subject: Re: JFFS2 format compatibility between kernel versions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 6 May 2005 11:36:29 +0400, Artem B. Bityuckiy wrote:
> 
> > Is a JFFS2 type filesystem formatted from blank flash (running as part
> > of
> > kernel 2.4.17) fully compatible with JFFS2 running on kernel 2.6.8?
> > In other words, if a system's kernel is upgraded from 2.4.17 to 2.6.8,
> > will a filesystem created under 2.4.17 be fully compatible when accessed
> > by the 2.6.8 kernel?  I haven't seen any problems, but want to make sure
> > there isn't any form of incompatibility that might show up later.
> I didn't try, but theoretically it should be.

If there is a form of incompatibility, you can consider it to be a bug
and report it to this list.

Jörn

-- 
He that composes himself is wiser than he that composes a book.
-- B. Franklin
