Received: from mail-fx0-f228.google.com ([209.85.220.228])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NdBAF-00071Q-Tx
	for linux-mtd@lists.infradead.org; Thu, 04 Feb 2010 23:31:16 +0000
Received: by fxm28 with SMTP id 28so3537500fxm.20
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Feb 2010 15:31:09 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH V6] Work to enable SmartMedia/xD support
Date: Fri,  5 Feb 2010 01:30:40 +0200
Message-Id: <1265326257-4446-1-git-send-email-maximlevitsky@gmail.com>
Cc: Alex Dubov <oakad@yahoo.com>, Artem Bityutskiy <dedekind1@gmail.com>,
	joern <joern@logfs.org>, linux-kernel <linux-kernel@vger.kernel.org>,
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

Hi,

This version fixes few bugs I discovered, especially
place where I forgot to unlock a mutex, another mistake in suspend/resume code
that prevented driver from working if card was removed during low power state.

David, merge window will soon open, so could you somehow review this?

Best regards,
	Maxim Levitsky
