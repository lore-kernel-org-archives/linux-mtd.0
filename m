Return-Path: <SRS0=gOwn=WX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7048C3A5A3
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 10:59:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78DFB20656
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 10:59:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n9TfZ26b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="LRt7deMt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78DFB20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8AlXjw81IQpAh2Qi4js7yI6oT2wcpdjiwRRWDhdmXU=; b=n9TfZ26bpGSERo
	Fj2/6/Lz9ZkGIeKgH46Es2Q72i2CBkwC/ycX2OYAJaFVHvoPpH/RYHg4yCZ+0ccIg+AGozOB1AxKB
	PfsZlqkAHkqQZDVWMnblmq6+3wXaiDCrTz/tuLQE+LCwIMVXx4ok0rIBnqV1BER1jQybzP1pHEKOR
	F7Gx72MrFSpFXy2UG/y6jHPeqdgEuug4cvWVF4LUeaDHg75u2TNWgFvbCG8hCCe8QgBPlnUJdagY3
	qyDQtHtLJh0kuCNAnnqDett8wwUaoMRl5pTbgRdQnzQcteEqrzEjyJTWZIcNNEOE9jPOwG3mSiKDT
	U6FRDOMuGyyfh2yBweiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2ZC8-0001KJ-Oh; Tue, 27 Aug 2019 10:59:24 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2ZC5-0001Jz-Vy
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2019 10:59:23 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7RAxF45051356;
 Tue, 27 Aug 2019 05:59:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1566903555;
 bh=5L8fTBAPAUD1wvBa2VIqOhwiyYh0NH9SJJH4PTKUqsY=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=LRt7deMtZhLAFFrLeVm+jWzpQxgCHZIihH4jFGB0DFLIX7uwJPkfk01JgmGJ4lwXG
 u2Th8oXO0O2XLXWKuIZ6H//GX2RBC/hlxxPz3ptEcJUmYJfIV3aiXn+X4SSF7/7rpf
 MjaMRHr8i539FlB++abyxPfHd9vZKbQ7JWYfmIFo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7RAxFSg029003
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Aug 2019 05:59:15 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 05:59:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 05:59:14 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7RAxAKl111334;
 Tue, 27 Aug 2019 05:59:11 -0500
Subject: Re: [Patch v3] drivers: mtd: spi-nor: Add flash property for
 mt25qu512a and mt35xu02g
To: Ashish Kumar <Ashish.Kumar@nxp.com>, <tudor.ambarus@microchip.com>,
 <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <1565692705-27749-1-git-send-email-Ashish.Kumar@nxp.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <9e1986a4-abe6-60f7-5b21-82ff8145f2cc@ti.com>
Date: Tue, 27 Aug 2019 16:29:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565692705-27749-1-git-send-email-Ashish.Kumar@nxp.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_035922_119127_E8D7CB00 
X-CRM114-Status: GOOD (  17.83  )
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
Cc: Kuldeep Singh <kuldeep.singh@nxp.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 13/08/19 4:08 PM, Ashish Kumar wrote:
> mt25qu512a is rebranded after its spinoff from STM, so it is
> different only in term of operating frequency, initial JEDEC id
> is same as that of n25q512a. In order to avoid any confussion
> with respect to name new entry is added.
> This flash is tested for Single I/O and QUAD I/O mode on LS1046FRWY.
> 
> mt35xu02g is Octal flash supporting Single I/O and QCTAL I/O
> and it has been tested on LS1028ARDB
> 
$subject should start as "mtd: spi-nor:" and should be tweaked as:

mtd: spi-nor: Add mt25qu512a and mt35xu02g flash entries

May be Tudor can fix this while applying, if there are no further comments.

Regards
Vignesh

> Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
> Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
> ---
> v3:
> -Reword commits msg
> -rebase to top of mtd-linux spi-nor/next
> v2:
> Incorporate review comments from Vignesh
> 
>  drivers/mtd/spi-nor/spi-nor.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 03cc788..97d3de8 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1988,6 +1988,12 @@ static const struct flash_info spi_nor_ids[] = {
>  	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>  	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "n25q256ax1",  INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
> +
> +	/* Micron */
> +	{ "mt25qu512a", INFO6(0x20bb20, 0x104400, 64 * 1024, 1024, SECT_4K |
> +				USE_FSR | SPI_NOR_DUAL_READ |
> +				SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +
>  	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>  	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
>  	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
> @@ -2003,6 +2009,9 @@ static const struct flash_info spi_nor_ids[] = {
>  			SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
>  			SPI_NOR_4B_OPCODES)
>  	},
> +	{ "mt35xu02g",  INFO(0x2c5b1c, 0, 128 * 1024, 2048,
> +			SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
> +			SPI_NOR_4B_OPCODES) },
>  
>  	/* PMC */
>  	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
