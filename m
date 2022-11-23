Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2D8C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Nov 2022 21:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ETwUxYqPeeBpUEdjC1Vgzln/Qn0z53N8CXIJ7wwGAJg=; b=PaX9uDk0J3t+eR
	1d1KghqrkIgWfqpFInMCv+KvgB4yu9rdkyS+PCMd/A4duaMyIVZVS5H1EbzQGeFQtH0QPCW016Drt
	CVKSmJJDJmf4IT/mO21WvzEMPxHcma5iZt2mp/BGeoPVdEmjHVG6oy+dFzvfnzqrD/A41Ksgdrdmr
	hoSj4obbrfuEk6YIhmINVG6cr1jgvAaLW75KXTFnMCvyutUrsuj7449XrVSgbXoNk8ulBReAUJQ1e
	hKXKqSrIQpPWAaIMPkxgc6UjZZrFPa8bEitBqzhY2GssQrSC5tmxy22NjjlsJINlK0h+3b1gpCJ67
	zE0mVkDFwxG2nLoOlUFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxx42-002T9v-80; Wed, 23 Nov 2022 21:13:50 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxx3x-002T8o-WD
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2022 21:13:47 +0000
Received: by mail-qt1-x831.google.com with SMTP id w9so12053027qtv.13
        for <linux-mtd@lists.infradead.org>; Wed, 23 Nov 2022 13:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jCAdz79Q9Nl+OKyzqzGeecpOB8hVla9Ab63J2ksR6Vs=;
        b=hn8hQ/eozXMiB5C6TMwm0AOG6mw/bHwooPBiXgxeZ90DttPFa3/u7OAtBOMpBX+nSj
         hsJx7G1859fRsXUMsxRPKoTHTPdAW/YiS2AGfKDandRFwGbAh1ILJn3G6uG1UFD2CUWv
         Iy3hSGc+19ek5rUa6ltWn7D79B3Rj8yNCZ6nW3jASD3QrYMB7nGIgCv7R2EMHq8g5a3n
         +4GtO5FUBv1wM2mUpgOPf/zxXtslzi9qZcfew69CKjEC+FEbRud+/JWxmYr1VNvBAJ59
         DbI7ivMeVBd8QyWhVgyD5LTb2ZC4CF1SO5ljh2SfGMJbCAQHNhOSoQZv57k4suUi/qcq
         h42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCAdz79Q9Nl+OKyzqzGeecpOB8hVla9Ab63J2ksR6Vs=;
        b=dFawBotjiC0nS+QiiXrDgXrYhSV3Ia/RCvRWlD73DyG5wuueVwxj/g5snutS7beX91
         lpvZe870xo7wUnQOfRoWVEAylxhdn9j3HqkhJR0SNjL03SGktjqEQJpOACsPCHQXwGwP
         IqG/mCOzg+bUuS31ACUJK6pP71o0+OlCyKvmqf9Ry9lq2GraP4U7QHjbl41JXBwl2MXx
         6mtOinMBe3dUIle0IBpCt4DwCLyVh/AA561CSRw1cjSP9H42FyNIo22MiLPC11M34dCt
         J5gdf9CNmiCFATlUPL5hSgMTYYDvnYwbwTNYvWkBiD+PuV2QTWJWIm85RS3JuDbkx8WM
         HWZA==
X-Gm-Message-State: ANoB5plFwchOkuYp7e8xz3Evu7o3SfxAOvOffvMcaXj+pRHPTl6fxm/j
	Y0Y7tUyoZkLo0MXMlLR30Hy2iA==
X-Google-Smtp-Source: AA0mqf6kDoFMZu4ePWxxwUg/J72OEu2pRDPGmxPTlFZFDAGC9mbXV5IpvRV0TQn56/juaryPJFIhYg==
X-Received: by 2002:a05:622a:2484:b0:3a5:2fdc:9dc8 with SMTP id cn4-20020a05622a248400b003a52fdc9dc8mr28904444qtb.69.1669238024169;
        Wed, 23 Nov 2022 13:13:44 -0800 (PST)
Received: from nathan-ideapad.. (d-75-76-18-234.oh.cpe.breezeline.net. [75.76.18.234])
        by smtp.gmail.com with ESMTPSA id cf11-20020a05622a400b00b0039ee562799csm10222928qtb.59.2022.11.23.13.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 13:13:43 -0800 (PST)
From: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
To: 
Cc: nathan.morrison@timesys.com,
	greg.malysa@timesys.com,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org (open list:SPI NOR SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/2] These are the required patches I found while adding
Date: Wed, 23 Nov 2022 16:13:33 -0500
Message-Id: <20221123211335.126417-1-nathan.morrison@timesys.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_131346_239739_FB3605F9 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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

1) The core framework needs some additional logic for 8S-8S-8S to pass through
succesfully.

2) The IS25LX256 chip needs added to the SPI part table along with various fixups

Nathan Barrett-Morrison (2):
  mtd: spi-nore: core: Add in framework for 8S-8S-8S Octal STR mode
  mtd: spi-nor: issi: Add in support for IS25LX256 chip, operating in
    Octal STR mode

 drivers/mtd/spi-nor/core.c |  57 ++++++++++++++++++++-
 drivers/mtd/spi-nor/core.h |   5 +-
 drivers/mtd/spi-nor/issi.c | 101 +++++++++++++++++++++++++++++++++++++
 3 files changed, 160 insertions(+), 3 deletions(-)

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
