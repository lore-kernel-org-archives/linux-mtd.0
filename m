Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QHaEc-0001j8-35
	for linux-mtd@lists.infradead.org; Wed, 04 May 2011 11:27:15 +0000
From: <john.maxin@nokia.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] add a check to prevent the incrementing of possible NULL
	value for "region" in onenand_base.c
Date: Wed, 4 May 2011 11:26:48 +0000
Message-ID: <77DFD0EF40BC5042BB7221A1EFFF75709578@008-AM1MPN1-021.mgdnok.nokia.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: kyungmin.park@samsung.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


 Hi,=0A=
=0A=
Coverity has reported that inside the function "onenand_block_by_block_eras=
e()" in onenand_base.c, we should add checks to prevent the incrementing of=
 possible NULL value for "region"=0A=
Thanks a lot to Adrian Hunter for suggesting a better solution.=0A=
=0A=
Signed-off-by: Maxin B. John <john.maxin@nokia.com>=0A=
---=0A=
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onena=
nd_base.c=0A=
index 56a8b20..fd659f8 100644=0A=
--- a/drivers/mtd/onenand/onenand_base.c=0A=
+++ b/drivers/mtd/onenand/onenand_base.c=0A=
@@ -2424,7 +2424,7 @@ static int onenand_block_by_block_erase(struct mtd_in=
fo *mtd,=0A=
                len -=3D block_size;=0A=
                addr +=3D block_size;=0A=
=0A=
-               if (addr =3D=3D region_end) {=0A=
+               if (region && addr =3D=3D region_end) {=0A=
                        if (!len)=0A=
                                break;=0A=
                        region++;=0A=
