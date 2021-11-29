Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A240C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Nov 2021 18:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IrS67Cbz2ZdU8ckHuoI6L7riLxAoNKSKaAfv5EIUQ2E=; b=zoazmNeTLf0fkX
	c4X/aS6FHu3thyVOw85L31NWEadqF/KjzPpxUE8D/A/cj7kl5FQVFuRzkBnXAIY3n3qVA3juVd+Qb
	dlsZf0gsQ/y6Lg4NiD27PqjQqfu0PwiyLvnpgZ9XdUvlS4yGga4XOLPo/+AowYgUFIzVo+lHmGvfJ
	1Ikf6p3LlAbp/QwPbaoh7XQgY2I88OVS2ag/eHaK1xowAEMNz9yDTcnttS48ZsmhJxZCJD7YXB5MH
	mbR4aI7gO6bpZ999rOD6J7iQ0lzoAtp+NYaK/FvRqznzrABX9rTMibfx1CVeDU3vC+qj673trVhIZ
	Nzmah7GIYC1cx4fngMUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrl68-001iUF-46; Mon, 29 Nov 2021 18:09:52 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrl65-001iSx-N3
 for linux-mtd@lists.infradead.org; Mon, 29 Nov 2021 18:09:51 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1ATI9bdw085910;
 Mon, 29 Nov 2021 12:09:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1638209377;
 bh=7BzZum/wSpr+6OJerze3ARCjTNpCFGTq2Yr+iKCYVE8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=G3U9OzgzLfAEvnAt1pP25EJH9XgDtuxUrXdMCff3ztCsgMYvYKSvtyoRevrqvGUWH
 t6Rtyz7SXl2lrdayZk2zjMnphy7bsnNFC/ExVgLhdtdZQZTxzBi0fOoVvfY/HLZbmO
 LtTYbOEWMqQM2VvqDHM45SGDGZtbnHtxacEHZUlA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1ATI9bNQ113862
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 29 Nov 2021 12:09:37 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 29
 Nov 2021 12:09:36 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 29 Nov 2021 12:09:36 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1ATI9ZYm037856;
 Mon, 29 Nov 2021 12:09:36 -0600
Date: Mon, 29 Nov 2021 23:39:35 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Rob Herring <robh+dt@kernel.org>
CC: Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] Add bindings for peripheral-specific SPI
 controller properties
Message-ID: <20211129180935.nmymboy336hllly7@ti.com>
References: <20211109181911.2251-1-p.yadav@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211109181911.2251-1-p.yadav@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_100949_914280_2D64623D 
X-CRM114-Status: GOOD (  17.78  )
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

Hi Rob,

On 09/11/21 11:49PM, Pratyush Yadav wrote:
> Hi,
> 
> This series adds bindings for peripheral-specific SPI controller properties.
> See patch 1 for more info on the motivations behind this.
> 
> This is the best approach that I came up with with my limited knowledge
> of JSON schema. It has some limitations that are mentioned in patch 1. I
> don't know of any better ways to model this. Suggestions are welcome!

Do you plan to take this series through your tree or should I poke Mark 
about it?

> 
> Changes in v3:
> - s/slave/peripheral/g
> - Drop the | on description.
> - Drop the compatible property.
> 
> Changes in v2:
> - Move other subnode properties listed in spi-controller.yaml to
>   spi-slave-props.yaml
> - Move the Cadence controller-specific properties out of
>   spi-slave-props.yaml. They will be added in a separate file.
> - Add a reference to spi-slave-props.yaml in spi-controller.yaml.
> - Update description.
> 
> Pratyush Yadav (3):
>   spi: dt-bindings: add schema listing peripheral-specific properties
>   spi: dt-bindings: cdns,qspi-nor: Move peripheral-specific properties
>     out
>   dt-bindings: mtd: spi-nor: Add a reference to
>     spi-peripheral-props.yaml
> 
>  .../bindings/mtd/jedec,spi-nor.yaml           |  3 +-
>  .../spi/cdns,qspi-nor-peripheral-props.yaml   | 42 +++++++++
>  .../bindings/spi/cdns,qspi-nor.yaml           | 33 -------
>  .../bindings/spi/spi-controller.yaml          | 69 +-------------
>  .../bindings/spi/spi-peripheral-props.yaml    | 89 +++++++++++++++++++
>  5 files changed, 135 insertions(+), 101 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-props.yaml
>  create mode 100644 Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> 
> --
> 2.33.1.835.ge9e5ba39a7
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
