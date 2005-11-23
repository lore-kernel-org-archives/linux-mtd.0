Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eekez-0003B3-7n
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2005 21:47:03 -0500
Received: from slurryseal.ddns.mvista.com (slurryseal.ddns.mvista.com
	[10.0.10.193])
	by hermes.mvista.com (Postfix) with ESMTP id 5BAF21A853
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Nov 2005 18:46:59 -0800 (PST)
Received: from slurryseal.ddns.mvista.com (localhost.localdomain [127.0.0.1])
	by slurryseal.ddns.mvista.com (8.13.4/8.13.4) with ESMTP id
	jAN2lcaE020161
	for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2005 18:47:38 -0800
Received: (from tpoynor@localhost)
	by slurryseal.ddns.mvista.com (8.13.4/8.13.4/Submit) id jAN2lcpA020160
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2005 18:47:38 -0800
Date: Tue, 22 Nov 2005 18:47:38 -0800
From: Todd Poynor <tpoynor@mvista.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20051123024738.GA19609@slurryseal.ddns.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: nandwrite autoplace for real
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

nand_write_ecc() treats OOB autoplace as "take a string of fs-supplied
bytes (without ECC bytes, bad block marker, etc.) and place them
sequentially in free OOB positions" (implemented in
nand_prepare_oobbuf).

nandwrite -a, on the other hand, requires the input to have the OOB data
already autoplaced (skipping ECC bytes, etc.), and copies the free bytes
position-by-position from input to OOB.

The former definition seems much more useful.  Any objection to the
following patch?  Is anything using the current definition?

BTW, I couldn't make heads or tails of the non-autoplace oob writing
code, which uses the number of ECC bytes as the starting position to
copy fs data from and to.

If I'm misunderstanding any of this I'd appreciate the clue bat. -- Todd

Index: util/nandwrite.c
===================================================================
RCS file: /home/cvs/mtd/util/nandwrite.c,v
retrieving revision 1.32
diff -u -r1.32 nandwrite.c
--- util/nandwrite.c	7 Nov 2005 11:15:13 -0000	1.32
+++ util/nandwrite.c	23 Nov 2005 02:20:36 -0000
@@ -401,13 +401,15 @@
 				 * such as the layout used by diskonchip.c
 				 */
 				if (!oobinfochanged && (old_oobinfo.useecc == MTD_NANDECC_AUTOPLACE)) {
-					for (i = 0;old_oobinfo.oobfree[i][1]; i++) {
-						/* Set the reserved bytes to 0xff */
+					int src;
+
+					for (src = 0, i = 0;old_oobinfo.oobfree[i][1]; i++) {
 						start = old_oobinfo.oobfree[i][0];
 						len = old_oobinfo.oobfree[i][1];
 						memcpy(oobbuf + start,
-							oobreadbuf + start,
+							oobreadbuf + src,
 							len);
+						src += len;
 					}
 				} else {
 					/* Set at least the ecc byte positions to 0xff */
