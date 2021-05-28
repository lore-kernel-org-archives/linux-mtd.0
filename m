Return-Path: <SRS0=UlXy=KX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A99C4708C
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 07:25:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94AD1611C9
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 07:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94AD1611C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VrzoArdNFVoDQqEyQ0Ov/y07EkYe8ybD9GFlRNt9XTw=; b=k+u7daL32Rvg2x
	5DlvrEFgOYHxDR5Y+S+TL2YaqV548axAceEqBHAnDLcqgF0r7fVYMJO1sBtLl7lFf04ZKR4eTn+0b
	SoAd9zyu5M41rruuxzAXXuXGwFXWG0vur8I7lJPOxYAkaZRO1OkmxyGcP1HXQH+0QTcwLNkP0hY2E
	imUjJL63XDbUD72/qt/QUxqyLIlTR09BxAg40cYAwpJzR1MuALGtxv6qUfdtseF6vJlEFcuKUY8hQ
	GLoCdfoEhm/iNLH6TpLpahuuPNDKwcc42mzgo7CjOt5lxwySx+oGoQRt1Zb+FnRU9akdr3o4IHNDP
	36Lbc50t7ONSYa3Xn0dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmWqo-00CxoW-K9; Fri, 28 May 2021 07:24:10 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmWqh-00CxlE-Ap
 for linux-mtd@lists.infradead.org; Fri, 28 May 2021 07:24:05 +0000
Received: from mail-internal.denx.de (p578adb1c.dip0.t-ipconnect.de
 [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: noc@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3E35682CAC;
 Fri, 28 May 2021 09:24:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1622186640;
 bh=NfjgOcSAiOExjKOX7ld2ADzJG7qdNwxiZWM1VBqYt9E=;
 h=From:To:Cc:Subject:Date:From;
 b=o6zo5DDxNTFdf/fgKJmQMvNkeb32LFTkr7UqaQiF+06lPL0IF4HidUepuIklIFIND
 mBx54zWoayzCp24D+NKnVDOjh1ZIHQ3PK8ra+8Ofg5gpd5uvgLC/N6tjYqYbYe6Ix3
 AHk5Q84ZcYSUkA5RtJ0dIRl0DUMuDVopyuIoE1Uk56LfV0cYhz9DnM8NipRwkl3X71
 4WGQ0RLFTiLzVI/VMa4kzNP4nVemikoLJ2aSBod5UenzNjmUfJUPbOcYUUK1XU+10n
 MK5s1A+VDZHMI75klVayk8lACIMhse4ozEc+75McCn9dnvCdf1shUAv8VexDqUMkSD
 aIsHlPk1q/qNw==
Received: from pollux.denx.de (pollux [192.168.1.1])
 by mail-internal.denx.de (Postfix) with ESMTP id 8CB1F182B99;
 Fri, 28 May 2021 09:23:53 +0200 (CEST)
Received: by pollux.denx.de (Postfix, from userid 515)
 id 63FAC1A8BC5; Fri, 28 May 2021 09:23:53 +0200 (CEST)
From: Heiko Schocher <hs@denx.de>
To: linux-mtd@lists.infradead.org
Cc: Heiko Schocher <hs@denx.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] mtd: devices: add support for microchip 48l640 EERAM
Date: Fri, 28 May 2021 09:23:49 +0200
Message-Id: <20210528072351.1639575-1-hs@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_002403_709303_B920CAA7 
X-CRM114-Status: UNSURE (   8.44  )
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


add support for microchip 48l640 eeram connected via
SPI. Patch 1 introduces devicetree documentation
and patch 2 the driver.



Heiko Schocher (2):
  mtd: devices: add devicetree documentation for microchip 48l640
  mtd: devices: add support for microchip 48l640 EERAM

 .../bindings/mtd/microchip,mchp48l640.yaml    |  40 ++
 drivers/mtd/devices/Kconfig                   |   6 +
 drivers/mtd/devices/Makefile                  |   1 +
 drivers/mtd/devices/mchp48l640.c              | 379 ++++++++++++++++++
 4 files changed, 426 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
 create mode 100644 drivers/mtd/devices/mchp48l640.c

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
