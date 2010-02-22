Received: from fg-out-1718.google.com ([72.14.220.157])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NjbKk-0004EJ-IW
	for linux-mtd@lists.infradead.org; Mon, 22 Feb 2010 16:40:39 +0000
Received: by fg-out-1718.google.com with SMTP id e21so1105932fga.0
	for <linux-mtd@lists.infradead.org>;
	Mon, 22 Feb 2010 08:40:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <a9e22dff1002220826p63209a33n27e84ea10e191a19@mail.gmail.com>
References: <a9e22dff1002220826p63209a33n27e84ea10e191a19@mail.gmail.com>
From: niam <niam.niam@gmail.com>
Date: Mon, 22 Feb 2010 18:40:11 +0200
Message-ID: <a9e22dff1002220840x7e86a1a0i3d44cefc1c6a79c0@mail.gmail.com>
Subject: [PATCH] jffs2: fix memory leak if the sector was successfully erased
To: David Woodhouse <dwmw2@infradead.org>, Joe Perches <joe@perches.com>,
	Joakim Tjernlund <Joakim.Tjernlund@transmode.se>,
	linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Resending patch to proper people/mailing list.

Memory allocated for erase instruction is not freed if the sector was
successfully erased.

Signed-off-by: Dmytro Milinevskyy <niam.niam@gmail.com>
---
=A0fs/jffs2/erase.c | =A0 =A04 +++-
=A01 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index b47679b..c0a5604 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -74,8 +74,10 @@ static void jffs2_erase_block(struct jffs2_sb_info *c,
=A0 =A0 =A0 =A0((struct erase_priv_struct *)instr->priv)->c =3D c;

=A0 =A0 =A0 =A0ret =3D c->mtd->erase(c->mtd, instr);
- =A0 =A0 =A0 if (!ret)
+ =A0 =A0 =A0 if (!ret) {
+ =A0 =A0 =A0 =A0kfree(instr);
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
+ =A0 =A0}

=A0 =A0 =A0 =A0bad_offset =3D instr->fail_addr;
=A0 =A0 =A0 =A0kfree(instr);
