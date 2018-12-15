Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYCjZ-0004Aj-9J
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2018 16:24:11 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, dwmw2@infradead.org,
 Richard Weinberger <richard@nod.at>, stable@vger.kernel.org
Subject: [PATCH] jffs2: Fix integer underflow in jffs2_rtime_compress
Date: Sat, 15 Dec 2018 17:23:50 +0100
Message-Id: <20181215162350.12489-1-richard@nod.at>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The rtime compressor assumes that at least two bytes are
compressed.
If we try to compress just one byte, the loop condition will
wrap around and an out-of-bounds write happens.

Cc: <stable@vger.kernel.org>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 fs/jffs2/compr_rtime.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/jffs2/compr_rtime.c b/fs/jffs2/compr_rtime.c
index 406d9cc84ba8..cbf700001fc9 100644
--- a/fs/jffs2/compr_rtime.c
+++ b/fs/jffs2/compr_rtime.c
@@ -39,6 +39,9 @@ static int jffs2_rtime_compress(unsigned char *data_in,
=20
 	memset(positions,0,sizeof(positions));
=20
+	if (*dstlen < 2)
+		return -1;
+
 	while (pos < (*sourcelen) && outpos <=3D (*dstlen)-2) {
 		int backpos, runlen=3D0;
 		unsigned char value;
--=20
2.20.0
