Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13nx0r-0006KA-00
	for mtd-list@infradead.org; Tue, 24 Oct 2000 06:52:41 +0100
Received: from pop3.web.de ([212.227.116.81] helo=smtp.web.de)
	by infradead.org with smtp (Exim 3.16 #2)
	id 13nx0p-0006K4-00
	for mtd@infradead.org; Tue, 24 Oct 2000 06:52:39 +0100
Message-ID: <000201c03d7d$8ca36a20$877eadc2@telos.de>
From: "Markus Thiesmeyer" <markus_thiesmeyer@web.de>
To: <mtd@infradead.org>
Subject: Problems with concurrent access
Date: Mon, 23 Oct 2000 17:51:29 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hello,

I'm using the mtd driver to access cfi-compliant intel flash devices on an
embedded system with an amd sc400 processor.

I've provided a mapping that is similar to the octagon-5066.c
implementation. Now I'm facing problems when two processes concurently try
to access the devices.

Do the cfi-implementations support concurrent accesses?


Best Regards

Markus Thiesmeyer



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
