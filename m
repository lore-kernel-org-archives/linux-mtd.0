Received: from fg-out-1718.google.com ([72.14.220.158])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NbEqn-0006Ex-Pi
	for linux-mtd@lists.infradead.org; Sat, 30 Jan 2010 15:03:10 +0000
Received: by fg-out-1718.google.com with SMTP id 16so49893fgg.0
	for <linux-mtd@lists.infradead.org>;
	Sat, 30 Jan 2010 07:03:03 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH V5] Work to enable SmartMedia/xD support
Date: Sat, 30 Jan 2010 17:02:31 +0200
Message-Id: <1264863768-27606-1-git-send-email-maximlevitsky@gmail.com>
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

Here is another minor revision of my work.
In this version I added few (two) sysfs attributes for udev rules

One attribute is exported my mtd driver, and specifies if this is smartmedia or
xd card (its called "media_type")

Another attribute is exported by FTL, and it is extracted vendor name from the card CIS.
I added short common code to translation layer to allow such thing.

Tested this again on 256 byte/page nandsim device, and everything works as usual.
I don't think I will need to change anything major from now on.

Best regards,
	Maxim Levitsky
