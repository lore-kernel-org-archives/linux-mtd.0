Received: from bay7-f32.bay7.hotmail.com ([64.4.11.57] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dhzo7-0001U3-4p
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2005 21:01:41 -0400
Message-ID: <BAY7-F32F576C95CF56BEF0F5611DAF30@phx.gbl>
In-Reply-To: <20050613072709.GB26966@wohnheim.fh-wedel.de>
From: "tong changda" <tongcd@hotmail.com>
To: joern@wohnheim.fh-wedel.de
Date: Tue, 14 Jun 2005 08:44:03 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: dedekind@yandex.ru, linux-mtd@lists.infradead.org, munira.ahmed@radixs.com
Subject: Re: jffs2 corrupt rarely, how to fix it?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks, one last question
After I had porting the mtd/jffs2 code, how to confirm that the problem is 
fixed? That is, Is there some ways to make these bugs to be more easily 
appeared on arm-linux-2.4.19/20?

>From: J鰎n Engel <joern@wohnheim.fh-wedel.de>
>To: tong changda <tongcd@hotmail.com>
>CC: munira.ahmed@radixs.com, 
dedekind@yandex.ru,linux-mtd@lists.infradead.org
>Subject: Re: jffs2 corrupt rarely, how to fix it?
>Date: Mon, 13 Jun 2005 09:27:09 +0200
>
>On Mon, 13 June 2005 10:23:28 +0800, tong changda wrote:
> >
> > Seem a little hard for me
> > I guess all changeset for jffs2 is limited in fs/jffs2/. the interface 
with
> > mtd should keep unchanged, If so, is it easier to start from 
linux-2.4.31
> > instead of 2.6.11.11?
>
>Most likely.  It should still be quite a bit of work.  An mtd update
>once caused people to claim that I effectively updated our kernel.  It
>pulled in quite a bit from header files that didn't exist in the old
>kernel, etc.
>
>J鰎n
>
>--
>And spam is a useful source of entropy for /dev/random too!
>-- Jasmine Strong

_________________________________________________________________
与联机的朋友进行交流，请使用 MSN Messenger:  http://messenger.msn.com/cn  
