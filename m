Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14XZZy-0008Hg-00
	for mtd-list@infradead.org; Tue, 27 Feb 2001 02:09:30 +0000
Received: from [64.74.56.234] (helo=stardust.tg-embedded.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14XZZx-0008HZ-00
	for mtd@infradead.org; Tue, 27 Feb 2001 02:09:29 +0000
Received: from tg-embedded.com ([192.168.1.100])
	(authenticated)
	by stardust.tg-embedded.com (8.11.0/8.11.0) with ESMTP id f1R2BsO05715
	for <mtd@infradead.org>; Mon, 26 Feb 2001 21:11:57 -0500
Message-ID: <3A9B09BD.C3D3CB68@tg-embedded.com>
Date: Mon, 26 Feb 2001 20:58:21 -0500
From: dant@tg-embedded.com
MIME-Version: 1.0
To: mtd@infradead.org
Subject: lilo kernel params failure
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I have been strugling with this for some time now.

It looks like a failure of lilo to pass kernel params ( append="...." )
But we have been through the code and fail to find a reason.
this happens with the lilo-mtd in the cvs /patches area and we have
patched 21 with the same results.
We are using DoC  2000 with kernel 2.4.2 though this has been happening
for months really.
Anyone have any ideas?



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
