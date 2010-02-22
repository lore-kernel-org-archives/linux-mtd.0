Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NjdCF-00044P-Hj
	for linux-mtd@lists.infradead.org; Mon, 22 Feb 2010 18:39:59 +0000
Received: by fxm6 with SMTP id 6so5096986fxm.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Feb 2010 10:39:54 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 0/15 V10] Work to enable SmartMedia/xD support in mtd
Date: Mon, 22 Feb 2010 20:39:27 +0200
Message-Id: <1266863982-5258-1-git-send-email-maximlevitsky@gmail.com>
Cc: Alex Dubov <oakad@yahoo.com>, Vitaly Wool <vitalywool@gmail.com>,
	joern <joern@logfs.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	stanley.miao@windriver.com, linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Changes:

* Rebased the series against patches from Ben Hutchings.
Now it applies cleanly on top of
git://git.infradead.org/users/dedekind/l2-mtd-2.6.git

* Fixed another blktrans hotplug problem. 
If you remove that card while it is used, then add it while,
the user still holds the block device open, block device wasn't accesable

* Fixed minor memory leak in mtdblock (unrelated to the patchset)

Best regards,
	Maxim Levitsky
