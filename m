Received: from smtp09.smtpout.orange.fr ([80.12.242.131]
 helo=smtp.smtpout.orange.fr)
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLue6-0007Ly-8v
 for linux-mtd@lists.infradead.org; Thu, 24 May 2018 18:07:29 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 05/13] mtd: rawnand: marvell: remove the dmaengine
 compat need
References: <20180524070703.11901-1-robert.jarzmik@free.fr>
 <20180524070703.11901-6-robert.jarzmik@free.fr>
 <20180524113006.3d5f393e@xps13>
Date: Thu, 24 May 2018 20:07:11 +0200
In-Reply-To: <20180524113006.3d5f393e@xps13> (Miquel Raynal's message of "Thu,
 24 May 2018 11:30:06 +0200")
Message-ID: <87603dx700.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Miquel Raynal <miquel.raynal@bootlin.com> writes:

> Hi Robert,

Actually, a last time error slipped in this patch here (I'm really doing poorly
on the copy paste side):
+	nfc->dma_chan =	dma_request_slave_channel(&nfc->dev, "data");

This should rather be :
+	nfc->dma_chan =	dma_request_slave_channel(nfc->dev, "data");

Would you grant your ack for the next iteration with this change folded in ?

Cheers.

--
Robert
