Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14DWXH-0008V8-00
	for mtd-list@infradead.org; Tue, 02 Jan 2001 18:51:51 +0000
Message-ID: <3A522396.510E91E5@mvista.com>
Date: Tue, 02 Jan 2001 10:53:10 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mark.langsdorf@amd.com, mtd@infradead.org
Subject: Re: CFI ident problems with AMD chips.
References: <4883.977501550@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

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

In the Am29DL322D/323D/324D spec, there's  a Top/Bottom Boot Sector Flag at
the end of the Primary Vendor-Specific Extended Query at address 4F (word mode)

where 02 = bottom, 03 = top.   I haven't tried it  yet.

Alice



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
