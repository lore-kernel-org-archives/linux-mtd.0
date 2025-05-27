Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D61CC54ED1
	for <linux-mtd@archiver.kernel.org>; Tue, 27 May 2025 11:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5GKpmEoajeK+ql+qEfg4hp0T4AVzSKSw3bj5J8VaejU=; b=Pmp1LUHPZpQ5/t
	IiA6/Bno0CYcNtxeVrpzZuh6l3U+7nDD0YFCLXHvGljpBcf71CWozmy2tyu9LoQNwkiCpjDmLifmC
	ZPsSXsGn9W/DpZImUqQDlvt9XhiYWV5aOngjwbMwE42rWpvZxXrjV7bPMi+1M7pQS0CqMnjZk1qYo
	eOFLnQEaQaXWNZbIaR7kQ3V6p/thPKVijLDq+IA5LPgyHotDgukvXSQwjkdnZfgcsEHeXDxdk1TGT
	TeMctMz+RYRRMAFI/madY5B+oSE+Mb9Eivs4wNVGafzQaljXgt8kVilX3BgRz5RdpigkGiNPrgCf0
	PzIlBEHx17jUlD/3ErHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJsAl-0000000AX6i-0RRA;
	Tue, 27 May 2025 11:08:43 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJsAh-0000000AX5p-3ti3
	for linux-mtd@lists.infradead.org;
	Tue, 27 May 2025 11:08:41 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ad1f6aa2f84so648356366b.0
        for <linux-mtd@lists.infradead.org>; Tue, 27 May 2025 04:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748344118; x=1748948918; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VrzlUqZN0a5R+G7GF9tUab03ZGWFooFwFU0L4xjwtxM=;
        b=jUSiOHQ8NGdGXmcnWigKz9irUGud9A1Nciz6/x05X8sZIEq9y9+c1IRJSCR/rQ5nov
         19jG3EOqp62r/VTKknCEnhkZDujU9Ij+Z1LjoZjzakcdM0ef41c9q6InZatYIJjVBcpD
         VbQ6jwS8g94Vv9fGMRph5rTeMBH/tbuss+RAsPQiIESpT+IrQKRUASRfZRuPPEt5k9Mn
         YDRq/+9d+ow7b8uXZ0+fqY4JuBTctD3BQI2JzqH+C7WXzKckAX+O7kaGcPhkrhs/xcpM
         B8tLdq1cMWvORYHy2npLzdEFJyeB9n0q+cn7F64ub9XQ0D3rNcyqjJVKbxbgYLoouyTX
         YhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748344118; x=1748948918;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VrzlUqZN0a5R+G7GF9tUab03ZGWFooFwFU0L4xjwtxM=;
        b=XqgBYokiGQgUHhJeeMqBvZ9y/v/V5gtnqEgV8ZN9rbK8sjbTyi4qYW6qcqrer0Vnfk
         AjF10XapbHfK95sV49vupIyRnoyb6PA1NfAg+EapRzMTnuARa+j16z4ypLivjRpHt2UF
         JGcEepxRErTQo+FsKEUY4MyTPR3EJlMwicbf4E5mbY9zbnE8qTdRitRBuczH3zhim2L4
         1N+mMcC7fzqB26raYjS04KRWkGHuW2BVRjSENs+p6/v77GoCZF92mU1EFx9CBfQBdfkj
         pld/ymCWnVlzDzn9pbPRwHdtt6YN+CpTYcJzkhkecw8Dpq/xKbJv6K+hWy62gH2P13kB
         X93w==
X-Forwarded-Encrypted: i=1; AJvYcCV4iPmHmf05nFM67yLjqvVeghwbX1Dwvz+RZstnKDMR5v4+MGsdKD/nT44y5+Vc/z4zkAPZBRfGNRs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx27QilizcMpPqXOvbL9yIWpaMWLDxYHURFTvz11UaA4UdR0rVX
	1WZSatWFHxfXC+hq4TqyAym3MevP3lCrAyAhJ6EqFVPHzTiHR5iGPgDXS5RkmDV5
