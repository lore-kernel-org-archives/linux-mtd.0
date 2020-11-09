Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACAE4C2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 17:27:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C2342083B
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 17:27:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3MQiwShj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vWdI2/oH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C2342083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j2RvahOxeSemAsanOMVaMYF+OYr+2FqY44RAgczvmnc=; b=3MQiwShj8g78vkvpKMV6naHnE
	sNFDi3Iiv43OQQWdVRc6SEzbuH7FzoBu1qGcAV1UJoZVP68Gq4/AllQ5w2QXxWbddQWsnHMA9QGm/
	ouWLNXxKlyhBf6DS7JTyQAygjPHNYB2o8gVFZRrWyvNpNnmkAok9r0tTdI0wD5G7HdUymQ9xmJ/t5
	5hAcBXouVrH/cDXIVZWKulD9wXlUxn3OFmBBL//b9Ux0Hnixu9gXSX8bvqRFfgQNIERzHYmYECoi4
	wLrB9UaRfi//Vn8nylIUVEbSY57WSAJs3R/bPiYj0EWEu2WKwgdnIQstKK59PKu7toRDridGMXZdA
	iWyrZ95BA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcAvm-0003YH-W0; Mon, 09 Nov 2020 17:26:15 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcAvk-0003Wt-53
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 17:26:13 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A9HQ6oo010288;
 Mon, 9 Nov 2020 11:26:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604942767;
 bh=eKRlGEeVdSpzyOS3CbMbMx61s3L73kVGKe+o4x55G0s=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=vWdI2/oHkvCy16HluTWuU73GQuOjQ7R0Nk4GFVvy/SHM8v2ci12FVsb/EyEI9+RW2
 zctfwl8OnYwREa5EgzvVT8y1+BfFT5Pvd3vPp2dP3oCED1/zIe7ct+dOv7wtsXmtlW
 JcoXprmr20wqdNhRUv+Z0Q2San3HGAPw3lVC/iZU=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A9HQ6ug059918
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 9 Nov 2020 11:26:06 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 9 Nov
 2020 11:26:06 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 9 Nov 2020 11:26:06 -0600
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A9HQ3UY046797;
 Mon, 9 Nov 2020 11:26:03 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <linux-kernel@vger.kernel.org>, Pratyush Yadav <p.yadav@ti.com>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, <linux-mtd@lists.infradead.org>, Richard
 Weinberger <richard@nod.at>
Subject: Re: [PATCH v16 00/15] mtd: spi-nor: add xSPI Octal DTR support
Date: Mon, 9 Nov 2020 22:55:49 +0530
Message-ID: <160494271262.25072.15509428200904851771.b4-ty@ti.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201005153138.6437-1-p.yadav@ti.com>
References: <20201005153138.6437-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_122612_331562_0FB1188D 
X-CRM114-Status: GOOD (  13.60  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Sekhar Nori <nsekhar@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 5 Oct 2020 21:01:23 +0530, Pratyush Yadav wrote:
> This series adds support for Octal DTR flashes in the SPI NOR framework,
> and then adds hooks for the Cypress Semper and Micron Xcella flashes to
> allow running them in Octal DTR mode. This series assumes that the flash
> is handed to the kernel in Legacy SPI mode.
> 
> Tested on Micron MT35X and S28HS flashes for Octal DTR. Tested on Micron
> MT25Q, and Cypress S25FL for regressions. All flashes were tested by
> running a read/write stress test on top of UBIFS. On the Cypress S28HS
> flash 1-bit ECC had to be used to allow UBIFS to work since partial page
> writes don't work with 2-bit ECC.
> 
> [...]

With comments on 14/15 addressed:

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next, thanks!
[01/15] mtd: spi-nor: core: use EOPNOTSUPP instead of ENOTSUPP
        https://git.kernel.org/mtd/c/39bdfb789b
[02/15] mtd: spi-nor: add spi_nor_controller_ops_{read_reg, write_reg, erase}()
        https://git.kernel.org/mtd/c/6e1bf55d72
[03/15] mtd: spi-nor: add support for DTR protocol
        https://git.kernel.org/mtd/c/0e30f47232
[04/15] mtd: spi-nor: sfdp: get command opcode extension type from BFPT
        https://git.kernel.org/mtd/c/0e1b2fc4e5
[05/15] mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table
        https://git.kernel.org/mtd/c/fb27f19897
[06/15] mtd: spi-nor: core: use dummy cycle and address width info from SFDP
        https://git.kernel.org/mtd/c/6c6a2b2b8e
[07/15] mtd: spi-nor: core: do 2 byte reads for SR and FSR in DTR mode
        https://git.kernel.org/mtd/c/354b412967
[08/15] mtd: spi-nor: Introduce SNOR_F_IO_MODE_EN_VOLATILE
        https://git.kernel.org/mtd/c/c6908077b1
[09/15] mtd: spi-nor: Parse SFDP SCCR Map
        https://git.kernel.org/mtd/c/981a8d60e0
[10/15] mtd: spi-nor: core: enable octal DTR mode when possible
        https://git.kernel.org/mtd/c/a33c89db4c
[11/15] mtd: spi-nor: sfdp: detect Soft Reset sequence support from BFPT
        https://git.kernel.org/mtd/c/1131324aa5
[12/15] mtd: spi-nor: core: perform a Soft Reset on shutdown
        https://git.kernel.org/mtd/c/d73ee7534c
[13/15] mtd: spi-nor: core: disable Octal DTR mode on suspend.
        https://git.kernel.org/mtd/c/1b65c43f70
[14/15] mtd: spi-nor: spansion: add support for Cypress Semper flash
        https://git.kernel.org/mtd/c/c3266af101
[15/15] mtd: spi-nor: micron-st: allow using MT35XU512ABA in Octal DTR mode
        https://git.kernel.org/mtd/c/ad624dfd7b

--
Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
