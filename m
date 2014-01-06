Received: from mail-bn1bln0179.outbound.protection.outlook.com
 ([2a01:111:f400:7c10::1:179]
 helo=na01-bn1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W02dC-0008CF-M2
 for linux-mtd@lists.infradead.org; Mon, 06 Jan 2014 05:21:47 +0000
From: Insop Song <Insop.Song@gainspeed.com>
To: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] Check flag status register for Micron n25q512a
Date: Mon, 6 Jan 2014 05:21:17 +0000
Message-ID: <6bf927e513554e628fe15d309aac698e@BLUPR07MB002.namprd07.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Priyanka.Jain@freescale.com" <Priyanka.Jain@freescale.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All,=0A=
=0A=
In order to use Micron n25q512a, MTD, two changes are required as follows:=
=0A=
- jedec code should be fixed=0A=
- flag status should be read for writing.=0A=
=0A=
Check flag status register for Micron n25q512a=0A=
    - Programing Micron n25q512a requires to check flag status register=0A=
    - According to datasheet=0A=
    	"=0A=
    	The flag status register must be read any time a PROGRAM, ERASE,=0A=
    	SUSPEND/RESUME command is issued, or after a RESET command while devic=
e=0A=
    	is busy. The cycle is not complete until bit 7 of the flag status=0A=
    	register output 1.=0A=
    	"=0A=
    - Ref: https://www.micron.com/~/media/Documents/Products/Data%20Sheet/N=
OR%20Flash/Serial%20NOR/N25Q/n25q_512mb_1ce_3v_65nm.pdf=0A=
=0A=
=0A=
=0A=
=0A=
Signed-off-by: Insop Song <insop.song@gainspeed.com>=0A=
---=0A=
 drivers/mtd/devices/m25p80.c |   91 ++++++++++++++++++++++++++++++++++++++=
+++-=0A=
 1 file changed, 90 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c=0A=
index 7eda71d..e53e522 100644=0A=
--- a/drivers/mtd/devices/m25p80.c=0A=
+++ b/drivers/mtd/devices/m25p80.c=0A=
@@ -38,6 +38,7 @@=0A=
 /* Flash opcodes. */=0A=
 #define	OPCODE_WREN		0x06	/* Write enable */=0A=
 #define	OPCODE_RDSR		0x05	/* Read status register */=0A=
+#define	OPCODE_RDFSR		0x70	/* Read flag status register */=0A=
 #define	OPCODE_WRSR		0x01	/* Write status register 1 byte */=0A=
 #define	OPCODE_NORM_READ	0x03	/* Read data bytes (low frequency) */=0A=
 #define	OPCODE_FAST_READ	0x0b	/* Read data bytes (high frequency) */=0A=
@@ -70,6 +71,8 @@=0A=
 /* Status Register bits. */=0A=
 #define	SR_WIP			1	/* Write in progress */=0A=
 #define	SR_WEL			2	/* Write enable latch */=0A=
+/* Flag Status Register bits. */=0A=
+#define	FSR_RDY			0x80	/* FSR ready */=0A=
 /* meaning of other SR_* bits may differ between vendors */=0A=
 #define	SR_BP0			4	/* Block protect 0 */=0A=
 #define	SR_BP1			8	/* Block protect 1 */=0A=
@@ -95,6 +98,7 @@ struct m25p {=0A=
 	u8			program_opcode;=0A=
 	u8			*command;=0A=
 	bool			fast_read;=0A=
+	bool			flag_status;=0A=
 };=0A=
 =0A=
 static inline struct m25p *mtd_to_m25p(struct mtd_info *mtd)=0A=
@@ -131,6 +135,28 @@ static int read_sr(struct m25p *flash)=0A=
 }=0A=
 =0A=
 /*=0A=
+ * Read the flag status register, returning its value in the location=0A=
+ * Return the status register value.=0A=
+ * Returns negative if error occurred.=0A=
+ */=0A=
+static int read_fsr(struct m25p *flash)=0A=
+{=0A=
+	ssize_t retval;=0A=
+	u8 code =3D OPCODE_RDFSR;=0A=
+	u8 val;=0A=
+=0A=
+	retval =3D spi_write_then_read(flash->spi, &code, 1, &val, 1);=0A=
+=0A=
+	if (retval < 0) {=0A=
+		printk(&flash->spi->dev, "error %d reading FSR\n",=0A=
+				(int) retval);=0A=
+		return retval;=0A=
+	}=0A=
+=0A=
+	return val;=0A=
+}=0A=
+=0A=
+/*=0A=
  * Write status register 1 byte=0A=
  * Returns negative if error occurred.=0A=
  */=0A=
