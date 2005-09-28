Received: from bay17-f25.bay17.hotmail.com ([64.4.43.75] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKXjZ-0001OR-64
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2005 04:56:35 -0400
Message-ID: <BAY17-F251C753C13F2DA744709DBE88D0@phx.gbl>
In-Reply-To: <20050928081635.GA16484@wohnheim.fh-wedel.de>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: joern@wohnheim.fh-wedel.de
Date: Wed, 28 Sep 2005 16:38:30 +0800
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

OK. The final version is at:
http://www.infradead.org/~forrest/1:1mapping_r2.patch

Thanks,
Forrest
