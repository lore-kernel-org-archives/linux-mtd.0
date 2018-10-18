Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9SD-0004T0-MF
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:40:52 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 31/42] mkfs.ubifs: Accept 0x prefix for key descriptor
Date: Thu, 18 Oct 2018 16:37:07 +0200
Message-Id: <20181018143718.26298-32-richard@nod.at>
In-Reply-To: <20181018143718.26298-1-richard@nod.at>
References: <20181018143718.26298-1-richard@nod.at>
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

From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/fscrypt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ubifs-utils/mkfs.ubifs/fscrypt.c b/ubifs-utils/mkfs.ubifs/fs=
crypt.c
index 6d1fa4ba9d3f..02132e205a35 100644
--- a/ubifs-utils/mkfs.ubifs/fscrypt.c
+++ b/ubifs-utils/mkfs.ubifs/fscrypt.c
@@ -165,6 +165,9 @@ static int parse_key_descriptor(const char *desc, __u=
8 *dst)
 {
 	int i, hi, lo;
=20
+	if (desc[0] =3D=3D '0' && (desc[1] =3D=3D 'x' || desc[1] =3D=3D 'X'))
+		desc +=3D 2;
+
 	for (i =3D 0; i < FS_KEY_DESCRIPTOR_SIZE; ++i) {
 		if (!desc[i * 2] || !desc[i * 2 + 1]) {
 			err_msg("key descriptor '%s' is too short", desc);
--=20
2.19.1
