Received: from fudo.makrotopia.org ([2001:41d0:8:c75d::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkJJ8-0007YP-RI
 for linux-mtd@lists.infradead.org; Tue, 13 May 2014 20:28:15 +0000
Date: Tue, 13 May 2014 22:27:58 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: add missing ui pointer in debugging code
Message-ID: <20140513202750.GA27516@earthship.olsr.leipzig.freifunk.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

If UBIFS_DEBUG is defined an additional assertion of the ui_lock
spinlock in do_writepage cannot compile because the ui pointer has not
been previously declared.

Fix this by declaring and initializing the ui pointer in case
UBIFS_DEBUG is defined.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 fs/ubifs/file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 4f34dba..e13ec5e 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -903,6 +903,7 @@ static int do_writepage(struct page *page, int len)
 	struct ubifs_info *c =3D inode->i_sb->s_fs_info;
=20
 #ifdef UBIFS_DEBUG
+	struct ubifs_inode *ui =3D ubifs_inode(inode);
 	spin_lock(&ui->ui_lock);
 	ubifs_assert(page->index <=3D ui->synced_i_size << PAGE_CACHE_SIZE);
 	spin_unlock(&ui->ui_lock);
--=20
1.9.2


--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJTcoBGAAoJECBgbL4bcbCQokAH/A/zqKgT7qkEiSJ4Tgvmq7kh
SuT86b0ek3ptXw5joM9QwWxB4euM+G2S9FgGP4ph++m6ybAHg40T9/XxSBfXBPSO
HuiuJhnwsyqjyAKm6ytza6aXTtJfJtg2aaKjvhtFTYe5evsS0K8kagQC8D4t+DDN
3KcJDhEPqTbnIVIipARjFfJ8wYDN+L0QJTEn2ANht/WapotwzG/B1HBAqv421OEQ
CkDSs6I0Sohi7oraPxVvm2np5xv4+zAh5+izBDUfihUKxoqpYlhEiK7/Fjw3RS6q
7agPWRxABINloUI0VdJnBpoAHUHoPN0peYCmRr1e+xseilTNgA2LQGfciu9tS1c=
=rBVS
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
