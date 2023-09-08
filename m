Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1BBEE57D7
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Sep 2023 06:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZWqIl9mQq3UJxBD3HzF3WnJLoxkBwIoJ3ddreXVsEM=; b=u44SPGbDOQaG+o
	DHV7YSMbHSwVeqiNu7sF9RThP+MHVZdQvoy5RoZNT7KcxnF4r2qB30pcnf6dqAMy34y+sPVoIOHDE
	YyQ3OS/ig8cK26mLn++6Fc4shB+jOUJsmdrLFRPjMXkMxvk78B1k2c8zc+Z69txOEL7hfAqWoSAan
	EWNRSm7IdpND+Cbibr0ZG+dxCKKuzGPl7X0oKONM87Hi/K7LMO9+/VW90zrKK8SzpCTdWpg2w94uF
	7S/1f8pdRzKJHph9xEv8qFuWEIAQjpCFg2vv21AQJbKSOS6HLxmsbF/rDH+NFwe18VFQE062faFM1
	CFhUZio8knisOKV5xjFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeVD6-00DBK0-30;
	Fri, 08 Sep 2023 06:43:20 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeVD2-00DBHN-1e
	for linux-mtd@lists.infradead.org;
	Fri, 08 Sep 2023 06:43:17 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1a1fa977667so1420030fac.1
        for <linux-mtd@lists.infradead.org>; Thu, 07 Sep 2023 23:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694155393; x=1694760193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1BImkcIGdw9QjAovIeu02YeNVehzWJ4PFHHdOqnnyM=;
        b=e4o8tBuJCtuC2GIOgwVyeRckZRpfdkwaTqFgwo/O1rA0gwato9wB0q4+DvsSORf0Ss
         celsctzgYGb0qT7k6LNPur4iahoNyhjr6my/taraAnjZv1isTMLJAcoPKSl6wsE9SaRd
         sAPEvPkeorU67cHKQJ3eg8kBkZQ35xNCMcoguHPvAC0Yf13q2rZsl47h1kq3Wkdhsb1+
         FE6ry/Y4bEJGS71pCqnU6utOGxYTSpuwyNtzth2H+TSSMIAvAdEcMyzvbV42GR2pXGLI
         lZYcGUGaqX5ZhAuzbqKpNTehD/Ggsz9NtmWVrUCU9UeKL0Za8xMFZbpziwM5oxaffsT/
         DVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694155393; x=1694760193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1BImkcIGdw9QjAovIeu02YeNVehzWJ4PFHHdOqnnyM=;
        b=ZbfiZutB7KoIeoMn79fvZvmeu/wpuH0D5qhQMnseIaDrfp48lDe64B0OF+TSzgi9hc
         H2UAR49Z7LskjZHsBY00xvH4r635stu1vW4SLL6EYnhhqNvFdXs1IHrtL1DT5zzsvi9j
         qXG8TIRlnRBf+GuP/TxH1etlVU1XxiiMhYk7LMAdywUWvSzOjmDZjdLMPcKKqY2lla/j
         1XVFkS88KPjZsA01/6Ne901HBXZZIn8xLBDhQCg2mBnz/Ixncq8IJM+51daJMg3WqfDo
         wlrrPPry3Q/mpw+LTLdpPG3mdPTJFKIH+mBa29t+lyy+WL8s0T/dVP6Be8DRmn0j8lUe
         gqtw==
X-Gm-Message-State: AOJu0YxR6hKXe88mr8OSS3/brelzTmuza7q5vygIBHlQ08DIxN9O/OeS
	cEUqOQjCEetTQI0qVptTYq0=
X-Google-Smtp-Source: AGHT+IEz4AO1PYfuq/NH2WB8g9OISCeLyIzuU7F8oi/8Ge1ws+2G5UKncChp0BMeYDZ2EQzMQJGYbA==
X-Received: by 2002:a05:6871:85:b0:1bb:8333:ab8a with SMTP id u5-20020a056871008500b001bb8333ab8amr2346516oaa.4.1694155392979;
        Thu, 07 Sep 2023 23:43:12 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id k4-20020a637b44000000b00563e1ef0491sm558956pgn.8.2023.09.07.23.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 23:43:12 -0700 (PDT)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id ECCB281870;
	Fri,  8 Sep 2023 14:45:08 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v4 5/6] mtd: spi-nor: core: Allow specifying the byte order in DTR mode
Date: Fri,  8 Sep 2023 14:43:03 +0800
Message-Id: <20230908064304.27757-6-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_234316_550454_55D23B4F 
X-CRM114-Status: GOOD (  13.37  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

Macronix swaps bytes on a 16-bit boundary when configured in Octal DTR.
The byte order of 16-bit words is swapped when read or written in 8D-8D-8D
mode compared to STR modes. Allow operations to specify the byte order in
DTR mode, so that controllers can swap the bytes back at run-time to
address the flash's endianness requirements, if they are capable. If the
controllers are not capable of swapping the bytes, the protocol is
downgrade via spi_nor_spimem_adjust_hwcaps(). When available, the swapping
of the bytes is always done regardless if it's a data or register access,
so that we comply with the JESD216 requirements: "Byte order of 16-bit
words is swapped when read in 8D-8D-8D mode compared to 1-1-1".

Merge Tudor's patch and add modifications for suiting newer version
of Linux kernel.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/spi-nor/core.c | 8 ++++++++
 drivers/mtd/spi-nor/core.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 7ee624b16e17..83e7b7ff89ee 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -70,6 +70,13 @@ static u8 spi_nor_get_cmd_ext(const struct spi_nor *nor,
 	}
 }
 
+static inline bool spi_nor_is_octal_dtr_swab16(const struct spi_nor *nor,
+						enum spi_nor_protocol proto)
+{
+	return (proto == SNOR_PROTO_8_8_8_DTR) &&
+		(nor->flags & SNOR_F_DTR_SWAB16);
+}
+
 /**
  * spi_nor_spimem_setup_op() - Set up common properties of a spi-mem op.
  * @nor:		pointer to a 'struct spi_nor'
@@ -105,6 +112,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 		op->addr.dtr = true;
 		op->dummy.dtr = true;
 		op->data.dtr = true;
+		op->data.dtr_swab16 = spi_nor_is_octal_dtr_swab16(nor, proto);
 
 		/* 2 bytes per clock cycle in DTR mode. */
 		op->dummy.nbytes *= 2;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 92cbc2d3f7fe..7ff4c96fe21e 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -133,6 +133,7 @@ enum spi_nor_option_flags {
 	SNOR_F_RWW		= BIT(14),
 	SNOR_F_ECC		= BIT(15),
 	SNOR_F_NO_WP		= BIT(16),
+	SNOR_F_DTR_SWAB16       = BIT(17),
 };
 
 struct spi_nor_read_command {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
