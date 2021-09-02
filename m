Return-Path: <SRS0=etPf=NY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E79CC432BE
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 14:22:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41804610D2
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 14:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 41804610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=z0GLHuLaHVcUE+Iuqyygr8KEfLRh+rNJGMXl6UdL/2U=; b=iiHQzUaLye3gda3pr6zjMO2lrG
	uujWfhtWzvOXDKR7BT9LXnk/YB03NwQbTpCx0SVn07ql5HUDEtN0YDLGkZlPpIuOHNoIIq6igIbOx
	BPg5Ok6aUxhogpXXiumimtRjr7jMEBoADkN5xE1RBtEBmSqsnuqKabcYJkABbgXWywO55wRdlOzD4
	lr1QWAL+avMiTx0EkatSDxohyes4P5mCecN+/mrIrNiOjfc3TMZquOPS5tCVVMxHI3B9ZX1yESBsZ
	w8/TZkW44rAL2UCl5XLQukrWGbepBbFwZIaFsfehvkHjdk2A4u3CKJ6ItAEPJgGosw8FYwGdnwGF4
	ChpVbuhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLnbD-009oOP-Bb; Thu, 02 Sep 2021 14:21:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLnb7-009oNm-G5
 for linux-mtd@lists.infradead.org; Thu, 02 Sep 2021 14:21:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F3C3610A4;
 Thu,  2 Sep 2021 14:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630592505;
 bh=sUsA0gFbABycvbiHzVJiJQ+UzKuwYnPW95lbREpcEWw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XANpgNcQspq5z8PetoCzgkEbmqNZk7yTrPFnmupbUnt9JFfFxRDbj7QpyT5IxnI0j
 XdWYsC7EEEbB9lE8GPjnQ+N9CizsW0oGNvdnQCJwwCAlD7UlgaJV8jmWETXD+NyyqI
 vMGZrUwujYY4diEYs8O3EqqtCVQPEqlwz1oKinBswVYMbbSnw2NtFm0YKOqyGDAty5
 BZI98ASpP55dAZ7NhkHQp5ofmZ1wn/BOC1+2ff8DrGLGPuCdOulNCbr/khiY8WTs1x
 OA08OZrDB3Zlrz1C8/wuJzSRLXZD4jH2Ht9zWlT+j59bs7KpqFWBOWGIXTkFGC7gIt
 4oT6bdu3WSBOQ==
Subject: Re: [PATCH v2 2/6] dt-bindings: memory-controllers: ti, gpmc: Convert
 to yaml
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, nm@ti.com, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, lokeshvutla@ti.com, robh+dt@kernel.org,
 krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
 tony@atomide.com, linux-kernel@vger.kernel.org
References: <20210902095609.16583-1-rogerq@kernel.org>
 <20210902095609.16583-3-rogerq@kernel.org>
 <1630584239.117607.685604.nullmailer@robh.at.kernel.org>
From: Roger Quadros <rogerq@kernel.org>
Message-ID: <d6b5a2b3-6a29-0c5d-cbe5-eda9b07b2c65@kernel.org>
Date: Thu, 2 Sep 2021 17:21:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630584239.117607.685604.nullmailer@robh.at.kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_072145_602777_DE9356A9 
X-CRM114-Status: GOOD (  18.11  )
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

On 02/09/2021 15:03, Rob Herring wrote:
> On Thu, 02 Sep 2021 12:56:05 +0300, Roger Quadros wrote:
>> Convert omap-gpmc.txt to ti,gpmc.yaml.
>>
>> Signed-off-by: Roger Quadros <rogerq@kernel.org>
>> ---
>>  .../bindings/memory-controllers/omap-gpmc.txt | 157 --------
>>  .../bindings/memory-controllers/ti,gpmc.yaml  | 364 ++++++++++++++++++
>>  .../devicetree/bindings/mtd/gpmc-nand.txt     |   2 +-
>>  .../devicetree/bindings/mtd/gpmc-nor.txt      |   4 +-
>>  .../devicetree/bindings/mtd/gpmc-onenand.txt  |   2 +-
>>  .../devicetree/bindings/net/gpmc-eth.txt      |   4 +-
>>  6 files changed, 370 insertions(+), 163 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/memory-controllers/ti,gpmc.example.dt.yaml:0:0: /example-0/memory-controller@50000000/nand@0,0: failed to match any schema with compatible: ['ti,omap2-nand']

'ti,omap2-nand' compatible is being added in patch 3 of this series.
So the error will go away there.

cheers,
-roger

> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1523568
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

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