@@ -220,6 +246,30 @@ static int wait_till_ready(struct m25p *flash)=0A=
 }=0A=
 =0A=
 /*=0A=
+ * Service routine to read flag status register until ready, or timeout oc=
curs.=0A=
+ * Returns non-zero if error.=0A=
+ */=0A=
+static int wait_till_fsr_ready(struct m25p *flash)=0A=
+{=0A=
+	unsigned long deadline;=0A=
+	int sr;=0A=
+=0A=
+	deadline =3D jiffies + MAX_READY_WAIT_JIFFIES;=0A=
+=0A=
+	do {=0A=
+		if ((sr =3D read_fsr(flash)) < 0)=0A=
+			break;=0A=
+		else if ((sr & FSR_RDY))=0A=
+			return 0;=0A=
+=0A=
+		cond_resched();=0A=
+=0A=
+	} while (!time_after_eq(jiffies, deadline));=0A=
+=0A=
+	return 1;=0A=
+}=0A=
+=0A=
+/*=0A=
  * Erase the whole flash memory=0A=
  *=0A=
  * Returns 0 if successful, non-zero otherwise.=0A=
@@ -273,6 +323,14 @@ static int erase_sector(struct m25p *flash, u32 offset=
)=0A=
 	if (wait_till_ready(flash))=0A=
 		return 1;=0A=
 =0A=
+	/* Flag status, Wait until finished previous write command. */=0A=
+	if (flash->flag_status =3D=3D true) {=0A=
+		if (wait_till_fsr_ready(flash)) {=0A=
+			mutex_unlock(&flash->lock);=0A=
+			return 1;=0A=
+		}=0A=
+	}=0A=
+=0A=
 	/* Send write enable, then erase commands. */=0A=
 	write_enable(flash);=0A=
 =0A=
@@ -427,6 +485,14 @@ static int m25p80_write(struct mtd_info *mtd, loff_t t=
o, size_t len,=0A=
 =0A=
 	mutex_lock(&flash->lock);=0A=
 =0A=
+	/* Flag status, Wait until finished previous write command. */=0A=
+	if (flash->flag_status =3D=3D true) {=0A=
+		if (wait_till_fsr_ready(flash)) {=0A=
+			mutex_unlock(&flash->lock);=0A=
+			return 1;=0A=
+		}=0A=
+	}=0A=
+=0A=
 	/* Wait until finished previous write command. */=0A=
 	if (wait_till_ready(flash)) {=0A=
 		mutex_unlock(&flash->lock);=0A=
@@ -457,6 +523,14 @@ static int m25p80_write(struct mtd_info *mtd, loff_t t=
o, size_t len,=0A=
 		t[1].len =3D page_size;=0A=
 		spi_sync(flash->spi, &m);=0A=
 =0A=
+		/* Flag status, Wait until finished previous write command. */=0A=
+		if (flash->flag_status =3D=3D true) {=0A=
+			if (wait_till_fsr_ready(flash)) {=0A=
+				mutex_unlock(&flash->lock);=0A=
+				return 1;=0A=
+			}=0A=
+		}=0A=
+=0A=
 		*retlen =3D m.actual_length - m25p_cmdsz(flash);=0A=
 =0A=
 		/* write everything in flash->page_size chunks */=0A=
@@ -477,6 +551,14 @@ static int m25p80_write(struct mtd_info *mtd, loff_t t=
o, size_t len,=0A=
 =0A=
 			spi_sync(flash->spi, &m);=0A=
 =0A=
+			/* Flag status, Wait until finished previous write command. */=0A=
+			if (flash->flag_status =3D=3D true) {=0A=
+				if (wait_till_fsr_ready(flash)) {=0A=
+					mutex_unlock(&flash->lock);=0A=
+					return 1;=0A=
+				}=0A=
+			}=0A=
+=0A=
 			*retlen +=3D m.actual_length - m25p_cmdsz(flash);=0A=
 		}=0A=
 	}=0A=
@@ -782,7 +864,7 @@ static const struct spi_device_id m25p_ids[] =3D {=0A=
 	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, 0) },=0A=
 	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, 0) },=0A=
 	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K) },=0A=
-	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K) },=0A=
+	{ "n25q512a",    INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K) },=0A=
 =0A=
 	/* PMC */=0A=
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },=0A=
@@ -996,6 +1078,13 @@ static int m25p_probe(struct spi_device *spi)=0A=
 	spi_set_drvdata(spi, flash);=0A=
 =0A=
 	/*=0A=
+	 * Micron n25q512a requires to check flag status register=0A=
+	 */=0A=
+	flash->flag_status =3D false;=0A=
+	if (strcmp(id->name, "n25q512a") =3D=3D 0)=0A=
+		flash->flag_status =3D true;;=0A=
+=0A=
+	/*=0A=
 	 * Atmel, SST and Intel/Numonyx serial flash tend to power=0A=
 	 * up with the software protection bits set=0A=
 	 */=0A=
-- =0A=
1.7.9.5=0A=
