Received: from smtp12.dti.ne.jp ([202.216.231.187])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G8lcn-0001tq-Ts
	for linux-mtd@lists.infradead.org; Thu, 03 Aug 2006 18:25:10 -0400
Date: Fri, 4 Aug 2006 07:25:00 +0900
From: takasi-y@ops.dti.ne.jp
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Mcronix MX29F040 support.
Message-Id: <20060804072500.a0ad58a6.takasi-y@ops.dti.ne.jp>
In-Reply-To: <625fc13d0608030713u299085f4l60dbc9169e61b968@mail.gmail.com>
References: <20060803223936.87040059.takasi-y@ops.dti.ne.jp>
	<625fc13d0608030713u299085f4l60dbc9169e61b968@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Josh Boyer <jwboyer@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thank you, josh.
I'd missunderstood thet the line is added certified(?) people.
/yoshii

Signed-off-by: Takashi YOSHII <takasi-y@ops.dti.ne.jp>

Index: drivers/mtd/chips/jedec_probe.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/jedec_probe.c,v
retrieving revision 1.68
diff -u -p -r1.68 jedec_probe.c
--- drivers/mtd/chips/jedec_probe.c	29 Mar 2006 08:42:49 -0000	1.68
+++ drivers/mtd/chips/jedec_probe.c	3 Aug 2006 13:31:52 -0000
@@ -112,6 +112,7 @@
 #define MX29LV040C	0x004F
 #define MX29LV160T	0x22C4
 #define MX29LV160B	0x2249
+#define MX29F040	0x00A4
 #define MX29F016	0x00AD
 #define MX29F002T	0x00B0
 #define MX29F004T	0x0045
@@ -1173,6 +1174,19 @@ static const struct amd_flash_info jedec
 		}
 	}, {
 		.mfr_id		= MANUFACTURER_MACRONIX,
+		.dev_id		= MX29F040,
+		.name		= "Macronix MX29F040",
+		.uaddr		= {
+			[0] = MTD_UADDR_0x0555_0x02AA /* x8 */
+		},
+		.DevSize	= SIZE_512KiB,
+		.CmdSet		= P_ID_AMD_STD,
+		.NumEraseRegions= 1,
+		.regions	= {
+			ERASEINFO(0x10000,8),
+		}
+        }, {
+		.mfr_id		= MANUFACTURER_MACRONIX,
 		.dev_id		= MX29F016,
 		.name		= "Macronix MX29F016",
 		.uaddr		= {
