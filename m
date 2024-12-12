Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCFEE7717F
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Dec 2024 17:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mBJojk6VCBEDKLkIEUiJz2O/twiW4pD+VPr4YA41PPg=; b=v4T4ymWOHFXO18
	nbVRAA2fr2Vu7FZnLCBy0XrsKe4P5/dHBzAX1KHXK8bj98jXVfkAAu/Qcz5Wes1C3b7NKL8BbQNze
	NmSiG6hMgeLXNUGpw2daWLjWGHDPOs8yYu8J1StLMSvfoLR0t3GKSF68gLaO7LWgBvjC63CoXCSFu
	lP0KZRVq/355aIWh5rGazETOTjxTjj3Ti8EjqYMMwNo16VIhTEG2VQThanEDTlq2q5NtHIqdjoYZc
	MiQUPd8kBi6Z3GRrGrVpR+NP9s7im2pYtoNGxjQBI5TdqsoK3UpX8joxWmbZqjFvIWr5vz9M/syiG
	AtncEXWI+BF42cXH90Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnER-00000001FOn-3x6Y;
	Thu, 12 Dec 2024 17:44:11 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmzt-00000001BVO-3Kjp
	for linux-mtd@lists.infradead.org;
	Thu, 12 Dec 2024 17:29:11 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-540254357c8so822440e87.1
        for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2024 09:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734024548; x=1734629348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j9BcecuYcmDSHCbSRIk014IUFsWGwdT9TWUaQI0m9W8=;
        b=AEnC0q8s754brahjgkoZbA/LfiqMfEJKMO17F/y25YzS3qz09PByQdG43cgBo2of56
         gCNV/tWiknkAsPJNFIqK8x0fugQeaGj4fm8dKc1+GZRMOFtf9VhRipmgurY745vz8d2K
         aV83KPTVujlwfRwGEFzwISZh7jt5ILHFnm+2UOoulBBO/VXgdUcGCbD/6do7n+SBZ9k0
         yuQDbTG5fHvjWlKngy8n3kwBMIxMVrWGZPz0alimZlRqIwVO/8v4w/41b5CuYL0zwZCG
         forwTldD9/WQdUsbnpDLUphB5hVe3BpRe1MjKnlXB2XndwEViWrjvYGtQR63IrA1iso0
         +r9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734024548; x=1734629348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j9BcecuYcmDSHCbSRIk014IUFsWGwdT9TWUaQI0m9W8=;
        b=kAYsHudM2ffxa11dNQcN+QMAnfXpwl63Lkd3TIP8pdjelcswpQVhNJWxOP+3vF71V7
         xrPmRIHxyjfwHgctjFkHiA1f4694nhjrTobUcXQHmM+JSFu7zKMqEVb5OmStUNJbjkTC
         yMf41KgjFN6sywZvqyalG9VrcOUgspEiA1pUR8yJHPcaVSV6UPrbbZ73beWv1AlH5ZHR
         u1qZigJ0o1hlfpD7NotzMK0H+50zHT/Iv0lgSZWG+ZazLtzrHfhiOBh/+CA1BNRgUMZJ
         JGAZ+MZ1ICme/T7I6Aaq7OSz7V8pG8kx/3nJET2K9gagt7UCl1UB+W2xTXfU2CS0bAQm
         CSQQ==
X-Gm-Message-State: AOJu0YxXf94idCv2z5IVy1RnaEoetW4vnkYf1S0ja9D304TYCWvTM/xx
	ne/InrnCDBpIrRdban14MhkMEEJh7/mSGeQfC+zShnH0BR/1PWSu4LkJEFBHdqF1fg==
X-Gm-Gg: ASbGnctbv18VAWjI/VeYfwrIRTCao75xPuNDSwg6j3fIRLdKLDlv3JC57n3BRiKNHWc
	Dajht9fpAaVobo1KTYHE3CmtqWwpLB52/+2DAbXY4QffAwHittpo1gi/HMcxJtS7wjfsm8RIz3M
	hrrGPeUCX92KKMFsvRM01IV6EnjRgA15zUOYDqswZfyFU5YlwAbHI4MwdcOPsVKrA++/I6givfT
	QehrUQfxR3ARNFmTQSWbVxcMpixf02n9B29dqUWK2ezO+7t8cCs6V0nmm1ErKt3k39iafV5871w
	0ldjhkeUjlzZJi2LLHkiFXhSA5jiuf5NyiNF2/k=
X-Google-Smtp-Source: AGHT+IGlXlbmc4h97z/RXqzwv+Hd3GrQ2k1a+ygIhI00iw16m31uNWMw2/gEJf4iKKRr14ZhIWGZKw==
X-Received: by 2002:a05:6512:104a:b0:540:2ef4:9cf1 with SMTP id 2adb3069b0e04-54034107c6cmr586329e87.17.1734024547346;
        Thu, 12 Dec 2024 09:29:07 -0800 (PST)
Received: from astra-student.rasu.local (109-252-122-202.nat.spd-mgts.ru. [109.252.122.202])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e6b4c051esm1792743e87.70.2024.12.12.09.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 09:29:05 -0800 (PST)
From: Anton Moryakov <ant.v.moryakov@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Anton Moryakov <ant.v.moryakov@gmail.com>
Subject: [PATCH mtd-utils] ubi-utils: Fix integer overflow in mtdinfo.c
Date: Thu, 12 Dec 2024 20:29:18 +0300
Message-Id: <20241212172918.56255-1-ant.v.moryakov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_092909_829962_926D4CA7 
X-CRM114-Status: GOOD (  12.04  )
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

Report of the static analyzer:
The value of an arithmetic expression 'reginfo->offset + i * reginfo->erasesize' is a subject to overflow 
because its operands are not cast to a larger data type before performing arithmetic

Corrections explained:
Added casting reginfo->offset to long long

Triggers found by static analyzer Svace.

Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>

---
 ubi-utils/mtdinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index 7dff0de..850297b 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -203,7 +203,7 @@ static void print_region_map(const struct mtd_dev_info *mtd, int fd,
 		ret_locked = ret_bad = errno_locked = errno_bad = 0;
 
 	for (i = 0; i < reginfo->numblocks; ++i) {
-		start = reginfo->offset + i * reginfo->erasesize;
+		start = (long long)reginfo->offset + i * reginfo->erasesize;
 		printf(" %*i: %08lx ", width, i, start);
 
 		if (ret_locked != -1) {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
