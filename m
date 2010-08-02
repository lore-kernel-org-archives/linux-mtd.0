Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oftc3-0001Mq-8m
	for linux-mtd@lists.infradead.org; Mon, 02 Aug 2010 11:55:26 +0000
From: Florian Fainelli <ffainelli@freebox.fr>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] NAND: add support for reading ONFI parameters from NAND
	device
Date: Mon, 2 Aug 2010 13:55:52 +0200
References: <201007290047.06394.ffainelli@freebox.fr>
	<201007291051.38278.ffainelli@freebox.fr>
	<4C568F1D.4020007@parrot.com>
In-Reply-To: <4C568F1D.4020007@parrot.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201008021355.52744.ffainelli@freebox.fr>
Cc: Maxime Bizon <mbizon@freebox.fr>, David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <norris@broadcom.com>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matthieu,

On Monday 02 August 2010 11:25:49 Matthieu CASTET wrote:
> Florian Fainelli a =C3=A9crit :
> > Hi Matthieu,
> >=20
> > On Thursday 29 July 2010 09:54:20 Matthieu CASTET wrote:
> >> Hi,
> >>=20
> >>=20
> >> Also you don't handle endianness (integer are little endian) for value
> >> in nand_onfi_params.
> >=20
> > Yes, so far the drivers using those values were doing the correct endian
> > conversion when they need to use them.
>=20
> In that case use le16, le32, ... type. Also prefer kernel type over
> uintx_t type.
>=20
> >> This won't work this unknown nand, and not work with some LP nand that
> >> doesn't provide additional id bytes.
> >=20
> > So how do you see things regarding the provisioning of the relevant ONFI
> > parameters?
>=20
> I will see something like in the patch attached in
> http://article.gmane.org/gmane.linux.drivers.mtd/30935.
>=20
> ONFI parsing is done early in nand_get_flash_type (unknow chip or LP nand=
).
> If the ONFI parsing is ok we bypass the old identification method
> (additional id bytes).

Looks ok to me.

>=20
> As an example I attach a patch that mix your patch and mine.
>=20
>=20
> Matthieu
>=20
> PS : the NAND_ONFI flags seems useless, we can use onfi_version (0 means
> no onfi).

Right, thanks for noticing that.

I got a couple of comments on your patch that I inlined, the rest looks
good.
=2D-
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 4a7b864..25a44fa 100644
=2D-- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2772,15 +2772,50 @@ static void nand_set_defaults(struct nand_chip *chi=
p, int busw)
=20
 }
=20
+static u16 onfi_crc(u16 crc, unsigned char const *p, size_t len)
+{
+       int i;
+       while (len--) {
+               crc ^=3D *p++ << 8;
+               for (i =3D 0; i < 8; i++)
+                       crc =3D (crc << 1) ^ ((crc & 0x8000) ? 0x8005 : 0);
+       }
+       return crc;
+}
+
+/*
+ * sanitize ONFI strings so we can safely print them
+ */
+static void sanitize_string(uint8_t *s, size_t len)
+{
+       ssize_t i;
+
+       /* null terminate */
+       s[len - 1] =3D 0;
+
+       /* remove non printable chars */
+       for (i =3D 0; i < len - 1; i++) {
+               if (s[i] < ' ' || s[i] > 127)
+                       s[i] =3D '?';
+       }
+
+       /* remove trailing spaces */
+       for (i =3D len - 1; i >=3D 0; i--) {
+               if (s[i] && s[i] !=3D ' ')
+                       break;
+               s[i] =3D 0;
+       }
+}
+
 /*
  * Get the flash and manufacturer id and lookup if the type is supported
  */
 static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
                                                  struct nand_chip *chip,
=2D                                                 int busw, int *maf_id,
+                                                 int busw, int *maf_id, in=
t *dev_id
                                                  struct nand_flash_dev *ty=
