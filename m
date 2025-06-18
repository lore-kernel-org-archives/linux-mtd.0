Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA6BC7115B
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jun 2025 20:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b0zxFJ42cdGpk8G1iakXib4I/LrSuau2/FtO6sp4iGg=; b=ZiHD6EA0hszcp+
	/0LL9fv1bsSsSq74H4RkjnXlt2ZGV7p8kO75ZuEovBY9AHs6eREnPGuZT5jHJV3fWfIdifmHvTRDW
	ROE44Rz+D0/6Jdk2WGVlerrYQI9nVvaTNOr4li9vVvuYAHHcPY/Wcr1BaIyrovdUZ4XzNlE5nzJl/
	laG8V/K1hQdxgtH8Mmy0kWdTQJOLhIAhWvxDcLSUzuEQvxfMMaQU4HM6TaddBxueiuS5WDeqkT3Tv
	799wSdEiIwIx2Mcdknk71O5EhydYFTCVpmgwJkUel7xBfWuVvflOO8qilaadZiVpn6MInp4X74ii2
	qD+D9MAzikvumMG7A2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRzJN-0000000BJpW-1Ogw;
	Wed, 18 Jun 2025 20:23:09 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRzJK-0000000BJot-2Wkb
	for linux-mtd@lists.infradead.org;
	Wed, 18 Jun 2025 20:23:07 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a54690d369so106923f8f.3
        for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2025 13:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750278185; x=1750882985; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4oRSqP7dY+WE1W0lXhOBXepJSbajb4/5a0aRiQRgmg=;
        b=F9E3bYIkfyrSX1sjj8P8bgHyvhj79QHbpq8prWB9kKJH9lwVms6d4eEv1qO+SEYEEK
         it/9nMdZqEsqjPmkuQFwtoR6DQtYOV25wQmSm5Oh/+mtNB0tccAw/3LhL9q5BFm04a2w
         JC8OFn7+RfDrDKBeLp+oWjkwdUJT0u5EJSR2+mp4UgpVkKl9KjIy31AkHA+0ijHZ+VOZ
         qWRm9Btz5qC39OZMc5DUpW75JlqtyNqAjI5l2W0L7p1GqQ414aqXR2FhWjr9TROi8IQm
         lhpZlGgUQwvwn2qmAu1Rwn9/oQ0lUM9PaAXhR/0APQ5KRGBw9DLcNv7o45M9/N27akhF
         FSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278185; x=1750882985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4oRSqP7dY+WE1W0lXhOBXepJSbajb4/5a0aRiQRgmg=;
        b=nqyuscgKgob3QqmT4ZN7u7Dsaa0knMD/Gg8srgk/EDzALZ99BEEDnKW1UYy2ahOyGi
         i0P6NpF4hVHwbz2gu9nAY7tqp3VjiUmmazSbRZOhOF0dbqOAAczUAtyKfo6o2O34rQHQ
         Y3Jz4GP9Fstb8mawS9XBsxQLbQgV6Si6CPZnREem5ZPgsQslFZ6+SJ4daZXXknEIt2V5
         QkKrs3mX6H+OI4Hktel1jbMbAUyKNY6GKdWBMfn9p47lNRBLbivx6GLbh7+eSkfnw7rl
         lBZT+b6JC4zPe2Ph4lfXBN4t5HPaqFuOmBsn92wU9gxRvyuJ5e6lzToGaY8Vn8yddX0e
         E/XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFI8evarVQTfm/0znZ4nkQU822KkLcAwidFt6/O7ULpi11iccqh05wHiUfFZ+54WGDigSdXAlEnok=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZSXKBsBgUWiKE7SYFppxeLYfJvrzv2GcIAmLoaxClzw8bgxnu
	puf4aGus8fKMc5ZKE2Xr3BYSBrDM4Ajo5CF95LdrNxvzwMqZQ65RM4+1CMvP6rrK
X-Gm-Gg: ASbGncsm69lcbvZEfX3W8FmtIe7rEoD47IBb2C6sA7RmA3M5xC3nR+D12IVpSSKQNfZ
	cvFU4L5MpuFzP5JenU7Or4iOEMnQxjeK559G5bGJkGNFw7BELmqDKlmfBplKmfjNwFc4Xqc7tuR
	C7H41bXSu/XA1hHFkT2K7n8h4RcEsnziBaL69zz0o21hgDJrKSil1AnnuJzsndOjBRUVPC6aA66
	pOZc/IUtEpL2XYqPxrO964heQZ0Sno6tjYv0pYGlHNPZulqB2l+WU8D0cnjkm4Sw5Ua4Dro5+WZ
	xGdG9iyyqv1VsBDta3BPPZtwQLx6psReXJoi4NIcJoLtQrk4VpFSPYOEQDB2/yTjq4aZg4iQWT9
	xcCj+ytB8UykPE18=
