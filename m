Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14AW3B-0001Kj-00
	for mtd-list@infradead.org; Mon, 25 Dec 2000 11:44:21 +0000
Message-ID: <3A473302.74DD6A6B@auriga.ru>
Date: Mon, 25 Dec 2000 14:44:02 +0300
From: Nick Ivanter <nick@auriga.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mark.langsdorf@amd.com, mtd@infradead.org
Subject: Re: CFI ident problems with AMD chips.
References: <4883.977501550@redhat.com>
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

They surely have differnet Device ID's which can be found in a datasheet
and compared with the reported ones.

Nick

David Woodhouse wrote:

> Hi,
>
> I've now started using AMD chips. I have a chip which I believe to be a
> 4MiB part with TOP boot blocks. Should be 63*64KiB erase regions followed by
> 8*8KiB erase regions.
>
> However, the CFI "Erase Block Region" information reports them in the wrong
> order - the 8*8KiB blocks _before_ the 63*64KiB.
>
> Is there some way to tell the top-boot parts apart from the bottom-boot
> parts?
>
> --
> dwmw2
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
