Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13DpTo-0004Fo-00
	for mtd-list@infradead.org; Sun, 16 Jul 2000 15:33:16 +0100
Date: Sun, 16 Jul 2000 15:32:13 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Prabha19 Selva <sprabha19@hotmail.com>
cc: mtd@infradead.org, sprabha@hotmail.com
Subject: Re: Fwd: Re: Error when loading the modules
In-Reply-To: <20000715222433.57109.qmail@hotmail.com>
Message-ID: <Pine.LNX.4.21.0007161530460.900-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Sat, 15 Jul 2000, Prabha19 Selva wrote:

> Hi David,
> Still the same problem (can not load the cfi_prob.o, cfi_cmdset_0002.o
> etc. modules. It is still giving "unresolved symbol put-module-symbol". I 
> have added the patch you mentioned earlier and recompile the kernel and also 
> (just to make sure) the mtd drivers. But I still get the same error.


Either the patch didn't apply properly, or you're not running the kernel
to which you applied the patch.

Check that kernel/ksyms.c contains a line which says:
	EXPORT_SYMBOL(put_module_symbol);

Check that put_module_symbol exists in /proc/ksyms

Make sure CONFIG_MODVERSIONS is turned off.

--
dwmw2



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
