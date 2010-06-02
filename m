Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OJna7-0000df-Ql
	for linux-mtd@lists.infradead.org; Wed, 02 Jun 2010 13:02:04 +0000
Received: by fxm15 with SMTP id 15so4682798fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Jun 2010 06:02:01 -0700 (PDT)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: dwmw2 <dwmw2@infradead.org>
Subject: Few fixes for my driver + minor fix in mtd's Kconfig
Date: Wed,  2 Jun 2010 16:01:44 +0300
Message-Id: <1275483708-11929-1-git-send-email-maximlevitsky@gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

These patches finally fix few dma related problems in my r852 driver.
Last patch unrelated to my driver, fixes display in xconfig, 
as it would otherwise put whole nand submenu under 'mtd' directly.
I don't think there is functional change.

Best regards,
	Maxim Levitsky
