Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9254BC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 19:57:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BEAB64E79
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 19:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BEAB64E79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2V4elElz2eUELO0G/uPXzROtN550nCnfIcxj8pHwyHw=; b=1yhQTjzXhb4eTainRBmM/Z6GWH
	OVTczauq6A/NH++IRr+k1CsGiLvusev7SNkIOwVoF1s+SNwt6m811Bxppgj69IW47WWjvTwDzcNMu
	k6RfFIGtuEk+8yr6bv+Q6DRQWImpqucI+WRVTmfE9Iobcg9m0SRn9LXocqUg0DQuaBRvRq6+6pNmf
	5bokJGyaHzm0ddjrMnfJ8ZnQWLY+QEdmx1hbsg505hKFEfDJ+uB00VAkn72+2Cn25a/lK3oXUzYKR
	fjPc33r17ob+U5dLnAPzKl3vDvI+rpeR1JQXu8UVtzavIfvwgyMkCwToIJH9KcM+LRLWmw0tvDboA
	YADbrrvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC6SS-0006VE-VB; Tue, 16 Feb 2021 19:56:28 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC6SR-0006Uq-Io
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 19:56:28 +0000
Received: by mail-ej1-x62d.google.com with SMTP id b14so12570620eju.7
 for <linux-mtd@lists.infradead.org>; Tue, 16 Feb 2021 11:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GmrtnPXCD3lM2n5tvEfT5pQqzuGL0Fcvb04FWPJXdvM=;
 b=TrYyuXNG326Lf9T0XKT3xldpL3tZ5ZK8+oe2VK6wSswubBHEervTdnV0JxTGjAoBd4
 /V19izDbiTeAay61Fd94z92echr1vTjCKWLju3RFKWwsdI+CGAeYhr8LF1eAhmbpGppk
 lW4J/WE/Tqp27fC86jNlKFHtNBR1yGdM4Lu3cVKqbS/VSDefDAMpS7CgD5Q/Gei99nMt
 4+G3zpyk/N9Xvk0RBoJnVSDQ/YlOwg8XYoKk55OE0L8eCZ1BrFuOjzANDRrlayKGafgf
 oTHCxr4H/fwv/9fkXaRQRVPFWYOu3i8KH/RL1S3uHxI6m8VkwqiBe8zsEQXhYoRTwsYw
 HFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GmrtnPXCD3lM2n5tvEfT5pQqzuGL0Fcvb04FWPJXdvM=;
 b=X/411GozsltVSj669qLFRAPdB96aYgElcM2zS9ym/hpybNtkZ3Z+eaqjEYdPTych0s
 hoP8ETxl6YYIEbBE50rvF75D6u9tIeqNxggCnYRCPyBAswGKlWBHKxF7YISvKg1FYkPM
 qr2eVVjfR5JY0ID54GNUgZCx/s2LGCSpc9q0dBVxFIQOKWy65UDld8w5Co+uMBXSZCa9
 szZk7At75sgxTu2iqBUO2DdBRDgsOriuidQcKGxE/1UPjD3LoiJK732N5K76n37Sa6Pr
 IbXcMiX2H5grRfwXgRvR5nQWkT6vDPaHVB1zey8NcZAG+gr0QUe5huDycXDDp68MXLKu
 xVAg==
X-Gm-Message-State: AOAM5315W98F+Igvbqx3dGBbPueTRBOoMELadj0bbUmpDiNhmcTVu1xZ
 Gpmpu/Q3s6cVnRfKCks6RHw=
X-Google-Smtp-Source: ABdhPJzuUW25BARHUvkOTFcexOuBecvymIGNIzWJWeiJ0BjTaZDQQRKmGMvpqd17j/DPPFaByuX54w==
X-Received: by 2002:a17:906:2652:: with SMTP id
 i18mr1946178ejc.213.1613505384494; 
 Tue, 16 Feb 2021 11:56:24 -0800 (PST)
Received: from Ansuel-xps.localdomain
 (host-87-6-252-11.retail.telecomitalia.it. [87.6.252.11])
 by smtp.googlemail.com with ESMTPSA id rh22sm963332ejb.105.2021.02.16.11.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 11:56:23 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: [PATCH 0/3] Implement nvmem support for mtd
Date: Tue, 16 Feb 2021 20:56:08 +0100
Message-Id: <20210216195618.27959-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_145627_657106_EF540B1D 
X-CRM114-Status: GOOD (  14.58  )
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ansuel Smith <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The mtd support for the nvmem api has been stalled from 2018 with a patch
half pushed hoping that a scheme is found for the mtd name later. This
patchset try to address this.

The solution is simple.
New partitions scheme should always have the partitions {} structure and 
declare subnodes as partitions is deprecated and should not be used anymore.
Fixed-partitions parser is changed to parse direct subnode as partitions
only if the appropriate compatible is used. This change make possible
the use of nvmem-partitions compatible and the entire partition node can
be parsed by the nvmem of framework.
The current code register the partition to the nvmem framework every time
but skip actually of_node parting. The new nvmem-partitions compatible is
used to enable of_node parsing on the desired partitions.


Ansuel Smith (3):
  mtd: partitions: ofpart: skip subnodes parse with compatible
  mtd: core: add nvmem-partitions compatible to parse mtd as nvmem cells
  dt-bindings: mtd: Document use of nvmem-partitions compatible

 .../mtd/partitions/nvmem-partitions.yaml      | 105 ++++++++++++++++++
 drivers/mtd/mtdcore.c                         |   2 +-
 drivers/mtd/parsers/ofpart.c                  |   5 +
 3 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/nvmem-partitions.yaml

-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
