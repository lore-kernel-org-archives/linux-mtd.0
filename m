Received: from sypressi.dnainternet.net ([83.102.40.135])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6fzc-0003sp-PJ
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2013 12:04:02 +0000
Subject: [PATCH] alauda: do not use stack for URB transfer_buffers
To: linux-mtd@lists.infradead.org
From: Jussi Kivilinna <jussi.kivilinna@iki.fi>
Date: Tue, 06 Aug 2013 15:03:29 +0300
Message-ID: <20130806120329.8864.36301.stgit@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: Joern Engel <joern@logfs.org>, linux-usb@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Patch fixes alauda not to use stack as URB transfer_buffer. URB buffers need to
be DMA-able, which stack is not.

Patch is only compile tested.

Cc: stable@vger.kernel.org
Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
---
 drivers/mtd/nand/alauda.c |   74 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 56 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/alauda.c b/drivers/mtd/nand/alauda.c
index 60a0dfd..e99e302 100644
--- a/drivers/mtd/nand/alauda.c
+++ b/drivers/mtd/nand/alauda.c
@@ -69,6 +69,9 @@ struct alauda {
 	struct mtd_info		*mtd;
 	struct alauda_card	*card;
 	struct mutex		card_mutex;
+	void			*card_cmdbuf;
+	void			*card_oobbuf;
+	void			*card_ignore_buf;
 	u32			pagemask;
 	u32			bytemask;
 	u32			blockmask;
@@ -119,6 +122,13 @@ static void alauda_delete(struct kref *kref)
 {
 	struct alauda *al = container_of(kref, struct alauda, kref);
 
+	kfree(al[0].card_cmdbuf);
+	kfree(al[1].card_cmdbuf);
+	kfree(al[0].card_oobbuf);
+	kfree(al[1].card_oobbuf);
+	kfree(al[0].card_ignore_buf);
+	kfree(al[1].card_ignore_buf);
+
 	if (al->mtd) {
 		mtd_device_unregister(al->mtd);
 		kfree(al->mtd);
@@ -133,7 +143,9 @@ static int alauda_get_media_status(struct alauda *al, void *buf)
 
 	mutex_lock(&al->card_mutex);
 	ret = usb_control_msg(al->dev, usb_rcvctrlpipe(al->dev, 0),
-			ALAUDA_GET_XD_MEDIA_STATUS, 0xc0, 0, 1, buf, 2, HZ);
+			ALAUDA_GET_XD_MEDIA_STATUS, 0xc0, 0, 1, al->card_cmdbuf,
+			2, HZ);
+	memcpy(buf, al->card_cmdbuf, 2);
 	mutex_unlock(&al->card_mutex);
 	return ret;
 }
@@ -155,7 +167,9 @@ static int alauda_get_media_signatures(struct alauda *al, void *buf)
 
 	mutex_lock(&al->card_mutex);
 	ret = usb_control_msg(al->dev, usb_rcvctrlpipe(al->dev, 0),
-			ALAUDA_GET_XD_MEDIA_SIG, 0xc0, 0, 0, buf, 4, HZ);
+			ALAUDA_GET_XD_MEDIA_SIG, 0xc0, 0, 0, al->card_cmdbuf,
+			4, HZ);
+	memcpy(buf, al->card_cmdbuf, 4);
 	mutex_unlock(&al->card_mutex);
 	return ret;
 }
@@ -167,7 +181,8 @@ static void alauda_reset(struct alauda *al)
 		0, 0, 0, 0, al->port
 	};
 	mutex_lock(&al->card_mutex);
-	usb_bulk_msg(al->dev, al->bulk_out, command, 9, NULL, HZ);
+	memcpy(al->card_cmdbuf, command, 9);
+	usb_bulk_msg(al->dev, al->bulk_out, al->card_cmdbuf, 9, NULL, HZ);
 	mutex_unlock(&al->card_mutex);
 }
 
@@ -223,14 +238,17 @@ static int __alauda_read_page(struct mtd_info *mtd, loff_t from, void *buf,
 			goto out;
 	}
 	init_completion(&sg.comp);
