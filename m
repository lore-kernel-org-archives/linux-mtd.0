Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NasBr-0000xQ-6Z
	for linux-mtd@lists.infradead.org; Fri, 29 Jan 2010 14:51:23 +0000
Received: by bwz4 with SMTP id 4so1893014bwz.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Jan 2010 06:51:16 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH V4] Work to enable smartmedia/xd support in mtd
Date: Fri, 29 Jan 2010 16:50:47 +0200
Message-Id: <1264776663-7042-1-git-send-email-maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


This is updated version of my work to make my xD card reader work.

I combined again the patches in one series.
Patches 0-7 fix hotplug issues in mtd block translation layer
Patches 8-14 fix several bugs in nand subsystem and add some xD workarounds

Biggest change from former version is that I decided to keed 
mtd block translation thread unfreezeable and instead fix that problem in nand subsystem.

Everything works, very stable.

Best regards,
	Maxim Levitsky
