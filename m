Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9F7CA0FE1
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Sep 2023 00:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:Subject:Mime-Version
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JTLMcbwbNjH9R66To2aK66diieYYFpVVz6sm/mPIuVs=; b=qG7PrYUmjUdWAU
	jNzHe4cTTJ/s4Dt+VgBu11DWFg3ykPowfCBPwo0teCpTZULUzBBpnl4ALd037VWSS8O+T8uxQa06n
	SdSaVG0+AL4r0PjWKZ4Bwv5+071RgepHyzaJLFMsxlrSx62VjVuaRjL1su3DXQJoJlKOG0pPbjq7f
	mEImnt2t77bs9gxvisFQrn9mYlLe6dZngLCYyfeq4PhfwIpn6l1lSawJVBsjvjW66ACxlSINAjS9S
	PuzWDmPWkYZbkfB4Az6uR3JOZDOAVqe/YzLlncbtg6PH2q0aDLl2hUtjN34rf3NJDeUiOKKYRqsLr
	5QG15O+7RI2dMU62EhOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbsRX-00G90a-3C;
	Fri, 01 Sep 2023 00:55:24 +0000
Received: from repl.esden.net ([176.9.151.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbsRU-00G8yD-08
	for linux-mtd@lists.infradead.org;
	Fri, 01 Sep 2023 00:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=esden.net;
	s=202007170; h=To:Date:Message-Id:Subject:Mime-Version:
	Content-Transfer-Encoding:Content-Type:From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FzZq8J7y1++a8GOHENrGDS3sEA4GxOjLepFplSCgJEE=; b=vsMGtDQ2EArOEnbxiVTK9Q4ko4
	nZMDN49Ws5zbcPK1N828kW8s/K7BUng6KAd44U+XG3Ok07PzoAmsSVSB7yL6xWejmB6Hh9J6DXD7Y
	/CoT6JDomDTeglDxUBmUFcXdW5Rx+tW0jAFFn2dneEOZD3YUkLa/dD1oloiCyY0W7OK8itfTHbszT
	fYs8BVJClW1a1BCGQVkJITavdVb0ttxMmwfyLVVGavrDE5VND9AuAI/pC1sL3pvvv7VdhIFUe9Pq2
	a+zXnNnfkDhZzY1mV2Wm1Pd/te4RTNMZ0bzbHHp8hl/AEiFzPrZ6eEKvgdbGxpippNBND5dMPNm0l
	mvxyDWFg==;
Received: from c-73-240-60-215.hsd1.or.comcast.net ([73.240.60.215] helo=smtpclient.apple)
	by repl.esden.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <piotr@esden.net>)
	id 1qbsRP-009uzb-1l
	for linux-mtd@lists.infradead.org;
	Fri, 01 Sep 2023 02:55:15 +0200
From: Piotr Esden-Tempski <piotr@esden.net>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: [PATCH] flashcp: Add write last option.
Message-Id: <BF77DED8-F817-4BDE-A668-4F8AD46A2836@esden.net>
Date: Thu, 31 Aug 2023 17:55:03 -0700
To: linux-mtd@lists.infradead.org
X-Mailer: Apple Mail (2.3731.600.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_175520_130952_51BB54D6 
X-CRM114-Status: GOOD (  17.36  )
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

This option is useful for power fail resilient bootloader updates, for
systems that check only the partition header for validity before
attempting to load the bootloader. For example zynq.

Postponing the write of a specified amount of bytes at the beginning of
a bootloader makes sure a written bootloader slot is not considered
valid until all the data is written.
---
 misc-utils/flashcp.c | 69 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 59 insertions(+), 10 deletions(-)

diff --git a/misc-utils/flashcp.c b/misc-utils/flashcp.c
index e1be292..9c48637 100644
--- a/misc-utils/flashcp.c
+++ b/misc-utils/flashcp.c
@@ -64,6 +64,7 @@
 #define FLAG_DEVICE		0x08
 #define FLAG_ERASE_ALL	0x10
 #define FLAG_PARTITION	0x20
+#define FLAG_WR_LAST	0x40
 
 /* error levels */
 #define LOG_NORMAL	1
@@ -104,13 +105,14 @@ static NORETURN void showusage(bool error)
 			"       %1$s -h | --help\n"
 			"       %1$s -V | --version\n"
 			"\n"
-			"   -h | --help      Show this help message\n"
-			"   -v | --verbose   Show progress reports\n"
-			"   -p | --partition Only copy different block from file to device\n"
-			"   -A | --erase-all Erases the whole device regardless of the image size\n"
-			"   -V | --version   Show version information and exit\n"
-			"   <filename>       File which you want to copy to flash\n"
-			"   <device>         Flash device node or 'mtd:<name>' to write to (e.g. /dev/mtd0, /dev/mtd1, mtd:data, etc.)\n"
+			"   -h | --help           Show this help message\n"
+			"   -v | --verbose        Show progress reports\n"
+			"   -p | --partition      Only copy different block from file to device\n"
+			"   -A | --erase-all      Erases the whole device regardless of the image size\n"
+			"   -l | --wr-last=bytes  Write the first [bytes] last\n"
+			"   -V | --version        Show version information and exit\n"
+			"   <filename>            File which you want to copy to flash\n"
+			"   <device>              Flash device node or 'mtd:<name>' to write to (e.g. /dev/mtd0, /dev/mtd1, mtd:data, etc.)\n"
 			"\n",
 			PROGRAM_NAME);
 
@@ -219,7 +221,9 @@ int main (int argc,char *argv[])
 	struct mtd_info_user mtd;
 	struct erase_info_user erase;
 	struct stat filestat;
-	unsigned char *src,*dest;
+	unsigned char *src,*dest,*wrlast_buf;
+	unsigned long long wrlast_len = 0;
+	int error = 0;
 
 	/*********************
 	 * parse cmd-line
@@ -227,12 +231,13 @@ int main (int argc,char *argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "hvpAV";
+		static const char *short_options = "hvpAl:V";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 'h'},
 			{"verbose", no_argument, 0, 'v'},
 			{"partition", no_argument, 0, 'p'},
 			{"erase-all", no_argument, 0, 'A'},
+			{"wr-last", required_argument, 0, 'l'},
 			{"version", no_argument, 0, 'V'},
 			{0, 0, 0, 0},
 		};
@@ -260,6 +265,10 @@ int main (int argc,char *argv[])
 				flags |= FLAG_ERASE_ALL;
 				DEBUG("Got FLAG_ERASE_ALL\n");
 				break;
+			case 'l':
+				flags |= FLAG_WR_LAST;
+				wrlast_len = simple_strtoll(optarg, &error);
+				break;
 			case 'V':
 				common_print_version();
 				exit(EXIT_SUCCESS);
@@ -288,6 +297,10 @@ int main (int argc,char *argv[])
 	if (flags & FLAG_PARTITION && flags & FLAG_ERASE_ALL)
 		log_failure("Option --partition does not support --erase-all\n");
 
+	if (flags & FLAG_PARTITION && flags & FLAG_WR_LAST) {
+		log_failure("Option --partition does not support --wr-last\n");
+	}
+
 	atexit (cleanup);
 
 	/* get some info about the flash device */
@@ -364,10 +377,40 @@ int main (int argc,char *argv[])
 	 * write the entire file to flash *
 	 **********************************/
 
-	log_verbose ("Writing data: 0k/%lluk (0%%)",KB ((unsigned long long)filestat.st_size));
 	size = filestat.st_size;
 	i = mtd.erasesize;
 	written = 0;
+
+	if ((flags & FLAG_WR_LAST) && (filestat.st_size > wrlast_len)) {
+		if (wrlast_len > mtd.erasesize)
+			log_failure("The wrlast (%lluk) is larger than erasesize (%lluk)\n", KB (wrlast_len), KB ((unsigned long long)mtd.erasesize));
+
+		if (size < mtd.erasesize) i = size;
+
+		log_verbose ("Reading %lluk of data to write last.\n", KB ((unsigned long long)wrlast_len));
+		wrlast_buf = malloc(wrlast_len);
+		if (!wrlast_buf)
+			log_failure("Malloc failed");
+		safe_read (fil_fd, filename, wrlast_buf, wrlast_len);
+		safe_lseek(dev_fd, wrlast_len, SEEK_SET, device);
+		written += wrlast_len;
+		size -= wrlast_len;
+		i -= wrlast_len;
+
+		log_verbose ("Writing remaining erase block data: %dk/%lluk (%llu%%)\n",
+				KB (written + i),
+				KB ((unsigned long long)filestat.st_size),
+				PERCENTAGE ((unsigned long long)written + i, (unsigned long long)filestat.st_size));
+		safe_read (fil_fd, filename, src, i);
+		safe_write(dev_fd, src, i, written, (unsigned long long)filestat.st_size, device);
+
+		written += i;
+		size -= i;
+		i = mtd.erasesize;
+	} else {
+		log_verbose ("Writing data: 0k/%lluk (0%%)",KB ((unsigned long long)filestat.st_size));
+	}
+
 	while (size)
 	{
 		if (size < mtd.erasesize) i = size;
@@ -390,6 +433,12 @@ int main (int argc,char *argv[])
 			KB ((unsigned long long)filestat.st_size));
 	DEBUG("Wrote %d / %lluk bytes\n",written,(unsigned long long)filestat.st_size);
 
+	if ((flags & FLAG_WR_LAST) && (filestat.st_size > wrlast_len)) {
+		log_verbose ("Writing %lluk of the write last data.\n", KB ((unsigned long long)wrlast_len));
+		safe_rewind (dev_fd, device);
+		safe_write(dev_fd, wrlast_buf, wrlast_len, 0, wrlast_len, device);
+	}
+
 	/**********************************
 	 * verify that flash == file data *
 	 **********************************/
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
