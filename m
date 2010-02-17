Received: from fg-out-1718.google.com ([72.14.220.157])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nhrm2-0005Fo-P7
	for linux-mtd@lists.infradead.org; Wed, 17 Feb 2010 21:49:39 +0000
Received: by fg-out-1718.google.com with SMTP id 22so127074fge.0
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Feb 2010 13:49:32 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 0/14 V9] Work to enable SmartMedia/xD support in mtd
Date: Wed, 17 Feb 2010 23:49:10 +0200
Message-Id: <1266443364-4538-1-git-send-email-maximlevitsky@gmail.com>
Cc: Alex Dubov <oakad@yahoo.com>, Artem Bityutskiy <dedekind1@gmail.com>,
	joern <joern@logfs.org>, Vitaly Wool <vitalywool@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"stanley.miao" <stanley.miao@windriver.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is slightly updated version of my patchset.
Now I can tell you for sure that hotplug works.
It was used/abused for long time.
I did some changes in richoh card reader driver, to work better after resume
and renamed it to r852.

I kindly ask you to merge this patchset to 2.6.34.
If I/users find other bugs they can be addressed by follow up patches.

Best regards,
	Maxim Levitsky
