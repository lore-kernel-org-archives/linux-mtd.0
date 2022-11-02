Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4572C433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Nov 2022 22:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iyWHfDHMuAXMKH/8C7w2PfXpcJWOZ3R69L3Y/LLlJe0=; b=RCxM78QUCz5Hia
	Rrw68pjc4fyKaRHF/l0hZreCEY0hBSeRRU5W98FUxWD8dJlGrIC74Oq02YH6mVI+bAhdDaO1aKpNN
	ylUKGQjiYk0fBbxzedBNTsg5mdCqOe1+fLLkfjVehR/sGQ6q+nwgTNk1az5dce4z7WWsCw2BUv8aT
	/Me3tAhYuz4hwqX2O1ZtzhZz7L0mjjhAyKR3gu/8Q2TsGLB03SlXLtZOdlct7AydryK4gKfR5B5/1
	hInNvC/zugd3shY/eBjMOcJwGTFRA/HrAGyMOw3mYsPgsEwmtynOTZaLy+ozbJTRcw4HlId27xgEY
	y584GNywq2UeKAU81JDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqMY7-00EmDr-4l; Wed, 02 Nov 2022 22:49:31 +0000
Received: from mx0a-00105401.pphosted.com ([67.231.144.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqMXu-00Em5u-8t
	for linux-mtd@lists.infradead.org; Wed, 02 Nov 2022 22:49:21 +0000
Received: from pps.filterd (m0083135.ppops.net [127.0.0.1])
	by mx0a-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 2A2Mfivm001024;
	Wed, 2 Nov 2022 22:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=nJY97TUo3B3ZBE1sr3dSUg+gYt8ovl3o9ac8M7yVfEs=;
 b=YyO60z6I2V/WzY9UV7imV7+4erpB3dOGRaDuNfMmZGvsCvsqVy+72+BPNjlPuy9TVB1O
 665yMwWLvwwYrbc7KfOVtBuaidTYJlgvJ8ZkrlmQerDWNBJG2GFe6BJ4kNrdGfzmo3xS
 8uO8/RiKBwG5bLWgelHx5r+MwatgE3X5eoua4JBIMqB3yqdGG+BQ/nkkogcGae91Xrug
 PgzMq+3q3PZtIN8g9S12GE7T/QmPxKAt9V+YhPZSZYTogmL60Kk8Elr+tT0Y7bxf9wBu
 P5Tyjwh6mRq11BG+m9rvzPMAGb2KLkvlE6v6JO97jt9Y3GwGGvSUBmRbpHmheLBMeUzn hw== 
Received: from xnwpv37.utc.com ([167.17.239.17])
	by mx0a-00105401.pphosted.com with ESMTP id 3kktubcvs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Nov 2022 22:49:15 +0000
Received: from qusnwafe.utcapp.com (qusnwafe.utcapp.com [10.161.48.101])
	by xnwpv37.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 2A2MnE1P181933
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Nov 2022 22:49:14 GMT
Received: from ciulimr02.rockwellcollins.com ([10.172.224.19])
	by qusnwafe.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 2A2MnD7V016256
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 2 Nov 2022 22:49:14 GMT
X-Received: from kirk.rockwellcollins.lab (kirk.rockwellcollins.lab [10.148.204.208])
	by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 9C04820095;
	Wed,  2 Nov 2022 17:49:13 -0500 (CDT)
From: Brandon Maier <brandon.maier@collins.com>
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
        Brandon Maier <brandon.maier@collins.com>
Subject: [PATCH mtd-utils 4/7] misc-utils: flashcp: simplify logging
Date: Wed,  2 Nov 2022 17:47:54 -0500
Message-Id: <20221102224757.58012-5-brandon.maier@collins.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102224757.58012-1-brandon.maier@collins.com>
References: <20221102224757.58012-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: tk5ZI51amNJ2lQY272styvKic9Rco-0X
X-Proofpoint-GUID: tk5ZI51amNJ2lQY272styvKic9Rco-0X
X-Proofpoint-Spam-Details: rule=outbound_default_notspam policy=outbound_default score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211020151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_154918_376822_512509D4 
X-CRM114-Status: GOOD (  29.85  )
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

Most of the uses of log_printf fall into two styles

> if (flags & FLAG_VERBOSE)
>     log_printf(LOG_NORMAL, ...);

or

> log_printf(LOG_ERROR, ...)
> exit(EXIT_FAILURE);

Replace them with log_verbose and log_failure respectively.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 misc-utils/flashcp.c | 173 +++++++++++++++++++------------------------
 1 file changed, 77 insertions(+), 96 deletions(-)

diff --git a/misc-utils/flashcp.c b/misc-utils/flashcp.c
index 8cb0dbb..9e669b4 100644
--- a/misc-utils/flashcp.c
+++ b/misc-utils/flashcp.c
@@ -48,7 +48,7 @@
 /* for debugging purposes only */
 #ifdef DEBUG
 #undef DEBUG
-#define DEBUG(fmt,args...) { log_printf (LOG_ERROR,"%d: ",__LINE__); log_printf (LOG_ERROR,fmt,## args); }
+#define DEBUG(fmt,args...) { fprintf (stderr,"%d: ",__LINE__); fprintf (stderr,fmt,## args); }
 #else
 #undef DEBUG
 #define DEBUG(fmt,args...)
@@ -62,7 +62,6 @@
 
 /* cmd-line flags */
 #define FLAG_NONE		0x00
-#define FLAG_VERBOSE	0x01
 #define FLAG_HELP		0x02
 #define FLAG_FILENAME	0x04
 #define FLAG_DEVICE		0x08
@@ -73,21 +72,34 @@
 #define LOG_NORMAL	1
 #define LOG_ERROR	2
 
-static void log_printf (int level,const char *fmt, ...)
+static NORETURN void log_failure (const char *fmt, ...)
 {
-	FILE *fp = level == LOG_NORMAL ? stdout : stderr;
 	va_list ap;
 	va_start (ap,fmt);
-	vfprintf (fp,fmt,ap);
+	vfprintf (stderr,fmt,ap);
 	va_end (ap);
-	fflush (fp);
+	fflush (stderr);
+
+	exit (EXIT_FAILURE);
 }
 
-static NORETURN void showusage(bool error)
+static int verbose = 0;
+static void log_verbose (const char *fmt, ...)
 {
-	int level = error ? LOG_ERROR : LOG_NORMAL;
+	va_list ap;
 
-	log_printf (level,
+	if (!verbose)
+		return;
+
+	va_start (ap,fmt);
+	vfprintf (stdout,fmt,ap);
+	va_end (ap);
+	fflush (stdout);
+}
+
+static NORETURN void showusage(bool error)
+{
+	fprintf (error ? stderr : stdout,
 			"\n"
 			"Flash Copy - Written by Abraham van der Merwe <abraham@2d3d.co.za>\n"
 			"\n"
@@ -110,44 +122,42 @@ static NORETURN void showusage(bool error)
 
 static int safe_open (const char *pathname,int flags)
 {
+	const char *access = "unknown";
 	int fd;
 
 	fd = open (pathname,flags);
 	if (fd < 0)
 	{
-		log_printf (LOG_ERROR,"While trying to open %s",pathname);
 		if (flags & O_RDWR)
-			log_printf (LOG_ERROR," for read/write access");
+			access = "read/write";
 		else if (flags & O_RDONLY)
-			log_printf (LOG_ERROR," for read access");
+			access = "read";
 		else if (flags & O_WRONLY)
-			log_printf (LOG_ERROR," for write access");
-		log_printf (LOG_ERROR,": %m\n");
-		exit (EXIT_FAILURE);
+			access = "write";
+
+		log_failure ("While trying to open %s for %s access: %m\n",pathname,access);
 	}
 
 	return (fd);
 }
 
-static void safe_read (int fd,const char *filename,void *buf,size_t count,bool verbose)
+static void safe_read (int fd,const char *filename,void *buf,size_t count)
 {
 	ssize_t result;
 
 	result = read (fd,buf,count);
 	if (count != result)
 	{
-		if (verbose) log_printf (LOG_NORMAL,"\n");
+		log_verbose ("\n");
 		if (result < 0)
 		{
-			log_printf (LOG_ERROR,"While reading data from %s: %m\n",filename);
-			exit (EXIT_FAILURE);
+			log_failure("While reading data from %s: %m\n",filename);
 		}
-		log_printf (LOG_ERROR,"Short read count returned while reading from %s\n",filename);
-		exit (EXIT_FAILURE);
+		log_failure("Short read count returned while reading from %s\n",filename);
 	}
 }
 
-static void safe_write (int fd,const void *buf,size_t count,size_t written,unsigned long long to_write,const char *device,bool verbose)
+static void safe_write (int fd,const void *buf,size_t count,size_t written,unsigned long long to_write,const char *device)
 {
 	ssize_t result;
 
@@ -155,18 +165,14 @@ static void safe_write (int fd,const void *buf,size_t count,size_t written,unsig
 	result = write (fd,buf,count);
 	if (count != result)
 	{
-		if (verbose) log_printf (LOG_NORMAL,"\n");
+		log_verbose ("\n");
 		if (result < 0)
 		{
-			log_printf (LOG_ERROR,
-					"While writing data to 0x%.8lx-0x%.8lx on %s: %m\n",
+			log_failure("While writing data to 0x%.8lx-0x%.8lx on %s: %m\n",
 					written,written + count,device);
-			exit (EXIT_FAILURE);
 		}
-		log_printf (LOG_ERROR,
-				"Short write count returned while writing to x%.8zx-0x%.8zx on %s: %zu/%llu bytes written to flash\n",
+		log_failure("Short write count returned while writing to x%.8zx-0x%.8zx on %s: %zu/%llu bytes written to flash\n",
 				written,written + count,device,written + result,to_write);
-		exit (EXIT_FAILURE);
 	}
 }
 
@@ -177,8 +183,7 @@ static off_t safe_lseek (int fd,off_t offset,int whence,const char *filename)
 	off = lseek (fd,offset,whence);
 	if (off < 0)
 	{
-		log_printf (LOG_ERROR,"While seeking on %s: %m\n",filename);
-		exit (EXIT_FAILURE);
+		log_failure("While seeking on %s: %m\n",filename);
 	}
 
 	return off;
@@ -189,15 +194,13 @@ static void safe_rewind (int fd,const char *filename)
 	safe_lseek(fd,0L,SEEK_SET,filename);
 }
 
-static void safe_memerase (int fd,const char *device,struct erase_info_user *erase,bool verbose)
+static void safe_memerase (int fd,const char *device,struct erase_info_user *erase)
 {
 	if (ioctl (fd,MEMERASE,erase) < 0)
 	{
-		if (verbose) log_printf (LOG_NORMAL,"\n");
-		log_printf (LOG_ERROR,
-				"While erasing blocks 0x%.8x-0x%.8x on %s: %m\n",
+		log_verbose ("\n");
+		log_failure("While erasing blocks 0x%.8x-0x%.8x on %s: %m\n",
 				(unsigned int) erase->start,(unsigned int) (erase->start + erase->length),device);
-		exit (EXIT_FAILURE);
 	}
 }
 
@@ -250,7 +253,7 @@ int main (int argc,char *argv[])
 				DEBUG("Got FLAG_HELP\n");
 				break;
 			case 'v':
-				flags |= FLAG_VERBOSE;
+				verbose = 1;
 				DEBUG("Got FLAG_VERBOSE\n");
 				break;
 			case 'p':
@@ -290,24 +293,17 @@ int main (int argc,char *argv[])
 	if (ioctl (dev_fd,MEMGETINFO,&mtd) < 0)
 	{
 		DEBUG("ioctl(): %m\n");
-		log_printf (LOG_ERROR,"This doesn't seem to be a valid MTD flash device!\n");
-		exit (EXIT_FAILURE);
+		log_failure("This doesn't seem to be a valid MTD flash device!\n");
 	}
 
 	/* get some info about the file we want to copy */
 	fil_fd = safe_open (filename,O_RDONLY);
 	if (fstat (fil_fd,&filestat) < 0)
-	{
-		log_printf (LOG_ERROR,"While trying to get the file status of %s: %m\n",filename);
-		exit (EXIT_FAILURE);
-	}
+		log_failure("While trying to get the file status of %s: %m\n",filename);
 
 	/* does it fit into the device/partition? */
 	if (filestat.st_size > mtd.size)
-	{
-		log_printf (LOG_ERROR,"%s won't fit into %s!\n",filename,device);
-		exit (EXIT_FAILURE);
-	}
+		log_failure("%s won't fit into %s!\n",filename,device);
 
 	/* diff block flashcp */
 	if (flags & FLAG_PARTITION)
@@ -333,24 +329,24 @@ int main (int argc,char *argv[])
 		erase.length *= mtd.erasesize;
 	}
 
-	if (flags & FLAG_VERBOSE)
+	if (verbose)
 	{
 		/* if the user wants verbose output, erase 1 block at a time and show him/her what's going on */
 		int blocks = erase.length / mtd.erasesize;
 		erase.length = mtd.erasesize;
-		log_printf (LOG_NORMAL,"Erasing blocks: 0/%d (0%%)",blocks);
+		log_verbose ("Erasing blocks: 0/%d (0%%)",blocks);
 		for (i = 1; i <= blocks; i++)
 		{
-			log_printf (LOG_NORMAL,"\rErasing blocks: %d/%d (%d%%)",i,blocks,PERCENTAGE (i,blocks));
-			safe_memerase(dev_fd,device,&erase,flags & FLAG_VERBOSE);
+			log_verbose ("\rErasing blocks: %d/%d (%d%%)",i,blocks,PERCENTAGE (i,blocks));
+			safe_memerase(dev_fd,device,&erase);
 			erase.start += mtd.erasesize;
 		}
-		log_printf (LOG_NORMAL,"\rErasing blocks: %d/%d (100%%)\n",blocks,blocks);
+		log_verbose ("\rErasing blocks: %d/%d (100%%)\n",blocks,blocks);
 	}
 	else
 	{
 		/* if not, erase the whole chunk in one shot */
-		safe_memerase(dev_fd,device,&erase,flags & FLAG_VERBOSE);
+		safe_memerase(dev_fd,device,&erase);
 	}
 	DEBUG("Erased %u / %luk bytes\n",erase.length,filestat.st_size);
 
@@ -358,33 +354,30 @@ int main (int argc,char *argv[])
 	 * write the entire file to flash *
 	 **********************************/
 
-	if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"Writing data: 0k/%lluk (0%%)",KB ((unsigned long long)filestat.st_size));
+	log_verbose ("Writing data: 0k/%lluk (0%%)",KB ((unsigned long long)filestat.st_size));
 	size = filestat.st_size;
 	i = BUFSIZE;
 	written = 0;
 	while (size)
 	{
 		if (size < BUFSIZE) i = size;
-		if (flags & FLAG_VERBOSE)
-			log_printf (LOG_NORMAL,"\rWriting data: %dk/%lluk (%llu%%)",
-					KB (written + i),
-					KB ((unsigned long long)filestat.st_size),
-					PERCENTAGE (written + i,(unsigned long long)filestat.st_size));
+		log_verbose ("\rWriting data: %dk/%lluk (%llu%%)",
+				KB (written + i),
+				KB ((unsigned long long)filestat.st_size),
+				PERCENTAGE (written + i,(unsigned long long)filestat.st_size));
 
 		/* read from filename */
-		safe_read (fil_fd,filename,src,i,flags & FLAG_VERBOSE);
+		safe_read (fil_fd,filename,src,i);
 
 		/* write to device */
-		safe_write(dev_fd,src,i,written,(unsigned long long)filestat.st_size,device,flags & FLAG_VERBOSE);
+		safe_write(dev_fd,src,i,written,(unsigned long long)filestat.st_size,device);
 
 		written += i;
 		size -= i;
 	}
-	if (flags & FLAG_VERBOSE)
-		log_printf (LOG_NORMAL,
-				"\rWriting data: %lluk/%lluk (100%%)\n",
-				KB ((unsigned long long)filestat.st_size),
-				KB ((unsigned long long)filestat.st_size));
+	log_verbose ("\rWriting data: %lluk/%lluk (100%%)\n",
+			KB ((unsigned long long)filestat.st_size),
+			KB ((unsigned long long)filestat.st_size));
 	DEBUG("Wrote %d / %lluk bytes\n",written,(unsigned long long)filestat.st_size);
 
 	/**********************************
@@ -396,40 +389,32 @@ int main (int argc,char *argv[])
 	size = filestat.st_size;
 	i = BUFSIZE;
 	written = 0;
-	if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL,"Verifying data: 0k/%lluk (0%%)",KB ((unsigned long long)filestat.st_size));
+	log_verbose ("Verifying data: 0k/%lluk (0%%)",KB ((unsigned long long)filestat.st_size));
 	while (size)
 	{
 		if (size < BUFSIZE) i = size;
-		if (flags & FLAG_VERBOSE)
-			log_printf (LOG_NORMAL,
-					"\rVerifying data: %luk/%lluk (%llu%%)",
-					KB (written + i),
-					KB ((unsigned long long)filestat.st_size),
-					PERCENTAGE (written + i,(unsigned long long)filestat.st_size));
+		log_verbose ("\rVerifying data: %luk/%lluk (%llu%%)",
+				KB (written + i),
+				KB ((unsigned long long)filestat.st_size),
+				PERCENTAGE (written + i,(unsigned long long)filestat.st_size));
 
 		/* read from filename */
-		safe_read (fil_fd,filename,src,i,flags & FLAG_VERBOSE);
+		safe_read (fil_fd,filename,src,i);
 
 		/* read from device */
-		safe_read (dev_fd,device,dest,i,flags & FLAG_VERBOSE);
+		safe_read (dev_fd,device,dest,i);
 
 		/* compare buffers */
 		if (memcmp (src,dest,i))
-		{
-			log_printf (LOG_ERROR,
-					"File does not seem to match flash data. First mismatch at 0x%.8zx-0x%.8zx\n",
+			log_failure("File does not seem to match flash data. First mismatch at 0x%.8zx-0x%.8zx\n",
 					written,written + i);
-			exit (EXIT_FAILURE);
-		}
 
 		written += i;
 		size -= i;
 	}
-	if (flags & FLAG_VERBOSE)
-		log_printf (LOG_NORMAL,
-				"\rVerifying data: %lluk/%lluk (100%%)\n",
-				KB ((unsigned long long)filestat.st_size),
-				KB ((unsigned long long)filestat.st_size));
+	log_verbose ("\rVerifying data: %lluk/%lluk (100%%)\n",
+			KB ((unsigned long long)filestat.st_size),
+			KB ((unsigned long long)filestat.st_size));
 	DEBUG("Verified %d / %lluk bytes\n",written,(unsigned long long)filestat.st_size);
 
 	exit (EXIT_SUCCESS);
@@ -451,22 +436,18 @@ DIFF_BLOCKS:
 	int blocks = erase.length / mtd.erasesize;
 	erase.length = mtd.erasesize;
 
-	if (flags & FLAG_VERBOSE)
-		log_printf (LOG_NORMAL,
-				"\rProcessing blocks: 0/%d (%d%%)", blocks, PERCENTAGE (0,blocks));
+	log_verbose ("\rProcessing blocks: 0/%d (%d%%)", blocks, PERCENTAGE (0,blocks));
 	for (int s = 1; s <= blocks; s++)
 	{
 		if (size < mtd.erasesize) i = size;
-		if (flags & FLAG_VERBOSE)
-			log_printf (LOG_NORMAL,
-					"\rProcessing blocks: %d/%d (%d%%)", s, blocks, PERCENTAGE (s,blocks));
+		log_verbose ("\rProcessing blocks: %d/%d (%d%%)", s, blocks, PERCENTAGE (s,blocks));
 
 		/* read from filename */
-		safe_read (fil_fd,filename,src,i,flags & FLAG_VERBOSE);
+		safe_read (fil_fd,filename,src,i);
 
 		/* read from device */
 		current_dev_block = safe_lseek(dev_fd, 0, SEEK_CUR, device);
-		safe_read (dev_fd,device,dest,i,flags & FLAG_VERBOSE);
+		safe_read (dev_fd,device,dest,i);
 
 		/* compare buffers, if not the same, erase and write the block */
 		if (memcmp (src,dest,i))
@@ -474,11 +455,11 @@ DIFF_BLOCKS:
 			diffBlock++;
 			/* erase block */
 			safe_lseek(dev_fd, current_dev_block, SEEK_SET, device);
-			safe_memerase(dev_fd,device,&erase,flags & FLAG_VERBOSE);
+			safe_memerase(dev_fd,device,&erase);
 
 			/* write to device */
 			safe_lseek(dev_fd, current_dev_block, SEEK_SET, device);
-			safe_write(dev_fd,src,i,written,(unsigned long long)filestat.st_size,device,flags & FLAG_VERBOSE);
+			safe_write(dev_fd,src,i,written,(unsigned long long)filestat.st_size,device);
 		}
 
 		erase.start += i;
@@ -486,7 +467,7 @@ DIFF_BLOCKS:
 		size -= i;
 	}
 
-	if (flags & FLAG_VERBOSE) log_printf (LOG_NORMAL, "\ndiff blocks: %d\n", diffBlock);
+	log_verbose ("\ndiff blocks: %d\n", diffBlock);
 
 	exit (EXIT_SUCCESS);
 }
-- 
2.38.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
