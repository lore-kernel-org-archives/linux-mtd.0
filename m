Received: from bay17-f17.bay17.hotmail.com ([64.4.43.67] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKoiW-0005hX-86
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2005 23:04:28 -0400
Message-ID: <BAY17-F17BAE916A33A743D7E8592E88C0@phx.gbl>
In-Reply-To: <20050928081635.GA16484@wohnheim.fh-wedel.de>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: joern@wohnheim.fh-wedel.de
Date: Thu, 29 Sep 2005 11:04:14 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
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

>On Wed, 28 September 2005 15:42:01 +0800, zhao forrest wrote:
> >
> > Compared with revision 1, the main changes are:
> > 1 changing from sizeof(uint8_t *) to sizeof(void *)
> > 2 move the definitin of jffs2_blocks_use_vmalloc()
> > from nodelist.h to malloc.c
> > 3 other minor cleanups
>
> > +	return ((c->flash_size / c->sector_size) * sizeof (struct 
jffs2_eraseblock)) > (128 * 1024);
>
>	return ((c->flash_size / c->sector_size) * sizeof(void*)) > (128 * 1024);
>
>Rest looks fine.
>
>With this change, the patch "can go right in".  Since we want to quiet
>down for a while, to stabilize current cvs code, that would mean
>something like "in about a month", I guess.
>

Since we have gone through the review, the patch is in good quality.
On the other hand, I even saw the check-in of new feature today. Then why
only I should wait for this one month delay??
So if there's no solid reason, I'll check in the patch today.

Thanks,
Forrest
