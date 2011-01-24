Received: from mail.de.keymile.com ([195.8.104.1])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PhMDf-0006sk-UN
	for linux-mtd@lists.infradead.org; Mon, 24 Jan 2011 13:12:33 +0000
Message-ID: <4D3D7AB5.50401@keymile.com>
Date: Mon, 24 Jan 2011 14:12:21 +0100
From: Holger Brunck <holger.brunck@keymile.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: UBI: corrupted PEB detection for Numonyx P30
Content-Type: text/plain;
	charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "Walter, Axel" <Axel.Walter@keymile.com>, Detlev Zundel <dzu@denx.de>,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
we have on a powerpc based board with a new Numonyx P30 65nm 1GBit flash an
error seen on the PEB detection of UBI.

If we do a power cut on the board we get an similar situation as on Spansion
S29GL512N. After a reboot the eraseblock is unwriteable and we can not
invalidate the VID and EC header. In u-boot the area looks like:

=> md 0x56180000

56180000: 00000000 00000000 00000000 00000000    ................
56180010: 00000000 00000000 00000000 00000000    ................
56180020: ffffffff ffffffff ffffffff ffffffff    ................
56180030: ffffffff ffffffff ffffffff ffffffff    ................
56180040: ffffffff ffffffff ffffffff ffffffff    ................
56180050: ffffffff ffffffff ffffffff ffffffff    ................

During bootime we hit the checks for valid VID and EC header in nor_erase_prepare:
err1 = ubi_io_read_vid_hdr(ubi, pnum, &vid_hdr, 0);
err1 = ubi_io_read_ec_hdr(ubi, pnum, &ec_hdr, 0);

Both functions were only checked for (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 ==
UBI_IO_BAD_HDR). But in our case we have a VID header with all FFs and the
return code is UBI_IO_FF. So I think it must be checked also for UBI_IO_FF and
UBI_IO_FF_BITFLIPS.

The following patch seems to solve our problem:

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 811775a..407aa46 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -507,11 +507,13 @@ static int nor_erase_prepare(struct ubi_device *ubi, int pnum)
         * PEB.
         */
        err1 = ubi_io_read_vid_hdr(ubi, pnum, &vid_hdr, 0);
-       if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR) {
+       if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR ||
+           err1 == UBI_IO_FF || err1 == UBI_IO_FF_BITFLIPS) {
                struct ubi_ec_hdr ec_hdr;

                err1 = ubi_io_read_ec_hdr(ubi, pnum, &ec_hdr, 0);
-               if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR)
+               if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR ||
+                   err1 == UBI_IO_FF || err1 == UBI_IO_FF_BITFLIPS) {
                        /*
                         * Both VID and EC headers are corrupted, so we can
                         * safely erase this PEB and not afraid that it will be

Does anyone see a problem with this patch? If not I can post it as a git patch
on the mailing list.

Best regards
Holger Brunck
