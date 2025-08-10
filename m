Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54318C87FCF
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Aug 2025 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0eJ5z6agx5GW6SUGVlZM65Cki2n565Yvyv7oBVPMrrU=; b=mswG9oW6y2h6Kc
	LbTqd7gr/1zBBZIPdwihVnxde8s3gRvh34D6CzKELAGANYqTACn7BRzZoLzMfdZ3+E2C03KOnPqcZ
	FbKG2A4HLq81okIFg0w1RXXOvlfud8qVpJjpXr8Cb0Mlpe/SmQ/xsZzz5Aow71WxCzGKrwxjcqsfh
	3L9ZkxiCnN902UeJI8M10ZoAVV8qShPK95GeWu4VqZD8lrDEB1Rfu3qDzVFvS5KVeG6GdUzg7yPYu
	YQSzYGaBFBlqAdWX7VVhTsIRMZwqt7/dyGlxbSdr1N8dkT+kX6bIgN7wtNvTbCw5fCWAOGUgt3Dag
	SNYiBH3P96aRbRLv0reA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul7Ck-00000005hin-2bV7;
	Sun, 10 Aug 2025 14:39:22 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ul7Ch-00000005hha-0Z4T
	for linux-mtd@lists.infradead.org;
	Sun, 10 Aug 2025 14:39:20 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-458aee6e86aso22349695e9.3
        for <linux-mtd@lists.infradead.org>; Sun, 10 Aug 2025 07:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754836757; x=1755441557; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9O7vRcMwEFVP7dodHcQ7X4md2K8okfmo/tHy/twqkHg=;
        b=TJZyOVW+X+Nu4p+/wIX5lvLPp7HQnmhOlBIKm3yXzUkxQ7/v9M6M8xx+DT7WC3JX2o
         PBjMKWyz3ldYnyVgWpPcl0l4L4u2eE3Lr1bw2O2gT9BLsX2KNBNoP1cQAhBLjZ/eVGtI
         ce7a7Sb56YoLu1Ch3qnrDA2rVFgJmK6uCc0vbEV/R7XFnrliv1b26EN4bSno8lFtrZlx
         pZWz2dqf2/1mnFb5p3wOY9Ka23WK4yWFPMsYoOaTvRew4JA0/jkcIDiQ6qIGtVOzewMp
         QrP3IOl2q5eaWAvG7z/N1/vaeVSgHV9+i55JWdiaGtf3hDFC+C/iJ6TdlC6gfXGbw4xB
         OqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754836757; x=1755441557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9O7vRcMwEFVP7dodHcQ7X4md2K8okfmo/tHy/twqkHg=;
        b=OHTnCew8ZU+0QOhoTnCqjDDkYDbv47Ihdc9eSN4mqcLQ6Vseppv1NFXnVZvfaxOPQj
         ThfjlcG045VEb6oXH/WOUBqFAex0U59Gg63L9oHEhrpFvLHf/S/WiaXNW/aM3DoUOaYC
         +Kwn+P6CEbXP8OCrxd1ZiOmljJXnNeyf0uINO51ebMcadIoGhLbde7ZPW3drcv4Nftqj
         ryxo3ohfkhktuUY+7mxDvs36vCBTDJDEZnwBil9epBQJA/fqL7NXHrW0LkEebSNkLAYL
         lMkdMiMsyI3iQuns31E17I/HtYbkkhDapwQwNXiCu/HRK0ZG7v5PKySVbtQT44vGo9x8
         8WIg==
X-Forwarded-Encrypted: i=1; AJvYcCUS8mnRRNnHiPuAzUmD/2ZMSU2TwCE6cBA+mCacHNRPW69mQtKJa7Tq3jAKe7mQ6G9kGHN4RYTbubU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyXhmXWUAiJl6ER2v+sWweDuvzYXS6h8pSl35SJWCGR0i7dBik8
	wAlxTOo+1EZ7ZtsrDxv88ySzSZAKBa5DWiwi4XCQWDHEOwCSHWsBupXT
X-Gm-Gg: ASbGncvr3bbuzmB6HS4IqhSdLBVz6XimAo4hSBEfk2gRm09Via0J9fzOXAqI0TXHMCa
	FJW60GS2T/vlVJNCw+4Mz+Mo6f192yyUW8hh8qaFN2QjvRq19A7nZ8hOqE/5WkxtCTfGDxFJV4h
	ZchvWnONXUam3PUrJ26cLaDUQ5cOeIu8MKMijmIgPHvsjhf3zgC85EZd/GQK5N06BP4uZ6f1yE6
	eDOXbHXmuEhc43MLnMPlV0D6hMMe55QjTHgmLUAcw5kE44CDwkpSq18fvIuamogjPYFMP6H5ijK
	n9EhLC0SLLSkMAWITcO5CSRCn3QbpgJ5+uK/dr5izohiQjZrVbBuLNFJFU3VBDeSbJ0LHzc0Nco
	XiyQn6Y8tlgwCx1XAf5W/uS6lHgIesoOnLtCJhs2SrCHGk8CJoj8=
X-Google-Smtp-Source: AGHT+IFriHNfRSUY+nrgYqvfc98x7fIebMd0YvKqXJrl8fH85WF3xqxHwfsGbrwLZHbCzjxKoBC2Ng==
X-Received: by 2002:a05:600c:4ed0:b0:456:1bae:5470 with SMTP id 5b1f17b1804b1-459f4eb4126mr90929485e9.8.1754836757121;
        Sun, 10 Aug 2025 07:39:17 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-459dbba5210sm287721715e9.2.2025.08.10.07.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 07:39:16 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Sun, 10 Aug 2025 16:38:50 +0200
Subject: [PATCH 1/2] spi: spi-qpic-snand: remove unused 'dev' member of
 struct 'qpic_ecc'
MIME-Version: 1.0
Message-Id: <20250810-qpic-snand-qpic_ecc-cleanup-v1-1-33a6b2bcbc67@gmail.com>
References: <20250810-qpic-snand-qpic_ecc-cleanup-v1-0-33a6b2bcbc67@gmail.com>
In-Reply-To: <20250810-qpic-snand-qpic_ecc-cleanup-v1-0-33a6b2bcbc67@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_073919_174752_677066FE 
X-CRM114-Status: GOOD (  10.75  )
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

The 'dev' member of the 'qpic_ecc' structure is never used in the
code so remove that.

No functional changes.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 7b76d2c82a5287df13ee6fcebc4abbe58ca861ee..bc2158e560be3b0ab1b26882e4de524ecf662d14 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -78,7 +78,6 @@ struct qcom_ecc_stats {
 };
 
 struct qpic_ecc {
-	struct device *dev;
 	int ecc_bytes_hw;
 	int spare_bytes;
 	int bbm_size;

-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
