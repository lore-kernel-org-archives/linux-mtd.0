Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9A1C5321E
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 09:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=La796CzhgOjbviPArlxu4q4ToOcNJar6Da91jlaGcpg=; b=Zi6po2Ie86HGKQ
	IjfbNTaOZU7rbeVAOhGK0kKqoX7LDCpRXbGDdzc2j5Pc4tq57COvhlA9CqnJ6qd15aA+fSjgCgp8j
	+wp3TCk6aV/CJDFkcpWniYosto65v+2YurXsNzQ8h1kp3pHyjkKhVXL3KCLgl68ABeaqKbf1d0SBc
	oYRg2vQp+/9Sjo1sYGzmJwWFaPHxZcz9Yu+Mc++zp3LLyjc3N59NsvOR7/k+wRogDY2HFYB8usTxk
	MBfEGoX/kH+Vnc59Z2zo3GjIEvFJ9Wocn7BVF33mY/IUDtDP7H/awY2p+tVi/sy+Bwbz0LeVWTEfB
	soaSuPpe6WWyuVFsqU3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWMu-00000006lnm-220j;
	Mon, 26 Aug 2024 09:50:36 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWJ1-00000006kT9-2JpQ
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 09:46:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B5D0C000D;
	Mon, 26 Aug 2024 09:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724665594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e8A/sKUyRdSI4EHMCgzJYx3mHKtcM3NvrHTekDDwoYk=;
	b=fY+Z2qxaROODtNxmWDfN2vKA1KKUuyWX4cx8IyuaGgO70XgGz02+JLcgsCpSJOhV0ae+3V
	groT+VuT17CPjisjAToWPpjIKsUCPlGjEG/82F49BDbNBkRDIqEkEJiKWCcywyyghTIBAp
	4wx51ga+QLBPczIofe5aq8JtymVH/jzbVlfFXOfPiSdzEtkZWp9/ucLAT01tUN6N6ngVcM
	fPu2hX40zcsw1/0Qpdo59fPcyEnOhnPKDmgBalm6+4M/JbMPDlz11Je227J7vobtX8CdDo
	u7kFU49i7+V5/bKWtjkcDfeUmvaYAG/qU4mfwPHtrs1/pQHFEboenHhgNjmTtg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH mtd-utils 03/10] nand-utils: nanddump: Add support for testing continuous reads
Date: Mon, 26 Aug 2024 11:46:22 +0200
Message-ID: <20240826094629.19065-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094629.19065-1-miquel.raynal@bootlin.com>
References: <20240826094629.19065-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_024635_930896_8A5DEDFD 
X-CRM114-Status: GOOD (  18.42  )
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

In order to trigger a continuous read, the user needs to request more
than one data page. So far the tool would split the length into page
chunks. This is no longer the case when the -C option is passed (-c is
already used for the canonical output style).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 nand-utils/nanddump.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/nand-utils/nanddump.c b/nand-utils/nanddump.c
index a3e6e92..bc22858 100644
--- a/nand-utils/nanddump.c
+++ b/nand-utils/nanddump.c
@@ -54,6 +54,7 @@ static void display_help(int status)
 "-s addr    --startaddress=addr  Start address\n"
 "           --skip-bad-blocks-to-start\n"
 "                                Skip bad blocks when seeking to the start address\n"
+"-C         --continuous         Continuous read up to a block of data at a time\n"
 "\n"
 "--bb=METHOD, where METHOD can be `padbad', `dumpbad', or `skipbad':\n"
 "    padbad:  dump flash data, substituting 0xFF for any bad blocks\n"
@@ -89,6 +90,7 @@ static bool			quiet = false;		// suppress diagnostic output
 static bool			canonical = false;	// print nice + ascii
 static bool			forcebinary = false;	// force printing binary to tty
 static bool			skip_bad_blocks_to_start = false;
+static bool			continuous = false;	// leverage continuous reads
 
 static enum {
 	padbad,   // dump flash data, substituting 0xFF for any bad blocks
@@ -103,7 +105,7 @@ static void process_options(int argc, char * const argv[])
 
 	for (;;) {
 		int option_index = 0;
-		static const char short_options[] = "hs:f:l:opqncaV";
+		static const char short_options[] = "hs:f:l:opqncaVC";
 		static const struct option long_options[] = {
 			{"version", no_argument, 0, 'V'},
 			{"bb", required_argument, 0, 0},
@@ -119,6 +121,7 @@ static void process_options(int argc, char * const argv[])
 			{"length", required_argument, 0, 'l'},
 			{"noecc", no_argument, 0, 'n'},
 			{"quiet", no_argument, 0, 'q'},
+			{"continuous", no_argument, 0, 'C'},
 			{0, 0, 0, 0},
 		};
 
@@ -191,6 +194,9 @@ static void process_options(int argc, char * const argv[])
 			case 'n':
 				noecc = true;
 				break;
+			case 'C':
+				continuous = true;
+				break;
 			case 'h':
 				display_help(EXIT_SUCCESS);
 				break;
@@ -220,6 +226,13 @@ static void process_options(int argc, char * const argv[])
 		exit(EXIT_FAILURE);
 	}
 
+	if (continuous && !omitoob) {
+		fprintf(stderr, "Sequential/continuous reads (when available) will\n"
+				"always skip OOB data, so it is not possible to \n"
+				"request both at the same time.\n");
+		exit(EXIT_FAILURE);
+	}
+
 	if ((argc - optind) != 1 || error)
 		display_help(EXIT_FAILURE);
 
@@ -362,7 +375,7 @@ int main(int argc, char * const argv[])
 		return errmsg("mtd_get_dev_info failed");
 
 	/* Allocate buffers */
-	readbuf_sz = mtd.min_io_size;
+	readbuf_sz = mtd.eb_size;
 	oobbuf = xmalloc(mtd.oob_size);
 	readbuf = xmalloc(readbuf_sz);
 
@@ -428,8 +441,6 @@ int main(int argc, char * const argv[])
 	if (!length || end_addr > mtd.size)
 		end_addr = mtd.size;
 
-	bs = mtd.min_io_size;
-
 	/* Print informative message */
 	if (!quiet) {
 		fprintf(stderr, "Block size %d, page size %d, OOB size %d\n",
@@ -441,6 +452,8 @@ int main(int argc, char * const argv[])
 
 	/* Dump the flash contents */
 	for (ofs = start_addr; ofs < end_addr; ofs += bs) {
+		long long size_left = end_addr - ofs;
+
 		/* Check for bad block */
 		if (bb_method == dumpbad) {
 			badblock = 0;
@@ -454,6 +467,11 @@ int main(int argc, char * const argv[])
 			}
 		}
 
+		if (continuous)
+			bs = MIN(size_left, mtd.eb_size);
+		else
+			bs = mtd.min_io_size;
+
 		if (badblock) {
 			/* skip bad block, increase end_addr */
 			if (bb_method == skipbad) {
@@ -500,7 +518,6 @@ int main(int argc, char * const argv[])
 			}
 		} else {
 			/* Write requested length if oob is omitted */
-			long long size_left = end_addr - ofs;
 			if (omitoob && (size_left < bs))
 				err = ofd_write(ofd, readbuf, size_left);
 			else
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
