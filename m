Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35F5C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 09:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xGHm+VJL9hs+zg4GRHPphAzT+0Y9bE4SDr+GKMStqBA=; b=vdC/5FLV3eUeKj
	RCxaZwoU5uWRe3/+RAIS1LnbCreWNGf6LB5NZUrBUMErfFknPCETnx+GLc2eUoV3fkCogTwSbaUv6
	vbSoy2rzG2bikoq+GXx514rOiAOA+FG2CBATE5E88CejnxwfAtcrX1SDFi9Xx791Iw1zO+KOF6zF6
	TTwUXDODMZi5b6IIybt8m5E6czw+pFNM2twk+woW45jEotooVeDl9nRmJ1pe8KLne8zCsMa0c629Z
	DF08h/P3CvFlttJ0KfcsJQTlPo/EjO/AxdKMtTT4/A1sJX03UQNoZUHhKfC15GfaI8Ou5NVSaWGOa
	2BdSJVrT+YzoHc9wvaCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nje1H-000ksN-MY; Wed, 27 Apr 2022 09:31:35 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nje1D-000kqa-LN
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2022 09:31:33 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23R9VQS3101909;
 Wed, 27 Apr 2022 04:31:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1651051886;
 bh=Q41u8TDrDC1yLEFN/TIxA0jpFdoBJn+r1/gn1QKCFK4=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=zPFY1wPUevqBJ2CUe4AzbuKbvSebm3utdT5kpWXAndvOk2UED1UmMOyQwm/1FKFZ+
 i+sooC9ihsIN8saV4BFioj3ww/OR2fqWkZ/JQTM8zK9axTIeMbK0V1uI2brVSwSYJM
 e7xeaCvq5XaDNYVMvKf/TSv4/JUzyBOQ/o6GgqQM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23R9VQAb096923
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 27 Apr 2022 04:31:26 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 27
 Apr 2022 04:31:26 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 27 Apr 2022 04:31:26 -0500
Received: from pratyush-4F-325.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23R9VKtR033801;
 Wed, 27 Apr 2022 04:31:23 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: <michael@walle.cc>, Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <Takahiro.Kuwano@infineon.com>, <linux-kernel@vger.kernel.org>,
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 00/11] mtd: spi-nor: Rework Octal DTR methods
Date: Wed, 27 Apr 2022 15:01:19 +0530
Message-ID: <165105175023.2301505.5047546691256262839.b4-ty@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420103427.47867-1-tudor.ambarus@microchip.com>
References: <20220420103427.47867-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_023131_841214_BB4A4C17 
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

On Wed, 20 Apr 2022 13:34:16 +0300, Tudor Ambarus wrote:
> v4:
> - s/spi_nor_read_reg/spi_nor_read_any_reg and
> s/spi_nor_write_reg/spi_nor_write_any_volatile_reg to comply with Micron
> and Cypress's naming scheme. Update documentation description on
> spi_nor_write_any_volatile_reg.
> - 2 new patches, the last ones, where I remove status polling on write
> volatile registers
> - collect R-bs
> v3:
> - queue patch: "mtd: spi-nor: Introduce templates for SPI NOR operations"
> from
> https://lore.kernel.org/lkml/20220304093011.198173-1-tudor.ambarus@microchip.com/
> The dependency chain between patches was too long and hard to follow.
> 
> [...]

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next, thanks!
[01/11] mtd: spi-nor: Rename method, s/spi_nor_match_id/spi_nor_match_name
        https://git.kernel.org/mtd/c/b1145d6f1e
[02/11] mtd: spi-nor: Introduce spi_nor_match_id()
        https://git.kernel.org/mtd/c/d0ddd88438
[03/11] mtd: spi-nor: core: Use auto-detection only once
        https://git.kernel.org/mtd/c/bffabd1c72
[04/11] mtd: spi-nor: core: Introduce method for RDID op
        https://git.kernel.org/mtd/c/86b6b55ffb
[05/11] mtd: spi-nor: manufacturers: Use spi_nor_read_id() core method
        https://git.kernel.org/mtd/c/a007d81aa5
[06/11] mtd: spi-nor: core: Add helpers to read/write any register
        https://git.kernel.org/mtd/c/a604ab33cb
[07/11] mtd: spi-nor: micron-st: Rework spi_nor_micron_octal_dtr_enable()
        https://git.kernel.org/mtd/c/4629adaff7
[08/11] mtd: spi-nor: spansion: Rework spi_nor_cypress_octal_dtr_enable()
        https://git.kernel.org/mtd/c/27ff0d34fb
[09/11] mtd: spi-nor: Introduce templates for SPI NOR operations
        https://git.kernel.org/mtd/c/c0abb861c5
[10/11] mtd: spi-nor: spansion: Remove status polling on volatile registers write
        https://git.kernel.org/mtd/c/467f0e8381
[11/11] mtd: spi-nor: micron-st: Remove status polling on volatile registers write
        https://git.kernel.org/mtd/c/37841975b3

--
Regards,
Pratyush Yadav
Texas Instruments Inc.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
