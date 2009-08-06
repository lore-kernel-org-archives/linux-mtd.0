Received: from mail-yw0-f172.google.com ([209.85.211.172])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MZCny-0006rv-7a
	for linux-mtd@lists.infradead.org; Thu, 06 Aug 2009 23:55:34 +0000
Received: by ywh2 with SMTP id 2so2713297ywh.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 06 Aug 2009 16:55:28 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 6 Aug 2009 16:55:27 -0700
Message-ID: <8c6c6f450908061655t5cbaf5a6x6bfceef1976a502e@mail.gmail.com>
Subject: random jffs2 errors
From: Ganesh Ragavan <ganeshragavan@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using a Macronix flash MX29LV128DT.  When I boot embedded linux
2.6.18 on it, I see random jffs2 errors (crc and magic bitmask 1985
not found) with this flash while booting up and also while doing
firmware upgrades and mounts.

I tried probing the flash, it says "Page mode: Not supported".  Just
wondering if the random errors could be due to the page mode not
supported.  These errors are not exactly reproducible, ie, they occur
at different places.

It would be great if someone could clarify.

Thanks,
G
