Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13OUhi-0002fD-00
	for mtd-list@infradead.org; Tue, 15 Aug 2000 01:35:42 +0100
Received: from mail04.syd.optusnet.com.au ([203.2.75.107])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13OUhe-0002f7-00
	for mtd@infradead.org; Tue, 15 Aug 2000 01:35:38 +0100
Received: from ctam.com.au (198.142.103.111.optusnet.com.au [198.142.103.111] (may be forged))
	by mail04.syd.optusnet.com.au (8.9.3/8.9.3) with ESMTP id KAA01280
	for <mtd@infradead.org>; Tue, 15 Aug 2000 10:34:15 +1000
Message-ID: <399890CE.A0F606F0@ctam.com.au>
Date: Tue, 15 Aug 2000 10:37:34 +1000
From: Brendan J Simon <brendan.simon@ctam.com.au>
Reply-To: brendan.simon@ctam.com.au
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Re: Integrating 2000 and Millenium drivers
References: <6011381691@mamao.cetuc.puc-rio.br>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I don't know the code very well, but I would push for code reuse where ever
possibl
 Maybe there should be three file ???  One that has the common/shared code,
one for Doc2000 specific code and one for DocMil specific code ???

Brendan Simon.


Miguel Freitas wrote:

>     Hi,
>     I'm fixing some little things on DOC2000 driver, and I'm wondering
> if we could integrate 2k and Millenium drivers in a single file. There
> is so many common code in these two drivers that I guess we could
> do it like m-sys do: a single driver with a flag to enable all pipeline
> stuff from millenium and registers. A single variable pointing to the
> IO register would also be nice.
>     I agree that from a first version perspective it's better to develop
> two drivers. We can work in all 2k or Mil little tricks without breaking
> the other. But maybe we are reaching a stable low level routines
> where the merge could be done.
>     I don't have the millenium hardware, so I would probably break
> everything for millenium users if I make this merge. Is there
> someone with knowledge of DoC Mil (and spare time!) to help me
> with it?
>
>     BTW, I've just begin hacking DoC last month, so forgive me if I'm
> missing some good reason why these drivers can't be merged...
>
> Regards,
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
