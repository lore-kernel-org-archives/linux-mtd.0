Date: Thu, 30 Nov 2017 09:56:42 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, kernel@pengutronix.de
Subject: UBI using outdated fastmaps
Message-ID: <20171130085642.smi3eu2khcrnrvud@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

We are chasing problems with corrupted UBI volumes here. With an
excessive load of power cuts we occasionally see UBI corruptions. Most
of the time we see that a LEB is unmapped although it should really be
mapped.

I finally found one place where such corruptions can happen. In
ubi_update_fastmap() the new fastmap is written. It can happen that
there is no free PEB to write the fastmap to. In this case the code
reuses the PEB where the old fastmap is. The critical place is when the
PEB with the old fastmap is erased but not updated with the new fastmap.
A power cut here can trick the fastmap attach code to use an outdated
fastmap during next boot. When during next boot no fastmap is found, the
code will fall back to scanning and everything is fine. It can, however,
happen that there is an even older fastmap found which is then used in
the lack of the more recent one which just got erased.

It is illegal to erase the PEB with the latest fastmap when there are
still older fastmaps on the device and this is what happens here.

The problem can be reproduced relatively easily with the patch below.
It panics the kernel at the right point after having erased the old
block, but before it is written again. The ubi.fm_debug parameter during
next boot will then find inconsistencies in case there is an old fastmap
on the flash.

I haven't digged further yet, right now I have no idea how to fix this
properly.

Sascha


diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 2542a44f47f9..ece6dfb0b054 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1619,6 +1619,8 @@ int ubi_update_fastmap(struct ubi_device *ubi)
 		/* no fresh anchor PEB was found, reuse the old one */
 		if (!tmp_e) {
 			ret = erase_block(ubi, old_fm->e[0]->pnum);
+			printk("%s: re-use old fm_anchor. Erased PEB %d\n", __func__, old_fm->e[0]->pnum);
+			panic("boom");
 			if (ret < 0) {
 				ubi_err(ubi, "could not erase old anchor PEB");
 
-- 
2.11.0


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
