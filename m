Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBE4EB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jul 2023 17:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zsgg6rGQANgS9l5THYpMwZOIPCECt8k5tbXoQva8W2s=; b=3YtYimy7gs9cmf
	Tb4DYfuIyOE3MlNBj943cngtlqSBXMau/XqFAO2RPlp4ZiIbBg33FvLbSvk8qNgSM73Ceu0i9SN47
	mY1xuxA7Ay+5v8iSb6Mb6bSLFUm7f39aRgi6zIR7AR0Mwl3dmcnUKZFNvjjwfVl8YyWOPE+eCRtZc
	RSQN+PmgqJHui2wJ9ZzVuByGr9ikxwCxnPrnH1q3DQt7N7BYu+dVPqpTdrTNN4exqPgpoRlWpYmU1
	6K1605VVEAq+NidzfkmidhNOUrwNdB8aPtNuLgROgM5+58ilF+Ag+einvSNIB50TImOVqwEpHJjbd
	MKvHxqQ68OWn4GsMidIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMtd3-00EiEK-25;
	Fri, 21 Jul 2023 17:09:21 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMtd0-00EiDh-17
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jul 2023 17:09:19 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b70404a5a0so32305261fa.2
        for <linux-mtd@lists.infradead.org>; Fri, 21 Jul 2023 10:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689959354; x=1690564154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LFftK4DOqMxbenvX+ZWqpHvjB8TLWZvVjtgs6c90DoU=;
        b=unHfkWtTynIdF3DmfPr/pm+AvDuWRBEvAfMZqyKGnq2rPIdttl4tGwe06sWP+nhGKJ
         3S3qadfHXZN9+PICDei6rU/TvS6Rdx44PaLkmv/v4lE0kv5LVR7cQfcH+Z2IrGVdjHEZ
         W0i5VjY3oYOrEIXMxGP4TYCFmJ7eXIGqWUc6uIGrwscdpWQ8IAQj6HT02ZDkA9Dee4pD
         wV+2UUfw/+ku6sUKUfoqO1IBYZIymkbjGGlE5rc+8/jM0O9Xzw+z1ku7SYJ15cwU8dOd
         xq/Y4sYQdHXxtAjogrwaJ7KM31Ojkk8CVWtFczdLfRF8vTERy5xGeSnnOovVOegNOxtP
         6HlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689959354; x=1690564154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LFftK4DOqMxbenvX+ZWqpHvjB8TLWZvVjtgs6c90DoU=;
        b=Qy5w7KWDj5IXEuAO8BN9ZyubbknDjuShplnFCtfec7lvMcHYSxIPpIQnvxzaIkYEYw
         5HDDAgSSpX7PCuwq7EyBxaPmEVHMuRePp/hLFRL0Lr5nwIy3SXESxwhhABa18hMrki4B
         Yp+5p1HqKOQ548cPIx69H+kjCWp0DmbZa0SF2BWhFhF43t/3Ap7kEQQnpvOb2bSkwA/e
         MI7vb7AFyMBEBdKQM7v4xM8Q9rNAvgGwSKYCdfz76/xj8uMqEuES8nCUeYWwwhiEoJTQ
         qtgnk0GxbrJJdWjmG0BpNbIzRKHaLqqzGyOM9DTd7SlaonP1dcXVeCPLu1ObmivjlEg+
         qgbw==
X-Gm-Message-State: ABy/qLYR0oGVPGSs8BWqd/pwsY9WZGFf+HjhcAlZwKr2BJ/cIg4LOzKW
	iiwmeNkHV6g8wYEOHApd5wGjhQ==
X-Google-Smtp-Source: APBJJlGb27JNqR6RAqfTDfKccDLdkTr7mrg5TaiqGTP9fE1aUTFst6Ia/n/KmqEazT/VCfSB+hYovA==
X-Received: by 2002:a2e:960b:0:b0:2b7:65:fca2 with SMTP id v11-20020a2e960b000000b002b70065fca2mr1953117ljh.49.1689959354136;
        Fri, 21 Jul 2023 10:09:14 -0700 (PDT)
Received: from 1.. ([79.115.63.16])
        by smtp.gmail.com with ESMTPSA id bi3-20020a170906a24300b00992ae4cf3c1sm2363957ejb.186.2023.07.21.10.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 10:09:13 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: tkuw584924@gmail.com,
	Takahiro.Kuwano@infineon.com,
	michael@walle.cc,
	pratyush@kernel.org
Cc: Bacem.Daassi@infineon.com,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH] mtd: spi-nor: spansion: return method directly
Date: Fri, 21 Jul 2023 20:09:11 +0300
Message-Id: <20230721170911.13502-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=850; i=tudor.ambarus@linaro.org; h=from:subject; bh=p7fYs/NDrLBsJ7A5rZESMpJEhJ59/ar0SKfXrjS//Ik=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkuru2q9Kjx1LfzaXzgUtk7b45i5QsKazJj4spN n2UK7cUI8WJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZLq7tgAKCRBLVU9HpY0U 6aizB/4me6YzGHiEfDYZFRgD+eWOKIgRCeMsSq8O3TZHPZN1X2AiOb/v8X6kijP/0hxeC5EXCU6 Cnq8r9GKxk/z1a4Xyt7x00p6wbiFgD8TpKZZtNmRxLSXwZH5opFtmyTAVZaWeururpl7jfJ5ZaC z7PsODi0NRDLry7BZRnh/rvUl7/GelCi7+36e6fgVZyE/TnpKcxms2D+EyWWaYrjCmz3Q1+MLW6 ApUkZUfVhVnZLy90sUO+EAhgJmDLstuWnMKEbl9vm13yEvYbbkozga16yR818MpjgXqPH4t5pZu Mpri8lnE3/YeohUr/Zy7ZVyZbzGVGoP7+/ouE1u712e5cQIL
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_100918_399191_647876AD 
X-CRM114-Status: UNSURE (   9.45  )
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

Remove unnecessary handling of method's return code and return the
method directly.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/spansion.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 6d6466a3436e..314667d4b8a8 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -656,13 +656,7 @@ static int s28hx_t_post_bfpt_fixup(struct spi_nor *nor,
 				   const struct sfdp_parameter_header *bfpt_header,
 				   const struct sfdp_bfpt *bfpt)
 {
-	int ret;
-
-	ret = cypress_nor_set_addr_mode_nbytes(nor);
-	if (ret)
-		return ret;
-
-	return 0;
+	return cypress_nor_set_addr_mode_nbytes(nor);
 }
 
 static void s28hx_t_late_init(struct spi_nor *nor)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
