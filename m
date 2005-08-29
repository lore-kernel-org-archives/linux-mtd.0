Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E9ois-0003vw-Rb
	for linux-mtd@lists.infradead.org; Mon, 29 Aug 2005 14:51:12 -0400
Date: Mon, 29 Aug 2005 20:50:42 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jdub@us.ibm.com>
Message-ID: <20050829185042.GA28514@wohnheim.fh-wedel.de>
References: <20050826102512.GA23886@wohnheim.fh-wedel.de>
	<1125087149.26481.12.camel@windu.rchland.ibm.com>
	<20050829100722.GB17088@wohnheim.fh-wedel.de>
	<1125340972.30800.7.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1125340972.30800.7.camel@windu.rchland.ibm.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] remove support for virtual blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 29 August 2005 13:42:52 -0500, Josh Boyer wrote:
> 
> Be realistic, this is JFFS2 not ext3 :).  If we break support for larger
> devices, people aren't going to complain about it for months.  That
> means this patch will sit here for months too.

Agreed.

> I'd rather we switch to using vmalloc instead for now.  It's not an end
> solution, but at least it doesn't prevent larger devices from being
> used.

Can you explain this in diff -u format?

So far, my patch is the only one in existence.  It is not perfect, no
doubt about that.  And I will drop it as soon as I see something
better.  But so far, nothing has shown up. ;)

Jörn

-- 
"Security vulnerabilities are here to stay."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
