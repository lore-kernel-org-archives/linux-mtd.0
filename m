Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587F6C10DC3
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Nov 2023 08:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTSaaKKVXyTRkp9c0D6YEiM58kDiRq5yIJGh3Q7KSqo=; b=O1VVxEYAow5b9e
	YXaCPlWMAqC+szRyt3pPY6+DozwmTcjflVnjp7CxrAQCBCnMDkqUiVGbQrWi/bK+wVEAyPw/YoL6r
	hTZwU9pXXZz1ozy7INtkjrFDcRJaKNOXf0xYLhtrLu8gu9gZAU61HRV/XPuU57tdEDAKFvAS5/egE
	bdcDYDJTY/arYwUqce3VR8H1dr3S+aqKVe9pJNGdq4pig9IawVjLRRNexUibXd8QGU2p+WevI3c04
	DN/b0vYcDvuxDAQR0PIO++07AZbVPCMxYpACK1nCgRi/NBQ/gX0lk5ITztQ04Gs50na6cmTctGEDL
	XDyJ14E+gU0AImrem/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cZo-00AEVx-32;
	Thu, 30 Nov 2023 08:39:16 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8cZj-00AESA-2L
	for linux-mtd@lists.infradead.org;
	Thu, 30 Nov 2023 08:39:13 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cfc35090b0so6471465ad.1
        for <linux-mtd@lists.infradead.org>; Thu, 30 Nov 2023 00:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701333548; x=1701938348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVTTWWtZhFqG9GH7YEwD3bL8dviTGVgBf2t5fcazJks=;
        b=FMgn/zFiyHFKocDcIU9b1NpovOVQOr0HiuLP8QKrb42sFWOA7dFOmgfg8TJJdKKW59
         3r/EZhcKrMjmpW6A1jl/uYtLf+zB3Vr/JVYB7EQXzgk1Ug1l92syVNvyByved7C5CpV0
         PvuVMFguilb49cboYzqioXiaRGbJse8SU/URFKk7qCxGrXxsV8FQSU2zVNbTWL93yTE6
         uIiLCo2A0U8NFqni4qV75+8I9uB6mH38WVaZ6jEhfw5vdf1VBrJ34bq4PhlHk2nxX4uE
         WOPvWunaL4RdTdQMyiQSZHbbpJCtuBxanXaM+6rZQSy1jPx4lHyK4lwHEptCqkk6TFFs
         xJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701333548; x=1701938348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVTTWWtZhFqG9GH7YEwD3bL8dviTGVgBf2t5fcazJks=;
        b=d+IgPlp8XohboBBrkajKesJDD8tRVeuG9tW2yJ30L+v78TKQXUdFBdgEQRzupujPqC
         /wF/e+B9HaYD301frshDzOBig7omGi/doCd9N0bHec23AP8K6VQRYhdw/zvEgg6VXVtm
         vSVRwLiM00RPzpRbHncx7BntLQa382BEoRMdtKU3B7x9vtyM25RdOcQ8HoiE5QxwRJVe
         qVqCTwc7tEuvpzIw9uWvY+yAHPFsB+FshSqdeJmTAosbJSJegrydQNFCKceB+wY6w6SI
         owjaUQbiwK3NTcA7PcI7Jg6KX4g6gsJYYy2ZImj/kUj3I3P7pgiHbJptmgRe3vWnlomF
         4wQA==
X-Gm-Message-State: AOJu0YyESDsX7UGX71mSxzIkJ2WrmSu1DJOT57j69USO0zL0f81GD7/X
	lnDHPmf9FnlsbagSdv2JVQU=
X-Google-Smtp-Source: AGHT+IHCvPcZKZxT3vJt/Tlpr6uavRwolz/TAQOyaS5sc6voxNkev1XbIWdAKQW3wJhCtL1hmn7vSg==
X-Received: by 2002:a17:902:f68d:b0:1cf:fc5c:75c4 with SMTP id l13-20020a170902f68d00b001cffc5c75c4mr9442055plg.55.1701333548074;
        Thu, 30 Nov 2023 00:39:08 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id y11-20020a170902b48b00b001cfa4178981sm736641plr.309.2023.11.30.00.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 00:39:07 -0800 (PST)
Received: from hqs-appsw-appswa2.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id EC2DB80650;
	Thu, 30 Nov 2023 16:38:45 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	jaimeliao@mxic.com.tw
Subject: [PATCH v6 3/7] mtd: spi-nor: core: Allow specifying the byte order in DTR mode
Date: Thu, 30 Nov 2023 16:38:50 +0800
Message-Id: <20231130083854.55221-4-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231130083854.55221-1-jaimeliao.tw@gmail.com>
References: <20231130083854.55221-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_003911_760445_5D98ED14 
X-CRM114-Status: GOOD (  13.35  )
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
index 1c443fe568cf..f659dd037a25 100644
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
index 93cd2fc3606d..fe1259b32110 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -140,6 +140,7 @@ enum spi_nor_option_flags {
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
