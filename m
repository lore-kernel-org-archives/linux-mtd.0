Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13OJh3-0000RF-00
	for mtd-list@infradead.org; Mon, 14 Aug 2000 13:50:17 +0100
Received: from caja.ldhs.cetuc.puc-rio.br ([139.82.28.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13OJh0-0000R3-00
	for mtd@infradead.org; Mon, 14 Aug 2000 13:50:14 +0100
From: "Miguel Freitas" <miguel@cetuc.puc-rio.br>
To: mtd@infradead.org
Date: Mon, 14 Aug 2000 09:48:56 GMT-3
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: Re: DOC2000 & NFTL problems (2MB and 64MB devices)
Reply-to: miguel@cetuc.puc-rio.br
CC: ciro@prosa.it
Message-ID: <563CB64D4A@mamao.cetuc.puc-rio.br>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


Ciro wrote:

> Under DOS everything works fine: the systems detects, identifies
> and formats the DOC. Everything is also fine with the binary-only
> Linux driver provided by M-Systems, under Linux 2.0.38.
> Next, I try Linux 2.2.16 with the mtd driver and patch.
> ...then I get the following message, repeated for all EUNs
> ---------------------------------------------------------------------
> EUN 506: EraseMark not 0x3c69 (0xffff 0xffff instead)
> ---------------------------------------------------------------------


   Sorry for the delay...

   The current driver _does not_ supports NAND chips of 2MB and  
64MB due to their addressing mechanism. I've been working on this 
last week and I will release a patch in the next few days...
   Also, there should be a problem with 8MB and 16MB nand chips 
because they have a larger erase block. My patch also corrects this.
   NOTE: This is not a problem with 8 or 16MB DiskOnChips! It's is a 
problem with whatever xxMB DiskOnChips that use 8 and 16MB 
nand chips! BTW, a 2MB DiskOnChip = one 2MB nand chip.

Regards,


Miguel Freitas
Center for Telecommunications Studies
CATHOLIC UNIVERSITY - BRASIL
e-mail: miguel@cetuc.puc-rio.br
phone/fax#:+55-21-540-8854


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
