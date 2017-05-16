Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAgxR-0003dn-O0
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 18:12:32 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 52/53] docs-rst: get rid of Documentation/sphinx/tmplcvt
 script
Date: Tue, 16 May 2017 15:11:59 -0300
Message-Id: <fd74809e73be1192f2455d39932a94dfa6fb0e83.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <dca1e58e3f1c82a840abaafb9328f84ae69a9926.1494935649.git.mchehab@s-opensource.com>
References: <dca1e58e3f1c82a840abaafb9328f84ae69a9926.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As everything was converted to ReST, we don't need this
script anymore.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/sphinx/tmplcvt | 28 ----------------------------
 1 file changed, 28 deletions(-)
 delete mode 100755 Documentation/sphinx/tmplcvt

diff --git a/Documentation/sphinx/tmplcvt b/Documentation/sphinx/tmplcvt
deleted file mode 100755
index 6848f0a26fa5..000000000000
--- a/Documentation/sphinx/tmplcvt
+++ /dev/null
@@ -1,28 +0,0 @@
-#!/bin/bash
-#
-# Convert a template file into something like RST
-#
-# fix <function>
-# feed to pandoc
-# fix \_
-# title line?
-#
-set -eu
-
-if [ "$#" != "2" ]; then
-	echo "$0 <docbook file> <rst file>"
-	exit
-fi
-
-DIR=$(dirname $0)
-
-in=$1
-rst=$2
-tmp=$rst.tmp
-
-cp $in $tmp
-sed --in-place -f $DIR/convert_template.sed $tmp
-pandoc -s -S -f docbook -t rst -o $rst $tmp
-sed --in-place -f $DIR/post_convert.sed $rst
-rm $tmp
-echo "book writen to $rst"
-- 
2.9.3
