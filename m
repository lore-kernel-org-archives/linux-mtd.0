Return-Path: <SRS0=a+Ch=4O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04832C4BA10
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2020 09:38:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF57C24653
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2020 09:38:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zah87T4N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eJwnt7bJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF57C24653
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7LIZpVl42+Dj3+Jt1C9Q4w6X3boHMuI27Y6ZmD5XBVw=; b=Zah87T4NrM+39+
	jnOZVy4tNZJUoOTo3AUWB9oEeh/+5Wqs/596Q3W2Dw4wS3KySm3VZuey8IueB2X1IvIyJC0a3ubjd
	h3p2f5dJ/j/H5uSekDA0NzFSNotUfF5GpkLrddziphNC0TQPjKSFCTCSweRmU90p3O3PrPKFRrLgC
	k3u+eo54lBnREkHDPF55ybFSB6ys4w5zqnOStL3AWvfZqxYzMbee9bwnrevrP74gO/dhhGNp6RS+U
	lUDUoPR5rD/ALwke7aa6PkyXKSiZ1tIZ6oj2DErIBRA7BV0Ip5ar1hlbTHbxbwHK9Iwpgv+ii+RV9
	hhZ+JOFDA3VhldROzt1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6t8c-0001Vz-AL; Wed, 26 Feb 2020 09:37:54 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6t86-00012G-0E
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2020 09:37:25 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01Q9b9FN087050;
 Wed, 26 Feb 2020 03:37:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582709829;
 bh=fx7S2CDPaTW7xSXzGMie7/8qKHKT4vHfX8u8KvtoGKc=;
 h=From:To:CC:Subject:Date;
 b=eJwnt7bJM8WoM7V8AGiP7gRLIJXWrfsHi9HOrlifdKe1uqOiAW0KR6MtjzuYg4zpe
 blmiFN27FJ0DDZ9Esq3P6519ssqGujT+OyjgRWtaa/2LjtaUt6uczAV4cbdXvHbtWE
 NHqrNnGBs5VlgzSwfk2Dp92him1vrgyWsoK44BOY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01Q9b9aA122372
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Feb 2020 03:37:09 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 26
 Feb 2020 03:37:08 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 26 Feb 2020 03:37:08 -0600
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01Q9b4A5110613;
 Wed, 26 Feb 2020 03:37:05 -0600
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 00/11] mtd: spi-nor: add xSPI Octal DTR support
Date: Wed, 26 Feb 2020 15:06:52 +0530
Message-ID: <20200226093703.19765-1-p.yadav@ti.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_013722_123456_1EEE0E04 
X-CRM114-Status: GOOD (  14.16  )
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
Cc: devicetree@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, Pratyush Yadav <p.yadav@ti.com>
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

This series depends on [0]. v1 can be found at [1].

[0] https://patchwork.kernel.org/patch/11355593/
[1] https://lore.kernel.org/linux-mtd/20200211133348.15558-1-p.yadav@ti.com/

Changes in v2:
- Add DT properties "spi-rx-dtr" and "spi-tx-dtr" to allow expressing
  DTR capabilities.

- Set the mode bits SPI_RX_DTR and SPI_TX_DTR when we discover the DT
  properties "spi-rx-dtr" and spi-tx-dtr".

- spi_nor_cypress_octal_enable() was updating nor->params.read[] with
  the intention of setting the correct number of dummy cycles. But this
  function is called _after_ selecting the read so setting
  nor->params.read[] will have no effect. So, update nor->read_dummy
  directly.

- Fix spi_nor_spimem_check_readop() and spi_nor_spimem_check_pp()
  passing nor->read_proto and nor->write_proto to
  spi_nor_spimem_setup_op() instead of read->proto and pp->proto
  respectively.

- Move the call to cqspi_setup_opcode_ext() inside cqspi_enable_dtr().
  This avoids repeating the 'if (f_pdata->is_dtr)
  cqspi_setup_opcode_ext()...` snippet multiple times.

- Call the default 'supports_op()' from cqspi_supports_mem_op(). This
  makes sure the buswidth requirements are also enforced along with the
  DTR requirements.

- Drop the 'is_dtr' argument from spi_check_dtr_req(). We only call it
  when a phase is DTR so it is redundant.

Pratyush Yadav (11):
  dt-bindings: spi: allow expressing DTR capability
  spi: set mode bits for "spi-rx-dtr" and "spi-tx-dtr"
  spi: spi-mem: allow specifying whether an op is DTR or not
  spi: spi-mem: allow specifying a command's extension
  spi: cadence-quadspi: Add support for octal DTR flashes
  mtd: spi-nor: add support for DTR protocol
  mtd: spi-nor: get command opcode extension type from BFPT
  mtd: spi-nor: parse xSPI Profile 1.0 table
  mtd: spi-nor: use dummy cycle and address width info from SFDP
  mtd: spi-nor: enable octal DTR mode when possible
  mtd: spi-nor: add support for Cypress Semper flash

 .../bindings/spi/spi-controller.yaml          |  10 +
 drivers/mtd/spi-nor/spi-nor.c                 | 594 ++++++++++++++++--
 drivers/spi/spi-cadence-quadspi.c             | 247 +++++++-
 drivers/spi/spi-mem.c                         |  46 ++
 drivers/spi/spi.c                             |  10 +-
 include/linux/mtd/spi-nor.h                   |  55 +-
 include/linux/spi/spi-mem.h                   |  32 +
 include/linux/spi/spi.h                       |   2 +
 8 files changed, 891 insertions(+), 105 deletions(-)

--
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
