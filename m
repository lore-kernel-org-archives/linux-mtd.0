Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13DaMt-0002iA-00
	for mtd-list@infradead.org; Sat, 15 Jul 2000 23:25:07 +0100
Received: from law-f64.hotmail.com ([209.185.131.127] helo=hotmail.com)
	by infradead.org with smtp (Exim 3.03 #1)
	id 13DaMr-0002i4-00
	for mtd@infradead.org; Sat, 15 Jul 2000 23:25:05 +0100
Message-ID: <20000715222433.57109.qmail@hotmail.com>
From: "Prabha19 Selva" <sprabha19@hotmail.com>
To: mtd@infradead.org
Cc: sprabha@hotmail.com
Subject: Fwd: Re: Error when loading the modules
Date: Sat, 15 Jul 2000 18:24:33 EDT
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi David,
Still the same problem (can not load the cfi_prob.o, cfi_cmdset_0002.o
etc. modules. It is still giving "unresolved symbol put-module-symbol". I 
have added the patch you mentioned earlier and recompile the kernel and also 
(just to make sure) the mtd drivers. But I still get the same error.

What can I do now...

Prabha

p.s. Do I need to apply anyother patches in the mtd/patches directory?...
>
>On Fri, 14 Jul 2000, David Woodhouse wrote:
>
> >
> > Apply the put_module_symbol-2.2.1x.patch patch to your kernel. It 
>provides
> > the put_module_symbol() function.
> >
> > --
> > dwmw2
> >
> >
> >
>
>

________________________________________________________________________
Get Your Private, Free E-mail from MSN Hotmail at http://www.hotmail.com



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
