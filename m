Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13JKC4-0003Px-00
	for mtd-list@infradead.org; Mon, 31 Jul 2000 19:21:40 +0100
Received: from cerberus.colubris.com ([207.35.116.195] helo=mail.colubris.com)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13JKC3-0003Pr-00
	for mtd@infradead.org; Mon, 31 Jul 2000 19:21:39 +0100
Received: from colubris.com (ws1-58.colubris.com [192.168.1.58])
	by mail.colubris.com (8.10.2/8.10.2) with ESMTP id e6VILZ917171
	for <mtd@infradead.org>; Mon, 31 Jul 2000 14:21:35 -0400
Message-ID: <3985C29C.8F37EBC3@colubris.com>
Date: Mon, 31 Jul 2000 14:17:00 -0400
From: Stephane Laroche <stephane.laroche@colubris.com>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Erasing more than one sector at a time?
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


The erase functions in cfi_cmd_*.c seem to support erasing more than 1
sector per call.

I'm wondering why the parameter validation at the start of those
function specifically prohibits erasing more than one sector.  Is this
because the interface is defined this way or is it an oversight?

I'm thinking of removing the validation so my user programs don't have
to loop when erasing more than one sector.

-Stephane



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
