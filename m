Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13qLhr-0003WB-00
	for mtd-list@infradead.org; Mon, 30 Oct 2000 20:38:59 +0000
Received: from imladris.demon.co.uk ([193.237.130.41] ident=root)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13qLhq-0003W5-00
	for mtd@infradead.org; Mon, 30 Oct 2000 20:38:58 +0000
Date: Mon, 30 Oct 2000 20:38:54 +0000 (GMT)
From: David Woodhouse <dwmw2@infradead.org>
To: Qiuyuan Liu <q.liu@acm.org>
cc: mtd@infradead.org
Subject: Re: building mtd: put_module_symbol?
In-Reply-To: <39FDD62E1B8.9E6AQ.LIU@mail.neontech.com>
Message-ID: <Pine.LNX.4.21.0010302033500.15834-100000@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 30 Oct 2000, Qiuyuan Liu wrote:

> 1. where is put_module_symbol defined referred in mtd/map.h:
> do_map_probe().

Apply put_module_symbol-2.2.18.patch to your kernel.

> 2. set_current_state redefinition

Fixed in cvs tree.

> 3. physmap.c, line 65:
> 'CONFIG_MTD_PHYSMAP_BUSWIDTH' undeclared here (not in a function)
> initializer elemennt for 'physmap_map.buswidth' is not constant

Likewise.

-- 
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
