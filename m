Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141Wyn-0007HC-00
	for mtd-list@infradead.org; Thu, 30 Nov 2000 16:54:41 +0000
Received: from amdext2.amd.com ([163.181.251.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 141Wyg-0007H3-00
	for mtd@infradead.org; Thu, 30 Nov 2000 16:54:39 +0000
Received: from odyssey.amd.com (odyssey.amd.com [163.181.250.8])
	by amdext2.amd.com (8.9.3/8.9.3/AMD) with SMTP id KAA13542
	for <mtd@infradead.org>; Thu, 30 Nov 2000 10:53:57 -0600 (CST)
From: mark.langsdorf@amd.com
Received: from txexmta8.amd.com (txexmta8.amd.com [163.181.3.118]) by
 amdint2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id KAA16929 for
 <mtd@infradead.org>; Thu, 30 Nov 2000 10:53:56 -0600 (CST)
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9F1FC@txexmta8.amd.com>
To: mtd@infradead.org
Subject: RE: inter-module-2.2.17 patch
Date: Thu, 30 Nov 2000 10:53:54 -0600
MIME-Version: 1.0
Content-Type: text/plain;
 charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> Relativity@HumanHeuristic.com said:
> >  just copied a file to it ... no error .. sync'd it .. got that
> > NFTL_findfreeblock error again .. the file is still  there tho ...
> > reboot ... remount ... yep file is still in-tact.
> 
> Strange. Nothing I write to my 4MiB doc2000 seems to 'take'. 
> 
> Anyone else?

	I'm still getting link errors (down to only one, though).
Now it can't find cfi_cmdset_0002 for check_cmd_set.
	drivers/mtd shows a cfi_cmdset_0002.o and CONFIG_MTD_CFI_AMDSTD
is set to yes in .config.
	What the heck is going on?

-Mark Langsdorf
AMD, Inc.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
