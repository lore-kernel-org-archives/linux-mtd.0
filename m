Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbQ9-0001Ma-8b
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:18:00 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH v2 10/53] conf.py: define a color for important markup on PDF
 output
Date: Tue, 16 May 2017 09:16:02 -0300
Message-Id: <2a054b5156cf3bbca31b5b34170df0b7ed065e12.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
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

As kdbg.rst uses the ".. important::" annotation, let's define a
color for PDF output.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/conf.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 0ce8001a50b6..1774357150a3 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -281,6 +281,7 @@ latex_elements = {
 	\\definecolor{NoteColor}{RGB}{204,255,255}
 	\\definecolor{WarningColor}{RGB}{255,204,204}
 	\\definecolor{AttentionColor}{RGB}{255,255,204}
+	\\definecolor{ImportantColor}{RGB}{192,255,204}
 	\\definecolor{OtherColor}{RGB}{204,204,204}
         \\newlength{\\mynoticelength}
         \\makeatletter\\newenvironment{coloredbox}[1]{%
@@ -301,7 +302,12 @@ latex_elements = {
 	            \\ifthenelse%
 	            {\\equal{\\py@noticetype}{attention}}%
 	            {\\colorbox{AttentionColor}{\\usebox{\\@tempboxa}}}%
-	            {\\colorbox{OtherColor}{\\usebox{\\@tempboxa}}}%
+		    {%
+	               \\ifthenelse%
+	               {\\equal{\\py@noticetype}{important}}%
+	               {\\colorbox{ImportantColor}{\\usebox{\\@tempboxa}}}%
+	               {\\colorbox{OtherColor}{\\usebox{\\@tempboxa}}}%
+		    }%
 		 }%
 	      }%
         }\\makeatother
-- 
2.9.3
