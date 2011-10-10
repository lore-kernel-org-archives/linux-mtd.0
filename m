Received: from mga02.intel.com ([134.134.136.20])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RDBQN-0002On-S7
	for linux-mtd@lists.infradead.org; Mon, 10 Oct 2011 08:41:28 +0000
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Artem Bityutskiy <artem.bityutskiy@intel.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH resend] tests: checkfs: remove unused code
Date: Mon, 10 Oct 2011 11:40:43 +0300
Message-Id: <61071344f543384c616680ba182ec98a02279210.1318235878.git.andriy.shevchenko@linux.intel.com>
In-Reply-To: <a2202ab2af2fb20aead5d5956bd46dc030082eef.1318235873.git.andriy.shevchenko@linux.intel.com>
References: <a2202ab2af2fb20aead5d5956bd46dc030082eef.1318235873.git.andriy.shevchenko@linux.intel.com>
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
1.7.6.3
