Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKX7A-0000r3-Fv
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2005 04:16:40 -0400
Date: Wed, 28 Sep 2005 10:16:35 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: zhao forrest <zhao_fusheng@hotmail.com>
Message-ID: <20050928081635.GA16484@wohnheim.fh-wedel.de>
References: <BAY17-F12414C0763DD8F8C87F486E88D0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BAY17-F12414C0763DD8F8C87F486E88D0@phx.gbl>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]1:1 mapping(revision 2)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 28 September 2005 15:42:01 +0800, zhao forrest wrote:
> 
> Compared with revision 1, the main changes are:
> 1 changing from sizeof(uint8_t *) to sizeof(void *)
> 2 move the definitin of jffs2_blocks_use_vmalloc()
> from nodelist.h to malloc.c
> 3 other minor cleanups

> +	return ((c->flash_size / c->sector_size) * sizeof (struct jffs2_eraseblock)) > (128 * 1024);

	return ((c->flash_size / c->sector_size) * sizeof(void*)) > (128 * 1024);

Rest looks fine.

With this change, the patch "can go right in".  Since we want to quiet
down for a while, to stabilize current cvs code, that would mean
something like "in about a month", I guess.

Jörn

-- 
You cannot suppose that Moliere ever troubled himself to be original in the
matter of ideas. You cannot suppose that the stories he tells in his plays
have never been told before. They were culled, as you very well know.
-- Andre-Louis Moreau in Scarabouche
