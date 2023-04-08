Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5B4C77B6F
	for <linux-mtd@archiver.kernel.org>; Sat,  8 Apr 2023 06:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41OMchu/4rwrNX0DSz4xDS9YSQPCex1kbqXyW6faI7c=; b=O4pkYG475OLr0I
	Itm+0PR5JDtt1cWOTDZjkdKcaS75FPEWDtxG3W55vWihusbiMKTTsrBvtjYcP/SHfWi91i1JH5RdI
	yrPfVUUh3Zgq4aBk15HsXBboifZewUxBLXeGxNgPYba8l2q4PcsqQ/AaRTXWppHNp4lVkq3Etx/Qe
	NclfSNQt6IwmIFIV65hMxjUlMFflQKQlIQkeONZaSR7B6l/cvDWBnzhZHQ0WURfu1CoYkQ+tFRhKQ
	eaL9e8MDlTPWMZukWqpbDKjMJp603v7aomx3doIPxsCnQflFW6fQ0fRyDhQorz+DZgsh2eKVcm+HJ
	oizoSKuN7a5JaxZ9/NOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pl2Hc-00Bpiz-1W;
	Sat, 08 Apr 2023 06:42:44 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pl2HX-00BphT-2X
	for linux-mtd@lists.infradead.org;
	Sat, 08 Apr 2023 06:42:41 +0000
Received: by mail-wr1-x435.google.com with SMTP id e2so380049wrc.10
        for <linux-mtd@lists.infradead.org>; Fri, 07 Apr 2023 23:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680936157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIF4uUtfUbeGTIPeLcqdmP9uFxVPe+NUKhdRTEkmOAE=;
        b=zz6FKlssLfpATdYowkzJWuQswT5d7DVNch2T7Ff46Wu/xKjVv4qjBQQOGhWM0yoU4B
         jyiXsS8NGupzZ66ItwBVrXZnYrAv3COhcBSKLZyHlFw4plkcGbyNdzpYXvNeK7yuyB6e
         IoBbS9gDtX/ZN9Dr61Rxt1FOP1XbYAqM407Bcjb3aIuq4rx/6zXIYQ9ObdbbR0FKXsxQ
         FdHN3leYQ4UFxbqtXBqZP4AbYu7HMC6ZKgORN1kVlCCc3aSr6yPpL1OG5WnTF3q+1yBH
         wP23ESWxoohS38V5XFlIMLsavGLrqWxxdUxyxZIFsp32HEJvXpaG2yHijHpRURQAYZcR
         URrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680936157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIF4uUtfUbeGTIPeLcqdmP9uFxVPe+NUKhdRTEkmOAE=;
        b=41pDOvBolsSNUfbV924BBSDUxAGrgeOo983VnQc2tnRt592BVO9lu101KB4cHmgWFw
         krmYmXDet5FL3BybfADRKzyNmyQgYHtB5g9jVkUzzBjYLwB8kamWxQMSWLTCNMxodJcv
         X0FpojgIwCMw5f+QEnf4ot/3IYDK2BvP66RFgHBgCNiF5BDtyV+nlJTpFYGnGwEVziUM
         a+EAQCHTvLBnXntbL+xgmd6vEL3wW99hEGk7c2OWwvFiXeCYF6uAwA9nyyXN7RkqkxCW
         zaB7yomnzMeBphlqnjwnB0py6XlajRAr29LUOePNaJZ1LU2RlvswGqYutrHUwqEwdTAf
         qlnA==
X-Gm-Message-State: AAQBX9e9iZZnfM6YtoPUboJ6XaIvbYAuDkNPgyltZ+Nq+G475+QM5lR+
	RATQEzamIfYdEdHpTU+U/7x4i0udS8DL+QtgOog=
X-Google-Smtp-Source: AKy350b6mk/ZNyPOcr0AYjZlCab88BRfQc+PkXhlzNlKNoEWy1hnfuv5YyTfsR7l+nnDvipy9r34sw==
X-Received: by 2002:adf:e643:0:b0:2c7:df22:1184 with SMTP id b3-20020adfe643000000b002c7df221184mr2651582wrn.56.1680936157325;
        Fri, 07 Apr 2023 23:42:37 -0700 (PDT)
