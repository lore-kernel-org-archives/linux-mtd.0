Received: from g6t0185.atlanta.hp.com ([15.193.32.62])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QrXEo-0001SM-GY
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2011 15:32:03 +0000
Received: from G2W1953G.americas.hpqcorp.net (g2w1953g.austin.hp.com
	[16.238.8.185]) (using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by g6t0185.atlanta.hp.com (Postfix) with ESMTPS id 717E4240A2
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Aug 2011 15:31:59 +0000 (UTC)
From: "Fryar, Jeff" <jeff.fryar@hp.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Thu, 11 Aug 2011 16:30:33 +0100
Subject: [BUG] mtd-utils: nandwrite: invalid erase after page write failure
Message-ID: <EBEBA6C3BD40EF4B8C0A5B8AD5A28F993B6C6EB71A@GVW0547EXC.americas.hpqcorp.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

mtd-utils nandwrite.c: After a page write failure, the calculation
of the block number to erase is incorrect.  The erase block size is=20
being passed as the erase block number in the call to mtd_erase().

Jeff Fryar <jeff.fryar@hp.com>


--- mtd-utils-f1fe865/nandwrite.c.ORIG  2011-07-20 00:28:52.000000000 -0500
+++ mtd-utils-f1fe865/nandwrite.c       2011-08-11 09:19:12.000000000 -0500
@@ -659,7 +659,7 @@
                        fprintf(stderr, "Erasing failed write from %#08llx =
to %#08llx\n",
                                blockstart, blockstart + ebsize_aligned - 1=
);
                        for (i =3D blockstart; i < blockstart + ebsize_alig=
ned; i +=3D mtd.eb_size) {
-                               if (mtd_erase(mtd_desc, &mtd, fd, mtd.eb_si=
ze)) {
+                               if (mtd_erase(mtd_desc, &mtd, fd, (i/mtd.eb=
_size))) {
                                        int errno_tmp =3D errno;
                                        sys_errmsg("%s: MTD Erase failure",=
 mtd_device);
                                        if (errno_tmp !=3D EIO) {
