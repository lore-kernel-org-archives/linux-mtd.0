Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qw1AO-00082a-Ku
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2011 00:18:01 +0000
Received: by pzk4 with SMTP id 4so421472pzk.28
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Aug 2011 17:17:56 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 2/5] mtd: doc: remove mention of MEMSETOOBSEL
Date: Tue, 23 Aug 2011 17:17:33 -0700
Message-Id: <1314145056-5233-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314145056-5233-1-git-send-email-computersforpeace@gmail.com>
References: <1314145056-5233-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It's been gone for a while.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 Documentation/DocBook/mtdnand.tmpl |   14 --------------
 1 files changed, 0 insertions(+), 14 deletions(-)

diff --git a/Documentation/DocBook/mtdnand.tmpl b/Documentation/DocBook/mtdnand.tmpl
index 8c07540..0c674be 100644
--- a/Documentation/DocBook/mtdnand.tmpl
+++ b/Documentation/DocBook/mtdnand.tmpl
@@ -773,20 +773,6 @@ struct nand_oobinfo {
 				done according to the default builtin scheme.
 			</para>
 		</sect2>
-		<sect2 id="User_space_placement_selection">
-			<title>User space placement selection</title>
-		<para>
-			All non ecc functions like mtd->read and mtd->write use an internal 
-			structure, which can be set by an ioctl. This structure is preset 
-			to the autoplacement default.
-	     		<programlisting>
-	ioctl (fd, MEMSETOOBSEL, oobsel);
-	     		</programlisting>
-			oobsel is a pointer to a user supplied structure of type
-			nand_oobconfig. The contents of this structure must match the 
-			criteria of the filesystem, which will be used. See an example in utils/nandwrite.c.
-		</para>
-		</sect2>
 	</sect1>	
 	<sect1 id="Spare_area_autoplacement_default">
 		<title>Spare area autoplacement default schemes</title>
-- 
1.7.5.4
