Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13X6Tq-0004qp-00
	for mtd-list@infradead.org; Thu, 07 Sep 2000 19:32:58 +0100
Message-ID: <39B7E0CA.49A427A4@mvista.com>
Date: Thu, 07 Sep 2000 11:39:06 -0700
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: mtd@infradead.org, ahennessy@mvista.com
Subject: get_module_symbol
References: <39AF00C6.DA335C86@mvista.com>  <39AC4D1F.BFBEEA21@mvista.com> <398F1287.E29C8ECE@matrox.com> <31647.965720843@cygnus.co.uk> <9503.967625312@cygnus.co.uk> <19439.968073410@passion.cygnus.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

Couple of questions:

get_module_symbol()  is not finding "cfi_cmdset_0002"  in my environment
because the symbol table has version info after the function name.    Any
clue why?  (I'm not building mtd as a module) - I'm currently getting
around this by using  strncmp.

Also,  in mtdchar.c  mtd_write()  -> should be passing kbuf instead of buf
in  (*(mtd->write)) call,  correct?

Thanks,
Alice



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
