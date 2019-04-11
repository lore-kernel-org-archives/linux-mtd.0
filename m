Return-Path: <SRS0=0SW8=SN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71769C10F13
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2019 22:01:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BEE22084D
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2019 22:01:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="blA8Svfb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="CWZrJl4V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BEE22084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IgXuUDs2Pm1vAiPAGHWFtLySCwE4CL6DEiaxHUUv3es=; b=blA8Svfbh+kAfO
	YomWFdm8tGdjMSo3loICSYKkx9PiRA4ABeax+6WVap2dRgCy3Ah0xvwzSUYspzKT41xNBC+rXguCs
	wtV8MQXgomG9MBR+p4h03t9lMvHK3AShg1++hVz9VblEjwPbon2KlJKn5Bb9LdXoeXj6rzx6KWtl2
	NB6dY8jBR/lkRJlBT8yWFLuLnmr+J1vUtFMGBjxP8zaZssy12nHJkBASAfeGuQUAB59yN0I/qx83g
	1BrLL8ZT1ctPBOAdCs/lSz9SP+kC7HfWMpvqCxRViEKrweXIZWVGQYpne3Y4Zk2qYGpe1zphRZ43r
	0OWTdHhIYNYhAjlCM3YA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEhl7-0003aE-7P; Thu, 11 Apr 2019 22:01:25 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEhl3-0003YF-R0; Thu, 11 Apr 2019 22:01:23 +0000
Received: by mail-wm1-x344.google.com with SMTP id y197so8498668wmd.0;
 Thu, 11 Apr 2019 15:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=USu0U08XtV62/FT9Y9Zw6NN9l+FpUxSZTLC2grbjDtk=;
 b=CWZrJl4Vr7VzKxx4cuNrkwzXvIhQIEfjKSZI99fOT5xoTTBPIFfNC4x1k2/Ehi5YGE
 cJLZz13nPJucNqWvqlx/Ol3o8Yb4yvARPRelZNiAjlxtQ2yylVm77DBAfzRqxd2G4D5k
 wKawDinP0rtC7FqirFT5TqwBU6HDUa6N6PlIVbIyinUCNoxUR9JpnYSEVHqsnYC2qC/n
 Blatm/jNmqQstPsj0SvkKwOS3/Mrd0AluYcEuvfosUAI6QgRvtPRbYvUzy+iSj4nS5Qe
 C+PRbgd/rM7XaApOmLpVVDYqj1v32bFm8lctgHhFP+dTpdpkORpQ/1jqDEAdt38WLTAU
 8/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=USu0U08XtV62/FT9Y9Zw6NN9l+FpUxSZTLC2grbjDtk=;
 b=BZcH9E/vhxrg5dhtyFywqF3N3QISaNapZvb7x12N0XDF7xIq9wbrIAC7vL1J/KnwU4
 IIKnXG5uLl6BHdaIIfM71HoZ5lbgH6UL14JrQbZW/xdx2EAZvZaMIA0Pl5Eb6F8QeCCd
 DhV36lXxYtYc6gf74qX8V5jjKembUF2x/h3WlciQeXMtOg+F6MXs+TwpDxr1pSK4wwHp
 sbXkgDSxZsYZFg9DtQogdNJZ4e0WUYcmnjIfEEHl8urYmatqxS8W9HJcQA9mdJBow7dR
 AqmSS/swBw5hgHPMmo9nSKw2NPkzlWuUCYdfsMuQQ8xhs+uMU8djR/+eAqmo3boyA7V9
 JAnQ==
X-Gm-Message-State: APjAAAWDmd+V0QYVPgMhJAIeW3W+gUtS9ZiRNkmUQBbZCBR+4+6YaGb7
 3R6HpZOyihuWXF2oLmF0njI=
X-Google-Smtp-Source: APXvYqwrbxKve66ns57EPKWCyRVS1dNWITS6KhJEq0fgugMXjWKS9x4TQNLghNMdLAeaq01QCtsMTg==
X-Received: by 2002:a1c:be0e:: with SMTP id o14mr8237655wmf.118.1555020080027; 
 Thu, 11 Apr 2019 15:01:20 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C8AD0009F15067C8D22C31.dip0.t-ipconnect.de.
 [2003:f1:33c8:ad00:9f1:5067:c8d2:2c31])
 by smtp.googlemail.com with ESMTPSA id
 s189sm13266186wmf.45.2019.04.11.15.01.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2019 15:01:19 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: liang.yang@amlogic.com, linux-amlogic@lists.infradead.org,
 linux-mtd@lists.infradead.org, richard@nod.at, miquel.raynal@bootlin.com
Subject: [PATCH 0/4] meson-nand: small code improvements
Date: Fri, 12 Apr 2019 00:00:52 +0200
Message-Id: <20190411220056.19109-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_150121_907687_D93CEE43 
X-CRM114-Status: GOOD (  11.50  )
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
Cc: jianxin.pan@amlogic.com, bbrezillon@kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series comes with four small improvements for the meson-nand
driver:
* the first patches are replacing open-coded logic with existing
  utilities / helpers
* the third patch drops some unnecessary casting after changing
  the type of the info buffer parameter from "u8 *" to "void *"
* the fourth patch adjusts the usage of init_completion with what the
  documentation suggests

I have tested these patches as best as I could on my Meson8m2 board
using experimental patches on top of this series which add support for
this older SoC to the meson-nand driver.

Liang, can you please test this series on GXL and/or AXG so I don't
break the NFC driver on these newer SoCs? All of my GXL/GXM boards
have eMMC instead of raw NAND, so I cannot test it on these newer SoCs
myself.

This series is meant to be applied to the nand/next tree.


Martin Blumenstingl (4):
  mtd: rawnand: meson: use struct_size macro
  mtd: rawnand: meson: use of_property_count_elems_of_size helper
  mtd: rawnand: meson: use a void pointer for meson_nfc_dma_buffer_setup
  mtd: rawnand: meson: only initialize the RB completion once

 drivers/mtd/nand/raw/meson_nand.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
