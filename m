Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD88FC5321D
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 09:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+k51H2nQQEsJLsKCnThn01cWvK8n0JC/7OBzHg6+Mw=; b=lcsfAgJSJks62X
	tK0+8q12ZwmuYPgIYZ0rimHNjFaH/KqT0UbuGCJb64EpXR+c0n/w8QOwYN6KWLk5r3XFxrNxtKbPq
	yAXMRhsnCBd7q1g1n1ALPOGw/vM4ZsbIwy0V9bQxXVAPBe+AoCfE3mnS+xvap5IPVqBJ3cJaXxmiM
	VZRTvepnan4z/1wE20unYkzt/mb+OdbzueAD+FKctTlR02HOZ3Akt8M7FGmwEGbMfBNQLn4FHF6Gk
	ns2D5Mlv9ZEGAVYtZCF/fM33Yhyr5nmz3zUq0KjQTK4gXnFwhcjtJj7FChI9mkuoW62OSLof8P5n3
	PWly4EjornafBodSz3SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWMy-00000006lqJ-3iK6;
	Mon, 26 Aug 2024 09:50:40 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWJ2-00000006kUC-39w4
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 09:46:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C25CCC0003;
	Mon, 26 Aug 2024 09:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724665595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3icL4Coc8j893m5dgM4GCJWuzuAM/PMefbuGA42BRD8=;
	b=MW78lL2TxJ2SwgfhqhMooC5Nxay57YXEas4YcuWlM/uwKj2vkJEnoGaBV1vcRUT/MfVLAg
	8L6LDFpS9P/Hvj/e100fP4mN00L+1Zu7sIDREILiMODIPKmuTO1VsPlfs2ZVHGSThKUm6h
	CLrQgCdDbnXTEh49vjlY1c3BbE+45iM4c53pGoygaWMG3ZiZYmpZbs0PevTgVlEUeytJsy
	eDcWUoKUtEeBI2j3URoxzefpe1Ao4rez+mVg9586BQGQfCgKVvOzQpmtGx/lAm4tH97q0g
	JJ7ick5PIfLvtc4vARM2wnT4GR7lVkhPnzt8Ed346T4fNzz7zJb6GGQ2ozravA==
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
Subject: [PATCH mtd-utils 05/10] mtd-tests: nandbiterrs: Add support for testing continuous reads
Date: Mon, 26 Aug 2024 11:46:24 +0200
Message-ID: <20240826094629.19065-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094629.19065-1-miquel.raynal@bootlin.com>
References: <20240826094629.19065-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_024637_258041_9F1AFEDF 
X-CRM114-Status: GOOD (  15.13  )
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

In order to trigger a continuous read, the user needs to request at
least two pages at the same time. So far the tool would only read single
pages, so let's extend its capabilities to test continuous read output
when the -c option is passed.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 tests/mtd-tests/nandbiterrs.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/tests/mtd-tests/nandbiterrs.c b/tests/mtd-tests/nandbiterrs.c
index 30954f5..424a95f 100644
--- a/tests/mtd-tests/nandbiterrs.c
+++ b/tests/mtd-tests/nandbiterrs.c
@@ -63,6 +63,7 @@
 #define MODE_INCREMENTAL 0x02
 #define MODE_OVERWRITE 0x04
 #define PAGE_ERASED 0x08
+#define CONTINUOUS_READ 0x10
 
 static int peb = -1, page = -1, max_overwrite = -1, seed = -1;
 static const char *mtddev;
@@ -81,6 +82,7 @@ static const struct option options[] = {
 	{ "erased", no_argument, NULL, 'e' },
 	{ "writes", required_argument, NULL, 'w' },
 	{ "incremental", no_argument, NULL, 'i' },
+	{ "continuous", no_argument, NULL, 'c' },
 	{ "overwrite", no_argument, NULL, 'o' },
 	{ NULL, 0, NULL, 0 },
 };
@@ -95,7 +97,8 @@ static NORETURN void usage(int status)
 	"  -b, --peb <num>     Use this physical erase block\n"
 	"  -p, --page <num>    Use this page within the erase block\n"
 	"  -s, --seed <num>    Specify seed for PRNG\n"
-	"  -e, --erased        Test erased pages instead of written pages\n\n"
+	"  -e, --erased        Test erased pages instead of written pages\n"
+	"  -c, --continuous    Use two consecutive pages (incremental test only)\n\n"
 	"Options controling test mode:\n"
 	"  -i, --incremental   Manually insert bit errors until ECC fails\n"
 	"  -o, --overwrite     Rewrite page until bits flip and ECC fails\n\n"
@@ -124,7 +127,7 @@ static void process_options(int argc, char **argv)
 	int c;
 
 	while (1) {
-		c = getopt_long(argc, argv, "hkb:p:s:eiow:", options, NULL);
+		c = getopt_long(argc, argv, "hkb:p:s:eiow:c", options, NULL);
 		if (c == -1)
 			break;
 
@@ -175,6 +178,9 @@ static void process_options(int argc, char **argv)
 		case 'e':
 			flags |= PAGE_ERASED;
 			break;
+		case 'c':
+			flags |= CONTINUOUS_READ;
+			break;
 		case 'h':
 			usage(EXIT_SUCCESS);
 		default:
@@ -193,6 +199,9 @@ static void process_options(int argc, char **argv)
 	if (!(flags & (MODE_OVERWRITE|MODE_INCREMENTAL)))
 		errmsg_die("No test mode specified!");
 
+	if (flags & CONTINUOUS_READ && !(flags & MODE_INCREMENTAL))
+		errmsg_die("Use --continuous with --incremental only!");
+
 	if ((max_overwrite > 0) && !(flags & MODE_OVERWRITE))
 		errmsg_die("Write count specified but mode is not --overwrite!");
 
@@ -461,7 +470,10 @@ int main(int argc, char **argv)
 
 	pagesize = mtd.subpage_size;
 	pagecount = mtd.eb_size / pagesize;
-	bs = pagesize;
+	if (!(flags & CONTINUOUS_READ))
+		bs = pagesize;
+	else
+		bs = 2 * pagesize;
 
 	if (peb >= mtd.eb_cnt)
 		return errmsg("Physical erase block %d is out of range!", peb);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
