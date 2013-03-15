Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UGTHR-00081J-MA
 for linux-mtd@lists.infradead.org; Fri, 15 Mar 2013 11:58:38 +0000
Received: from dbdp20.itg.ti.com ([172.24.170.38])
 by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2FBwY1m010702
 for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2013 06:58:35 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
 by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2FBwXlQ009010
 for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2013 17:28:34 +0530 (IST)
From: "Gupta, Pekon" <pekon@ti.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: mtd_oobtest failing in linux-3.9-rc2
Date: Fri, 15 Mar 2013 11:58:33 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9A21B6@DBDE01.ent.ti.com>
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

Hi,

I'm finding the mtd_oobtest failing in latest mainline kernel (linux-3.9-rc=
2).=20
I'm using a omap2-nand driver with BCH8 scheme.

Can someone please confirm, is it broken for other driver sets also ?

=3D=3D=3D=3D=3D
[ 4654.301108] mtd_oobtest: MTD device: 6

[ 4654.305061] mtd_oobtest: MTD device size 5242880, eraseblock size 131072=
, page size 2048, count of eraseblocks 40, pages per eraseblock 64, OOB siz=
e 64

[ 4654.319460] mtd_oobtest: scanning for bad eraseblocks
[ 4654.334337] mtd_oobtest: scanned 40 eraseblocks, 0 are bad
[ 4654.340250] mtd_oobtest: test 1 of 5
[ 4654.344006] mtd_oobtest: erasing whole device
[ 4654.371637] mtd_oobtest: erased 40 eraseblocks
[ 4654.376319] mtd_oobtest: writing OOBs of whole device
[ 4654.387502] mtd_oobtest: written up to eraseblock 0
[ 4654.614386] mtd_oobtest: written 40 eraseblocks
[ 4654.619206] mtd_oobtest: verifying all eraseblocks

[ 4654.624312] mtd_oobtest: error: verify failed at 0x0
=3D=3D=3D=3D=3D

with regards, pekon
