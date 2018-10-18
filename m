Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD9RP-000451-Qs
 for linux-mtd@lists.infradead.org; Thu, 18 Oct 2018 14:38:43 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 05/42] mkfs.ubifs: Make r5 hash binary string aware
Date: Thu, 18 Oct 2018 16:36:41 +0200
Message-Id: <20181018143718.26298-6-richard@nod.at>
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

As of now all filenames known by UBIFS are strings with a NUL
terminator. With encrypted filenames a filename can be any binary
string and the r5 function cannot search for the NUL terminator.
UBIFS always knows how long a filename is, therefore we can change
the hash function to iterate over the filename length to work
correctly with binary strings.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubifs-utils/mkfs.ubifs/key.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/key.h b/ubifs-utils/mkfs.ubifs/key.h
index c16d0a85418e..0c7922b67687 100644
--- a/ubifs-utils/mkfs.ubifs/key.h
+++ b/ubifs-utils/mkfs.ubifs/key.h
@@ -64,9 +64,8 @@ static inline uint32_t key_r5_hash(const char *s, int l=
en)
 {
 	uint32_t a =3D 0;
 	const signed char *str =3D (const signed char *)s;
-	(void)len;
=20
-	while (*str) {
+	while (len--) {
 		a +=3D *str << 4;
 		a +=3D *str >> 4;
 		a *=3D 11;
--=20
2.19.1
