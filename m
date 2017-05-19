Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by casper.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWet-0007Fb-OP
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:24:51 +0000
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
 Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 07/30] isapnp.txt: promote title level
Date: Thu, 18 May 2017 22:23:59 -0300
Message-Id: <7f2724c5082537e6b6b5c2dbaa667a00ea586bb1.1495156975.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156975.git.mchehab@s-opensource.com>
References: <cover.1495156975.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156975.git.mchehab@s-opensource.com>
References: <cover.1495156975.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This simple document only needs to promote its title to be
using the standard we're using for document texts.

Yet, IMHO, it would be worth merging this file with
Documentation/pnp.txt in the future.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/isapnp.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/isapnp.txt b/Documentation/isapnp.txt
index 400d1b5b523d..8d0840ac847b 100644
--- a/Documentation/isapnp.txt
+++ b/Documentation/isapnp.txt
@@ -1,3 +1,4 @@
+==========================================================
 ISA Plug & Play support by Jaroslav Kysela <perex@suse.cz>
 ==========================================================
 
-- 
2.9.4
