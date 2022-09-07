Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD44C38145
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Sep 2022 07:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6/copDcdprPd5uHn4G1zf4tAiija99bi2FXXvUAsBO8=; b=hbUShv8tSMl8qb
	M7Smc643o/KXLieJybHOBUbBw1tCGkhjQlbouW09hloOYZyEKUr1o7UsfPDxXIPt68uyvPIRBu5DN
	AogSRLxyrE+xLgDbjt6Nst4Q+8xml52F2vCRL8LjPSE4Axn2hah1IBoDshxrYpSIAEB8KAsFVuJLd
	tYT2ZgIfwbS8WnU42jFWie/7WdCGPOam3bMeuLcY6FJd8c6uxF5NSlfxHPcpzaVuf/0pEFPvlbJ0E
	qQlL23NxJ8tE8OpXOGup/0D7/QC6qQuWR+5MDVw47gtx9WILiEL/cW/R16j2S7IsLelv5Z1TjY/gj
	oztwowHTml2QStQKPGJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVpiZ-003p3f-P8; Wed, 07 Sep 2022 07:43:27 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVpiW-003oz2-T7; Wed, 07 Sep 2022 07:43:26 +0000
Received: from [10.28.39.72] (10.28.39.72) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server id 15.1.2507.6; Wed, 7 Sep 2022 15:43:14 +0800
Message-ID: <ea0dda97-2f53-0a3f-6168-18b20a4095c0@amlogic.com>
Date: Wed, 7 Sep 2022 15:43:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RESEND v8 4/5] dt-bindings: nand: meson: convert txt to
 yaml
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Kelvin Zhang
	<kelvin.zhang@amlogic.com>, Richard Weinberger <richard@nod.at>, XianWei Zhao
	<xianwei.zhao@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, BiChao Zheng
	<bichao.zheng@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>, Rob
 Herring <robh+dt@kernel.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
	<linux-amlogic@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>,
	<linux-kernel@vger.kernel.org>, Victor Wan <victor.wan@amlogic.com>,
	<linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
	<devicetree@vger.kernel.org>, YongHui Yu <yonghui.yu@amlogic.com>,
	<linux-arm-kernel@lists.infradead.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
References: <20220906060034.2528-1-liang.yang@amlogic.com>
 <20220906060034.2528-5-liang.yang@amlogic.com>
 <1662471645.297810.360952.nullmailer@robh.at.kernel.org>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <1662471645.297810.360952.nullmailer@robh.at.kernel.org>
X-Originating-IP: [10.28.39.72]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_004324_997935_FCD8E1DC 
X-CRM114-Status: GOOD (  13.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Rob,

I reproduce this error and will fix it next version.

Thanks.

On 2022/9/6 21:40, Rob Herring wrote:
> [ EXTERNAL EMAIL ]
> 
> On Tue, 06 Sep 2022 14:00:32 +0800, Liang Yang wrote:
>> convert the amlogic,meson-name.txt to amlogic,meson-nand.yaml
>>
>> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
>> ---
>>   .../bindings/mtd/amlogic,meson-nand.txt       | 55 ------------
>>   .../bindings/mtd/amlogic,meson-nand.yaml      | 88 +++++++++++++++++++
>>   2 files changed, 88 insertions(+), 55 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
>>   create mode 100644 Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.example.dtb: nand-controller@ffe07800: Unevaluated properties are not allowed ('reg-names' was unexpected)
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.yaml
> 
> doc reference errors (make refcheckdocs):
> MAINTAINERS: Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
> 
> See https://patchwork.ozlabs.org/patch/
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 
> .

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
