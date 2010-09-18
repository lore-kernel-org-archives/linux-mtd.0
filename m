Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ox6bH-0008LI-VU
	for linux-mtd@lists.infradead.org; Sat, 18 Sep 2010 23:13:48 +0000
Received: by fxm4 with SMTP id 4so197242fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Sep 2010 16:12:53 -0700 (PDT)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [MTD] My updates
Date: Sun, 19 Sep 2010 01:12:35 +0200
Message-Id: <1284851558-1154-1-git-send-email-maximlevitsky@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
	Maciej Rutecki <maciej.rutecki@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

The first patch should finally fix both hotplug and the case of non removeable modules.
In fact all modules can be removed always.
Testing is welcome.

The 2nd and 3rd patches are cosmetic additions to my code.
(First patch avoids double powerdown/up, but it seemed to work both ways)

Best regards,
	Maxim Levitsky
