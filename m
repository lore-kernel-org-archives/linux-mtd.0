Return-Path: <SRS0=LGak=CY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C240C43461
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 06:47:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D361120756
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 06:47:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KwKD8Xf4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BFs8VHb6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D361120756
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9tmNBzrgsug/6vSyQHYudlp010v8x+kAJcQMqnaWRwA=; b=KwKD8Xf4YPGwRZXtMIIJP8U5b
	VA9gjk4RcnfqdeWWIcGNkvPVDWbEdM+8tskolt4k0xflORa5XaPcMeTSzyJ02gAyz9b4CUTVGRWjC
	IWvqbd47XO3s0WBa4FIvVZWgglQCMpQQUmW376M3MTjoIfAfeMjtM22X07/xy31Wg99gZg025Q8yd
	USaj9Nh8S48TeXslQij5pY/XM9eQofB2bdGfbkHu4wi3VBY/IrRMCvWihmYPx5AP4R4VuEd9UGjfS
	JxPrbR0wMMSWIbN9t+bXeicWHqjy+k9SDaSDWRPoQdPRWuUSYdCy0jFuP7oa/1EkM/dHwX0pyps3f
	mkAWQhgbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI4jb-0002sv-Sr; Tue, 15 Sep 2020 06:46:35 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI4jY-0002sE-Sv
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2020 06:46:33 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08F6kQbk044766;
 Tue, 15 Sep 2020 01:46:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600152386;
 bh=c0qC89K+xtv78g9xW2nSARu/6vLSkAR2jagY7DanMCg=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=BFs8VHb6IVFfWP9OGM+9f1eBIV9ePXmt8PrbnZ+nxxsvdkYceGOGF8sekM6HLHQiQ
 iYev7adKEJpYqLhjI+C9f0sS3g+8nZmltXPwE6t3xv+uWFZkQhwAx1tbT7RUWNaHJR
 PNBer+aa24QlDA2SUwcyVZlnDtymIUUE9TK6E2Gg=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08F6kQxY128608
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Sep 2020 01:46:26 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Sep 2020 01:46:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Sep 2020 01:46:26 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08F6kMp4074503;
 Tue, 15 Sep 2020 01:46:23 -0500
Subject: Re: [PATCH v12 00/14] mtd: spi-nor: add xSPI Octal DTR support
To: Pratyush Yadav <p.yadav@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, "open list:SPI NOR SUBSYSTEM"
 <linux-mtd@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20200903171313.18741-1-p.yadav@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <973eac67-fa01-309f-c4d1-7983f404d507@ti.com>
Date: Tue, 15 Sep 2020 12:16:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903171313.18741-1-p.yadav@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_024633_055203_30622A2E 
X-CRM114-Status: GOOD (  17.75  )
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
 Sekhar Nori <nsekhar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 9/3/20 10:42 PM, Pratyush Yadav wrote:
> Hi,
> 
> This series adds support for Octal DTR flashes in the SPI NOR framework,
> and then adds hooks for the Cypress Semper and Micron Xcella flashes to
> allow running them in Octal DTR mode. This series assumes that the flash
> is handed to the kernel in Legacy SPI mode.
> 
> Tested on TI J721E EVM with 1-bit ECC on the Cypress flash.
> 
[...]

Please fix checkpatch issues on patch 1, 3, 4 and 5

Otherwise patches look good to me...

> 
> Pratyush Yadav (14):
>   mtd: spi-nor: core: add spi_nor_{read,write}_reg() helpers
>   mtd: spi-nor: core: add spi_nor_controller_ops_erase helper
>   mtd: spi-nor: add support for DTR protocol
>   mtd: spi-nor: sfdp: get command opcode extension type from BFPT
>   mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table
>   mtd: spi-nor: core: use dummy cycle and address width info from SFDP
>   mtd: spi-nor: core: do 2 byte reads for SR and FSR in DTR mode
>   mtd: spi-nor: core: enable octal DTR mode when possible
>   mtd: spi-nor: sfdp: detect Soft Reset sequence support from BFPT
>   mtd: spi-nor: core: perform a Soft Reset on shutdown
>   mtd: spi-nor: core: disable Octal DTR mode on suspend.
>   mtd: spi-nor: core: expose spi_nor_default_setup() in core.h
>   mtd: spi-nor: spansion: add support for Cypress Semper flash
>   mtd: spi-nor: micron-st: allow using MT35XU512ABA in Octal DTR mode
> 
>  drivers/mtd/spi-nor/core.c      | 462 ++++++++++++++++++++++++--------
>  drivers/mtd/spi-nor/core.h      |  23 ++
>  drivers/mtd/spi-nor/micron-st.c | 102 ++++++-
>  drivers/mtd/spi-nor/sfdp.c      | 122 ++++++++-
>  drivers/mtd/spi-nor/sfdp.h      |   8 +
>  drivers/mtd/spi-nor/spansion.c  | 166 ++++++++++++
>  include/linux/mtd/spi-nor.h     |  53 +++-
>  7 files changed, 813 insertions(+), 123 deletions(-)




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
