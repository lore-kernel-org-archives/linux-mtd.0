Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NYTiF-00035K-Ee
	for linux-mtd@lists.infradead.org; Sat, 23 Jan 2010 00:18:55 +0000
Received: by bwz4 with SMTP id 4so1644470bwz.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Jan 2010 16:18:49 -0800 (PST)
Subject: [PATCH 0/8] Cleanups for mtd translation layer (broken up)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 23 Jan 2010 02:18:45 +0200
Message-ID: <1264205925.31827.3.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alex Dubov <oakad@yahoo.com>, joern <joern@logfs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This patch series is identical to series I posted very recently, but I
have broken up the patch #3 into smaller pieces.
Note that I want to merge it in kernel as a single patch, to avoid
bisect failures. This is for review.

Best regards,
Maxim Levitsky
