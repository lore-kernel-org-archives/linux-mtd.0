Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A003C46467
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Dec 2022 04:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFiGT/1pK0qx1DsP/bOXJdnKpoS5CdDHvh5D/q3ZPGA=; b=LFjPn7ZEuRIXpF
	2EXvSkjDpRV6hpqEMqkRFES6WttqrhBCytiYRW1otdvF3uBSpvFZEo0o6NX0mqUiNMcDAKlz/wjzI
	rwZy9DDbLLLbQmQx+hSP4nUq010ZTfZQ+iELFb50ULdWyMODynJZ9Bf/iMQzcCXus2fqVjij4ZD08
	c7opnrYJ1up2ecJFoV0rsOTSClM+LO2VpZ44urpWyidohLs0NteIEpsuVkvmzoDhhZqATRS0OK9qB
	aMajojtAvRc30Giybs11QwBGVFgqNuhvJzaEhUZZYJ8jq/aKRwD+x0Bfq2mhwk4LoK9JBQGQfdG6J
	SfjblDj0mHR5ioR0h5HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9ehD-001W3w-9V; Mon, 26 Dec 2022 04:02:39 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9eh8-001W1h-Ib
	for linux-mtd@lists.infradead.org; Mon, 26 Dec 2022 04:02:36 +0000
Received: by mail-pj1-x102a.google.com with SMTP id ge16so6088752pjb.5
        for <linux-mtd@lists.infradead.org>; Sun, 25 Dec 2022 20:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CRiHDRLRGEN7XfGYfeHrEmJadcM+PUxYmrk5OdFTIg=;
        b=GV+gUxhRYl8TobTj0hbeYxhmgjN28h2u5d1sBet2++6Ocy+12PUvNfWmSYDku6iO/W
         0mCSKn31KTVQTv/wPqjxjTdLdRUYGLW+b3f/+KN8SN6All4iSsUb7yov6TOLDEapmkcg
         661zaoCsStoEUeSjDUAqLHj5kvACPawVL3Or72jaaf9GLVTMl1tKOZEZhAM6QeczcIOs
         PLK1CkVdRkmw3sBpLcl2sj+cdXawpxRLEV2Dxm//nZiMB56sZWhIUpmabhq1lmXp4SIL
         6DvVTz9GE6Dwt0BVloW4rLtGtJmvHf4LfrgUsXdVgNDFgs97R9nP1BwO9ih2uviUAY8O
         zUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CRiHDRLRGEN7XfGYfeHrEmJadcM+PUxYmrk5OdFTIg=;
        b=jrSesK1598IZXvMcm0pB7CfHz82m9HGBhLhf9SIxNGoaBUzM7hSG/brY1CCTwozuph
         CaHh3GuSlYiVnBKJe8YO0C28aF3cCdKFKJMugRfh4sYWU4m9qNHyC7+KTbQ7jR3iSX9t
         EwU+FcRU0wPRdX59H7JlMUt17U6SN4C7vqYDhQ9rztmvRDoKP26h/ABY1RLAJcDbHejp
         HVqevwmumyUzyaFS7R2cw5jIr/zazFnFH7Afna2//ShuhE+JfxDYtkPpFEZNftq7g1aZ
         iIn0VC1lhyAe5GhaWVQT5nAhlrPWe7S9t/waanRUAEGfgrS9SaL1NILtMDfNkC24bZv/
         +VUA==
X-Gm-Message-State: AFqh2kq0xTbwLwZ3u2VIdRCuos322fp28ulYGVtgCqXcrkBsJITIMsfl
	yXGUY/IL63b1zBo6jcM/tWfC/78pmlA=
X-Google-Smtp-Source: AMrXdXtxseLj/6+2v5WtmXAwPBKPzASL/83NUOZEdxE3I89RWZzhHvRog7seEzwnqnpYrUzXOv+HFA==
X-Received: by 2002:a17:902:ab4d:b0:189:d0e1:4fcd with SMTP id ij13-20020a170902ab4d00b00189d0e14fcdmr21011332plb.55.1672027353630;
        Sun, 25 Dec 2022 20:02:33 -0800 (PST)
Received: from ISCNPF1JZGWX.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709026e0200b001708c4ebbaesm2641401plk.309.2022.12.25.20.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:02:33 -0800 (PST)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/3] mtd: spi-nor: sfdp: Fix index value for SCCR dwords
Date: Mon, 26 Dec 2022 13:01:58 +0900
Message-Id: <d8a2a77c2c95cf776e7dcae6392d29fdcf5d6307.1672026365.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672026365.git.Takahiro.Kuwano@infineon.com>
References: <cover.1672026365.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221225_200234_827754_032D73BC 
X-CRM114-Status: GOOD (  10.51  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Array index for SCCR 22th DOWRD should be 21.

Fixes: 981a8d60e01f ("mtd: spi-nor: Parse SFDP SCCR Map")
Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Michael Walle <michael@walle.cc>
Cc: stable@vger.kernel.org
---
 drivers/mtd/spi-nor/sfdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 8434f654eca1..5df2fcba5483 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1228,7 +1228,7 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
 
 	le32_to_cpu_array(dwords, sccr_header->length);
 
-	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[22]))
+	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[21]))
 		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
 
 out:
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
