Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35FC1088E4B
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2026 22:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=siYGs+rHcEEKSCfBPrK9UuvPcll6msFV1DwzeHKexTo=; b=Pgewav+zYIH+0B
	ax3kVTQAMTpdsMkND0i2jLJc2To6sN34AocAg+IBw380IR01C+DM3WraeKhFRMkThV8LyBSx+b5X/
	pGrge1tuG9WVUsbcGCcjMIU4sbXRVuQQtOK+DWGXSHpE++sseERgE++m79ZZaOv5YkhkQUyfKt909
	gvFonJQ3QAR1AnGR8+3C9ll7CEZw2RsY3bAaJResX9T26fgduNuIaJtVBjIDDFsOqBwQJl5W8F/vL
	wX01e5tUWHkF8fm8/erx7WxI35zEl5uPLHtmKjiCUc3KqID0a6PNk/o3hscStYVmFo9dwq7d7YjsE
	S00JXMv6Hxo6RKw3cLhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2zm9-00000009S7K-47KW;
	Wed, 18 Mar 2026 22:54:05 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2zm5-00000009S6y-2RvY
	for linux-mtd@lists.infradead.org;
	Wed, 18 Mar 2026 22:54:02 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43b41b545d9so315793f8f.2
        for <linux-mtd@lists.infradead.org>; Wed, 18 Mar 2026 15:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773874439; x=1774479239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tz+7kRqmNKMu49t5cWTIMffDOUjKAtKjalbQqhljI7U=;
        b=X7pNaHubwcO6tpQTJFbSLFZFb5vnGuu/byiY17dJLiLHD7B4ra4z6angAa1E3Z1jFz
         Xq9HTJNt+1R4Q0+Fby26NxUc9JDttPGLmPjbajyl1y4SsnTutmJ6GZPcqb2WKTczPoOz
         W0r0qUoxxad9pEnQ31h9igp6tcMSWqXGtSO5iRon6gqaJexNuuVERqzrXc86aTjJ/5QS
         yTt6XeJR1Cb3S6Sb3Yl0TvIp7Bek+s4SIJDTG8hH4pjq+ggSovnqsn1nZB3INlrJNOze
         G2dQsR0hjdKKLAA/oCsEr9w1VRiLpsvIHz5UUqnBtq6kBpDOW/CgkMl4qN3XpOQF49Na
         6yXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773874439; x=1774479239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tz+7kRqmNKMu49t5cWTIMffDOUjKAtKjalbQqhljI7U=;
        b=Yv2TbR0JMxc9oo/b1VlaOFzXdIaJxmAh/z4DGyK8vWGQWYojcez8oPDnBrcpkByVCQ
         OT7U6ZbLSfj4uVc7qyXG3NzQc78OG7H9sMFgYrGaJzTKWAjZGxxqdCNP+mRLg+X5ACsT
         sKgrnwYzza6dQRW9rXKENwTq1xOuvWVv5hGzWGk+5nTN54P27ApZFtXddxX4f0l7dtKu
         xnAKjSPQaj2fpzcjJZS6qIcgN/oOKyLxsDomCI1cg1OlOED7i00zaI4EV9IE7v9RO79d
         eCqFjnrmIxX7vU25wQuHvGNdVz8qYV2xrvqVWEm8NkO4NDrtoNG5+bHex90Q7tCHL9sg
         XxRQ==
X-Gm-Message-State: AOJu0YzHAGK1e543D2sEGki64Ul/8N9XHpKjwDMxZyvtN416SBfqzUrW
	8akmqglMeD4R6w6BH+c4oN/K+9C+d5KgQylrfD7Wqifpc/lt6ESdc80s6ZxApg==
