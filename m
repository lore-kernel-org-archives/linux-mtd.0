Return-Path: <SRS0=ekNa=5F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1658C4332D
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2020 06:19:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C448F20663
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2020 06:19:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pY5Rs95L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C448F20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VVqPCqhTqrg9H4YMXXW6fY7nTITsURqCA0kPdxDXrQs=; b=pY5Rs95LlrXyV4FSJPYFSBkr5
	TO1KxpZrJW+bb1fgDzHk3TNHvxyEE3e208slWKpGBuuOnytjwB2VGStmhG8YEIb2aQX8PbC41bYuq
	34tw0hCvNM9MOLvKcTSqVSBNeaRugiRO5mIHhYBX43G7oYQD+IpS/AM66bQqFKR7xVuXE1sr9iT4s
	sEolxtmqeTUh0GYMRbfNskrUvewsz9ClDwNb6XhtJ6FI4h2y7JqUnlOKVLcwlWWvWhH6EbpjVM5VO
	cLj0brpmrNH8DlexSOR/eK7/ujOjbwXT4L7IKwMk5ikHDi1BuUPeehYneCxfcsoV+kRxJDWSTR1vt
	kDI1pnyow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFB0W-0000kV-Lw; Fri, 20 Mar 2020 06:19:48 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFB0T-0000jv-OA
 for linux-mtd@lists.infradead.org; Fri, 20 Mar 2020 06:19:47 +0000
IronPort-SDR: BRw8wAWJYCu2lpcxHiVkJiFUh00xty+Nir8u9y5kbnvB64EARiU2uD6WDRIEcEuDOSAxhwDx4N
 88WxbQxQizUw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 23:19:44 -0700
IronPort-SDR: Rki1mw11JqeNDFWHxo4Zf/8q35aPR2PshLEnA5kL3XoJiC45euiZkKKZv93+S/dNZ45BJlof8c
 P6N/1746zoWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,283,1580803200"; d="scan'208";a="280330807"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 19 Mar 2020 23:19:44 -0700
Received: from [10.215.171.97] (unknown [10.215.171.97])
 by linux.intel.com (Postfix) with ESMTP id A3196580297;
 Thu, 19 Mar 2020 23:19:38 -0700 (PDT)
Subject: Re: [PATCH v12 1/4] dt-bindings: spi: Add schema for Cadence QSPI
 Controller driver
To: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, broonie@kernel.org, robh+dt@kernel.org
References: <20200310015213.1734-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200310015213.1734-2-vadivel.muruganx.ramuthevar@linux.intel.com>
 <c2ad909e-9042-6ba0-7213-83346c6b9908@ti.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <13a92ddd-b7dd-0465-d747-cda9bca21dbf@linux.intel.com>
Date: Fri, 20 Mar 2020 14:19:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <c2ad909e-9042-6ba0-7213-83346c6b9908@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_231945_797677_F91BD9D3 
X-CRM114-Status: GOOD (  18.22  )
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
Cc: marex@denx.de, devicetree@vger.kernel.org, tien.fong.chee@intel.com,
 tudor.ambarus@gmail.com, boris.brezillon@free-electrons.com, richard@nod.at,
 qi-ming.wu@intel.com, simon.k.r.goldschmidt@gmail.com, dinguyen@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 cheol.yong.kim@intel.com, cyrille.pitchen@atmel.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 david.oberhollenzer@sigma-star.at
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 20/3/2020 2:05 pm, Vignesh Raghavendra wrote:
>
> On 10/03/20 7:22 am, Ramuthevar,Vadivel MuruganX wrote:
>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>
>> Add dt-bindings documentation for Cadence-QSPI controller to support
>> spi based flash memories.
>>
>> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>> ---
>>   .../devicetree/bindings/mtd/cadence-quadspi.txt    |  67 -----------
>>   .../devicetree/bindings/spi/cdns,qspi-nor.yaml     | 127 +++++++++++++++++++++
>>   2 files changed, 127 insertions(+), 67 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
>>   create mode 100644 Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
>>
> [...]
>
>> +
>> +# subnode's properties
>> +patternProperties:
>> +  "^.*@[0-9a-fA-F]+$":
>> +    type: object
>> +    description:
>> +      flash device uses the subnodes below defined properties.
>> +
>> +  cdns,read-delay:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Delay in 4 microseconds, read capture logic, in clock cycles.
>
> Not its not... See the old binding description please:
>
> -- cdns,read-delay : Delay for read capture logic, in clock cycles
>
> There is no mention of 4us. Range is 0x0 - 0xF
Sure, will update as you have suggested.
>> +
>> +  cdns,tshsl-ns:
>> +    description: |
>> +      Delay in 50 nanoseconds, for the length that the master mode chip select
>> +      outputs are de-asserted between transactions.
> Again see the description in old binding file:
>
>   cdns,tshsl-ns : Delay in nanoseconds for the length that the master
>                    mode chip select outputs are de-asserted between
> 	  	transactions.
>
> Need not be 50ns or its multiple
Sure, will update as you have suggested.
>> +
>> +  cdns,tsd2d-ns:
>> +    description: |
>> +      Delay in 50 nanoseconds, between one chip select being de-activated
>> +      and the activation of another.
>> +
> same here
>
>> +  cdns,tchsh-ns:
>> +    description: |
>> +      Delay in 4 nanoseconds, between last bit of current transaction and
>> +      deasserting the device chip select (qspi_n_ss_out).
>> +
> Same here... Need not be 4ns...
>
>> +  cdns,tslch-ns:
>> +    description: |
>> +      Delay in 4 nanoseconds, between setting qspi_n_ss_out low and
>> +      first bit transfer.
>
> Same here...
>
> Above four values ( cdns,*-ns) come directly from the flash datasheets.
>
> These values are converted appropriate number of cycles depending upon
> the QSPI ref_clk frequency. So, there is no easy way to express the
> constraint (or range) in DT schema. I would recommend to just stick with
> the description that is there in the old binding file without any
> modifications.

Noted, will update.

Regards
Vadivel
>
> Regards
> Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
