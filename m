Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14smEQ-00020m-00
	for mtd-list@infradead.org; Thu, 26 Apr 2001 14:54:54 +0100
Received: from ztxmail05.ztx.compaq.com ([161.114.1.209])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14smEP-00020e-00
	for mtd@infradead.org; Thu, 26 Apr 2001 14:54:53 +0100
Message-ID: <D99C1FB421989A40818B6370E3187094C45E3C@tayexc19.americas.cpqcorp.net>
From: "Hicks, Jamey" <Jamey.Hicks@compaq.com>
To: chris.read@activesilicon.co.uk, mtd@infradead.org
Subject: RE: Power blackouts and brownouts
Date: Thu, 26 Apr 2001 08:54:12 -0500
MIME-Version: 1.0
content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On the Intel chips, the reset line seems to be most useful to force the
chip into a very low power standby mode.

The specs for recent Intel and AMD flash chips that I have read claim to
halt programming or erasing when the supply voltage drops below
acceptable levels.

So now you just need to worry about which part of the system browns out
first, whether there are voltage monitors on all the supplies, etc.

Jamey Hicks



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
