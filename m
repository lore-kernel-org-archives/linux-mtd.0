Received: from bay7-f7.bay7.hotmail.com ([64.4.11.7] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dhewd-0003xU-El
	for linux-mtd@lists.infradead.org; Sun, 12 Jun 2005 22:45:01 -0400
Message-ID: <BAY7-F7DE7464BD17A2C4E930DEDAF00@phx.gbl>
In-Reply-To: <20050610112127.GA29546@wohnheim.fh-wedel.de>
From: "tong changda" <tongcd@hotmail.com>
To: joern@wohnheim.fh-wedel.de, munira.ahmed@radixs.com
Date: Mon, 13 Jun 2005 10:23:28 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: dedekind@yandex.ru, linux-mtd@lists.infradead.org
Subject: Re: jffs2 corrupt rarely, how to fix it?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Seem a little hard for me
I guess all changeset for jffs2 is limited in fs/jffs2/. the interface with 
mtd should keep unchanged, If so, is it easier to start from linux-2.4.31 
instead of 2.6.11.11?
Thanks.

>From: J鰎n Engel <joern@wohnheim.fh-wedel.de>
>To: Munira Ahmed <munira.ahmed@radixs.com>
>CC: "Artem B. Bityuckiy" <dedekind@yandex.ru>,tong changda 
<tongcd@hotmail.com>,"linux-mtd@lists.infradead.org" 
<linux-mtd@lists.infradead.org>
>Subject: Re: jffs2 corrupt rarely, how to fix it?
>Date: Fri, 10 Jun 2005 13:21:28 +0200
>
>On Fri, 10 June 2005 16:14:21 +0800, Munira Ahmed wrote:
> > On Fri, 2005-06-10 at 12:03 +0400, Artem B. Bityuckiy wrote:
> > >
> > > Many fixes were made since the time of 2.4.20. So, use newer MTD.
> > >
> > I am also working on jffs2 and have been advised to update mtd. but I 
am
> > afraid that keeping the kernel same and updating the mtd may result in
> > some incomapatibility.
>
>Correct.  You're basically left with three options:
>1. Update to a current 2.6 kernel (2.6.11.11 or so).
>2. Merge current mtd/jffs2 with your kernel and make sure it works.
>3. Convince someone to do 2. for you.  This usually involves money.
>
>J鰎n
>
>--
>When you close your hand, you own nothing. When you open it up, you
>own the whole world.
>-- Li Mu Bai in Tiger & Dragon

_________________________________________________________________
与联机的朋友进行交流，请使用 MSN Messenger:  http://messenger.msn.com/cn  
