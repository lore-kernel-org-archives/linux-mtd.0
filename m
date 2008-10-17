Received: from vervifontaine.sonytel.be ([80.88.33.193]
	helo=vervifontaine.sonycom.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kqq7o-0006fL-4U
	for linux-mtd@lists.infradead.org; Fri, 17 Oct 2008 14:16:20 +0000
Date: Fri, 17 Oct 2008 16:16:10 +0200 (CEST)
From: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Sender: geert@sonytel.be
To: Artem Bityutskiy <dedekind@infradead.org>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>
Subject: [PATCH] ubifs: ubifs_compress() returns void
Message-ID: <Pine.LNX.4.64.0810171613360.9240@vixen.sonytel.be>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-584349381-1043085095-1224252970=:9240"
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

---584349381-1043085095-1224252970=:9240
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Update the comment for ubifs_compress(), which incorrectly states that it
returnsa success/failure indicator.

Signed-off-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>

diff --git a/fs/ubifs/compress.c b/fs/ubifs/compress.c
index 5bb51da..a0ada59 100644
--- a/fs/ubifs/compress.c
+++ b/fs/ubifs/compress.c
@@ -91,8 +91,6 @@ struct ubifs_compressor *ubifs_compressors[UBIFS_COMPR_TYPES_CNT];
  *
  * Note, if the input buffer was not compressed, it is copied to the output
  * buffer and %UBIFS_COMPR_NONE is returned in @compr_type.
- *
- * This functions returns %0 on success or a negative error code on failure.
  */
 void ubifs_compress(const void *in_buf, int in_len, void *out_buf, int *out_len,
 		    int *compr_type)

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
---584349381-1043085095-1224252970=:9240--
