Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B270C04AAD
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 16:02:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EF6B205ED
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 16:02:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rcZL/q5M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jCllPuGG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EF6B205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6VM8V3bGzrNXlWAa+wWU/UR8IeeKqQ6fJst27j3Q10=; b=rcZL/q5MmdVgWw
	JSibbPBcMgrd9GeNfWXcPaaM3wWpD/p2gWWQhpuRr3LWyfbf+Hz2x1E/4SE/yKxGOY6wFA/U3+MKE
	FAmc82465+QMK2xVU2meBYpmFsIFN9a/lJSXR24zP4ksABjCgIuVuVW9dcm1fC0/zAVN9tQ7aTd/k
	2egJ6k8S7c3ukZGgqEZElXhDmbhQzLLPcHK83eRTRZcMEibzHnJ/75iioNfvJgLZgo0nlpPRA6/av
	DxGEssYblM73carK460LIkXyE5vJa9yL+yVubZ4B3Jo6n0V0IgSeLvS6aABWLlHmN1vjeROoZbG7+
	wvYUY9my+/P+E/sLtOlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hO2Y0-0001wY-CZ; Tue, 07 May 2019 16:02:28 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO2Xw-0001vH-ER
 for linux-mtd@lists.infradead.org; Tue, 07 May 2019 16:02:25 +0000
Received: by mail-pf1-x441.google.com with SMTP id z28so8901636pfk.0
 for <linux-mtd@lists.infradead.org>; Tue, 07 May 2019 09:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
 :references; bh=oVg9jhszQTOKPX1D60R98eWmwxuEwcGgeC32BmiCC7A=;
 b=jCllPuGG8CrK7CTMwCkPKJYL8zWr7vbjz1mIx6XznvK5UfqWJ+oGbQwQ7BrGMxrZdR
 EMskKWRZWvyoLeA0ZHjTBMw4Ezwyb1li4pFRfnJNzc3Rw9lHnZZMQvT1n72ndA34inD5
 rK36vY68JHuoh3mG4Sjo9j1fYBLFwhTB9bvgtVqA/n8zqeMcKFi/esIQxprmjjyg69k1
 FLWWsD5XNk2baGjknlh6l96sRSsJ6GTQ8vcfyT/vtJmprBC5zB7GeMn8woGr3+NCdJcf
 8rQnyVPK1SqZh42lawjJFYBpMOnwDMNmxamehqpzlhUInJWqRqO9lfzmUA+dTY0AeWKg
 M5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=oVg9jhszQTOKPX1D60R98eWmwxuEwcGgeC32BmiCC7A=;
 b=UB31ewBX57g+4LzrEc5SGNgvGcLkvdYZvqhdZrGTufALuKWM6Wt5Ca1eCZrw8wqBCA
 OhecxVeIGKNai/gX8r1DflgmQh8w1E/lcXZfA2zJ9jZOFPCuLRJ5kH8t2S39/Mo5U3Du
 Jvddh7eKqyuWKRecH+YFXWpva8q+FZKCgbwXT1oYeKjf8fnuiCRqD+S/Z58LEDYL5keH
 AIEitZxFrB0hHYlQOK0R+12S08lEQmbYCCfTXS/EX2mwFGTBESGicJxuDeNOvRUL33ic
 ZGfNlrRQsrugBLY3whSb09rDR9XZB5oVYQkiMEc0mR5FOIa9zpQe/13bBCsjxCSIsCsX
 6Hng==
MIME-Version: 1.0
X-Gm-Message-State: APjAAAUSI0rlG5bNyzii07dGPXgI3ErHTT7fbU0liRcDL6Ip3bApqpOF
 O2K0e68hepl05ODBrpM/n6/6T/J973g24GxsqiY+OYy5lX+19qfZegUvGXiHKi2sIr3/b6+uzAS
 ISHnNOP2Z9icgVCaW1hw=
