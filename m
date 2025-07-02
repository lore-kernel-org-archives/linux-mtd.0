Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BAEC8303F
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jul 2025 12:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1VUEXTxMKKmpROxZ/0G9eGKJvg3fR5qBtIECJhVHe+M=; b=L/Mj9ORYTnkIuJ
	U5OkUd/sB1/5lNhCsWj3jt0Z2M/5h5Df22D84Lw5d5DG4ElFH6xC2lc9NMjZgvxPEfM/1aFX7DEak
	VLfE07V4QB0u9W9TgxoUKThtvFrcLbyokUVfSCsjSEWozLM07PA0QSASoC4Fnbkf3BPiI/9lrKPiV
	ykBnStzghHsWj8ciYMdOOXKaHKb/cKLeZxn4x2BWA2AXYsjJs/IXNKN+piZYQH/KAIMEiEi4E4BrK
	UXVbu4mrhp2w8bMj5aaDLMnt7fEdVspHPnlnY6kKDItEmp3p7CePsq06zCywDKvaFsQjY7dvPYqAh
	03NAWiGGtQmr3GzeSl0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwqg-00000008LlD-0DuI;
	Wed, 02 Jul 2025 12:46:02 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwgp-00000008Kuv-0pAV
	for linux-mtd@lists.infradead.org;
	Wed, 02 Jul 2025 12:35:52 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a5123c1533so2470109f8f.2
        for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2025 05:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751459749; x=1752064549; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jg0LOIPqdIozUkUH06/iHo0/WcHNQMfp9668OgWITsE=;
        b=QIWSFwD2+tRv6mdEb34I+lEGEg9nzGGloDAlGz6gt/cGiUWE4CYs23tk5rog5y4wOk
         LY930r2U8uN1d1tqP/I9vr9BeLilbJJ2gwsulvrMBdFJEH1UGncZaz1RibtN7RSIwECK
         VWIhcPKQgdMn1C/HZGzO864Pcdp+jC69O4uviLVzsIb0xFvpsF3sShz0Mc/S58cnv+fq
         6uziCJcHmumYYx7gkfFBgXWbn3wrN8WTWBa8EeB9+P3d2j04WSq3/p+j10hbvlKYjVZp
         fE7vjrkeEk3b9JbSp0wJGxunBTiLHARJ4Pw+9YqkUXON8DPuZ5r0da+RgRqVnZ00WXgb
         wKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751459749; x=1752064549;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jg0LOIPqdIozUkUH06/iHo0/WcHNQMfp9668OgWITsE=;
        b=OGWTbc9dWf1CKs31kdVE4zdMWeMN54QNMv1YDEiHXkzAmGnuoHXgE2rY5ENoA7LxRI
         PI98qyM7DGqvV6rDu2VmyQD4NawhOdqcGR6IhmFNjFsGiO0C9uXuxg4beneiQ88kZwBB
         Tr7E+0KvtBNIHtHSwgk0t2vqvT56i8sJxLkGno+ocROEXg5lskXZuPIL+3EoxJvpEco7
         93evV7q2hnGGRI3mrtkak2h1b+iWJkMACvDT8pU16/XcaYmA7GlBo+KSusHzr/XbGLo3
         XUISW5JSwFQnHh6nH1WAqkV/dSNS218X3+eLMJRS1s3OMWemvTnEMqm2cnkFZUfymnPm
         lr3g==
X-Forwarded-Encrypted: i=1; AJvYcCUZ3CymRk25XCDu4UNdJF20k3rl+jrB8bn8tUjU+BKBkumIbiDH9bP5Y+n0hpozZKr8+esFJHiwB50=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/6JwKkZPb5x9gMh/IYpy7X+1AbfBDCF6ijNSXcFtj/0v1t0ZQ
	dN5wtxVENGGlur1WbkPxdpR2aLHR261uDdYTYIF4RO66Q6hEUj3L+3de
X-Gm-Gg: ASbGnctDtFqLXIo7FQacQtLPI4JahLzARW2WFABMAUp1L7fDVTiM4/nvG2gphrM4Y/n
	7XuFXVCQfaNWKXeZN8etZl//0Cb4T/Aj3JvyT9ESJ0yF+t+OPXTkGOM6ItsGbAvEzIbK2fMJTld
	3EDVoUvei0Fn6chQZLKQiLnvUnSgbW8eZFZO/PyjpV5N/SjZir0y5OSJqz4IXsqaMsdBeuBBTSa
	eliZfBwArp+S4YQXzB3WYNGB8OUxxfmwvj4VchxEVS0IwtAL6MLTqhEqeUB11YEPU1vVsQTpE2g
	YSx7dKHpCxNZdbnMe3yVs9LOzx5KkMU23wrbeEuQJWqSem3uMPFX+nTrRrWtmTWzegOXbslzrrr
	MdAXx8niN6piXsxM=
X-Google-Smtp-Source: AGHT+IEZ7JKobG7elvoBdLsbn735VSU4fEnUj1mgXLW4+2+SXlswXfAlX7UhudyRbE0dWHkfsFfn2Q==
X-Received: by 2002:a05:6000:18ab:b0:3a4:ddde:13e4 with SMTP id ffacd0b85a97d-3b20253882cmr2157966f8f.58.1751459749144;
        Wed, 02 Jul 2025 05:35:49 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a892e5f8a0sm16208688f8f.96.2025.07.02.05.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 05:35:48 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH v2 0/2] spi: spi-qpic-snand: enable 8 bits ECC strength
 support
Date: Wed, 02 Jul 2025 14:35:22 +0200
Message-Id: <20250702-qpic-snand-8bit-ecc-v2-0-ae2c17a30bb7@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIonZWgC/22NQQ6CMBBFr0Jm7ZhabVJceQ/DAqYDTCIFWiQaw
 t2tsHDj8v3kv7dA5CAc4ZotEHiWKL1PoA8ZUFv6hlFcYtBKG6WVxXEQwuhL79BWMiEToSOrLrV
 T1uQa0nMIXMtrs96LnQOPzySffmMrcerDeyvPp++6R1Lmb2Q+ocLc1GdKoaoic2u6Uh5H6jso1
 nX9APl+Ot/LAAAA
X-Change-ID: 20250208-qpic-snand-8bit-ecc-dc804fd08592
To: Mark Brown <broonie@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_053551_239950_D41328CF 
X-CRM114-Status: GOOD (  12.63  )
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

This small patch set adds support for 8 bits ECC strength, which widens
the range of the usable SPI NAND chips with the driver.

The first one is a preparatory patch which adds some defines which
allows to avoid using magic values, and the second patch implements
the actual support.

The series should be integrated via the SPI tree, as that contains
prerequisite changes.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - collect offered tags
  - rebase on tip of spi/for-6.17
  - update cover letter
  - remove 'next' prefix
  - Link to v1: https://lore.kernel.org/r/20250502-qpic-snand-8bit-ecc-v1-0-95f3cd08bbc5@gmail.com

---
Gabor Juhos (2):
      mtd: nand: qpic-common: add defines for ECC_MODE values
      spi: spi-qpic-snand: add support for 8 bits ECC strength

 drivers/mtd/nand/raw/qcom_nandc.c    |  6 +++---
 drivers/spi/spi-qpic-snand.c         | 21 ++++++++++++++++-----
 include/linux/mtd/nand-qpic-common.h |  2 ++
 3 files changed, 21 insertions(+), 8 deletions(-)
---
base-commit: d2c0e95525216cdc695d0066ee2f70b8adfbc536
change-id: 20250208-qpic-snand-8bit-ecc-dc804fd08592

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
