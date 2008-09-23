Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Ki5zQ-0006Zn-Ju
	for linux-mtd@lists.infradead.org; Tue, 23 Sep 2008 11:23:33 +0000
Received: from epmmp1 (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0K7N000E2BN23Y@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 23 Sep 2008 20:23:26 +0900 (KST)
Received: from apgmoorthy ([107.108.214.61])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0K7N00JC1BMZ55@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Tue, 23 Sep 2008 20:23:26 +0900 (KST)
Date: Tue, 23 Sep 2008 16:55:50 +0530
From: apgmoorthy <moorthy.apg@samsung.com>
Subject: RE: [PATCH] [MTD-UTILS] Add support for 4KB page flash devices
In-reply-to: <9c9fda240809212322h4d9ac26eqfd7c3cfb9630c97b@mail.gmail.com>
To: 'Kyungmin Park' <kmpark@infradead.org>
Message-id: <000001c91d6f$238a6ea0$3dd66c6b@sisodomain.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
References: <33142758.53091221828088797.JavaMail.weblogic@epml16>
	<9c9fda240809212322h4d9ac26eqfd7c3cfb9630c97b@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

     I find not much issue with that, but still as a fair practice , I'll
absorb your comment in the patch. Have done the memory allocation later in
the function to avoid unnecessary freeing code. 
     And malloced with mtdInfo.writesize instead of constants , let us know
your comments. 

We can now use these utilities on 4KB devices.

Signed-off-by: Rohit Hagargundgi <h.rohit@samsung.com>
---
--- a/flashcp.c	2008-09-23 15:36:26.000000000 +0530
+++ b/flashcp.c	2008-09-23 15:49:42.000000000 +0530
@@ -61,7 +61,7 @@ typedef int bool;
 #define PERCENTAGE(x,total) (((x) * 100) / (total))
 
 /* size of read/write buffer */
-#define BUFSIZE (10 * 1024)
+#define BUFSIZE (10 * 4096)
 
 /* cmd-line flags */
 #define FLAG_NONE		0x00
--- a/flash_otp_write.c	2008-09-23 15:36:26.000000000 +0530
+++ b/flash_otp_write.c	2008-09-23 16:45:01.000000000 +0530
@@ -18,7 +18,7 @@ int main(int argc,char *argv[])
 	int fd, val, ret, size, wrote, len;
 	mtd_info_t mtdInfo;
 	off_t offset;
-	char *p, buf[2048];
+	char *p, *buf;
 
 	if (argc != 4 || strcmp(argv[1], "-u")) {
 		fprintf(stderr, "Usage: %s -u <device> <offset>\n",
argv[0]);
@@ -64,9 +64,16 @@ int main(int argc,char *argv[])
 		len = 256;
 
 	wrote = 0;
+
+	buf = (char *)malloc(mtdInfo.writesize);
+	if (!buf) {
+		return -ENOMEM;
+	}
+
 	while ((size = read(0, buf, len))) {
 		if (size < 0) {
 			perror("read()");
+			free(buf);
 			return errno;
 		}
 		p = buf;
@@ -79,10 +86,12 @@ int main(int argc,char *argv[])
 			ret = write(fd, p, size);
 			if (ret < 0) {
 				perror("write()");
+				free(buf);
 				return errno;
 			}
 			if (ret == 0) {
 				printf("write() returned 0 after writing %d
bytes\n", wrote);
+				free(buf);
 				return 0;
 			}
 			p += ret;
@@ -92,5 +101,6 @@ int main(int argc,char *argv[])
 	}
 
 	printf("Wrote %d bytes of OTP user data\n", wrote);
+	free(buf);
 	return 0;
 }
--- a/include/mtd/mtd-abi.h	2008-09-23 15:36:26.000000000 +0530
+++ b/include/mtd/mtd-abi.h	2008-09-23 15:48:48.000000000 +0530
@@ -104,7 +104,7 @@ struct nand_oobinfo {
 	uint32_t useecc;
 	uint32_t eccbytes;
 	uint32_t oobfree[8][2];
-	uint32_t eccpos[32];
+	uint32_t eccpos[128];
 };
 
 struct nand_oobfree {
@@ -119,7 +119,7 @@ struct nand_oobfree {
  */
 struct nand_ecclayout {
 	uint32_t eccbytes;
-	uint32_t eccpos[64];
+	uint32_t eccpos[128];
 	uint32_t oobavail;
 	struct nand_oobfree oobfree[MTD_MAX_OOBFREE_ENTRIES];
 };





-----Original Message-----
From: kyungmin78@gmail.com [mailto:kyungmin78@gmail.com] On Behalf Of
Kyungmin Park
Sent: Monday, September 22, 2008 11:53 AM
To: moorthy.apg@samsung.com
Cc: linux-mtd@lists.infradead.org; David.Woodhouse@intel.com
Subject: Re: [PATCH] [MTD-UTILS] Add support for 4KB page flash devices

Hi,

On Fri, Sep 19, 2008 at 9:41 PM, AYYANARPONNUSAMY GANGHEYAMOORTHY
<moorthy.apg@samsung.com> wrote:
> We can now use these utilities on 4KB devices.
>
> Signed-off-by: Rohit Hagargundgi <h.rohit@samsung.com>
> ---
> --- a/flash_otp_write.c 2008-06-27 21:51:28.000000000 +0530
> +++ b/flash_otp_write.c 2008-07-01 16:04:12.000000000 +0530
> @@ -18,7 +18,7 @@ int main(int argc,char *argv[])
>        int fd, val, ret, size, wrote, len;
>        mtd_info_t mtdInfo;
>        off_t offset;
> -       char *p, buf[2048];
> +       char *p, buf[4096];
>

Is it no problem the stack overflow in application?
How about to use malloc & free?

Thank you,
Kyungmin Park