-	usb_fill_bulk_urb(sg.urb[0], al->dev, al->bulk_out, command, 9,
+
+	mutex_lock(&al->card_mutex);
+
+	memcpy(al->card_cmdbuf, command, 9);
+	usb_fill_bulk_urb(sg.urb[0], al->dev, al->bulk_out, al->card_cmdbuf, 9,
 			alauda_complete, NULL);
 	usb_fill_bulk_urb(sg.urb[1], al->dev, al->bulk_in, buf, mtd->writesize,
 			alauda_complete, NULL);
-	usb_fill_bulk_urb(sg.urb[2], al->dev, al->bulk_in, oob, 16,
+	usb_fill_bulk_urb(sg.urb[2], al->dev, al->bulk_in, al->card_oobbuf, 16,
 			alauda_complete, &sg.comp);
 
-	mutex_lock(&al->card_mutex);
 	for (i=0; i<3; i++) {
 		err = usb_submit_urb(sg.urb[i], GFP_NOIO);
 		if (err)
@@ -243,6 +261,7 @@ cancel:
 			usb_kill_urb(sg.urb[i]);
 		}
 	}
+	memcpy(oob, al->card_oobbuf, 16);
 	mutex_unlock(&al->card_mutex);
 
 out:
@@ -288,14 +307,18 @@ static int alauda_write_page(struct mtd_info *mtd, loff_t to, void *buf,
 			goto out;
 	}
 	init_completion(&sg.comp);
-	usb_fill_bulk_urb(sg.urb[0], al->dev, al->bulk_out, command, 9,
-			alauda_complete, NULL);
-	usb_fill_bulk_urb(sg.urb[1], al->dev, al->write_out, buf,mtd->writesize,
-			alauda_complete, NULL);
-	usb_fill_bulk_urb(sg.urb[2], al->dev, al->write_out, oob, 16,
-			alauda_complete, &sg.comp);
 
 	mutex_lock(&al->card_mutex);
+
+	memcpy(al->card_cmdbuf, command, 9);
+	memcpy(al->card_oobbuf, oob, 16);
+	usb_fill_bulk_urb(sg.urb[0], al->dev, al->bulk_out, al->card_cmdbuf, 9,
+			alauda_complete, NULL);
+	usb_fill_bulk_urb(sg.urb[1], al->dev, al->write_out, buf,
+			  mtd->writesize, alauda_complete, NULL);
+	usb_fill_bulk_urb(sg.urb[2], al->dev, al->write_out, al->card_oobbuf,
+			  16, alauda_complete, &sg.comp);
+
 	for (i=0; i<3; i++) {
 		err = usb_submit_urb(sg.urb[i], GFP_NOIO);
 		if (err)
@@ -326,7 +349,6 @@ static int alauda_erase_block(struct mtd_info *mtd, loff_t ofs)
 		ALAUDA_BULK_CMD, ALAUDA_BULK_ERASE_BLOCK, PBA_HI(pba),
 		PBA_ZONE(pba), 0, PBA_LO(pba), 0x02, 0, al->port
 	};
-	u8 buf[2];
 	int i, err;
 
 	for (i=0; i<2; i++)
@@ -339,12 +361,15 @@ static int alauda_erase_block(struct mtd_info *mtd, loff_t ofs)
 			goto out;
 	}
 	init_completion(&sg.comp);
-	usb_fill_bulk_urb(sg.urb[0], al->dev, al->bulk_out, command, 9,
+
+	mutex_lock(&al->card_mutex);
+
+	memcpy(al->card_cmdbuf, command, 9);
+	usb_fill_bulk_urb(sg.urb[0], al->dev, al->bulk_out, al->card_cmdbuf, 9,
 			alauda_complete, NULL);
-	usb_fill_bulk_urb(sg.urb[1], al->dev, al->bulk_in, buf, 2,
+	usb_fill_bulk_urb(sg.urb[1], al->dev, al->bulk_in, al->card_oobbuf, 2,
 			alauda_complete, &sg.comp);
 
-	mutex_lock(&al->card_mutex);
 	for (i=0; i<2; i++) {
 		err = usb_submit_urb(sg.urb[i], GFP_NOIO);
 		if (err)
@@ -367,9 +392,9 @@ out:
 
 static int alauda_read_oob(struct mtd_info *mtd, loff_t from, void *oob)
 {
-	static u8 ignore_buf[512]; /* write only */
+	struct alauda *al = mtd->priv;
 
-	return __alauda_read_page(mtd, from, ignore_buf, oob);
+	return __alauda_read_page(mtd, from, al->card_ignore_buf, oob);
 }
 
 static int alauda_isbad(struct mtd_info *mtd, loff_t ofs)
@@ -677,6 +702,19 @@ static int alauda_probe(struct usb_interface *interface,
 	/* second device is identical up to now */
 	memcpy(al+1, al, sizeof(*al));
 
+	al[0].card_cmdbuf = kmalloc(9, GFP_KERNEL);
+	al[1].card_cmdbuf = kmalloc(9, GFP_KERNEL);
+	al[0].card_oobbuf = kmalloc(16, GFP_KERNEL);
+	al[1].card_oobbuf = kmalloc(16, GFP_KERNEL);
+	al[0].card_ignore_buf = kmalloc(512, GFP_KERNEL);
+	al[1].card_ignore_buf = kmalloc(512, GFP_KERNEL);
+	if (!al[0].card_cmdbuf || !al[1].card_cmdbuf || !al[0].card_oobbuf ||
+	    !al[1].card_oobbuf || !al[0].card_ignore_buf ||
+	    !al[1].card_ignore_buf) {
+		err = -ENOMEM;
+		goto error;
+	}
+
 	mutex_init(&al[0].card_mutex);
 	mutex_init(&al[1].card_mutex);
 
