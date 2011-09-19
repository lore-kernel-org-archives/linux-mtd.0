Received: from mga03.intel.com ([143.182.124.21])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R5bhB-0001Je-Ft
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2011 11:07:30 +0000
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Artem Bityutskiy <artem.bityutskiy@intel.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] tests: checkfs: remove unused code
Date: Mon, 19 Sep 2011 14:06:44 +0300
Message-Id: <19648e848664f51bece3ebdf41d768f69b0b6fd2.1316430185.git.andriy.shevchenko@linux.intel.com>
In-Reply-To: <ee354ceda32594afd6ba928722dbf659aaeac57c.1316430192.git.andriy.shevchenko@linux.intel.com>
References: <ee354ceda32594afd6ba928722dbf659aaeac57c.1316430192.git.andriy.shevchenko@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are two variables which are not used anymore. Thos patch removes useless
lines and suppresses gcc warnings.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 tests/checkfs/checkfs.c |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/tests/checkfs/checkfs.c b/tests/checkfs/checkfs.c
index 0e67626..3e4a6e2 100644
--- a/tests/checkfs/checkfs.c
+++ b/tests/checkfs/checkfs.c
@@ -566,22 +566,16 @@ int main(int argc, char **argv){
     char filename[30];
     short filenameCounter = 0;
     unsigned short counter;
-    unsigned short numberFiles;
-    char error = FALSE;
     short errorCnt = 0;
     time_t timep;
     char * time_string;
     unsigned int seed;
 
-
-    numberFiles = MAX_NUM_FILES;
-
     if(argc >= 1)
     {
         processCmdLine(argc, argv);
     }
 
-
     /*
       First open MAX_NUM_FILES and make sure that the checksum is ok.
       Also make an intry into the logfile.
@@ -629,7 +623,6 @@ int main(int argc, char **argv){
             fclose(logfp);
             (void)sync();
 
-            error = TRUE;
             errorCnt++;
 
             if(errorCnt > MaxErrAllowed){
-- 
1.7.5.4
