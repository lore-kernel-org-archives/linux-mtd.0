Received: from relay02.pair.com ([209.68.5.16])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KexS3-0008Ow-Fr
	for linux-mtd@lists.infradead.org; Sun, 14 Sep 2008 19:40:08 +0000
From: Grant Erickson <gerickson@nuovations.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD-UTILS] nandwrite: Eliminate Global Declaration Ambiguity
Date: Sun, 14 Sep 2008 12:40:05 -0700
Message-Id: <1221421205-17136-1-git-send-email-gerickson@nuovations.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Eliminate ambiguity as to whether the static global 'img' is a
character pointer or a constant character pointer.

Signed-off-by: Grant Erickson <gerickson@nuovations.com>
---

Enrico Scholz <enrico.scholz@sigma-chemnitz.de> raised a valid point
<http://lists.infradead.org/pipermail/linux-mtd/2008-September/022968.html>
that the declaration of mtd_device and img globals are somewhat
unclear with respect to the type for the typical reader.

 nandwrite.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index fc23e85..af73aa8 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -113,7 +113,8 @@ static void display_version (void)
 }
 
 static const char	*standard_input = "-";
-static const char	*mtd_device, *img;
+static const char	*mtd_device;
+static const char	*img;
 static int		mtdoffset = 0;
 static bool		quiet = false;
 static bool		writeoob = false;
-- 
1.6.0.1
