Received: from bay17-f33.bay17.hotmail.com ([64.4.43.83] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1ECu5a-00055c-Ak
	for linux-mtd@lists.infradead.org; Wed, 07 Sep 2005 03:11:26 -0400
Message-ID: <BAY17-F33D027CAAFE3148BB59A23E8A60@phx.gbl>
In-Reply-To: <20050830104737.GD9504@wohnheim.fh-wedel.de>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: joern@wohnheim.fh-wedel.de, jaredeh@gmail.com
Date: Wed, 07 Sep 2005 14:52:45 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
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


>
>Take 3: slab cache
>
>This would be my preferred solution, although it also has drawbacks
>and is a lot of work.  Instead of organizing the struct
>jffs2_eraseblock in an array, they are put into a linked list or
>similar structure.  Now it is possible to allocate the structures one
>at a time, using a dedicated slab cache.  Drawback is a different
>handling of blocks and increasing the struct jffs2_eraseblock by one
>struct list_head - 8 or 16 bytes depending on your architecture.
>
Hi, Joern

I agree with you that "slab cache" is a good idea. But "struct 
jffs2_eraseblock are put into a linked list or similar structure" is
not a perfect solution IMO. In JFFS2 code, there're several places
where the jeb is got by block_nr. So if struct jffs2_eraseblock are
put into linked list, the time of searching a jeb by block_nr will
not be O(1).

The data structure in my mind is "pointer array + slab cache".
So jeb is got by jeb = blocks[block_nr].element;, element is a 
pointer to struct jffs2_eraseblock.

Does it make sense?

Thanks,
Forrest
