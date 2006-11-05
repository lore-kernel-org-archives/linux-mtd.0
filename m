Received: from nf-out-0910.google.com ([64.233.182.189])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ggq9c-0006uz-Ve
	for linux-mtd@lists.infradead.org; Sun, 05 Nov 2006 17:07:53 -0500
Received: by nf-out-0910.google.com with SMTP id n28so2099963nfc
	for <linux-mtd@lists.infradead.org>;
	Sun, 05 Nov 2006 14:07:45 -0800 (PST)
Message-ID: <625fc13d0611051407h47678f07y8129a7966ffec509@mail.gmail.com>
Date: Sun, 5 Nov 2006 16:07:45 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH] [MTD] UBI: Fix make headers_install
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Fix make headers_install

Signed-off-by: Josh Boyer <jwboyer@gmail.com>

diff --git a/include/mtd/Kbuild b/include/mtd/Kbuild
index f3f424e..4d46b3b 100644
--- a/include/mtd/Kbuild
+++ b/include/mtd/Kbuild
@@ -3,4 +3,5 @@ header-y += jffs2-user.h
 header-y += mtd-abi.h
 header-y += mtd-user.h
 header-y += nftl-user.h
-header-y += ubi.h
+header-y += ubi-header.h
+header-y += ubi-user.h
