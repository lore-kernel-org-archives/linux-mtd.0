Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2ACC4332F
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Nov 2023 09:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mEIWMO1FhN3091nQbMwDRh/+RZtHL2v046Jt3L5HRE4=; b=MCbBm4Co30Yb06
	ZCDH23/3OqIDBIhla8jHV6cVDDU2dCpFgncBCMxEAqbOUv5hpW2K0LK8BGLQ7yQmn/LuDTqhRNK/y
	nhIQAHW622KmmT1SfgGNTdXeToPDpeKFEFPErY6qpbZCjXIKPUKGTJJGg4bjPRnSgR8LAwM+Hn3fO
	Zv4Hkb9oPMxaSGUhAzYUKBQWbpz7i0xWReelISniyw9SUiuCkUh9u9cmO71b8pLDYQQvM6mTdF6/T
	feuhr/IbzoKHllI5JZXBIz0DyRwKAoyk8JfsZv4yDvn5EV6sWNC9SYlz5gHv0B9U5PYgp+/sJYX4P
	CsSsgc6FpQl/cqX8pYkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0IJs-000v8u-1O;
	Tue, 07 Nov 2023 09:24:24 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0IJp-000v7u-05
	for linux-mtd@lists.infradead.org;
	Tue, 07 Nov 2023 09:24:22 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1cc30bf9e22so43088305ad.1
        for <linux-mtd@lists.infradead.org>; Tue, 07 Nov 2023 01:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699349059; x=1699953859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F9Gk5UeChrR6t8la1Nkn5HkFVZi5wlSIa0tTrdZqEkQ=;
        b=anPtLW+YUSllzu2546bsrGX1+cRWXBi0J0sZuCDfGaIT4GiVFrLmnzXRWg4pL7dpjh
         Zc+N0mRJB3QuhdhKb87JnJ8zjQB/lTS3XweoS+MAYdaVDwpAMNj2ksSQrgbXulu0zH6C
         1cvN8DKJwE4+I8Lu8sYObbuK8FDSRtMsWp5zoBtb6wU7Cw6cdyPXWc1maQuh/5UXO6pi
         0zk+6CUf7M7+Qk+1akzBRqlshi4LFTsrc9OzdOrA3+nmAstK4y+Ph+bjbQUgM587L81/
         L9VJZ+H8kkfZEpqhH1PjF/+Fo6R24jUV/UfmqrEIyTKGituFN+0irPXWDZWpi0CGNzug
         vWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699349059; x=1699953859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F9Gk5UeChrR6t8la1Nkn5HkFVZi5wlSIa0tTrdZqEkQ=;
        b=CZHLCsm9g+E3OrJWkSpZMIar2pMnxIPtcc8LJNgpDlfsJPY+wpe0417C3vydR27EqO
         BOT/jXDAEA0Qpyt/MxagsceHXDJnp5KS8YkOvHXmgLUiG4w+utMBQBxMMpJUc/yP7FvB
         HFd4rcwj17lBJygF5cc6e3pzASfq63o9HjmKrRTrgTfmn/i+chXLTV6vfvu9l+7XQPvL
         LWlmfd3JMmbJ8zZeH0rFWxxpzVWTiJxTDQ6BpJilPDOdOQrohOsg1o93PYGvUvgkilgF
         4I4EYelFzY60BvbSeToU4hTOEJsfa0nY4fYek2oqUzZdZEthZpj51MrzGSRNl8xL1iQn
         DBRA==
X-Gm-Message-State: AOJu0YyS4iX9zuStBCOLu1bQErDpy1Ql87vlP/V9yPPE/3DlFzWqGb4s
	oz6uholepihqyz3HjLu2q7HaGEnUOzM=
X-Google-Smtp-Source: AGHT+IH1hb0HycLsj9wuvtKeetctcvFK8uNPP2SRMQdejp2MHWZXQzuC9u/IJSVBmg3DkPiyRaTxhA==
X-Received: by 2002:a17:903:2350:b0:1cc:436f:70c2 with SMTP id c16-20020a170903235000b001cc436f70c2mr3781020plh.9.1699349058905;
        Tue, 07 Nov 2023 01:24:18 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id b2-20020a170902bd4200b001cc0f6028b8sm7148598plx.106.2023.11.07.01.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 01:24:18 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	david.oberhollenzer@sigma-star.at,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH] mtd-utils: flash_erase: Add an option for JFFS2 cleanmarker size