X-Google-Smtp-Source: APXvYqxvTAzllwIFd/OziGSwstlA9MxwXjvNPS8YISEepDqnYpycNRekLcN8eZHCxxqH0o+kb7b26Q==
X-Received: by 2002:a63:1cf:: with SMTP id 198mr32137329pgb.155.1557244943756; 
 Tue, 07 May 2019 09:02:23 -0700 (PDT)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id
 h187sm22543540pfc.52.2019.05.07.09.02.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 07 May 2019 09:02:22 -0700 (PDT)
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, bbrezillon@kernel.org, richard@nod.at,
 palmer@sifive.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v3 v3 3/3] mtd: spi-nor: add locking support for is25xxxxx
 device
Date: Tue,  7 May 2019 21:29:35 +0530
Message-Id: <1557244775-14206-3-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557244775-14206-1-git-send-email-sagar.kadam@sifive.com>
References: <1557244775-14206-1-git-send-email-sagar.kadam@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_090224_480698_290F3BD0 
X-CRM114-Status: GOOD (  15.79  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Implement a basic locking scheme for ISSI devices similar to that of
stm_lock mechanism. The is25xxxxx  devices have 4 bits for selecting
the range of blocks to be locked/protected from erase/write.

The current implementation enables block protection as per the table
defined into datasheet for is25wp256d device.

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 51 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 3942b26..5986260 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1459,6 +1459,56 @@ static int macronix_quad_enable(struct spi_nor *nor)
 
 	return 0;
 }
+/**
+ * issi_lock() - set BP[0123] write-protection.
+ * @nor: pointer to a 'struct spi_nor'.
+ * @ofs: offset from which to lock memory.
+ * @len: number of bytes to unlock.
+ *
+ * Lock a region of the flash.Implementation is based on stm_lock
+ * Supports the block protection bits BP{0,1,2,3} in the status register
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int issi_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
+{
+	int status_old, status_new, blk_prot;
+	u8 mask = SR_BP3 | SR_BP2 | SR_BP1 | SR_BP0;
+	u8 shift = ffs(mask) - 1;
+	u8 pow;
+	loff_t num_blks;
+
+	status_old = read_sr(nor);
+
+	/* if status reg is Write protected don't update bit protection */
+	if (status_old & SR_SRWD) {
+		dev_err(nor->dev,
+			"Status register is Write Protected, can't lock bit
+			protection bits...\n");
+		return -EINVAL;
+	}
+	num_blks = len / nor->info->sector_size;
+
+	pow = order_base_2(num_blks);
+
+	blk_prot = mask & (((pow+1) & 0xf)<<shift);
+
+	/*
+	 * Return if older protected blocks include the new requested block's
+	 */
+	if (((status_old >> shift) & 0x0f) > blk_prot) {
+		dev_info(nor->dev, "newly requested blocks are
+				already protected ");
+		return 0;
+	}
+
+	status_new = status_old | blk_prot;
+
+	if (status_old == status_new)
+		return 0;
+
+	return write_sr_and_check(nor, status_new, mask);
+}
 
 /**
  * issi_unlock() - clear BP[0123] write-protection.
@@ -4124,6 +4174,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	/* NOR protection support for ISSI chips */
 	if (JEDEC_MFR(info) == SNOR_MFR_ISSI ||
 	    info->flags & SPI_NOR_HAS_LOCK) {
+		nor->flash_lock = issi_lock;
 		nor->flash_unlock = issi_unlock;
 
 	}
-- 
1.9.1


-- 
The information transmitted is intended only for the person or entity to 
which it is addressed and may contain confidential and/or privileged 
material. If you are not the intended recipient of this message please do 
not read, copy, use or disclose this communication and notify the sender 
immediately. It should be noted that any review, retransmission, 
dissemination or other use of, or taking action or reliance upon, this 
information by persons or entities other than the intended recipient is 
prohibited.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
