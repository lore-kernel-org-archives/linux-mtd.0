Return-Path: <SRS0=mJc1=QD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65281C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 10:58:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 316106112D
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 10:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 316106112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K2XlEhOhZRow5giDhItgdzZ1a8hEszL7PeEj8V9ota0=; b=bUyJkM5S4mMvE6
	c/TKlfzK25APPxjka5YgJD+9NgKF706tgFbRJ6yyXfNPBY80afb7tshV8EPPxsKzTfVbIBps2HpE/
	P0wJL7ESkTktK+JCj+FYXVf4tjNKPyjZW0snXxa4MxPcx/B4tvD/N7eMKw2qyUfu6Kyjy4HlmAmlJ
	KXRmsZJ+6IMb1vaIfoQk2dRESEgCJXwR/BmoCd+sTIu+HcvcgDoAQxFWpPHf8rU7j/flLiCNTI5/7
	LYGC+FRqNgUdl5ZU0BXzDDDy/MLeY3WfLiFTJDj3Zbe3P4prKCQ0O11Zh82VCjksZCLrBvSQo5qsg
	puzp0/cDmKrQlBA1t/Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmwA7-001IfA-3G; Tue, 16 Nov 2021 10:58:03 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmwA2-001Idc-Ht; Tue, 16 Nov 2021 10:58:00 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AGAvQS8014543;
 Tue, 16 Nov 2021 04:57:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1637060246;
 bh=9tPrRLGqJKk/Nb1nA+Y3YgdyHCMQdFlK3AzubEUccYs=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ks1V/0Wf/cS0FO30+186FRS3MNFK8V2hX8d3tsuAS777Yq/TxARxXq4PFxL3nzfyr
 w2CqbPxuRWq24jxkDiD9YjGw2sJUzaiS1lVAvsa/svws+mf3y4CC2UkyEtICXhv9ON
 4IjlbxHOSIGYcmXj+DtUHW6pDn1CxsxxCAJl5I6U=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AGAvQWA093736
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Nov 2021 04:57:26 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 16
 Nov 2021 04:57:26 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 16 Nov 2021 04:57:26 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AGAvPFN073367;
 Tue, 16 Nov 2021 04:57:25 -0600
Date: Tue, 16 Nov 2021 16:27:24 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v3 16/25] mtd: spi-nor: Introduce
 spi_nor_init_fixup_flags()
Message-ID: <20211116105722.y3rlcubiqimlobjx@ti.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-17-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211029172633.886453-17-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_025758_752573_2391715E 
X-CRM114-Status: GOOD (  12.93  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 29/10/21 08:26PM, Tudor Ambarus wrote:
> Initialize NOR flags for settings that can not be discovered by SFDP
> for this particular flash because the SFDP table that indicates this
> support is not defined in the flash. In case the table for his support
> is defined but has wrong values, one should instead use a post_sfdp()
> hook to set the SNOR_F equivalent flag.
> Update all flash_info entries that use SPI_NOR_4B_OPCODES or
> SPI_NOR_IO_MODE_EN_VOLATILE to also use the FIXUP_FLAGS() macro. This
> should highlight to developers that those flags should be used only
> as fixups, where flashes miss to define the SFDP tables that describe
> those settings.
> No functional change intended in this patch.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
