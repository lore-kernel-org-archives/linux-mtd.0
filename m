Received: from moutng.kundenserver.de ([212.227.126.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JKCb9-0001mz-Li
	for linux-mtd@lists.infradead.org; Wed, 30 Jan 2008 13:03:34 +0000
From: Stefan Roese <sr@denx.de>
To: linux-mtd@lists.infradead.org
Subject: flash_eraseall reports incorrect percentage
Date: Wed, 30 Jan 2008 14:03:13 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200801301403.13149.sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It seems that the flash_eraseall utility doesn't report the correct percentage 
upon completion. After erasing the last sector, the output seems not to get 
updated anymore. This leads to something like this on a partition with only 2 
sectors:

flash_eraseall /dev/mtd6
Erasing 256 Kibyte @ 40000 -- 50 % complete.

I'm just posting this report as a reference. Perhaps somebody has a little 
time to fix it.

Thanks.

Best regards,
Stefan