X-Gm-Gg: ATEYQzz94s9sRSDUXjr1WWHATPR+ka7eOJcsmDE0wh5Jwx3lVqSGrMMxBMDPsA2cMlu
	5mmmIo11FH1sTpJDXJ59NMrC/r+XXgX6QTzpOXEyNWO7FsnQIkKR7fZrfyPJ2tgBSRV4h4O7ctL
	4xEWtywjnx29dYMWkmhIyiBI0DZmds6v8iaPnyBP8BPs26O6KnTEwN4bFkXF6gYr3RzUm0wyNGu
	ijZLsorw+qA5AI8jpdY45AIdGLBsN5cwtFuu4nf1QEmhPjEFyeOVhONKp3Lze3hkMUd93POXYcp
	vWQ3sCf7UGGG0GlSm1ok/cua7NqVK1NqQ/saTHKFrAUUlUHZtPKlFNlhlVjrE6KJaPic4mI17po
	S2ZNelB3Q9B0gVeQFB4X6Fer+l4+jzn4D/HbdRvDEcR4rbLL+5GpGOWuFBCP1YYQP6egKukZOY1
	feEaOn+ZRz38NAnbcpNQ+JXWORm7IrfVgjvY0=
X-Received: by 2002:a5d:5d85:0:b0:43b:4a2c:ff4 with SMTP id ffacd0b85a97d-43b527c40a9mr9036691f8f.33.1773874438236;
        Wed, 18 Mar 2026 15:53:58 -0700 (PDT)
