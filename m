Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32E7C369CB
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Apr 2025 19:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+S5G644T3rQZ+o83Hg+iSak47isBFd8LE7K89o1/tCE=; b=KCoT2BUUBWIBGb
	usMF3GUnEXg5KfLsJM4RFXZ2qMFZw1M4u0DVAFg5pXjDeEHWOd4zwqBbwRN9crK6m5h03WwKqUWye
	ekDdJ4ULBnJGn/qqybmw6Zb1y3KFSBCiYD6fhGDFA2IAvmFlK8Op5frbo4EaPaahmkqHRtENACyjj
	j8Ztp6hfuyfoVYeqhYUT3TQoS3hkrMnic0iqrslUpUMKRSCOSciFeA7RTKxMK4Pnvm1avxnuZauy5
	cLRV5O4U3FQI4S4bWmKyqUBXDUw/Gygnpeusn7w54FsgFf+VFbZEDki++YHUkvczAMb4lY6/TfFRb
	qgXqo5m1sNj1UtX8ONkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fqT-0000000BlM2-1Unz;
	Wed, 23 Apr 2025 19:33:21 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fpS-0000000Bkzc-0Geo
	for linux-mtd@lists.infradead.org;
	Wed, 23 Apr 2025 19:32:19 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ac2c663a3daso46432966b.2
        for <linux-mtd@lists.infradead.org>; Wed, 23 Apr 2025 12:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745436736; x=1746041536; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PQn3DRL4RP829nvfnG1w+3VmbMB4w74+ATdSejfmqSM=;
        b=CK+vBNUbJ8o7uhH54/qLvhwkZ0CVJMiNwRf+5SPfWK4fD8w5PzldFYFtCAZGFzod4J
         R5RMbNe1FIxMYLaWpAB/lsr7Y0BfDfab843Ly+dwomgngLMQTohyNr/K94vPeTWdBPca
         70ybN+ELxxfPfYGswQ48fBuEkvvlGfAFz9ccTzEdRR0BW3i8ReT0ptI2SR+sPJkergax
         hiiR12BKukBmFhtcGtKdopU8Hdn71W6rb63Y52yYB04ZAy3eNGubE8s7w5DLWBoLrh+D
         ngE6jMLxVWblwysqR5gqvdIBK0d3Do4XpJKDNMYlIfA7/vYBj+YErpD3S0+RBTBucSi9
         zu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745436736; x=1746041536;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQn3DRL4RP829nvfnG1w+3VmbMB4w74+ATdSejfmqSM=;
        b=fea2NVEImv80iIh4K8hv0LKve5YHWopZ+CqLLdKsr96fzpdTnm9TywuYwrI8ISaDZ7
         8X+9jzNDUfwFtelVD/eKBTyo6hM5IWoGYCLmV0GIR5mmXzH8r8x1EKwvzg9Qh+oFIMgq
         GIunkD2ySzNJslTX4DOSYJQ0LV0xrtJkz7wI2ZxWCJ1eFy1GYY0I0bwxaw/+34HIu8Bf
         o8o9fOjtw9f3T/qwYybVupXtE/kF+JdgewU1BSmuIH+ivVsaT2cC7mIS8tDwHaPAGutd
         +Baz1oTGfO+BRpknlzbKHWktKgRpElm5I/8D95usuyGQz6Gge0vTK3x09Q98MtzbRShT
         hc7g==
X-Forwarded-Encrypted: i=1; AJvYcCXkzF3ExdrM9U3bUJRcxbvSSFa2Cui/IvqoxTCtgceQ7iF6KbhTycD9vWe6PUB9pCBweLkdILynvH0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPr/WMbs1+CjRljgTFbg8I+ON6MKp2ncFu7w+tpirtjqT5a0M0
	hjSpHOGn2U83+7Sw4HUMEU5KWdR7Hyny1Xa/Z9Uer3AFicy5ZlXg
X-Gm-Gg: ASbGncuNXUss9Xd09Mf6vDLFtMprShApDvPj45jlXfZ6Jk1gmwWLGm4LUXnHVdP+hja
	9m1XhEB7giXBVG84ak1761W41w+UtxyelqXHsldOljOgjgiw6q8fhZXMJxStAqjEj6fTJc5ilpv
	HQL1Oq1uPDj1yf6oL6A2jlBVNXn10GQFWg0w6y76qxfixbgBJeXY0tu8hbKZONXsDhJ4UPL1+fn
	QqhqKhTfQ1MUFzxo2FeCuSvbFTqIe5Ol5HSFH6fe527acJ2YT2srIIE2KmI5fCYeeOffUJ36oPs
	FqWfL6mJOeNJlOHKFMNzWPZ0UjswCpfXKh7A0/E/FknO1Gf7MKZAsnX77g//aAXnGn9UqA==
X-Google-Smtp-Source: AGHT+IHT18d794Ji9hf7W0HV6iwefNzZYHGo0nf5c+s7xFlM/chCUnue7PpKhxE3F4tUdGZK30ZijQ==
X-Received: by 2002:a17:907:6eab:b0:ac7:9712:d11a with SMTP id a640c23a62f3a-ace572bd80bmr5209766b.32.1745436735928;
        Wed, 23 Apr 2025 12:32:15 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-acb6ef49c23sm828863366b.153.2025.04.23.12.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:32:15 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 23 Apr 2025 21:31:57 +0200
Subject: [PATCH] spi: spi-qpic-snand: propagate errors from
 qcom_spi_block_erase()
MIME-Version: 1.0
Message-Id: <20250423-qpic-snand-propagate-error-v1-1-4b26ed45fdb5@gmail.com>
X-B4-Tracking: v=1; b=H4sIACxACWgC/x3MMQqAMAxA0atIZgO2KKhXEYdYo2ZpayoiFO9uc
 fnwlp8hsQonGKsMyrckCb7A1BW4g/zOKGsx2MZ2TWstnlEcJk9+xagh0k4XI6sGxcENXW8MLSV
 QBlF5k+efT/P7fgAiB5JsAAAA
X-Change-ID: 20250422-qpic-snand-propagate-error-9c95811ab811
To: Mark Brown <broonie@kernel.org>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: linux-spi@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_123218_132510_B07EB90A 
X-CRM114-Status: GOOD (  10.74  )
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

The qcom_spi_block_erase() function returns with error in case of
failure. Change the qcom_spi_send_cmdaddr() function to propagate
these errors to the callers instead of returning with success.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 17eb67e19132612c4c1a84848fa6f7432b1130a8..ae32c452d0bcf852b69b76e595f3588ea7e1a670 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -1307,8 +1307,7 @@ static int qcom_spi_send_cmdaddr(struct qcom_nand_controller *snandc,
 		snandc->qspi->addr1 = cpu_to_le32(s_op.addr1_reg << 16);
 		snandc->qspi->addr2 = cpu_to_le32(s_op.addr2_reg);
 		snandc->qspi->cmd = cpu_to_le32(cmd);
-		qcom_spi_block_erase(snandc);
-		return 0;
+		return qcom_spi_block_erase(snandc);
 	default:
 		break;
 	}

---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250422-qpic-snand-propagate-error-9c95811ab811

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
