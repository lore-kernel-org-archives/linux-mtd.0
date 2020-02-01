Return-Path: <SRS0=WwSb=3V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7367AC33CB3
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Feb 2020 20:55:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 445682063A
	for <linux-mtd@archiver.kernel.org>; Sat,  1 Feb 2020 20:55:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DYynH7SI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Nt9YjEwe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 445682063A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=l5LLw+WDEyZXLu0qY1IqX2zTAd/IAajAb1W2uLg7+Tk=; b=DYynH7SIDfprVb3l5Ag3zBURWs
	FuXaxKFvWUU86lVeK+duJ+kmxaHky3nj0p65yS1UIjhVz8Y7KfZdYiqjzz4+JfNEUqKNdzex5ud+6
	ITxaoHrm82ylXHcidDZT90gYY/W4LwKrrX+Tz+1kSkYUrGE41AefzmKi2ekm/ia7N4QX/9zUJ2zzZ
	7/mnKOf1SN3Hf7iD/H9ZIak8cVew+uvU/4cfZkc5ha1af8CrtUli2eiRMtAZSx1L3CLqxfaaSKhqD
	qXS0a03Er+1s+r3SB6J/JyD1OQ2blTpA1U1UQ5NrrTkzJESGaGgIkw19HMFV9oFK+H0uByrcG+H8J
	ILDimWEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixzna-0003um-1q; Sat, 01 Feb 2020 20:55:26 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixznR-0003uF-BI
 for linux-mtd@lists.infradead.org; Sat, 01 Feb 2020 20:55:18 +0000
Received: by mail-lj1-x242.google.com with SMTP id w1so10728829ljh.5
 for <linux-mtd@lists.infradead.org>; Sat, 01 Feb 2020 12:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:references:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aDR7arjSMlMRJkwpPKCJoDo6pUjhnLXb2qa3+5T1Qe0=;
 b=Nt9YjEweiI8OfS/osWukAGNplcqDrBbC8dToCOwfdo9fiv4+2c4eQuSsLxgdKTSs2f
 rjb0NfdvyWOSrjBCoRp4NA0ebRJq3zLklaaWzLUhgFoxWlpXjHRas22rYULf3qKDnhWM
 3Tem1w/ZTuJf4o+wXbk/EmkNnQfoISdMDji9du5x5TWS0s2gOuKcIoztvRR2Q8kn9Q2m
 cNhRAT93skGLO9st3QuNFFsTabjmcWt0qCJrmoC57TBX6RLaevyB4zNZ1DrtdwfUIhzK
 YJU8L46iZmm+PwToi4+h4ykCVqXCazNIUPo1Fcpxy584XpLhhuVp4nkwtrLTwYoXHZF7
 NERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=aDR7arjSMlMRJkwpPKCJoDo6pUjhnLXb2qa3+5T1Qe0=;
 b=dmn2fILaoEQT79ukTnchZadB1vfcDTWNhDKg83+NPvyYFke858v34TmNk6G802xoE7
 R7IjiAPtsbjBRfeKiE/oWXlM7Ec/+tXgivCqlaHH4njfupkyJbWrLzBklaOSZaBgSrKv
 XVgLBb9XMZOAWh4DCtr0lAgpnG13r9tzzzPzqQJa0VkIgJ5T/IXomYGbEv+Pknf6e9dH
 /wR2896NYJxkbRgypvqqH5SHqBBskE+fbSGEAhbTTQM89OJFXiNzd/heW7dPOlU1XZe9
 6XRELD9mcxBEX2+LC7uaA84KXQBe3Ten1TtAbyxkQuqc+s9rEsb83PFi27O+9SP+9itX
 wZBQ==
X-Gm-Message-State: APjAAAXL7PF7ius9FWfsXqzYszVK/PtcXaVwWSH8VimCRYjPEdtc+2+0
 twkdjv/tIY3qRi3JUCWnYx8DLw==
X-Google-Smtp-Source: APXvYqzrckxinsJ/vh8oucx5/g5YpZqyBhzxt//Q3BTnbKB2dPYT89z3zTG1WbGsO3rm2wtySQgYNw==
X-Received: by 2002:a2e:9942:: with SMTP id r2mr9164394ljj.182.1580590510819; 
 Sat, 01 Feb 2020 12:55:10 -0800 (PST)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:43e:23d7:3996:dfcf:1d71:1e48])
 by smtp.gmail.com with ESMTPSA id r2sm7774392lff.63.2020.02.01.12.55.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 01 Feb 2020 12:55:09 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] mtd: spi-nor: use le32_to_cpu_array()
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
References: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <70ea17c5-c4cf-819c-9b47-5755d821b4b3@cogentembedded.com>
Date: Sat, 1 Feb 2020 23:55:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <610761cf-5a19-c182-07d8-8d118ca20035@cogentembedded.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200201_125517_461043_281A522B 
X-CRM114-Status: GOOD (  14.28  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

The driver calls le32_to_cpu() to convert the little-endian tables
to  a CPU endianness, where le32_to_cpus() should have been called.
Was going to use that one... and then discovered a whole array
converter, le32_to_cpu_array()! :-)

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'spi-nor/next' branch of the MTD 'linux.git' repo
plus couple of SPI NOR patches posted earlier...

 drivers/mtd/spi-nor/spi-nor.c |   11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

Index: linux/drivers/mtd/spi-nor/spi-nor.c
===================================================================
--- linux.orig/drivers/mtd/spi-nor/spi-nor.c
+++ linux/drivers/mtd/spi-nor/spi-nor.c
@@ -3626,8 +3626,7 @@ static int spi_nor_parse_bfpt(struct spi
 		return err;
 
 	/* Fix endianness of the BFPT DWORDs. */
-	for (i = 0; i < BFPT_DWORD_MAX; i++)
-		bfpt.dwords[i] = le32_to_cpu(bfpt.dwords[i]);
+	le32_to_cpu_array(bfpt.dwords, BFPT_DWORD_MAX);
 
 	/* Number of address bytes. */
 	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
@@ -4085,7 +4084,7 @@ static int spi_nor_parse_smpt(struct spi
 	u32 *smpt;
 	size_t len;
 	u32 addr;
-	int i, ret;
+	int ret;
 
 	/* Read the Sector Map Parameter Table. */
 	len = smpt_header->length * sizeof(*smpt);
@@ -4099,8 +4098,7 @@ static int spi_nor_parse_smpt(struct spi
 		goto out;
 
 	/* Fix endianness of the SMPT DWORDs. */
-	for (i = 0; i < smpt_header->length; i++)
-		smpt[i] = le32_to_cpu(smpt[i]);
+	le32_to_cpu_array(smpt, smpt_header->length);
 
 	sector_map = spi_nor_get_map_in_use(nor, smpt, smpt_header->length);
 	if (IS_ERR(sector_map)) {
@@ -4193,8 +4191,7 @@ static int spi_nor_parse_4bait(struct sp
 		goto out;
 
 	/* Fix endianness of the 4BAIT DWORDs. */
-	for (i = 0; i < SFDP_4BAIT_DWORD_MAX; i++)
-		dwords[i] = le32_to_cpu(dwords[i]);
+	le32_to_cpu_array(dwords, SFDP_4BAIT_DWORD_MAX);
 
 	/*
 	 * Compute the subset of (Fast) Read commands for which the 4-byte

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
