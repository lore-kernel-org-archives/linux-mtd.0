Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OlhLf-0005Ye-6L
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2010 12:02:28 +0000
Received: by ewy9 with SMTP id 9so277150ewy.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 Aug 2010 05:02:26 -0700 (PDT)
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
Date: Wed, 18 Aug 2010 14:01:15 +0200
Subject: [PATCH 3/4 v2] lib: add crc16_le helper
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
	Brian Norris <norris@broadcom.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Maxime Bizon <mbizon@freebox.fr>
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201008181401.15328.florian@openwrt.org>
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds a crc16_le helper function to lib/crc16.c

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>
Signed-off-by: Florian Fainelli <ffainelli@freebox.fr>
--
diff --git a/include/linux/crc16.h b/include/linux/crc16.h
index 9443c08..6c1c61f 100644
--- a/include/linux/crc16.h
+++ b/include/linux/crc16.h
@@ -26,5 +26,7 @@ static inline u16 crc16_byte(u16 crc, const u8 data)
 	return (crc >> 8) ^ crc16_table[(crc ^ data) & 0xff];
 }
 
+extern u16 crc16_le(u16 crc, const u8 *buffer, size_t len);
+
 #endif /* __CRC16_H */
 
diff --git a/lib/crc16.c b/lib/crc16.c
index 8737b08..ec4a95c 100644
--- a/lib/crc16.c
+++ b/lib/crc16.c
@@ -62,6 +62,18 @@ u16 crc16(u16 crc, u8 const *buffer, size_t len)
 }
 EXPORT_SYMBOL(crc16);
 
+u16 crc16_le(u16 crc, u8 const *p, size_t len)
+{
+	int i;
+	while (len--) {
+		crc ^= *p++ << 8;
+		for (i = 0; i < 8; i++)
+			crc = (crc << 1) ^ ((crc & 0x8000) ? 0x8005 : 0);
+	}
+	return crc;
+}
+EXPORT_SYMBOL(crc16_le);
+
 MODULE_DESCRIPTION("CRC16 calculations");
 MODULE_LICENSE("GPL");
 
