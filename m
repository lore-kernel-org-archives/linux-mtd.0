Return-Path: <SRS0=prrA=7Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C735C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 21:29:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F4D020663
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Jun 2020 21:29:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q+Lq1MW3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vdkf0ilg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F4D020663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=CIyglbDE14uc2pWePDhA6GGPDddFTfqAieeWbooPjsI=; b=q+L
	q1MW31jTet1n+Wf92tGtdj22cr71Ympcd9qtHBG54K6/P1xaFu7Z0f5CUahP23IFEyBi5KU9H4f5J
	0gUntoCrBfoVWdnOET0pWteY1wMrYppbV8C5D2A5ByrKwvcJqZxqoMWT+wCwhuFh9VGHpkvr7y6hw
	TL+S+I1k1mn9OIthNjYNT+I8gpGferD3U3I1Z5mflfBOMT0TiLDKSOccF7/n34UIzjJBEz+3IQRuG
	WwgQcSf/ZgTfb5w9dZgE7my3FQwCL8bmK5T32QyYm/+9rXWBd3k4YXWuzMFwrJflTKSGfF1VjqaCT
	tj2mm4WTjD4yAkq/1zLE1ePU27ZyRkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjrEq-0005vc-Tm; Fri, 12 Jun 2020 21:29:24 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjrEo-0005vA-Gj
 for linux-mtd@lists.infradead.org; Fri, 12 Jun 2020 21:29:23 +0000
Received: by mail-wr1-x42d.google.com with SMTP id j10so11381444wrw.8
 for <linux-mtd@lists.infradead.org>; Fri, 12 Jun 2020 14:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=snfMO5b6c1U6pIEGCoy7rx+lV4+ULX0l0cG6NiW0AsU=;
 b=vdkf0ilgGz4pz0tfmFHHL15RjT6iv1U85LYZia08qD0W7m39qc63ICGCRWGhMAOzVS
 us6NRmqKCgOO4GPZ75u5+vG2dFHkmIGU8MlIEYms86I5bIlOQ+83itC87y62Gqul2nTy
 50SyZzK1AvFpIQFJe1cFJhvSCAcCmI7Uqqyn1pfThoHPm6ixfv9OtACTG0UJCH62PygG
 JMm6k5auH0vp+0Vgr5kWKKfdiTFnYvSCCS2zgdG5jIFtXWcp2hw6IESdZFmWpnQKmkDI
 ljg9PPrqsH+JIzXz6wex324L7do7I11wILdoDn7Nu7BxYJ9+sQqcMKYbgNdW4BbQz1ym
 Unhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=snfMO5b6c1U6pIEGCoy7rx+lV4+ULX0l0cG6NiW0AsU=;
 b=oFqv4XgvYTWaxJxLBrFLhUVs03QSX+l5e7OwIDowxB0btTtLhfH/qOmMPcTPI16vju
 MFKPQFpM8VCyTyot2DDy/sl8QV/Q3/vocbUh3axEe4rUfu5B0EO3hPRNA113NVwWsZsN
 VokY5LF3e2HjwBIfc6ZTPH5yfAnH/1i48pqu4vLfgHI3tV1NzCTEw8gpdU7QSnKmrQmv
 BP+JA7uDwYA7wFJVldDrCMp5XQzHmJPdmS1fBfHy/gLJmbSgmjtY4Ej4QX0TFlL4y1QZ
 u3qH76ZUNV0oC8BpgpsZDWscLbUSlUhG4l/P0mYVysS/+qPryLLdG5SGZQGlmGXl5Tbl
 gn1g==
X-Gm-Message-State: AOAM531xxelOjWKdt/ORQfqVeedYAuR8PsxsY9TLV7BRVLRbiQPPRvEc
 df1Mc2UT6LhqwkIo1DMIlKI=
X-Google-Smtp-Source: ABdhPJwBIrsjDXb+JjTbUf07V8zjPgUb5Pxs4lh2oS/5SjUZonzl2Bk5GwCReCWvrtfuNSUbMSklBQ==
X-Received: by 2002:a5d:4d4d:: with SMTP id a13mr17287961wru.252.1591997360804; 
 Fri, 12 Jun 2020 14:29:20 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id n189sm10442048wmb.43.2020.06.12.14.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 14:29:20 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: [PATCH v2 0/2] mtd: rawnand: brcmnand: ECC error handling on EDU
 transfers
Date: Fri, 12 Jun 2020 17:29:00 -0400
Message-Id: <20200612212902.21347-1-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_142922_557612_3F999342 
X-CRM114-Status: UNSURE (   5.55  )
X-CRM114-Notice: Please train this message.
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
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

V2 changes:

"mtd: rawnand: brcmnand: Don't default to edu transfer"
- no change

"mtd: rawnand: brcmnand: ECC error handling on EDU transfers"
- Fix typos in commit message and clarify bitflips threhold use
- Fix typos in code comments
- change bool edu_read to bool edu_err in brcmnand_read()

Kamal Dasu (2):
  mtd: rawnand: brcmnand: Don't default to edu transfer
  mtd: rawnand: brcmnand: ECC error handling on EDU transfers

 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 31 ++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
