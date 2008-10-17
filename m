Received: from vervifontaine.sonytel.be ([80.88.33.193]
	helo=vervifontaine.sonycom.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KqqB8-0006SB-JZ
	for linux-mtd@lists.infradead.org; Fri, 17 Oct 2008 14:19:46 +0000
Date: Fri, 17 Oct 2008 16:19:45 +0200 (CEST)
From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Sender: geert@sonytel.be
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] jffs2: Correct parameter names of jffs2_compress() in comments
Message-ID: <Pine.LNX.4.64.0810171616330.9251@vixen.sonytel.be>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-584349381-1846543263-1224253185=:9251"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---584349381-1846543263-1224253185=:9251
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Make the parameter names of jffs2_compress() in its comments match with the
actual implementation

Signed-off-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
---
BTW, the first 2 parameters (struct jffs2_sb_info *c, struct jffs2_inode_info
*f) of jffs2_compress() and jffs2_decompress() are unused, so shouldn't they
be removed?

diff --git a/fs/jffs2/compr.c b/fs/jffs2/compr.c
index 86739ee..f25e70c 100644
--- a/fs/jffs2/compr.c
+++ b/fs/jffs2/compr.c
@@ -53,8 +53,8 @@ static int jffs2_is_best_compression(struct jffs2_compressor *this,
 }
 
 /* jffs2_compress:
- * @data: Pointer to uncompressed data
- * @cdata: Pointer to returned pointer to buffer for compressed data
+ * @data_in: Pointer to uncompressed data
+ * @cpage_out: Pointer to returned pointer to buffer for compressed data
  * @datalen: On entry, holds the amount of data available for compression.
  *	On exit, expected to hold the amount of data actually compressed.
  * @cdatalen: On entry, holds the amount of space available for compressed

With kind regards,

Geert Uytterhoeven
Software Architect

Sony Techsoft Centre Europe
The Corporate Village · Da Vincilaan 7-D1 · B-1935 Zaventem · Belgium

Phone:    +32 (0)2 700 8453
Fax:      +32 (0)2 700 8622
E-mail:   Geert.Uytterhoeven@sonycom.com
Internet: http://www.sony-europe.com/

A division of Sony Europe (Belgium) N.V.
VAT BE 0413.825.160 · RPR Brussels
Fortis · BIC GEBABEBB · IBAN BE41293037680010
---584349381-1846543263-1224253185=:9251--