pe)
 {
=2D       int i, dev_id, maf_idx;
+       int i, maf_idx;
        u8 id_data[8];
=20
        /* Select the device */
@@ -2797,7 +2832,7 @@ static struct nand_flash_dev *nand_get_flash_type(str=
uct mtd_info *mtd,
=20
        /* Read manufacturer and device IDs */
        *maf_id =3D chip->read_byte(mtd);
=2D       dev_id =3D chip->read_byte(mtd);
+       *dev_id =3D chip->read_byte(mtd);
=20
        /* Try again to make sure, as some systems the bus-hold or other
         * interface concerns can cause random data which looks like a
@@ -2807,15 +2842,13 @@ static struct nand_flash_dev *nand_get_flash_type(s=
truct mtd_info *mtd,
=20
        chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
=20
=2D       /* Read entire ID string */
=2D
=2D       for (i =3D 0; i < 8; i++)
+       for (i =3D 0; i < 2; i++)
                id_data[i] =3D chip->read_byte(mtd);
=20
=2D       if (id_data[0] !=3D *maf_id || id_data[1] !=3D dev_id) {
+       if (id_data[0] !=3D *maf_id || id_data[1] !=3D *dev_id) {
                printk(KERN_INFO "%s: second ID read did not match "
                       "%02x,%02x against %02x,%02x\n", __func__,
=2D                      *maf_id, dev_id, id_data[0], id_data[1]);
+                      *maf_id, *dev_id, id_data[0], id_data[1]);
                return ERR_PTR(-ENODEV);
        }
=20
@@ -2823,8 +2856,79 @@ static struct nand_flash_dev *nand_get_flash_type(st=
ruct mtd_info *mtd,
                type =3D nand_flash_ids;
=20
        for (; type->name !=3D NULL; type++)
=2D               if (dev_id =3D=3D type->id)
+               if (*dev_id =3D=3D type->id)
                         break;
+#if 1
+       chip->onfi_version =3D 0;
+       if (!type->name || !type->pagesize) {
+               /* try ONFI for unknow chip or LP */
+               chip->cmdfunc(mtd, NAND_CMD_READID, 0x20, -1);
+               if (chip->read_byte(mtd) =3D=3D 'O' &&
+                       chip->read_byte(mtd) =3D=3D 'N' &&
+                       chip->read_byte(mtd) =3D=3D 'F' &&
+                       chip->read_byte(mtd) =3D=3D 'I') {

Why not use what was in our original patch and do the memcmp? That looks
cleaner to me and allows to invert the logic on the if statement to get the
code cleaner. That's just cosmetic anyway.

+
+                       struct nand_onfi_params *p =3D &chip->onfi_params;
+                       int i;
+
+                       printk(KERN_INFO "ONFI flash detected\n");
+                       chip->cmdfunc(mtd, NAND_CMD_PARAM, 0, -1);
+                       for (i =3D 0; i < 3; i++) {
+                               /* XXX this that ok to use read_buf at this=
 stage ? */
+                               chip->read_buf(mtd, (uint8_t *)p, sizeof(*p=
));
+                               if (onfi_crc(0x4F4E, (uint8_t *)p, 254) =3D=
=3D le16_to_cpu(p->crc))
+                               {
+                                        printk(KERN_INFO "ONFI param page =
%d valid\n", i);
+                                        break;
+                               }
+                       }
+                       if (i < 3) {
+                               /* check version */
+                               int val =3D le16_to_cpu(p->revision);
+                               if (!is_power_of_2(val) || val =3D=3D 1 || =
val > (1 << 4)) {

the !is_power_of_2 check does not work for ONFI version 2.1 (3), so I would=
 only
keep the two other checks.

+                                       printk(KERN_INFO "%s: unsupported O=
NFI version\n", __func__);
+                               }
+                               else {
+                                       if (val & (1 << 1))
+                                               chip->onfi_version =3D 10;
+                                       else if (val & (1 << 2))
+                                               chip->onfi_version =3D 20;
+                                       else if (val & (1 << 3))
+                                               chip->onfi_version =3D 21;
+                                       else
+                                               chip->onfi_version =3D 22;
+                               }
+                       }
+                       if (chip->onfi_version) {
+                               sanitize_string(p->manufacturer, sizeof(p->=
manufacturer));
+                               sanitize_string(p->model, sizeof(p->model));
+                               if (!mtd->name)
+                                       mtd->name =3D p->model;
+                               mtd->writesize =3D le32_to_cpu(p->byte_per_=
page);
+                               mtd->erasesize =3D le32_to_cpu(p->pages_per=
_block)*mtd->writesize;
+                               mtd->oobsize =3D le16_to_cpu(p->spare_bytes=
_per_page);
+                               chip->chipsize =3D le32_to_cpu(p->blocks_pe=
r_lun) * mtd->erasesize;
+                               busw =3D 0;
+                               if (le16_to_cpu(p->features) & 1)
+                                       busw =3D NAND_BUSWIDTH_16;
+
+                               chip->options &=3D ~NAND_CHIPOPTIONS_MSK;
+                               chip->options |=3D (NAND_NO_READRDY | NAND_=
NO_AUTOINCR) & NAND_CHIPOPTIONS_MSK;
+
+                               /* emulate cellinfo ??? */
+                               //chip->cellinfo =3D 0x8;
+                               goto ident_done;
+
+                       }
+               }
+       }
+#endif
+       chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
+
+       /* Read entire ID string */
+
+       for (i =3D 0; i < 8; i++)
+               id_data[i] =3D chip->read_byte(mtd);
=20
        if (!type->name)
                return ERR_PTR(-ENODEV);
@@ -2886,6 +2990,21 @@ static struct nand_flash_dev *nand_get_flash_type(st=
ruct mtd_info *mtd,
                mtd->oobsize =3D mtd->writesize / 32;
                busw =3D type->options & NAND_BUSWIDTH_16;
        }
+       /* Get chip options, preserve non chip based options */
+       chip->options &=3D ~NAND_CHIPOPTIONS_MSK;
+       chip->options |=3D type->options & NAND_CHIPOPTIONS_MSK;
+
+       /* Check if chip is a not a samsung device. Do not clear the
+        * options for chips which are not having an extended id.
+        */
+       if (*maf_id !=3D NAND_MFR_SAMSUNG && !type->pagesize)
+               chip->options &=3D ~NAND_SAMSUNG_LP_OPTIONS;
+ident_done:
+
+       /*
+        * Set chip as a default. Board drivers can override it, if necessa=
ry
+        */
+       chip->options |=3D NAND_NO_AUTOINCR;
=20
        /* Try to identify manufacturer */
        for (maf_idx =3D 0; nand_manuf_ids[maf_idx].id !=3D 0x0; maf_idx++)=
 {
@@ -2900,7 +3019,7 @@ static struct nand_flash_dev *nand_get_flash_type(str=
uct mtd_info *mtd,
        if (busw !=3D (chip->options & NAND_BUSWIDTH_16)) {
                printk(KERN_INFO "NAND device: Manufacturer ID:"
                       " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id,
=2D                      dev_id, nand_manuf_ids[maf_idx].name, mtd->name);
+                      *dev_id, nand_manuf_ids[maf_idx].name, mtd->name);
                printk(KERN_WARNING "NAND bus width %d instead %d bit\n",
                       (chip->options & NAND_BUSWIDTH_16) ? 16 : 8,
                       busw ? 16 : 8);
@@ -2924,21 +3043,6 @@ static struct nand_flash_dev *nand_get_flash_type(st=
ruct mtd_info *mtd,
                NAND_LARGE_BADBLOCK_POS : NAND_SMALL_BADBLOCK_POS;
        chip->badblockbits =3D 8;
=20
=2D       /* Get chip options, preserve non chip based options */
=2D       chip->options &=3D ~NAND_CHIPOPTIONS_MSK;
=2D       chip->options |=3D type->options & NAND_CHIPOPTIONS_MSK;
=2D
=2D       /*
=2D        * Set chip as a default. Board drivers can override it, if neces=
sary
=2D        */
=2D       chip->options |=3D NAND_NO_AUTOINCR;
=2D
=2D       /* Check if chip is a not a samsung device. Do not clear the
=2D        * options for chips which are not having an extended id.
=2D        */
=2D       if (*maf_id !=3D NAND_MFR_SAMSUNG && !type->pagesize)
=2D               chip->options &=3D ~NAND_SAMSUNG_LP_OPTIONS;
=2D
        /*
         * Bad block marker is stored in the last page of each block
         * on Samsung and Hynix MLC devices
@@ -2958,9 +3062,10 @@ static struct nand_flash_dev *nand_get_flash_type(st=
ruct mtd_info *mtd,
        if (mtd->writesize > 512 && chip->cmdfunc =3D=3D nand_command)
                chip->cmdfunc =3D nand_command_lp;
=20
+       /* TODO onfi flash name */
        printk(KERN_INFO "NAND device: Manufacturer ID:"
=2D              " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, dev_id,
=2D              nand_manuf_ids[maf_idx].name, type->name);
+              " 0x%02x, Chip ID: 0x%02x (%s %s)\n", *maf_id, *dev_id,
+              nand_manuf_ids[maf_idx].name, chip->onfi_version?type->name:=
chip->onfi_params.model);
=20
        return type;
 }
@@ -2979,7 +3084,7 @@ static struct nand_flash_dev *nand_get_flash_type(str=
uct mtd_info *mtd,
 int nand_scan_ident(struct mtd_info *mtd, int maxchips,
                    struct nand_flash_dev *table)
 {
=2D       int i, busw, nand_maf_id;
+       int i, busw, nand_maf_id, nand_dev_id;
        struct nand_chip *chip =3D mtd->priv;
        struct nand_flash_dev *type;
=20
@@ -2989,7 +3094,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchip=
s,
        nand_set_defaults(chip, busw);
=20
        /* Read the flash type */
=2D       type =3D nand_get_flash_type(mtd, chip, busw, &nand_maf_id, table=
);
+       type =3D nand_get_flash_type(mtd, chip, busw, &nand_maf_id, &nand_d=
ev_id, table);
=20
        if (IS_ERR(type)) {
                if (!(chip->options & NAND_SCAN_SILENT_NODEV))
@@ -3007,7 +3112,7 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchip=
s,
                chip->cmdfunc(mtd, NAND_CMD_READID, 0x00, -1);
                /* Read manufacturer and device IDs */
                if (nand_maf_id !=3D chip->read_byte(mtd) ||
=2D                   type->id !=3D chip->read_byte(mtd))
+                   nand_dev_id !=3D chip->read_byte(mtd))
                        break;
        }
        if (i > 1)

=2D-
=46lorian
