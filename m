Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rU5u-0000hX-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 01:20:46 +0100
Received: from [62.178.143.33] (helo=gatekeeper.home.at ident=qmailr)
	by infradead.org with smtp (Exim 3.20 #2)
	id 14rU5t-0000hQ-00
	for mtd@infradead.org; Mon, 23 Apr 2001 01:20:45 +0100
From: "Erwin Authried" <eauth@softsys.co.at>
To: <mtd@infradead.org>
Subject: Re: JEDEC and MX29F1610 flash question
Date: Mon, 23 Apr 2001 01:45:10 +0200
Message-ID: <000001c0cb86$463357c0$6401a8c0@home.at>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

The MX29F1610 operation is rather different
from the other JEDEC flash memories. After
the programming commanmd sequence up to 
128 bytes are sent to flash in a stream,
with max. 30us between the writes. When all
bytes have been sent, there must be a 100us
delay to initiate programming. I don't think
that this mode is already supported in the code.
The buffer write must propably be done with 
interrupts disabled to ensure <=30us between
writes.

-Erwin


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
