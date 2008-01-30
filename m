Received: from wa-out-1112.google.com ([209.85.146.177])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JKGbL-0004Oo-UJ
	for linux-mtd@lists.infradead.org; Wed, 30 Jan 2008 17:20:02 +0000
Received: by wa-out-1112.google.com with SMTP id v33so465353wah.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 30 Jan 2008 09:19:54 -0800 (PST)
Message-ID: <6934efce0801300919v6fdc21f8v68e857301b77ff2e@mail.gmail.com>
Date: Wed, 30 Jan 2008 09:19:54 -0800
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Haavard Skinnemoen" <hskinnemoen@atmel.com>
Subject: Re: [PATCH] MTD: Intel StrataFlash P33 is locked on bootup
In-Reply-To: <20080130135350.67e95e20@dhcp-252-066.norway.atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1201631809-32193-1-git-send-email-hskinnemoen@atmel.com>
	<6934efce0801291813n68b796f5j5f3db1e90eb174a9@mail.gmail.com>
	<20080130135350.67e95e20@dhcp-252-066.norway.atmel.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Paolo.Santos@devoteam.com,
	Nicolas Pitre <nico@cam.org>, Justin Treon <justin_treon@yahoo.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> This will break cfi_cmdset_0002.c, which also uses MTD_STUPID_LOCK.

Oh.  That should be fixed ;)  Thanks for catching this.  We need more
inclusive tests.

So if I add this hunk, it should work right?


diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
b/drivers/mtd/chips/cfi_cmdset_0002.c
index 796bfea..d072e87 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -217,7 +217,7 @@ static void fixup_use_atmel_lock(struct mtd_info
*mtd, void *param)
 {
 	mtd->lock = cfi_atmel_lock;
 	mtd->unlock = cfi_atmel_unlock;
-	mtd->flags |= MTD_STUPID_LOCK;
+	mtd->flags |= MTD_POWERUP_LOCK;
 }
