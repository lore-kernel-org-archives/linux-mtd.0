Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C4AD74947
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 22:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n+xEd3P5s7+eBLcDIB/5BJfoQleDEx4E8PsCHNHydmM=; b=v7PzW1eJqvxsjF
	360rl02uKOUXRLr6PlvS8K5JbEI0qM067/nrdDHoJq4PF79HFhHWC60nwbn3YoxWp4TnJSCTKuzYJ
	cnZtSlDYurx5zsiiwxiRMLj3GsLGJD9RtkDfkKQBP0Qrj3taRQxU2Xc6aqiT5ZirG+kooQmtxDpQR
	FiU4WUyRbPzaiMHRT+TpR57xuV5vmOhlaryarhrcHVdsLY0KR7PAiaqw2wkUqVJcUuTdtBUQCQVh+
	pJqYEbP7zhfBMr/m6gDqmj2OU2GAu5K8ARdyLtYO7Jq6PV8+/R0N+DgJrHyynPBZXKQNvK0Gljw8p
	Ga5M8K0a62Iw3dAsOrvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5uZZ-0000000G2Oa-1qfU;
	Tue, 29 Oct 2024 22:20:21 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5uZW-0000000G2Nv-0xoz
	for linux-mtd@lists.infradead.org;
	Tue, 29 Oct 2024 22:20:19 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37d41894a32so194440f8f.1
        for <linux-mtd@lists.infradead.org>; Tue, 29 Oct 2024 15:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730240416; x=1730845216; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/7OE/QMinTNnLERT167c3CvL/M1HjMkuOBezusZau2s=;
        b=Fd+iKgudL1u61w+r2nqlJQwqg2CQ0/yfr3wDeZCcqWJvQ8TApPARzLzVntoaecjEQD
         3naprmhJKZGsuDnTld5KSL7+7YG8nT7vlJFdbpeE2BzAJ9+vMrePbz1KLPKPP9fQE2Mo
         urJZl6WssJnlil0/VbIOinSNwmaNAbt2GLeNQ+RnZ1Yp/Ku/CPzv8UCTJBWYoIo91vvl
         ky+YrNsfhl2FHsw18PaYi1+1qXqYY21B6OlpNMoa9gijQeLavW0yYWcpDMS6FW6W45U4
         94vup1XSu0tBEOSwlDUjTbJZ2j3JS/mJvI0+G2DjBOM0V3f98Xc1dCD/Kxf9gK+Vecf7
         /V/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730240416; x=1730845216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7OE/QMinTNnLERT167c3CvL/M1HjMkuOBezusZau2s=;
        b=prDVOWpoInuel1fVNX6J82i/6jFvM4P+eBZ1WiVathobpZ0aYnjjBsoq6az5f2FJgv
         mlidJxjJY+e1QZMkHQUNlu0sc15KaSNXswkL8uaZlDxfcwayrfq3De4NlGGfwQhE7HGo
         t7/ZCUGcx5NCo0Oq7q/Ibt0Gi+kHqU7Qv39mw3ORKHSa7vW9FzsF05BQMxSGd6erf+TQ
         Zj9P8LHKfzNNwlwWpSlqYSphrGnbcF24vKyeGO8S8l5dSKHO6CR0gFAeS708TOHxxrbw
         zSKpU8BuD4xlsUK6N6fWk651gncPOMJzn9aaywHoB4bbNnKzJqNeUfSocaE501EV6kL0
         xIEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuuJqorh+nAaq086YZcSv7KT8oBe+OhLcYTEGcIrDW9PCQcUMroKDT8e2pK15URGROg3kyn9GXEmo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxKIJ6CGOgUe5AkL/ExhXF1tHso7rh+UipfqQAkHFPyxtwIswuH
	yCnc/kuRm7UQfBIDdCC5dopArEm8Fy/zGnDSt4MiJuHOoX8OVx97smESoTLq
X-Google-Smtp-Source: AGHT+IGu+nfYSmitltWyx5Bwjm+ThSqNw6TaW7O5o1H3hKftUq+FGaLL8JkRaM0CTwtlDfnaFXsyjw==
X-Received: by 2002:adf:e810:0:b0:37d:4330:c87a with SMTP id ffacd0b85a97d-38173e61f42mr3163196f8f.4.1730240416210;
        Tue, 29 Oct 2024 15:20:16 -0700 (PDT)
Received: from localhost ([194.120.133.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b1c8a9sm13723466f8f.12.2024.10.29.15.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 15:20:15 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] jffs2: remove redundant check on outpos > pos
Date: Tue, 29 Oct 2024 22:20:15 +0000
Message-Id: <20241029222015.3069873-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_152018_293338_512A8FC4 
X-CRM114-Status: GOOD (  11.69  )
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

The check for outpos > pos is always false because outpos is zero
and pos is at least zero; outpos can never be greater than pos.
The check is redundant and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 fs/jffs2/compr_rubin.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/fs/jffs2/compr_rubin.c b/fs/jffs2/compr_rubin.c
index 556de100ebd5..9854253d0108 100644
--- a/fs/jffs2/compr_rubin.c
+++ b/fs/jffs2/compr_rubin.c
@@ -276,11 +276,6 @@ static int rubin_do_compress(int bit_divider, int *bits, unsigned char *data_in,
 
 	end_rubin(&rs);
 
-	if (outpos > pos) {
-		/* We failed */
-		return -1;
-	}
-
 	/* Tell the caller how much we managed to compress,
 	 * and how much space it took */
 
-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
