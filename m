Received: from rv-out-0708.google.com ([209.85.198.242])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KALjD-000173-UP
	for linux-mtd@lists.infradead.org; Sun, 22 Jun 2008 09:19:20 +0000
Received: by rv-out-0708.google.com with SMTP id b17so9395026rvf.42
	for <linux-mtd@lists.infradead.org>;
	Sun, 22 Jun 2008 02:19:18 -0700 (PDT)
Message-ID: <249908660806220219gaa18d9ep4c29de6476816b64@mail.gmail.com>
Date: Sun, 22 Jun 2008 11:19:18 +0200
From: Sigmatador <sigmatador@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: mkfs.jffs2 why blocksize less than 8KiB are not allowed ?
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When I'm playing with the block2mtd emulation, I need to create JFFS2
image that have a blocksize of 0x1000, it won't work with any other
value .However, the standard mkfs.jffs2 doesn't allow value less than
0x2000 and I have to patch it myself in order to create proper image.

Did I miss something about the way to use the block2mtd module or
mkfs.jffs2 ? Or maybe the limit should be lowered to 0x1000 ?

Regards.