X-Gm-Gg: ASbGnctfkNDZCm4616eu9eRTaSp85ozlPGt8OMmIv4HGS3eNZfALUVQ5zFx4nTFFqd1
	OqHqaxCOv+S7SXJQkb9eHAGKdksZwHOfPpZ6le8s4kx+4/TIaHXiKO491RpH3gKx0Jjtq0QP8oZ
	kAeB5A6lB3FbScjGIiXRWdlYvj2PcXSTD28LN0BgaJpiUN/VZuXuYxzs8Ib3HA93RmdGNkX8lX3
	JGQ2hBM8wH+oT3TEdd/HDfv+CM9olp35keLQu0ofE3kovxIboBPb0peRST91x9klnopPmrVNwVs
	BS72XIPJ/xdbPvA8Y3DKTTYWJRRQYllaT8XtrNf4vOnsNb6cseU9lYvxWszNRGiBSJ/fF1qkNNn
	47put
X-Google-Smtp-Source: AGHT+IGJFDt2RJQxu8Iu8q4jKRN0K1XcgwMH030e180iig8ad6QB0tPqnPyZqTiw7ph0nwENS67CkA==
X-Received: by 2002:a17:907:9483:b0:ad8:6dae:11e6 with SMTP id a640c23a62f3a-ad8986f270emr21002766b.0.1748344116076;
        Tue, 27 May 2025 04:08:36 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad52d4cbe90sm1819389666b.165.2025.05.27.04.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 04:08:35 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 27 May 2025 13:08:16 +0200
Subject: [PATCH] spi: spi-qpic-snand: document the limited bit error
 reporting capability
MIME-Version: 1.0
Message-Id: <20250527-qpic-snand-limited-biterr-caps-v1-1-61f7cf87be1e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAB+dNWgC/x2NQQqDMBAAvyJ7diEJiLZfEQ9rstqFNo27pQji3
 w1eBuYyc4CxChs8mwOU/2LyzVV820B8UV4ZJVWH4ELnutDjViSiZcoJ3/KRHyecK1UxUjEk/xh
 m56NfHEGNFOVF9nswTud5AUPqiVxwAAAA
X-Change-ID: 20250527-qpic-snand-limited-biterr-caps-a198b01c1f0a
To: Mark Brown <broonie@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_040839_969887_B86951AE 
X-CRM114-Status: GOOD (  12.08  )
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

The QPIC hardware is not capable of reporting the exact number of the
corrected bit errors, it only reports the number of the corrected bytes.

Document this behaviour in the code, and also issue a warning message
to inform the user about it.

No functional changes.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index fd129650434f0129e24d3bdac7e7c4d5542627e6..c2f5ef899f6a60ad98b9d754b7cac1832d0500eb 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -639,6 +639,20 @@ static int qcom_spi_check_error(struct qcom_nand_controller *snandc)
 			unsigned int stat;
 
 			stat = buffer & BS_CORRECTABLE_ERR_MSK;
+
+			/*
+			 * The exact number of the corrected bits is
+			 * unknown because the hardware only reports the
+			 * number of the corrected bytes.
+			 *
+			 * Since we have no better solution at the moment,
+			 * report that value as the number of bit errors
+			 * despite that it is inaccurate in most cases.
+			 */
+			if (stat && stat != ecc_cfg->strength)
+				dev_warn_once(snandc->dev,
+					      "Warning: due to hw limitation, the reported number of the corrected bits may be inaccurate\n");
+
 			snandc->qspi->ecc_stats.corrected += stat;
 			max_bitflips = max(max_bitflips, stat);
 		}

---
base-commit: b00d6864a4c948529dc6ddd2df76bf175bf27c63
change-id: 20250527-qpic-snand-limited-biterr-caps-a198b01c1f0a

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
