Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NT0g0-000747-9Q
	for linux-mtd@lists.infradead.org; Thu, 07 Jan 2010 22:18:00 +0000
Received: by bwz4 with SMTP id 4so11970423bwz.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Jan 2010 14:17:55 -0800 (PST)
Message-ID: <4B465DA1.6010300@googlemail.com>
Date: Thu, 07 Jan 2010 23:18:09 +0100
From: =?ISO-8859-1?Q?Ren=E9_Bolldorf?= <xsecute@googlemail.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH]drivers/mtd/chips/cfi_probe.c:18 remove unneeded comment
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--- ./drivers/mtd/chips/cfi_probe.c     2009-12-28 21:09:46.638828686 +0100
+++ ./drivers/mtd/chips/cfi_probe.c     2010-01-04 22:38:31.536678726 +0100
@@ -18,8 +18,6 @@
  #include <linux/mtd/cfi.h>
  #include <linux/mtd/gen_probe.h>

-//#define DEBUG_CFI
-
  #ifdef DEBUG_CFI
  static void print_cfi_ident(struct cfi_ident *);
  #endif
