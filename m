Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0734DC02197
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2025 02:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZGDWKg71v4XivjpYKDoyvqrx0khaOwaHZ7ABXmqE8p8=; b=Qjonv1IzGVcnap
	3/aIn5k83fu86ZUc7yeSsXALOO6rDV9KxMZe29pvJ2M16JUW1utV6EZiJobjPI/mddEDGvGycmmhj
	ZuRzBg194DsLqSJR0GLVC3c7UPFpEdmvqmTJkcGabx94/QJs1PecTVNaWZ0dX4W9w4Nm8o8vU1YGk
	dXBqY2wiJ5XZvI6tKoaCvRlwXrGeOJzREb/qTz9pNkNx4BSfCUiCstybQegPfGKO/DUPByaZOrpBT
	pWeVXYkFV9RCsC2460igUpKCgVsdwKZlxC6EJuEV0TvtWlYXboyQfSrOh0hwGMz+BAw6bN2XbgS1m
	05tirSIPDDY/Ac1/hHIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVCg-000000029Bs-0FU2;
	Wed, 05 Feb 2025 02:31:50 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfVCd-0000000298p-33Hk
	for linux-mtd@lists.infradead.org;
	Wed, 05 Feb 2025 02:31:48 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6e42f82ab88so5063126d6.1
        for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2025 18:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738722706; x=1739327506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0nndVOelB0GZZn73pGujC/UiwJRPbAJWARFJMrXRho=;
        b=RXyt0WwlHIowYy+jSyB/tCGODN+tgSygSCzJYxWPoeHD9PxcS8knyLoJARFY1boTxN
         ZOyDkY+ULVGvevJC5Q8Y2mLIriU+DuhP7NO5uRn2eMFPyEchbQ7JdtbObrjxf9hQnQVy
         sLKcNPLsYPyLyoAPEDtCy14w3o+QV5wJsO0od1TDYvgQNehcQRyT14DyTYIUc4yb7tPT
         IZHtEQAuulKNA8WsF6C+OfTH/0NaQsHqVG+UxDgfsghnuXNHtY240yeFG2Ak0OT6J2F8
         dBHWwwXcTfh1OuzZ2csRAbo1vO+TArg9+o9J3pCza8Zkjnb4gcbtnz77m4Ci0hEfLb2x
         fXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738722706; x=1739327506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0nndVOelB0GZZn73pGujC/UiwJRPbAJWARFJMrXRho=;
        b=p/KKhe/4J72qea3jz52HOdVQcKZkcAWPagoWUvfy1FT27YWeNI4bE7y6uSjagRBlnr
         vnXurDb8AbsQO0JtzCf0+140RktnnmAqkIggbseJ3CSTrUYp/PF9Wt75qr0upjv1tQHK
         DVEDut9BqglRaTOPBBEB9rxBfk+1RMjpYqwSG/vSpuFiNt8Xv2rB89LJSSflLc+PNLcQ
         Yhtd/VtMNxOvE4ZoTpn2RrzRoQarsR9+Mz70+6vHA4aG4xCJtVEylVY9VULuN2aIETGT
         1vyU2cHlcxtywCu6g2nTLctSaqLBlkmDhCwgPiU0gikNIhuBdFZBnhkhyFoJvudqBzSE
         Z0fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxm5SA0IHP1N0ygWvAL3SFY+vM/AcZzqpDDtsbERInOcvxmBC7m7s8i4Wkqeuog5FKzxduU8kBaWM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp+fZfZzEj+JM5UZ2iHeLfChLQCpXfALTaCc3NjO55qH55sJ0Y
	gywhKK7PqLC2ONzCog6bSdHLEXTn5OAn+Yr2C0BIf/WiC6ZjQ7zWiV1dMA==
X-Gm-Gg: ASbGncv5Okve9CDWeuYNOeQzOQUASUloW6VTGLZIHI8zpWJ/0nRSRR5Qo7T2bhhikoQ
	8u2dT+gfmYVSJ83oG9TfUauctEfE+2eZXktpUgZ7k42vRrNuBKFpWVxxKdYARzkrZWorrKKlNgw
	2Tbk3cDYAq/qGIHV/RmHpCD2//aFRT+BgLDsy8T5gysjgJVEvjoPeNWzOW92w+Nvl+trTso3ACM
	fOmhiYvoKWQsfl8s9GGe7CzpBQLoGksV4XV8wPC6Y37m6t7OFZYjLpzjABm588H85BXtRg4voxr
	j+1V5JBcif6PdV/4ldSKW7D+/lOdbySBNf2j9g==
X-Google-Smtp-Source: AGHT+IFS+kn2ZGB2pFJiLdc5JmZU8Ll8iIHRaRz39Sw1icfJkjZHfXf8rJhLmct3iVykW6xS2xt6kA==
X-Received: by 2002:ad4:5f45:0:b0:6e2:4911:cd8a with SMTP id 6a1803df08f44-6e42fbef337mr17367796d6.26.1738722706299;
        Tue, 04 Feb 2025 18:31:46 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e25492254esm68579306d6.90.2025.02.04.18.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 18:31:46 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: christophe.jaillet@wanadoo.fr
Cc: gmpy.liaowx@gmail.com,
	jiashengjiangcool@gmail.com,
	jirislaby@kernel.org,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	stable@vger.kernel.org,
	vigneshr@ti.com
Subject: [PATCH v3 2/2] mtd: Add check for devm_kcalloc()
Date: Wed,  5 Feb 2025 02:31:41 +0000
Message-Id: <20250205023141.26195-2-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250205023141.26195-1-jiashengjiangcool@gmail.com>
References: <f9a35a4f-b774-4480-910a-cdcf926df41b@wanadoo.fr>
 <20250205023141.26195-1-jiashengjiangcool@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_183147_781879_66083F63 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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

Add a check for devm_kcalloc() to ensure successful allocation.

Fixes: 78c08247b9d3 ("mtd: Support kmsg dumper based on pstore/blk")
Cc: <stable@vger.kernel.org> # v5.10+
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v2 -> v3:

1. No change.

v1 -> v2:

1. No change.
---
 drivers/mtd/mtdpstore.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/mtdpstore.c b/drivers/mtd/mtdpstore.c
index 2d004d41cf75..9cf3872e37ae 100644
--- a/drivers/mtd/mtdpstore.c
+++ b/drivers/mtd/mtdpstore.c
@@ -423,6 +423,9 @@ static void mtdpstore_notify_add(struct mtd_info *mtd)
 	longcnt = BITS_TO_LONGS(div_u64(mtd->size, mtd->erasesize));
 	cxt->badmap = devm_kcalloc(&mtd->dev, longcnt, sizeof(long), GFP_KERNEL);
 
+	if (!cxt->rmmap || !cxt->usedmap || !cxt->badmap)
+		return;
+
 	/* just support dmesg right now */
 	cxt->dev.flags = PSTORE_FLAGS_DMESG;
 	cxt->dev.zone.read = mtdpstore_read;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
