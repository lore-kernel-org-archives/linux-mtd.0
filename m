From: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
To: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
Subject: RE: [PATCH] mtd: Expand the ecc placement locations to 1260
Date: Thu, 19 Mar 2015 23:21:35 +0000
Message-ID: <0D23F1ECC880A74392D56535BCADD7354973F1C7@NTXBOIMBX03.micron.com>
References: <BN1BFFO11FD0497164C4D8ECB568C7BDA7C8010@BN1BFFO11FD049.protection.gbl>
In-Reply-To: <BN1BFFO11FD0497164C4D8ECB568C7BDA7C8010@BN1BFFO11FD049.protection.gbl>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "michals@xilinx.com" <michals@xilinx.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "shaktib@xilinx.com" <shaktib@xilinx.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kalluripunnaiahchoudary@gmail.com" <kalluripunnaiahchoudary@gmail.com>,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This device has a Page size x8: 17,600 bytes (16,384 + 1216 bytes) and mini=
mum required ECC 24-bit ECC per 1100 bytes of data.  Spare area needed for =
ECC would be ECC * M, where M is (codeword <=3D 2^m-1).  In this case M=3D1=
4, because (1100*8)<=3D2^14-1, therefore minimum spare area needed is 14*24=
 =3D 336b or 42B per codeword.  So for this device a minimum of 672bytes of=
 the 1216 need to be used for ECC, the rest can be used for other purposes.



Jeff Lauruhn
NAND Application Engineer


-----Original Message-----
From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of=
 Punnaiah Choudary Kalluri
Sent: Thursday, March 19, 2015 1:50 AM
To: dwmw2@infradead.org; computersforpeace@gmail.com
Cc: linux-kernel@vger.kernel.org; shaktib@xilinx.com; michals@xilinx.com; l=
inux-mtd@lists.infradead.org; kalluripunnaiahchoudary@gmail.com; Punnaiah C=
houdary Kalluri
Subject: [PATCH] mtd: Expand the ecc placement locations to 1260

Device like MT29F32G08ABCDBJ4 have a writesize/oobsize of 16K/1260 Bytes.
So, increasing the maximum ecc placement locations to 1260

Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
---
 include/linux/mtd/mtd.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h index f17fa7=
5..e73d85b 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -95,7 +95,7 @@ struct mtd_oob_ops {
 };
=20
 #define MTD_MAX_OOBFREE_ENTRIES_LARGE	32
-#define MTD_MAX_ECCPOS_ENTRIES_LARGE	640
+#define MTD_MAX_ECCPOS_ENTRIES_LARGE	1260
 /*
  * Internal ECC layout control structure. For historical reasons, there is=
 a
  * similar, smaller struct nand_ecclayout_user (in mtd-abi.h) that is reta=
ined
--
1.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
