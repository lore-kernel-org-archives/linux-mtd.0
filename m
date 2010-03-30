Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nwav2-00014f-Hk
	for linux-mtd@lists.infradead.org; Tue, 30 Mar 2010 12:51:48 +0000
Received: by wyf23 with SMTP id 23so1890613wyf.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 30 Mar 2010 05:51:41 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 30 Mar 2010 13:51:41 +0100
Message-ID: <804f0d21003300551h225f4bdfp66e9072115d0ad69@mail.gmail.com>
Subject: uncorrectable error : mtd->read(0x1fc bytes from 0x9e0e04) returned
	ECC error
From: Arno Steffen <arno.steffen@googlemail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I changed to a new kernel and did probably something wrong in setup
the mtd partitions ord mtd driver.
With the same flash file system I don't have trouble with my old
kernel, with the new (2.6.33) I get tons of messages like above.
But at the end (after some minutes) I  could access it.
I can do a "touch test" and get back
uncorrectable error :
mtd->read(0x6ad bytes from 0x2226fc) returned ECC error
but touch is now in filesystem.
Does someone ones what I missed in configure/setup the kernel?