Received: from localhost.localdomain ([147.235.207.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51899617sm11891113f8f.31.2026.03.18.15.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 15:53:57 -0700 (PDT)
From: Aviv Daum <aviv.daum@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Aviv Daum <aviv.daum@gmail.com>
Subject: [PATCH] mtd-utils: tests: jittertest: reject overlong file names
Date: Thu, 19 Mar 2026 00:53:32 +0200
Message-Id: <20260318225332.31623-1-aviv.daum@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_155401_684738_9324F820 
X-CRM114-Status: GOOD (  24.49  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

plotJittervsFill copies the -f argument into a 250-byte buffer with
strncpy(..., sizeof(LogFile)). A 250-byte file name leaves the buffer
unterminated, and the subsequent fopen() reads past the end of LogFile.

JitterTest uses the same fixed-size file name pattern for -r, while -c
still silently truncates overlong names and -f already rejects them.

Validate jittertest file name arguments before copying them so these
options all reject overlong input instead of truncating it or reading
past the end of fixed-size buffers.

Add a shell regression test that exercises the accepted and rejected
boundary lengths for plotJittervsFill and JitterTest during make check.

Signed-off-by: Aviv Daum <aviv.daum@gmail.com>
---
 Makefile.am                            |   3 +
 configure.ac                           |   1 +
 tests/jittertest/JitterTest.c          |  52 +++++++----
 tests/jittertest/Makemodule.am         |   6 +-
 tests/jittertest/filename_bounds.sh.in | 115 +++++++++++++++++++++++++
 tests/jittertest/plotJittervsFill.c    |  17 +++-
 6 files changed, 175 insertions(+), 19 deletions(-)
 create mode 100755 tests/jittertest/filename_bounds.sh.in

diff --git a/Makefile.am b/Makefile.am
index c756127..ba54acc 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -42,6 +42,9 @@ test_SCRIPTS =
 test_DATA =
 
 TESTS =
+TEST_EXTENSIONS = .sh
+SH_LOG_COMPILER = $(SHELL)
+AM_TESTS_ENVIRONMENT = TESTBINDIR='$(abs_top_builddir)'; export TESTBINDIR;
 EXTRA_DIST = COPYING CHANGELOG.md README.txt
 
 include lib/Makemodule.am
diff --git a/configure.ac b/configure.ac
index 2a79ba8..f17d703 100644
--- a/configure.ac
+++ b/configure.ac
@@ -304,6 +304,7 @@ AC_CONFIG_FILES([tests/fs-tests/fs_help_all.sh
 	tests/fs-tests/fs_run_all.sh
 	tests/fs-tests/stress/fs_stress00.sh
 	tests/fs-tests/stress/fs_stress01.sh
+	tests/jittertest/filename_bounds.sh
 	tests/ubi-tests/runubitests.sh
 	tests/ubi-tests/ubi-stress-test.sh
 	tests/ubifs_tools-tests/lib/common.sh
diff --git a/tests/jittertest/JitterTest.c b/tests/jittertest/JitterTest.c
index 2bee0b0..a3e3764 100644
--- a/tests/jittertest/JitterTest.c
+++ b/tests/jittertest/JitterTest.c
@@ -205,6 +205,7 @@ static int RunAsRTTask = FALSE; /* default action unless priority is
 
 /********************* Local Function Prototypes **********************/
 void HandleCmdLineArgs(int argc, char *argv[]);
+static void SaveFileName(char *pDest, size_t destSize, const char *pFileName);
 void SetFileName(char * pFileName);
 void SetInterruptPeriod(char * pASCIIInterruptPeriodMilliSec);
 void SetSchedulerPriority(char * pASCIISchedulerPriority);
@@ -830,9 +831,14 @@ void HandleCmdLineArgs(
                      (strcmp(argv[argNum],"-r")       == STRINGS_EQUAL)) {
                 /* Set the file to read*/
                 ++argNum;
-
-                strncpy(ReadFile, argv[argNum], sizeof(ReadFile));
-                DoRead = TRUE;
+                if (argNum < argc) {
+                    SaveFileName(ReadFile, sizeof(ReadFile), argv[argNum]);
+                    DoRead = TRUE;
+                }
+                else {
+                    printf("*** Read file name not specified. ***\n");
+                    exit(0);
+                }
             }
 
             else if ((strcmp(argv[argNum],"--write_bytes") ==
@@ -858,9 +864,13 @@ void HandleCmdLineArgs(
                      (strcmp(argv[argNum],"-c")       == STRINGS_EQUAL)) {
 	      /* Set the file to log console log on. */
 	      ++argNum;
-
-	      strncpy(LogFile, argv[argNum], sizeof(LogFile) - 1);
-	      LogFile[sizeof(LogFile) - 1] = '\0';
+	      if (argNum < argc) {
+	          SaveFileName(LogFile, sizeof(LogFile), argv[argNum]);
+	      }
+	      else {
+	          printf("*** Console log file name not specified. ***\n");
+	          exit(0);
+	      }
             }
 
             else if ((strcmp(argv[argNum],"--grab_kprofile") ==
@@ -913,27 +923,37 @@ void HandleCmdLineArgs(
 
 
 /***********************************************************************
- *                                SetFileName
- *  This function sets the output file name.
+ *                              SaveFileName
+ *  This function validates and saves a file name.
  *  output: N/A
  ***********************************************************************/
-void SetFileName(
-    char * pFileName)               /* ptr to desired output file name  */
+static void SaveFileName(
+    char *pDest,                    /* ptr to destination buffer        */
+    size_t destSize,                /* destination buffer size          */
+    const char *pFileName)          /* ptr to desired file name         */
 {
     size_t fileNameLen;             /* file name length (bytes)         */
 
-    /* Check file name length. */
     fileNameLen = strlen(pFileName);
-    if (fileNameLen > (size_t) MAX_FILE_NAME_LEN) {
+    if (fileNameLen > destSize - 1) {
         printf("File name %s exceeds maximum length %d.\n",
-               pFileName, MAX_FILE_NAME_LEN);
+               pFileName, (int)(destSize - 1));
         exit(0);
     }
 
-    /* File name length is OK so save the file name. */
-    strcpy(OutFileName, pFileName);
+    strcpy(pDest, pFileName);
+}
 
-    return;
+
+/***********************************************************************
+ *                                SetFileName
+ *  This function sets the output file name.
+ *  output: N/A
+ ***********************************************************************/
+void SetFileName(
+    char * pFileName)               /* ptr to desired output file name  */
+{
+    SaveFileName(OutFileName, sizeof(OutFileName), pFileName);
 }
 
 
diff --git a/tests/jittertest/Makemodule.am b/tests/jittertest/Makemodule.am
index d280192..2cb85c1 100644
--- a/tests/jittertest/Makemodule.am
+++ b/tests/jittertest/Makemodule.am
@@ -6,6 +6,8 @@ plotJittervsFill_CPPFLAGS = $(AM_CPPFLAGS)
 
 test_PROGRAMS += JitterTest plotJittervsFill
 
-test_SCRIPTS += tests/jittertest/filljffs2.sh
+test_SCRIPTS += tests/jittertest/filljffs2.sh tests/jittertest/filename_bounds.sh
+TESTS += tests/jittertest/filename_bounds.sh
 
-EXTRA_DIST += tests/jittertest/README tests/jittertest/filljffs2.sh
+EXTRA_DIST += tests/jittertest/README tests/jittertest/filljffs2.sh \
+	tests/jittertest/filename_bounds.sh.in
diff --git a/tests/jittertest/filename_bounds.sh.in b/tests/jittertest/filename_bounds.sh.in
new file mode 100755
index 0000000..0dfba74
--- /dev/null
+++ b/tests/jittertest/filename_bounds.sh.in
@@ -0,0 +1,115 @@
+#!/bin/sh
+
+TESTBINDIR=${TESTBINDIR-@TESTBINDIR@}
+
+tmpdir=
+jt_pid=
+watchdog_pid=
+
+fatal()
+{
+	echo "Error: $1" 1>&2
+	exit 1
+}
+
+cleanup()
+{
+	if [ -n "$watchdog_pid" ]; then
+		kill "$watchdog_pid" >/dev/null 2>&1 || :
+		wait "$watchdog_pid" 2>/dev/null || :
+	fi
+
+	if [ -n "$jt_pid" ]; then
+		kill "$jt_pid" >/dev/null 2>&1 || :
+		wait "$jt_pid" 2>/dev/null || :
+	fi
+
+	if [ -n "$tmpdir" ]; then
+		rm -rf "$tmpdir"
+	fi
+}
+
+trap 'status=$?; trap - EXIT; cleanup; exit $status' EXIT
+trap 'exit 1' HUP INT QUIT TERM
+
+make_name()
+{
+	char="$1"
+	length="$2"
+	name=
+	i=0
+
+	while [ "$i" -lt "$length" ]; do
+		name="${name}${char}"
+		i=$((i + 1))
+	done
+
+	printf '%s' "$name"
+}
+
+tmpdir=$(mktemp -d "${TMPDIR:-/tmp}/mtd-utils-jittertest.XXXXXX") ||
+	fatal "mktemp failed"
+cd "$tmpdir" || fatal "cannot change to temp dir"
+
+plot_valid=$(make_name a 249)
+: > "$plot_valid" || fatal "cannot create valid plot input"
+"$TESTBINDIR/plotJittervsFill" -f "$plot_valid" >plot-valid.out 2>plot-valid.err ||
+	fatal "plotJittervsFill rejected a 249-byte file name"
+if grep -q "exceeds maximum length" plot-valid.out plot-valid.err; then
+	fatal "plotJittervsFill reported a max-length error for a 249-byte file name"
+fi
+
+plot_invalid=$(make_name b 250)
+"$TESTBINDIR/plotJittervsFill" -f "$plot_invalid" >plot-invalid.out 2>plot-invalid.err || :
+if ! grep -q "exceeds maximum length" plot-invalid.out plot-invalid.err; then
+	fatal "plotJittervsFill did not reject a 250-byte file name"
+fi
+if grep -q "Unable to open input log file" plot-invalid.out plot-invalid.err; then
+	fatal "plotJittervsFill reached fopen() for an overlong file name"
+fi
+
+jt_read_valid=$(make_name r 32)
+"$TESTBINDIR/JitterTest" -c /dev/null -f out.dat -r "$jt_read_valid" >jt-valid.out 2>jt-valid.err &
+jt_pid=$!
+(
+	sleep 10
+	kill -TERM "$jt_pid" >/dev/null 2>&1 || :
+	sleep 1
+	kill -KILL "$jt_pid" >/dev/null 2>&1 || :
+) &
+watchdog_pid=$!
+sleep 1
+kill -INT "$jt_pid" >/dev/null 2>&1 || fatal "cannot stop JitterTest"
+wait "$jt_pid" || fatal "JitterTest failed with a 32-byte read file name"
+jt_pid=
+kill "$watchdog_pid" >/dev/null 2>&1 || :
+wait "$watchdog_pid" 2>/dev/null || :
+watchdog_pid=
+if ! grep -q "Press Ctrl+C to exit the program." jt-valid.out; then
+	fatal "JitterTest did not start normally with a 32-byte read file name"
+fi
+if ! grep -q "JitterTest exiting." jt-valid.out; then
+	fatal "JitterTest did not exit cleanly after SIGINT"
+fi
+
+jt_read_invalid=$(make_name s 33)
+"$TESTBINDIR/JitterTest" -c /dev/null -f out.dat -r "$jt_read_invalid" \
+	>jt-read-invalid.out 2>jt-read-invalid.err || :
+if ! grep -q "exceeds maximum length" jt-read-invalid.out jt-read-invalid.err; then
+	fatal "JitterTest did not reject a 33-byte read file name"
+fi
+if grep -q "Press Ctrl+C to exit the program." jt-read-invalid.out jt-read-invalid.err; then
+	fatal "JitterTest started despite an overlong read file name"
+fi
+
+jt_console_invalid=$(make_name c 33)
+"$TESTBINDIR/JitterTest" -c "$jt_console_invalid" -f out.dat \
+	>jt-console-invalid.out 2>jt-console-invalid.err || :
+if ! grep -q "exceeds maximum length" jt-console-invalid.out jt-console-invalid.err; then
+	fatal "JitterTest did not reject a 33-byte console file name"
+fi
+if grep -q "Press Ctrl+C to exit the program." jt-console-invalid.out jt-console-invalid.err; then
+	fatal "JitterTest started despite an overlong console file name"
+fi
+
+echo "SUCCESS"
diff --git a/tests/jittertest/plotJittervsFill.c b/tests/jittertest/plotJittervsFill.c
index 03929a9..8929f9a 100644
--- a/tests/jittertest/plotJittervsFill.c
+++ b/tests/jittertest/plotJittervsFill.c
@@ -75,6 +75,21 @@ static int Debug = 0; /* Debug level. Each "-d" on the cmd line increases the le
 
 #define MIN_JITTER_THRESHOLD 1 /* ms minimum jitter threshold */
 
+static void SetLogFileName(
+    const char *pFileName)          /* ptr to desired input file name   */
+{
+    size_t fileNameLen;             /* file name length (bytes)         */
+
+    fileNameLen = strlen(pFileName);
+    if (fileNameLen > sizeof(LogFile) - 1) {
+        printf("File name %s exceeds maximum length %d.\n",
+               pFileName, (int)(sizeof(LogFile) - 1));
+        exit(0);
+    }
+
+    strcpy(LogFile, pFileName);
+}
+
 static void PrintHelpInfo(void)
 {
     printf("Usage: plotJittervsFill [options] -f [--file] <input log file name> -t [--jitter_threshold] <jitter threshold in ms>\n");
@@ -122,7 +137,7 @@ static void HandleCmdLineArgs(
                 /* Set the name of the output file. */
                 ++argNum;
                 if (argNum < argc) {
-                    strncpy(LogFile, argv[argNum], sizeof(LogFile));
+                    SetLogFileName(argv[argNum]);
                 }
                 else {
                     printf("*** Input file name not specified. ***\n");
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
