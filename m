Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13yCL6-0001Wy-00
	for mtd-list@infradead.org; Tue, 21 Nov 2000 12:15:56 +0000
Received: from www.softsys.co.at
	([194.152.163.161] helo=corofin.softsys.co.at ident=qmailr)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13yCL3-0001Ws-00
	for mtd@infradead.org; Tue, 21 Nov 2000 12:15:54 +0000
Message-ID: <01C053BC.A1578B40@smithwicks.softsys.co.at>
From: Erwin Authried <eauth@softsys.co.at>
To: 'MTD List' <mtd@infradead.org>
Subject: Re: 2.4 stuff. 
Date: Tue, 21 Nov 2000 13:11:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse[SMTP:dwmw2@infradead.org] wrote:
> eauth@softsys.co.at said:
> > * compatmac.h: For 2.0, the inter_module_* functions are defined as
> > empty macros if CONFIG_MODULES is not defined. If CONFIG_MODULES is
> > defined (for 2.0), compilation is stopped with #error saying that it's
> > not possible to use MTD in 2.0 kernels with module support enabled.
> 
> Careful not to make the #error break stuff that does actually work. 
> If you're compiling in all the stuff that you're actually going to need, 
> but also have CONFIG_MODULES, it should all work, shouldn't it?
> 
Yes, you are right, that's really too restrictive. You can use modules in 
general, but MTD must be linked statically. 

> It might be better to define the inter_module_get() functions to return 
> NULL but printk a warning that they've been used - which should explain to 
> the user why it's not actually working for them.
> 
Nevertheless, I think that configuration of non-working stuff should be
disallowed by the configuration script, or by aborting the compilation. 
Why should we guide the user into a trap if we know it doesn't work?

-Erwin



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
