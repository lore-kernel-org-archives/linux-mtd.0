Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EDQco-0007mS-3F
	for linux-mtd@lists.infradead.org; Thu, 08 Sep 2005 13:56:03 -0400
Date: Thu, 8 Sep 2005 19:55:28 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050908175528.GA20668@wohnheim.fh-wedel.de>
References: <20050830104737.GD9504@wohnheim.fh-wedel.de>
	<BAY17-F33D027CAAFE3148BB59A23E8A60@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F33D027CAAFE3148BB59A23E8A60@phx.gbl>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] remove support for virtual blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 7 September 2005 14:52:45 +0800, zhao forrest wrote:
> 
> I agree with you that "slab cache" is a good idea. But "struct 
> jffs2_eraseblock are put into a linked list or similar structure" is
> not a perfect solution IMO. In JFFS2 code, there're several places
> where the jeb is got by block_nr. So if struct jffs2_eraseblock are
> put into linked list, the time of searching a jeb by block_nr will
> not be O(1).
> 
> The data structure in my mind is "pointer array + slab cache".
> So jeb is got by jeb = blocks[block_nr].element;, element is a 
> pointer to struct jffs2_eraseblock.
> 
> Does it make sense?

Mostly.  Why do you want the element part?

struct jffs2_eraseblock *blocks;
...
blocks = kmalloc(...);
...
jeb = blocks[block_nr];

Jörn

-- 
Don't worry about people stealing your ideas. If your ideas are any good,
you'll have to ram them down people's throats.
-- Howard Aiken quoted by Ken Iverson quoted by Jim Horning quoted by
   Raph Levien, 1979
