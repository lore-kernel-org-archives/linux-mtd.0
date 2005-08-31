Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EAPeS-0001m9-8Q
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2005 06:17:08 -0400
Date: Wed, 31 Aug 2005 12:17:00 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
Message-ID: <20050831101700.GB19207@wohnheim.fh-wedel.de>
References: <20050826102512.GA23886@wohnheim.fh-wedel.de>
	<1125087149.26481.12.camel@windu.rchland.ibm.com>
	<20050829100722.GB17088@wohnheim.fh-wedel.de>
	<1125340972.30800.7.camel@windu.rchland.ibm.com>
	<20050829185042.GA28514@wohnheim.fh-wedel.de>
	<43142B62.6040909@inf.u-szeged.hu>
	<20050830100036.GB9504@wohnheim.fh-wedel.de>
	<431576F8.8070405@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <431576F8.8070405@inf.u-szeged.hu>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] remove support for virtual blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 31 August 2005 11:23:04 +0200, Ferenc Havasi wrote:
> >
> OK, it's ready: http://www.inf.u-szeged.hu/jffs2/jffs2-novirtblocks.patch

I'm not sure about the operand order and couldn't find it in c99.
Either put brackets around "c->flash_size / c->sector_size" or tell me
the section in c99 that I missed.

> May I commit it? (for temporary solution)

I'm still a bit afraid.  This is exactly the patch that will cause
data loss for some poor users, if they upgrade.  I'll write a warning
mail to the list.  Once you read that, you can go ahead and commit.

Jörn

-- 
It is better to die of hunger having lived without grief and fear,
than to live with a troubled spirit amid abundance.
-- Epictetus
