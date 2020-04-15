Return-Path: <SRS0=fMXC=57=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C18C2BA19
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2020 22:06:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9FCF2076D
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Apr 2020 22:06:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WxnZU3J+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Vww20jGh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9FCF2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRpavwNndwIyRdtqrhJ05lGocDgVgKc5jWsuxesqkxo=; b=WxnZU3J+HXFVJ4
	1CJfOMdSDxMcEVEXMg3D8I8OyxM7+FpMXGwfeCzbMIC3Gt2eEnaq6dIwRM8yr250rjdEL3Ap+oJFN
	prZ9JLTyuY5nQI/T3WE0vqMTDCmTjFalXLmOrsrISaIVbtxT4bdQ+Ub+SLND36dbSdE8B1RKa7MNY
	m66bff5/fbFaSklN9HmS+/RFRILj8SQ/0CMfT0tL+NwF+0aCqu1MVXsOCzYZmVmabDzbnKQI/TN2A
	l2rcVKhU/NjkhUamx5W20cbTole6P//w5q9an1irP0Y40IzscA60AGalbv4Jeyl8XNLuv81qH6VYI
	Lcxu6ngMJM9qjb8EM0cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOqAV-0008C0-BH; Wed, 15 Apr 2020 22:06:03 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOqAR-0008Ao-PM
 for linux-mtd@lists.infradead.org; Wed, 15 Apr 2020 22:06:01 +0000
Received: by mail-wm1-x329.google.com with SMTP id a201so1959737wme.1
 for <linux-mtd@lists.infradead.org>; Wed, 15 Apr 2020 15:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TSH8Zz/0+b8V3ai1FRug8rbeA2NpMDawQ7Swr68gBQE=;
 b=Vww20jGh73nudzgVXWPkzHO1ftBq0ZQCF/ZP+oJYJ9pF8DrKmMd6GoCN/lVIAE1wpk
 v7JvSGO+4fxgRvBMDlf4ZlibwzTh36VuE+r2kqxHATwwOCNTARIwBkj7FRKqampszJ8Q
 SdorBSvdH6knY3L9C5C6YrcyP7z5LqrQsQLxmrdSxg+O1RFLzA3tTxRu5buI6L9mFtU6
 Z2jqaJ4rLg+Oyjc7xjuQVymUgmv1Drxt3V6/1n4uNMYOUxLVHGVPuay+7YpGK6drj0R/
 U3nrtJBeoeI8cibx8AvCDcbFNWrdjUvexuGHQ7UEBOMfZ9S7m/V2TnsehOR6dX3w5zAZ
 gryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TSH8Zz/0+b8V3ai1FRug8rbeA2NpMDawQ7Swr68gBQE=;
 b=jw00WWRqIQ0T8onZ+poTvLQrVZogHnvF7VtpUYv4qWLl5wwF3SYm95SaxpAKI2gL+7
 OILu4/dWe52w+cvfu162ABTejiKkEfog2pRbhSh2QL/ItGlSOnbHJX3GOYwCi00gkiwC
 Be6Wgt4CXFwK3VThWBuZ3TX13ZYEQJsSmIQPlbqIOVPZ2JBD0k+sNw2a/8EUShS55wKl
 OWX46ihj4gkgBr6NjqKRpcJbQ9nqLzGUQLVESv/Bu1RPh3o7Zc4Qy6qjnTB0yCFe1h5E
 JDFEv4H1twEmuJxtGZUoxowJBb3qFJz3QOk+dzmtzoIy+TWn86Bkupcc9hk+TJ65imJb
 gPzA==
X-Gm-Message-State: AGi0PuaEZYxsLL0D1W7H8reGxRrXTdcIoFz9Ds1+NtFUfF0M3ItdCvZ2
 Ghe6J/FKdctTT5gElz05uOo=
X-Google-Smtp-Source: APiQypJ+keUVSmlKkrPVJTacLNMuwb6cbVrGFBfXXLMRDpS5EHRHjFEdNrwFzqXVPgBuEqM+JFkkqA==
X-Received: by 2002:a7b:c5cd:: with SMTP id n13mr1323555wmk.125.1586988358165; 
 Wed, 15 Apr 2020 15:05:58 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id n4sm1045064wmi.20.2020.04.15.15.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 15:05:57 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: vadivel.muruganx.ramuthevar@linux.intel.com
Subject: RE: [PATCH v1 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
Date: Thu, 16 Apr 2020 00:05:33 +0200
Message-Id: <20200415220533.733834-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200414022433.36622-3-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20200414022433.36622-3-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_150559_851459_8E68101E 
X-CRM114-Status: GOOD (  11.85  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, andriy.shevchenko@intel.com, arnd@arndb.de,
 vigneshr@ti.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, tglx@linutronix.de, masonccyang@mxic.com.tw,
 piotrs@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

first of all: thank you for working on upstreaming this.
Especially since you are going to use the new exec_op style in v2 as
Boris suggested.

> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> This patch adds the new IP of Nand Flash Controller(NFC) support
> on Intel's Lightning Mountain(LGM) SoC.
> 
> DMA is used for burst data transfer operation, also DMA HW supports
> aligned 32bit memory address and aligned data access by default.
> DMA burst of 8 supported. Data register used to support the read/write
> operation from/to device.
I am wondering how this new hardware is different from the Lantiq NAND
controller IP - for which there is already a driver in mainline (it's
in drivers/mtd/nand/raw/xway_nand.c).
The CON and WAIT registers look suspiciously similar.

As far as I understand the "old" SoCs (VRX200 and earlier) don't have
a built-in ECC engine. This seems to have changed with ARX300 though
(again, AFAIK).

A bit of lineage on these SoCs (initially these were developed by
Infineon. Lantiq then started as an Infineon spin-off in 2009 and
was then acquired by Intel in 2015):
- Danube
- ARX100 from 2008/2009
- VRX200 from 2009/2010
- ARX300 from 2014
- GRX350 from 2015/2016
- GRX550 from 2017
- and now finally: LGM from 2020 (est.)

The existing xway_nand driver supports the Danube, ARX100 and VRX200
SoCs.


Best regards,
Martin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
