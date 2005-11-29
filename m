Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Egtrt-0003dw-Br
	for linux-mtd@lists.infradead.org; Mon, 28 Nov 2005 20:01:16 -0500
Received: from slurryseal.ddns.mvista.com (slurryseal.ddns.mvista.com
	[10.0.10.193])
	by hermes.mvista.com (Postfix) with ESMTP id 3763A1A9D0
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Nov 2005 17:01:11 -0800 (PST)
Received: from slurryseal.ddns.mvista.com (localhost.localdomain [127.0.0.1])
	by slurryseal.ddns.mvista.com (8.13.4/8.13.4) with ESMTP id
	jAT11nkC010089
	for <linux-mtd@lists.infradead.org>; Mon, 28 Nov 2005 17:01:49 -0800
Received: (from tpoynor@localhost)
	by slurryseal.ddns.mvista.com (8.13.4/8.13.4/Submit) id jAT11nKo010088
	for linux-mtd@lists.infradead.org; Mon, 28 Nov 2005 17:01:49 -0800
Date: Mon, 28 Nov 2005 17:01:48 -0800
From: Todd Poynor <tpoynor@mvista.com>
To: linux-mtd@lists.infradead.org
Message-ID: <20051129010148.GA9661@slurryseal.ddns.mvista.com>
References: <20051123024738.GA19609@slurryseal.ddns.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20051123024738.GA19609@slurryseal.ddns.mvista.com>
Subject: Re: nandwrite autoplace for real
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 22, 2005 at 06:47:38PM -0800, Todd Poynor wrote:
> nandwrite -a, on the other hand, requires the input to have the OOB data
> already autoplaced (skipping ECC bytes, etc.), and copies the free bytes
> position-by-position from input to OOB.
> 
> The former definition seems much more useful.  Any objection to the
> following patch?  Is anything using the current definition?

To err on the side of safety, here's a new version that only triggers the
new behavior when the "-a" option is given and the target mtd device
advertises an autoplace OOB layout (which used to be a NOP).

To recap: the new behavior is to take a string of bytes without ECC or
bad blocks information from the input file (supplied by the fs creation
utility) and place those bytes in free OOB positions in the target
device (much like the in-kernel nand_write_ecc).  The existing behavior
is to copy free OOB byte positions from input to the device, skipping
ECC bytes and bad block indicator in both input and output (when the
destination device uses an auto OOB layout).

If you use nandwrite -a on files containing OOB data that is formatted
to match the auto OOB layout of a particular device, this patch will
break that usage, but omitting the "-a" option should preserve the
existing behavior.

Any disagreement that this is an appropriate way for nandwrite -a to
behave real soon now?

Index: util/nandwrite.c
===================================================================
RCS file: /home/cvs/mtd/util/nandwrite.c,v
retrieving revision 1.32
diff -u -r1.32 nandwrite.c
--- util/nandwrite.c	7 Nov 2005 11:15:13 -0000	1.32
+++ util/nandwrite.c	29 Nov 2005 00:39:49 -0000
@@ -400,7 +400,20 @@
 				 * Modified to support out of order oobfree segments,
 				 * such as the layout used by diskonchip.c
 				 */
-				if (!oobinfochanged && (old_oobinfo.useecc == MTD_NANDECC_AUTOPLACE)) {
+				if (autoplace &&
+				    (old_oobinfo.useecc == 
+				     MTD_NANDECC_AUTOPLACE)) {
+					int src;
+
+					for (src = 0, i = 0;old_oobinfo.oobfree[i][1]; i++) {
+						start = old_oobinfo.oobfree[i][0];
+						len = old_oobinfo.oobfree[i][1];
+						memcpy(oobbuf + start,
+						       oobreadbuf + src,
+						       len);
+						src += len;
+					}
+				} else if (!oobinfochanged && (old_oobinfo.useecc == MTD_NANDECC_AUTOPLACE)) {
 					for (i = 0;old_oobinfo.oobfree[i][1]; i++) {
 						/* Set the reserved bytes to 0xff */
 						start = old_oobinfo.oobfree[i][0];
 
 
