Return-Path: <SRS0=wpEZ=37=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D74C3B187
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 13:34:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A6A42070A
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 13:34:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UjKrW9e2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sQVOwcs6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A6A42070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=crd4oL+bIn+n35RSf02it86XszmAhHUX4xxeyHzqORk=; b=UjKrW9e2gc4ytx
	n9PkzGX8iREslVKInMl1mA0ueXpgHpQeOgyRmePIgcESXk1fGNxtW4hmq48e2VhSKZO15lRc0BCzb
	heF6Dqu67WAqeoTnfh9ZvNGSSjr/yNqXOEwAFbV531DZKh2t7oLOOTgrgKckVPBsEpAuUFXWYcjFv
	O1uZ3S0pXFXnFgD+BWkLdvFsvWwjATJ6YspPQDY7qdo6K/3P+/DIrjmhrncmCzbwAm845dzMyRo0n
	hHU34nVivHSboSOhW/cQQYqM/T+2n0ac79HIsLQHANYSBGtGzYX1L6jkvyu6t03uudiSm69wRW0rZ
	X4LiF0nGYRQqyNbKO1Xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1VgB-0003yi-Fj; Tue, 11 Feb 2020 13:34:19 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1Vfu-0003mG-TP
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2020 13:34:04 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01BDXqb1085585;
 Tue, 11 Feb 2020 07:33:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581428032;
 bh=qagrc5drcyyqyRVbRzDGijYxvDYbBFyarf0AzXcJ+2A=;
 h=From:To:CC:Subject:Date;
 b=sQVOwcs670HcbphfeOVngpvABQLOHFn45ldwnmTBI7mMZlRsWbsbPitDsWYci/HBJ
 51G45bcxVMxQx0Q+7vngaIwLGNaebtQat0mfr3M8FEo38aArINvdK7JGt/GuU4MPD1
 4eTUhGD+vaha5zSSnCD8JPCxiEYYZFiyi1SoCDnU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01BDXqtS069874
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 11 Feb 2020 07:33:52 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 11
 Feb 2020 07:33:52 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 11 Feb 2020 07:33:52 -0600
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01BDXm5H087522;
 Tue, 11 Feb 2020 07:33:49 -0600
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/9] mtd: spi-nor: add xSPI Octal DTR support
Date: Tue, 11 Feb 2020 19:03:39 +0530
Message-ID: <20200211133348.15558-1-p.yadav@ti.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_053403_033984_9368E4F1 
X-CRM114-Status: GOOD (  10.64  )
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
Cc: Sekhar Nori <nsekhar@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pratyush Yadav <p.yadav@ti.com>,
 linux-spi@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

This series adds support for octal DTR flashes in the spi-nor framework,
and then adds hooks for the Cypress Semper flash which is an xSPI
compliant Octal DTR flash.

The Cadence QSPI controller driver is also updated to run in Octal DTR
mode.

Tested on TI J721e EVM with 1-bit ECC on the Cypress flash.

This series depends on [0].

[0] https://patchwork.kernel.org/patch/11355593/

Pratyush Yadav (9):
  spi: spi-mem: allow specifying whether an op is DTR or not
  spi: spi-mem: allow specifying a command's extension
  spi: cadence-quadspi: Add support for octal DTR flashes
  mtd: spi-nor: add support for DTR protocol
  mtd: spi-nor: get command opcode extension type from BFPT
  mtd: spi-nor: parse xSPI Profile 1.0 table
  mtd: spi-nor: use dummy cycle and address width info from SFDP
  mtd: spi-nor: enable octal DTR mode when possible
  mtd: spi-nor: add support for Cypress Semper flash

 drivers/mtd/spi-nor/spi-nor.c     | 595 +++++++++++++++++++++++++++---
 drivers/spi/spi-cadence-quadspi.c | 262 +++++++++++--
 drivers/spi/spi-mem.c             |  48 +++
 include/linux/mtd/spi-nor.h       |  55 ++-
 include/linux/spi/spi-mem.h       |  32 ++
 include/linux/spi/spi.h           |   2 +
 6 files changed, 890 insertions(+), 104 deletions(-)

--
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
