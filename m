Received: from samwise.efn.org ([12.33.21.33])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DqwC3-0001mc-OU
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2005 12:59:18 -0400
To: dedekind@yandex.ru
In-reply-to: <42CEAA83.20908@yandex.ru> (dedekind@yandex.ru)
References: <E1DqvgV-000275-00@amazonia.client.comcast.net>
	<42CEAA83.20908@yandex.ru>
Message-Id: <E1DqwC0-0002Er-00@amazonia.client.comcast.net>
From: Rick Bronson <rick@efn.org>
Date: Fri, 08 Jul 2005 09:59:12 -0700
Cc: linux-mtd@lists.infradead.org
Subject: Re: infinite loop in jffs2_flush_wbuf_gc()?
Reply-To: rick@efn.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Artem,

  Thanks very much for the response.

  Sorry, I never got your previous email answering my original post.
Nor did I see it in my saved archive of the mtd mailing list.  Hmmm.

  Anyway, I got the latest CVS a few weeks ago but then had to do:

cvs update -dP -D 2005-03-04

  because I'm using 2.4.27 on a ARM.

  I noticed that the code in wbuf.c is pretty much the same in the
latest CVS as in the 2005-03-04 version so I thought someone might
have stumbled upon this issue.

> you didn't write the version of Linux/MTD you're using. It's important 
> because I fixed one endless GC thread loop problem recently. Please, try 
> a fresh MTD snapshot (download it from CVS). If it won't help - come back.

  Maybe you could tell me roughly the fix, I'd really appreciate that.

  Thanks again.

  Rick
  

> Rick Bronson wrote:
> > Hi,
> > 
> >   I seem to encounter an infinite loop in in jffs2_flush_wbuf_gc() in
> > wbuf.c starting at: 
> > 
> Rick,
> 
> this is the second time you're reporting this and this is the second 
> time I inquire the version of your MTD :-) Is it the last MTD?
> 
> http://lists.infradead.org/pipermail/linux-mtd/2005-July/012948.html
> 
> -- 
> Best Regards,
> Artem B. Bityuckiy,
> St.-Petersburg, Russia.
> 