Received: from 1.. ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id k13-20020a5d66cd000000b002c707785da4sm6113045wrw.107.2023.04.07.23.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 23:42:36 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: linux-mtd@lists.infradead.org,
	tkuw584924@gmail.com
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v4 0/8] mtd: spi-nor: Add support for Infineon SEMPER s25hl02gt and s25hs02gt
Date: Sat,  8 Apr 2023 09:42:30 +0300
Message-Id: <168093614108.51189.3153773628255664983.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680849425.git.Takahiro.Kuwano@infineon.com>
References: <cover.1680849425.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1864; i=tudor.ambarus@linaro.org; h=from:subject:message-id; bh=i1k2niMHpn9GQQ2jwT94E6gMaMbpmt4eU+gud8ZWxzM=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBkMQzUeWh+vvastgIc7ecfwlideonNXfczj0rd4 y7Hd6TWNpGJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZDEM1AAKCRBLVU9HpY0U 6ehkB/9pRHzsLDEjn7aFDWVbehOQbY3uQQ51EdlDlTb98KTnWWR5RTFOc+BFg4VA1Lc/hRdzWKj vDsCBBVyDjeglaPKMAqpWxkHhJLcOqDrzT/pFt7XPKNI9gHeEqa17IY8XnU5K4HyC/D6AzOe0C4 OyoDhXc1O5qsfTnXwo3+X/I3ynxvV+HnXPRMQ/nanqhNPSFLTRgF42fynmF6voKSlKjKhwimKVy VJruWhZvpUGcbofDWjomJWZosL9em7vqjRHPe/nENteeNSU+yvomwc4I9KkK8u4ocbrfSWJOHaq 49JmhHVY1cI49SFxWkXB4oACO4XrRUCqf4g9xP3mxajHPios
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_234239_825676_2E0F9534 
X-CRM114-Status: GOOD (  10.17  )
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

On Fri, 07 Apr 2023 15:40:56 +0900, tkuw584924@gmail.com wrote:
> Infineon SEMPER s25hl02gt and s25hs02gt are multi-chip (dual-die) package
> parts and the datasheet can be found at:
> https://www.infineon.com/dgdl/Infineon-S25HS02GT_S25HS04GT_S25HL02GT_S25HL04GT_2-Gb_DDP_4-Gb_QDP_HS-T_1.8-V_HL-T_3_0-V_Semper_Flash_with_Quad_SPI-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c7e7124d1017f01b9a5055b7b
> 
> The key characteristics of multi-chip devices are:
> - Each die has dedicataed registers so we need to configure and check
>   registers in all the dice
> - Read ops can cross the die boundary
> - 4-byte address mode by default
> - Legacy chip-erase command is not supported
> 
> [...]

Applied to git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch. Thanks!

[1/8] mtd: spi-nor: spansion: Rename method to cypress_nor_get_page_size
      https://git.kernel.org/mtd/c/120c94a67b26
[2/8] mtd: spi-nor: Allow post_sfdp hook to return errors
      https://git.kernel.org/mtd/c/e570f7872a34
[3/8] mtd: spi-nor: Extract volatile register offset from SCCR map
      https://git.kernel.org/mtd/c/706fd00da031
[4/8] mtd: spi-nor: sfdp: Add support for SCCR map for multi-chip device
      https://git.kernel.org/mtd/c/7ab8b810757a
[5/8] mtd: spi-nor: spansion: Rework cypress_nor_get_page_size() for multi-chip device support
      https://git.kernel.org/mtd/c/6c01ae11130c
[6/8] mtd: spi-nor: spansion: Rework cypress_nor_quad_enable_volatile() for multi-chip device support
      https://git.kernel.org/mtd/c/f24d423a5c4f
[7/8] mtd: spi-nor: spansion: Add a new ->ready() hook for multi-chip device
      https://git.kernel.org/mtd/c/91f3c430f622
[8/8] mtd: spi-nor: spansion: Add support for Infineon
      https://git.kernel.org/mtd/c/df6def86b9dc

Cheers,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
