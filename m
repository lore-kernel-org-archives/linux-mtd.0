Received: from recycle.lbl.gov ([131.243.169.124])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15pZhj-0008HJ-00
	for <linux-mtd@lists.infradead.org>; Fri, 05 Oct 2001 19:28:11 +0100
Message-ID: <20011005113711.A29087@recycle.lbl.gov>
Date: Fri, 5 Oct 2001 11:37:11 -0700
From: Larry Doolittle <ldoolitt@recycle.lbl.gov>
To: linux-mtd@lists.infradead.org
Subject: minor einfo and mtd_debug improvement
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

The following changes let einfo and mtd_debug do the right
thing when the underlying MTD device is marked readonly.

    - Larry


diff -ur mtd-util-20011003/einfo.c /home/ldoolitt/cvs/mtd/util/einfo.c
--- mtd-util-20011003/einfo.c	Mon Oct  1 15:42:08 2001
+++ /home/ldoolitt/cvs/mtd/util/einfo.c	Tue Apr 10 00:57:45 2001
@@ -20,7 +20,7 @@
 	}
    
 	// Open and size the device
-	if ((Fd = open(argv[1],O_RDONLY)) < 0)
+	if ((Fd = open(argv[1],O_RDWR)) < 0)
 	{
 		fprintf(stderr,"File open error\n");
 		return 8;
diff -ur mtd-util-20011003/mtd_debug.c /home/ldoolitt/cvs/mtd/util/mtd_debug.c
--- mtd-util-20011003/mtd_debug.c	Mon Oct  1 16:01:41 2001
+++ /home/ldoolitt/cvs/mtd/util/mtd_debug.c	Mon Jun 18 03:47:25 2001
@@ -357,7 +357,6 @@
 {
    const char *progname;
    int err = 0,fd,option = OPT_INFO;
-   int open_flag;
    (progname = strrchr (argv[0],'/')) ? progname++ : (progname = argv[0]);
 
    /* parse command-line options */
@@ -373,8 +372,7 @@
 	 showusage (progname);
 
    /* open device */
-   open_flag = (option==OPT_INFO || option==OPT_READ) ? O_RDONLY : O_RDWR;
-   if ((fd = open (argv[2],O_SYNC | open_flag)) < 0)
+   if ((fd = open (argv[2],O_SYNC | O_RDWR)) < 0)
 	 {
 		perror ("open()");
 		exit (1);
