Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 14801Y-0003dr-00
	for mtd-list@infradead.org; Mon, 18 Dec 2000 13:08:16 +0000
Received: from www.softsys.co.at
	([194.152.163.161] helo=corofin.softsys.co.at ident=qmailr)
	by infradead.org with smtp (Exim 3.16 #2)
	id 14801V-0003dk-00
	for mtd@infradead.org; Mon, 18 Dec 2000 13:08:14 +0000
Message-ID: <000e01c068f3$13881180$5201a8c0@home.at>
From: "Erwin Authried" <eauth@softsys.co.at>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
References: <Pine.LNX.4.30.0012180026320.18907-100000@imladris.demon.co.uk>
Subject: Re: module registration changes
Date: Mon, 18 Dec 2000 14:04:37 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

there were a couple of small changes necessary to compile on 2.0.
Here are some other changes that I would like to commit too, please let me
know if its ok.:

* Use #ifdef NO_MM in mtdchar.c to avoid vmalloc if no MMU is used
(uClinux).

* "list.h" is missing in the 2.0 kernel source. The best thing that I could
think of is to simply add it
to MTD in linux/mtd/list.h.

* Somehow initcalls.c must be used for 2.0 kernels conditionally. Either in
the Makefile, or just
#include from mtdcore.c? I don't know how to do that in the Makefile nicely.

Regards,

Erwin

----- Original Message -----
From: David Woodhouse <dwmw2@infradead.org>
To: <eauth@softsys.co.at>
Cc: <mtd@infradead.org>
Sent: Monday, December 18, 2000 1:29 AM
Subject: module registration changes


>
> Please could people test the new stuff I've just committed to bypass the
> inter_module_get code by using weakly-linked symbols? Especially on 2.0.
>
> This should also fix the dependency on link order which was introduced by
> the removal of get_module_symbol().
>
> --
> dwmw2
>
>
>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
