Received: from mail-bn3nam01on0079.outbound.protection.outlook.com
 ([104.47.33.79] helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dvNo1-0000P3-GB
 for linux-mtd@lists.infradead.org; Fri, 22 Sep 2017 13:15:51 +0000
From: Mathias Thore <Mathias.Thore@infinera.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Regression for NOR flash with multiple erase block regions
Date: Fri, 22 Sep 2017 13:15:21 +0000
Message-ID: <31272a4ee6904476b20b22720d993ac0@sv-ex13-prd1.infinera.com>
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

Hello,

Commit 1eeef2d7483a7e3f8d2dd2a5b9939b3b814dc549 included in Linux 4.13 ( ht=
tps://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/dri=
vers/mtd/mtdpart.c?h=3Dv4.13&id=3D1eeef2d7483a7e3f8d2dd2a5b9939b3b814dc549 =
) introduces a regression for NOR flash with multiple erase block regions o=
f different sizes.

Only the largest erase block size seems to be considered when determining i=
f partitions are aligned. Partitions in smaller regions will be mounted as =
read-only. With Linux 4.12 and earlier, read/write access was available for=
 these partitions.


Regards,
Mathias Thore