X-Google-Smtp-Source: AGHT+IF2Yt5Qr66WFJjZ3nAxSDDAh6K93FuxUaCHHH3uM6Wtjr8nP1UL4rf0BHUdcEdxOWb9HzdFng==
X-Received: by 2002:a05:6000:2582:b0:3a4:eda1:f64f with SMTP id ffacd0b85a97d-3a5723a3b64mr13525613f8f.30.1750278185178;
        Wed, 18 Jun 2025 13:23:05 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a568a633ddsm17617951f8f.26.2025.06.18.13.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 13:23:04 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Wed, 18 Jun 2025 22:22:49 +0200
Subject: [PATCH v3 1/2] spi: spi-qpic-snand: reallocate BAM transactions
MIME-Version: 1.0
Message-Id: <20250618-qpic-snand-avoid-mem-corruption-v3-1-319c71296cda@gmail.com>
References: <20250618-qpic-snand-avoid-mem-corruption-v3-0-319c71296cda@gmail.com>
In-Reply-To: <20250618-qpic-snand-avoid-mem-corruption-v3-0-319c71296cda@gmail.com>
To: Mark Brown <broonie@kernel.org>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Varadarajan Narayanan <quic_varada@quicinc.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_132306_648336_91196410 
X-CRM114-Status: GOOD (  22.71  )
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

Using the mtd_nandbiterrs module for testing the driver occasionally
results in weird things like below.

1. swiotlb mapping fails with the following message:

  [   85.926216] qcom_snand 79b0000.spi: swiotlb buffer is full (sz: 4294967294 bytes), total 512 (slots), used 0 (slots)
  [   85.932937] qcom_snand 79b0000.spi: failure in mapping desc
  [   87.999314] qcom_snand 79b0000.spi: failure to write raw page
  [   87.999352] mtd_nandbiterrs: error: write_oob failed (-110)

  Rebooting the board after this causes a panic due to a NULL pointer
  dereference.

2. If the swiotlb mapping does not fail, rebooting the board may result
   in a different panic due to a bad spinlock magic:

  [  256.104459] BUG: spinlock bad magic on CPU#3, procd/2241
  [  256.104488] Unable to handle kernel paging request at virtual address ffffffff0000049b
  ...

Investigating the issue revealed that these symptoms are results of
memory corruption which is caused by out of bounds access within the
driver.

The driver uses a dynamically allocated structure for BAM transactions,
which structure must have enough space for all possible variations of
different flash operations initiated by the driver. The required space
heavily depends on the actual number of 'codewords' which is calculated
from the pagesize of the actual NAND chip.

Although the qcom_nandc_alloc() function allocates memory for the BAM
transactions during probe, but since the actual number of 'codewords'
is not yet know the allocation is done for one 'codeword' only.

Because of this, whenever the driver does a flash operation, and the
number of the required transactions exceeds the size of the allocated
arrays the driver accesses memory out of the allocated range.

To avoid this, change the code to free the initially allocated BAM
transactions memory, and allocate a new one once the actual number of
'codewords' required for a given NAND chip is known.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Reviewed-by: Md Sadre Alam <quic_mdalam@quicinc.com>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v3:
  - rebase on top of current spi/for-6.16

Changes in v2:
  - add 'Reviewed-by' tag from Alam
  - reduce kernel log spam in the commit message
---
 drivers/spi/spi-qpic-snand.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 77d9cc65477ad35a3da795d8f6d34d533b65bcc4..f2e1a27b410ddb98d1dfca52898cd5fe38308a2c 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -315,6 +315,22 @@ static int qcom_spi_ecc_init_ctx_pipelined(struct nand_device *nand)
 
 	mtd_set_ooblayout(mtd, &qcom_spi_ooblayout);
 
+	/*
+	 * Free the temporary BAM transaction allocated initially by
+	 * qcom_nandc_alloc(), and allocate a new one based on the
+	 * updated max_cwperpage value.
+	 */
+	qcom_free_bam_transaction(snandc);
+
+	snandc->max_cwperpage = cwperpage;
+
+	snandc->bam_txn = qcom_alloc_bam_transaction(snandc);
+	if (!snandc->bam_txn) {
+		dev_err(snandc->dev, "failed to allocate BAM transaction\n");
+		ret = -ENOMEM;
+		goto err_free_ecc_cfg;
+	}
+
 	ecc_cfg->cfg0 = FIELD_PREP(CW_PER_PAGE_MASK, (cwperpage - 1)) |
 			FIELD_PREP(UD_SIZE_BYTES_MASK, ecc_cfg->cw_data) |
 			FIELD_PREP(DISABLE_STATUS_AFTER_WRITE, 1) |

-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
