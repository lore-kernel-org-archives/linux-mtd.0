Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14d0Oi-0005Nj-00
	for mtd-list@infradead.org; Wed, 14 Mar 2001 01:48:20 +0000
Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14d0Og-0005Nd-00
	for mtd@infradead.org; Wed, 14 Mar 2001 01:48:18 +0000
Message-ID: <3AAECE2A.D88E0348@mvista.com>
Date: Tue, 13 Mar 2001 17:49:30 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: mtd@infradead.org
CC: ahennessy@mvista.com
Subject: cfi_endian.h
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

What do you think of the idea of making the choice
of  CFI_LITTLE_ENDIAN, CFI_HOST_ENDIAN,
CFI_BIG_ENDIAN and CFI_LART_ENDIAN configurable so
that different boards can setup the driver via configuring physmap
and not have to touch  the code at all (if they don't need to set vpp
and
just want a single device)?

Alice



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
