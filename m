Received: from dedekind (helo=localhost)
	by phoenix.infradead.org with local-esmtp (Exim 4.43 #1 (Red Hat
	Linux)) id 1Cp429-0004eO-0g
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2005 12:25:15 +0000
Date: Thu, 13 Jan 2005 12:25:00 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: MTD List <linux-mtd@lists.infradead.org>
Message-ID: <Pine.LNX.4.58.0501131219480.17331@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Subject: CRC on Read-Only partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

But if I formulate the question as:
we have device with RO partition. It is Read-Only always.

Does NAND technology imply that this partition may become bad, and it is 
normal?

The blocks from this partition are not ever erased. They are once writte 
when the device was shipped, checked.

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
