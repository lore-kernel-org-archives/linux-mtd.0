Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14ftPx-0008GV-00
	for mtd-list@infradead.org; Thu, 22 Mar 2001 00:57:33 +0000
Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14ftPw-0008GP-00
	for mtd@infradead.org; Thu, 22 Mar 2001 00:57:32 +0000
Message-ID: <3AB94E90.78DC848C@mvista.com>
Date: Wed, 21 Mar 2001 17:00:00 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: mtd@infradead.org
CC: ahennessy@mvista.com
Subject: physmap.c map size
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I haven't used physmap.c in a while (having added partitioning to a
local copy and then
creating cstm_cfi_jedec.c)  but I just tried it.   I had assumed that
mtd->size would be
the same as CONFIG_MTD_PHYSMAP_LEN set in config.  But
CONFIG_MTD_PHYSMAP_LEN
is ignored and the flash chip(s) total queried size is used in
mtd->size.   Am I missing something?

Alice



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
