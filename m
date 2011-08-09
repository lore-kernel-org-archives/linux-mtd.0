Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QquQJ-0003aU-7S
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2011 22:05:20 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH v2 8/9] faq: ubi(fs): small spelling, URL fixups
Date: Tue, 9 Aug 2011 15:05:01 -0700
Message-ID: <1312927501-16796-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1312832239-21759-9-git-send-email-computersforpeace@gmail.com>
References: <1312832239-21759-9-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We used `<a name=[URL]>' instead of `<a href=[URL]>' by accident.

Also, the file "faq/ubi.html" is located within the "faq" directory, so
use a simpler relative link (i.e., don't use `../faq').

Change "we have never find" to "we have never found".

Change "refer this tread" to "refer to this thread".

Change "UBIi" to "UBI", "you your" to "your".

Change "refer the" to "refer to the".

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2: add "refer the" => "refer to the" fix

 faq/ubi.xml   |    4 ++--
 faq/ubifs.xml |    8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/faq/ubi.xml b/faq/ubi.xml
index 9458e77..1ee4327 100644
--- a/faq/ubi.xml
+++ b/faq/ubi.xml
@@ -375,7 +375,7 @@ describes how UBI-aware flasher program has to work.</p>
 
 <p><b>Important!</b>: even if you do not care about erasecounters, do not use
 <code>nandwrite</code> for flashing UBI images containing UBIFS file-system to
-NAND flashes, read <a href="../faq/ubifs.html#L_why_ubiformat">here</a> for
+NAND flashes, read <a href="ubifs.html#L_why_ubiformat">here</a> for
 more information.</p>
 
 
@@ -567,7 +567,7 @@ any image, and check if you still have these errors.</p>
 <p>If you do not have errors when you mount empty flash, it is probably indeed
 related to how you flash the UBI/UBIFS images. One typical problem is related
 to ECC calculation algorithm - read
-<a name="ubifs.html#L_why_ubiformat">here</a> for more information. Make sure
+<a href="ubifs.html#L_why_ubiformat">here</a> for more information. Make sure
 that you use <a href="../doc/ubifs.html#L_usptools">ubiformat</a>, or make sure
 either that your flashing program skips <code>0xFF</code> properly (see
 <a href="../doc/ubi.html#L_flasher_algo">here</a>) or that your UBIFS image
diff --git a/faq/ubifs.xml b/faq/ubifs.xml
index dbfac0e..b6b0b14 100644
--- a/faq/ubifs.xml
+++ b/faq/ubifs.xml
@@ -717,8 +717,8 @@ provably want the file-system doing inode updates every time they are read.</p>
 
 <p>Not, it does not, which means you cannot export UBIFS file-system via NFS.
 We did make an attempt to support NFS, but the support was not exactly correct
-so it was dropped, and we have never find time to come back to that. Please,
-refer <a href="http://marc.info/?l=linux-next&amp;m=121852228611051&amp;w=2">this tread</a>
+so it was dropped, and we have never found time to come back to that. Please,
+refer to <a href="http://marc.info/?l=linux-next&amp;m=121852228611051&amp;w=2">this thread</a>
 for some more details. The original patch can also be found there.</p>
 
 
@@ -1482,7 +1482,7 @@ all checks: "<code>echo 127 > /sys/module/ubifs/parameters/debug_chks</code>".</
 	saw any errors/warnings, describe them and include all corresponding
 	prints from tests / UBIFS / etc;</li>
 
-	<li>provide UBIi and UBIFS configuration from you your
+	<li>provide UBI and UBIFS configuration from your
 	<code>.config</code> file, or just attach whole file;</li>
 
 	<li>describe your flash device, attach the "<code>mtdinfo&amp;nbsp;-a</code>"
@@ -1501,7 +1501,7 @@ all checks: "<code>echo 127 > /sys/module/ubifs/parameters/debug_chks</code>".</
 private e-mails to UBIFS authors, always CC the mailing list!</p>
 
 <p>Note, sometimes UBIFS bugs may appear to be UBI bugs. If you suspect
-there are UBI problems, please, also enable UBI debugging. Please, refer the
+there are UBI problems, please, also enable UBI debugging. Please, refer to the
 <a href="ubi.html#L_how_debug">UBI debugging</a> section for more
 information.</p>
 
-- 
1.7.0.4
