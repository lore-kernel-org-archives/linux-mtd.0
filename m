Received: from nabagan.bluegap.ch ([88.198.58.248])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KFtVD-0003Bk-RF
	for linux-mtd@lists.infradead.org; Mon, 07 Jul 2008 16:23:48 +0000
Message-ID: <48724306.4040908@bluegap.ch>
Date: Mon, 07 Jul 2008 18:23:34 +0200
From: Markus Wanner <markus@bluegap.ch>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: ioDrive by FusionIO
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've recently read about FusionIO [1], a startup promoting a product 
called ioDrive. It attaches a couple of NAND chips to commodity servers 
via PCI Express (x4). They claim reaching much higher throughput and 
lower latency with their device, compared to normal SSDs, which pipe 
their data through SAS or (S)ATA.

The general idea makes lots of sense to me, except that I wish they 
would not only emulate a block device, but also provide an MTD 
interface. (Even if the currently available file systems probably don't 
cope well with the sizes they offer (claiming up to 320 GiB), yet.) (And 
who knows, maybe the hardware would allow it, and one just needs to 
write the drivers?)

The company looks pretty "professional", also in the rather negative 
sense that they don't disclose much information about their product's 
internals. Or does anybody on this list have more information about 
their products? More thoughts or comments?

Regards

Markus

[1]: http://www.fusionio.com/
