Received: from fg-out-1718.google.com ([72.14.220.159])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NgHeh-0001c3-GC
	for linux-mtd@lists.infradead.org; Sat, 13 Feb 2010 13:03:31 +0000
Received: by fg-out-1718.google.com with SMTP id e12so163996fga.0
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Feb 2010 05:03:24 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 0/14 V8] Work to enable SmartMedia/xD support in mtd
Date: Sat, 13 Feb 2010 15:02:59 +0200
Message-Id: <1266066193-17625-1-git-send-email-maximlevitsky@gmail.com>
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

This is next version of my patches, and it fixes many problems.

First of all, I have rewriiten the hotplug fixes.
Now I hope there are no races and memory leaks.
Although I still add an unlocked version of get/put_mtd_device I use that only
with mtd_table_mutex held.

Patch #10 is also new, and it allows me to reuse the default nand_block_bad

As usuall, few fixes there and there, few memory leaks fixed thanks to kmemleak

Best regards,
	Maxim Levitsky
