Received: from mail-vb0-f44.google.com ([209.85.212.44])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vg4tu-0001sf-SW
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 03:44:27 +0000
Received: by mail-vb0-f44.google.com with SMTP id 11so3880387vbe.31
 for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2013 19:44:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <528196CF.9090404@freescale.com>
References: <1384189727-19563-1-git-send-email-festevam@gmail.com>
 <20131111182324.GE20061@ld-irv-0074.broadcom.com>
 <528196CF.9090404@freescale.com>
Date: Tue, 12 Nov 2013 01:44:01 -0200
Message-ID: <CAOMZO5BzXhrbDtkFMPmYPnQp+X2=gSEJGc+3U8H+QrGdgRgCxw@mail.gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Fix NULL pointer dereference
From: Fabio Estevam <festevam@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 12, 2013 at 12:47 AM, Huang Shijie <b32955@freescale.com> wrote=
:
> =E4=BA=8E 2013=E5=B9=B411=E6=9C=8812=E6=97=A5 02:23, Brian Norris =E5=86=
=99=E9=81=93:

> For imx23, the work flow is like this:
> [1] first check the fingerprint, if we can find it, we will return
> immediately.
> [2] if [1] failed, such as you erase all the partitions, the gpmi will ca=
ll
> mx23_write_transcription_stamp() to write the fingerprint.
>
> So the @chip->buffer is not only used by the
> mx23_check_transcription_stamp(),
> but _also_ used by the mx23_write_transcription_stamp() when the gpmi
> can not find any
> fingerprint in the NAND page.
>
>
> That's why i use the NAND_OWN_BUFFERS, the buffer can be used by both
> the mx23_check_transcription_stamp()
> and mx23_write_transcription_stamp().

Understood.

What if we just allocate the 4-byte buffer once on probe?

Like this:

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index a9830ff..647da1b 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1342,7 +1342,6 @@ static int mx23_check_transcription_stamp(struct
gpmi_nand_data *this)
     unsigned int search_area_size_in_strides;
     unsigned int stride;
     unsigned int page;
-    uint8_t *buffer =3D chip->buffers->databuf;
     int saved_chip_number;
     int found_an_ncb_fingerprint =3D false;

@@ -1368,10 +1367,10 @@ static int
mx23_check_transcription_stamp(struct gpmi_nand_data *this)
          * and starts in the 12th byte of the page.
          */
         chip->cmdfunc(mtd, NAND_CMD_READ0, 12, page);
-        chip->read_buf(mtd, buffer, strlen(fingerprint));
+        chip->read_buf(mtd, this->buffer, strlen(fingerprint));

         /* Look for the fingerprint. */
-        if (!memcmp(buffer, fingerprint, strlen(fingerprint))) {
+        if (!memcmp(this->buffer, fingerprint, strlen(fingerprint))) {
             found_an_ncb_fingerprint =3D true;
             break;
         }
@@ -1401,7 +1400,6 @@ static int mx23_write_transcription_stamp(struct
gpmi_nand_data *this)
     unsigned int block;
     unsigned int stride;
     unsigned int page;
-    uint8_t      *buffer =3D chip->buffers->databuf;
     int saved_chip_number;
     int status;

@@ -1442,9 +1440,9 @@ static int mx23_write_transcription_stamp(struct
gpmi_nand_data *this)
     }

     /* Write the NCB fingerprint into the page buffer. */
-    memset(buffer, ~0, mtd->writesize);
+    memset(this->buffer, ~0, mtd->writesize);
     memset(chip->oob_poi, ~0, mtd->oobsize);
-    memcpy(buffer + 12, fingerprint, strlen(fingerprint));
+    memcpy(this->buffer + 12, fingerprint, strlen(fingerprint));

     /* Loop through the first search area, writing NCB fingerprints. */
     dev_dbg(dev, "Writing NCB fingerprints...\n");
@@ -1455,7 +1453,7 @@ static int mx23_write_transcription_stamp(struct
gpmi_nand_data *this)
         /* Write the first page of the current stride. */
         dev_dbg(dev, "Writing an NCB fingerprint in page 0x%x\n", page);
         chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
-        chip->ecc.write_page_raw(mtd, chip, buffer, 0);
+        chip->ecc.write_page_raw(mtd, chip, this->buffer, 0);
         chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);

         /* Wait for the write to finish. */
@@ -1728,6 +1726,10 @@ static int gpmi_nand_probe(struct platform_device *p=
dev)
         return -ENOMEM;
     }

+    this->buffer =3D devm_kzalloc(&pdev->dev, strlen(fingerprint), GFP_KER=
NEL);
+    if (!this->buffer)
+        return -ENOMEM;
+
     platform_set_drvdata(pdev, this);
     this->pdev  =3D pdev;
     this->dev   =3D &pdev->dev;
diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
index a7685e3..e88114c 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.h
@@ -186,6 +186,7 @@ struct gpmi_nand_data {

     /* private */
     void            *private;
+    uint8_t         *buffer;
 };
