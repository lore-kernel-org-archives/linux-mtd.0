Received: from idiom.com ([216.240.32.1] ident=espin)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16G9CL-0003lD-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Dec 2001 01:37:37 +0000
Received: (from espin@localhost)
	by idiom.com (8.9.3/8.9.3) id RAA71187
	for linux-mtd@lists.infradead.org; Mon, 17 Dec 2001 17:48:22 -0800 (PST)
Date: Mon, 17 Dec 2001 17:48:21 -0800
From: Geoffrey Espin <espin@idiom.com>
To: linux-mtd@lists.infradead.org
Subject: mtd_debug.c patch for hex options and low memory
Message-ID: <20011217174821.A64308@idiom.com>
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

1. The 'mtd_debug' utility doesn't allow hex offsets on the
command-line.

2. If you're short of contiguous RAM then kmalloc() a smaller buffer
and chunk along instead of bailing out.  Especially painful, if
after erasing the existing contents!

Geoff
-- 
Geoffrey Espin espin@idiom.com
--

--- mtd_debug.c.ORIG	Mon Oct  8 15:00:06 2001
+++ mtd_debug.c	Mon Dec 17 15:13:21 2001
@@ -103,42 +103,62 @@
 
 int flash_to_file (int fd,u_int32_t offset,size_t len,const char *filename)
 {
-   u_int8_t *buf;
+   u_int8_t *buf = NULL;
    int outfd,err;
+   int size = len * sizeof (u_int8_t);
+   int n = len;
+
    if (offset != lseek (fd,offset,SEEK_SET))
 	 {
 		perror ("lseek()");
 		goto err0;
 	 }
-   if ((buf = (u_int8_t *) malloc (len * sizeof (u_int8_t))) == NULL)
-	 {
-		perror ("malloc()");
-		goto err0;
-	 }
    outfd = creat (filename,O_WRONLY);
    if (outfd < 0)
 	 {
 		perror ("creat()");
 		goto err1;
 	 }
-   err = read (fd,buf,len);
+
+retry:
+   if ((buf = (u_int8_t *) malloc (size)) == NULL)
+	 {
+#define BUF_SIZE	(64 * 1024 * sizeof (u_int8_t))
+		fprintf (stderr, __FUNCTION__ ": malloc(%#x)\n", size);
+		if (size != BUF_SIZE) {
+			size = BUF_SIZE;
+			fprintf (stderr, __FUNCTION__ ": trying buffer size %#x\n", size);
+			goto retry;
+		}
+		perror ("malloc()");
+		goto err0;
+	 }
+ do {
+   if (n <= size)
+	   size = n;
+   err = read (fd,buf,size);
    if (err < 0)
 	 {
+		fprintf (stderr, __FUNCTION__ ": read, size %#x, n %#x\n", size, n);
 		perror ("read()");
 		goto err2;
 	 }
-   err = write (outfd,buf,len);
+   err = write (outfd,buf,size);
    if (err < 0)
 	 {
+		fprintf (stderr, __FUNCTION__ ": write, size %#x, n %#x\n", size, n);
 		perror ("write()");
 		goto err2;
 	 }
-   if (err != len)
+   if (err != size)
 	 {
-		fprintf (stderr,"Couldn't copy entire buffer to %s. (%d/%d bytes copied)\n",filename,err,len);
+		fprintf (stderr,"Couldn't copy entire buffer to %s. (%d/%d bytes copied)\n",filename,err,size);
 		goto err2;
 	 }
+   n -= size;
+   } while (n > 0);
 
+   if (buf != NULL)
    free (buf);
    close (outfd);
    printf ("Copied %d bytes from address 0x%.8x in flash to %s\n",len,offset,filename);
@@ -147,6 +167,7 @@
    err2:
    close (outfd);
    err1:
+   if (buf != NULL)
    free (buf);
    err0:
    return (1);
@@ -154,40 +175,59 @@
 
 int file_to_flash (int fd,u_int32_t offset,u_int32_t len,const char *filename)
 {
-   u_int8_t *buf;
+   u_int8_t *buf = NULL;
    FILE *fp;
    int err;
+   int size = len * sizeof (u_int8_t);
+   int n = len;
+
    if (offset != lseek (fd,offset,SEEK_SET))
 	 {
 		perror ("lseek()");
 		return (1);
 	 }
-   if ((buf = (u_int8_t *) malloc (len * sizeof (u_int8_t))) == NULL)
+   if ((fp = fopen (filename,"r")) == NULL)
 	 {
-		perror ("malloc()");
+		perror ("fopen()");
 		return (1);
 	 }
-   if ((fp = fopen (filename,"r")) == NULL)
+retry:
+   if ((buf = (u_int8_t *) malloc (size)) == NULL)
 	 {
-		perror ("fopen()");
-		free (buf);
+		fprintf (stderr, __FUNCTION__ ": malloc(%#x) failed\n", size);
+		if (size != BUF_SIZE) {
+			size = BUF_SIZE;
+			fprintf (stderr, __FUNCTION__ ": trying buffer size %#x\n", size);
+			goto retry;
+		}
+		perror ("malloc()");
+		fclose (fp);
 		return (1);
 	 }
-   if (fread (buf,len,1,fp) != 1 || ferror (fp))
+ do {
+   if (n <= size)
+	   size = n;
+   if (fread (buf,size,1,fp) != 1 || ferror (fp))
 	 {
+		fprintf (stderr, __FUNCTION__ ": fread, size %#x, n %#x\n", size, n);
 		perror ("fread()");
 		free (buf);
 		fclose (fp);
 		return (1);
 	 }
-   err = write (fd,buf,len);
+   err = write (fd,buf,size);
    if (err < 0)
 	 {
+		fprintf (stderr, __FUNCTION__ ": write, size %#x, n %#x\n", size, n);
 		perror ("write()");
 		free (buf);
 		fclose (fp);
 		return (1);
 	 }
+   n -= size;
+} while (n > 0);
+
+   if (buf != NULL)
    free (buf);
    fclose (fp);
    printf ("Copied %d bytes from %s to address 0x%.8x in flash\n",len,filename,offset);
@@ -386,13 +426,13 @@
 		showinfo (fd);
 		break;
 	  case OPT_READ:
-		err = flash_to_file (fd,atol (argv[3]),atol (argv[4]),argv[5]);
+		err = flash_to_file (fd,strtol (argv[3],NULL,0),strtol (argv[4],NULL,0),argv[5]);
 		break;
 	  case OPT_WRITE:
-		err = file_to_flash (fd,atol (argv[3]),atol (argv[4]),argv[5]);
+		err = file_to_flash (fd,strtol (argv[3],NULL,0),strtol (argv[4],NULL,0),argv[5]);
 		break;
 	  case OPT_ERASE:
-		err = erase_flash (fd,atol (argv[3]),atol (argv[4]));
+		err = erase_flash (fd,strtol (argv[3],NULL,0),strtol (argv[4],NULL,0));
 		break;
 	 }
 
