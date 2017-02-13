Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cdOFi-0008Bw-RY
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2017 21:33:46 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at, dwmw2@infradead.org,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 2/5] Update faq entry on compiling mtd-utils
Date: Mon, 13 Feb 2017 22:31:15 +0100
Message-Id: <20170213213118.7857-3-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20170213213118.7857-1-david.oberhollenzer@sigma-star.at>
References: <20170213213118.7857-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 faq/general.xml | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/faq/general.xml b/faq/general.xml
index a11147a..3b1e4c5 100644
--- a/faq/general.xml
+++ b/faq/general.xml
@@ -270,13 +270,29 @@ repository:
 <CODE>git://git.infradead.org/mtd-utils.git</CODE>
 
 <P>
+Source tar balls of the release versions are available from the following
+ftp directory:
+</P>
+
+<CODE>ftp://ftp.infradead.org/pub/mtd-utils/</CODE>
+
+<P>
 To compile, first you have to install libraries the tools depend on. You can
 find the information about <CODE>mkfs.jffs2</CODE> dependencies
 <A HREF="jffs2.html#L_mkfs_jffs2_comp">here</A> and the the information about
 <CODE>mkfs.ubifs</CODE> dependencies
-<A HREF="ubifs.html#L_mkfs_ubifs_comp">here</A>. Once you have these satisfied,
-you should be able to simply type <CODE>make</CODE> from the root mtd-utils
-directory.
+<A HREF="ubifs.html#L_mkfs_ubifs_comp">here</A>.
+</P>
+
+<P>
+The mtd-utils use an autotools based build system. For the release tar balls,
+simply run the <CODE>configure</CODE> script from the mtd-utils root directory
+followed by <CODE>make</CODE> to build the mtd-utils.
+</P>
+
+<P>
+If you are working on the mtd-utils git-tree, you have to generate the
+configure script by running the <CODE>autogen.sh</CODE> script first.
 </P>
 
 
-- 
2.11.0