Date: Tue,  7 Nov 2023 18:23:57 +0900
Message-Id: <20231107092357.26360-1-Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_012421_060974_B92E807F 
X-CRM114-Status: GOOD (  14.56  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

JFFS2 supports buffer mode for ECC'd NOR Flash that cleanmarker size
is rounded up to mtd->writesize, while the '-j' option in flash_erase
utility uses fixed 12 bytes. That makes flash program ops unaligned to
mtd->writesize and causes program error or disables ECC.

The mkfs.jffs2 utility supports '-c' option that allows users to specify
cleanmarker size. This patch implements '-c' option in the flash_erase
that can be used along with '-j' option.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 misc-utils/flash_erase.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/misc-utils/flash_erase.c b/misc-utils/flash_erase.c
index 000f94a..c6f6f66 100644
--- a/misc-utils/flash_erase.c
+++ b/misc-utils/flash_erase.c
@@ -64,13 +64,14 @@ static void display_help (void)
 			"Erase blocks of the specified MTD device.\n"
 			"Specify a count of 0 to erase to end of device.\n"
 			"\n"
-			"  -j, --jffs2       format the device for jffs2\n"
-			"  -N, --noskipbad   don't skip bad blocks\n"
-			"  -u, --unlock      unlock sectors before erasing\n"
-			"  -q, --quiet       do not display progress messages\n"
-			"      --silent      same as --quiet\n"
-			"      --help        display this help and exit\n"
-			"      --version     output version information and exit\n",
+			"  -j, --jffs2             format the device for jffs2\n"
+			"  -c, --cleanmarker=SIZE  size of jffs2 cleanmarker (default 12)\n"
+			"  -N, --noskipbad         don't skip bad blocks\n"
+			"  -u, --unlock            unlock sectors before erasing\n"
+			"  -q, --quiet             do not display progress messages\n"
+			"      --silent            same as --quiet\n"
+			"      --help              display this help and exit\n"
+			"      --version           output version information and exit\n",
 			"\n"
 			"  MTD_DEVICE  MTD device node or 'mtd:<name>'\n"
 			PROGRAM_NAME);
@@ -115,7 +116,7 @@ int main(int argc, char *argv[])
 {
 	libmtd_t mtd_desc;
 	struct mtd_dev_info mtd;
-	int fd, cmlen = 8;
+	int fd, cmlen = 8, cmsize = sizeof(cleanmarker);
 	unsigned long long start;
 	unsigned int eb, eb_start, eb_cnt;
 	bool isNAND, erase_chip = false;
@@ -127,11 +128,12 @@ int main(int argc, char *argv[])
 	 */
 	for (;;) {
 		int option_index = 0;
-		static const char *short_options = "jNquVh";
+		static const char *short_options = "jc:NquVh";
 		static const struct option long_options[] = {
 			{"help", no_argument, 0, 'h'},
 			{"version", no_argument, 0, 'V'},
 			{"jffs2", no_argument, 0, 'j'},
+			{"cleanmarker", required_argument, 0, 'c'},
 			{"noskipbad", no_argument, 0, 'N'},
 			{"quiet", no_argument, 0, 'q'},
 			{"silent", no_argument, 0, 'q'},
@@ -155,6 +157,9 @@ int main(int argc, char *argv[])
 		case 'j':
 			jffs2 = 1;
 			break;
+		case 'c':
+			cmsize = atoi(optarg);
+			break;
 		case 'N':
 			noskipbad = 1;
 			break;
@@ -207,6 +212,10 @@ int main(int argc, char *argv[])
 
 	if (jffs2 && mtd.type == MTD_MLCNANDFLASH)
 		return errmsg("JFFS2 cannot support MLC NAND.");
+	if (jffs2 && cmsize < sizeof(cleanmarker))
+		return errmsg("cleanmarker size must be >= 12");
+	if (jffs2 && cmsize >= mtd.eb_size)
+		return errmsg("cleanmarker size must be < eraseblock size");
 
 	eb_start = start / mtd.eb_size;
 
@@ -216,7 +225,7 @@ int main(int argc, char *argv[])
 		cleanmarker.magic = cpu_to_je16 (JFFS2_MAGIC_BITMASK);
 		cleanmarker.nodetype = cpu_to_je16 (JFFS2_NODETYPE_CLEANMARKER);
 		if (!isNAND) {
-			cleanmarker.totlen = cpu_to_je32(sizeof(cleanmarker));
+			cleanmarker.totlen = cpu_to_je32(cmsize);
 		} else {
 			cleanmarker.totlen = cpu_to_je32(8);
 			cmlen = min(mtd.oobavail, 8);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
