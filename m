From: bpqw <bpqw@micron.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>
Subject: [PATCH 1/1] mtd: cfi_cmdset_0002:add fixup for Micron M29EW after
 erase operation
Date: Mon, 1 Sep 2014 02:20:52 +0000
Message-ID: <A765B125120D1346A63912DDE6D8B6315DB7BE@NTXXIAMBX02.xacn.micron.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>,
 Jingoo Han <jg1.han@samsung.com>,
 Christian Riesch <christian.riesch@omicron.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For Micron M29EW,20ms delay is needed after erase operation.

Signed-off-by: BeanHuo <bpqw@micron.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cm=
dset_0002.c
index 5a4bfe3..9b0de91 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -509,6 +509,16 @@ static void cfi_fixup_m29ew_delay_after_resume(struct =
cfi_private *cfi)
 		cfi_udelay(500);
 }
=20
+static void cfi_fixup_m29ew_delay_after_erase(struct cfi_private *cfi)=20
+{
+	/*
+	 * Resolving the Delay After ERASE Issue @low temperature.
+	 * 20ms delay is needed after erase operation.
+	 */
+	if (is_m29ew(cfi))
+		cfi_udelay(20000);
+}
+
 struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)  {
 	struct cfi_private *cfi =3D map->fldrv_priv; @@ -2397,6 +2407,7 @@ static=
 int __xipram do_erase_oneblock(struct map_info *map, struct flchip *chip,
 		ret =3D -EIO;
 	}
=20
+	cfi_fixup_m29ew_delay_after_erase(cfi);
 	chip->state =3D FL_READY;
 	DISABLE_VPP(map);
 	put_chip(map, chip, adr);
--
1.7.9.5
