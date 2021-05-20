Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7972C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 09:11:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37FDB6101D
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 09:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37FDB6101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2Y9Kr9R02j3TfDtrfqanhOwHzyZQ/kvQh4VfvZg7+I=; b=HQTNnpgWXh7YupBtDtFSKXK97X
	K09dRTRBBpCyWZprkSfe+ZOddK96kLGoYTPmFiH7EUrCPHxF86CGoLI45Kphejw2KB+Ywa27eEY9b
	NxLkZBzVefzIWmDkrRJkNmOTIp84IhQon6UGMQdR/NZpn6GDXMT5Gsjc/Av/k44+RCkVB7lkpCUwf
	Xc+fY9UceAoov3Vm10/nw5e5WJYHLkZ46dSfVY7AZsKzek+pLLeO1LzAaLJM3rBZzJF9dfrxdVeS5
	Uno4osgEugRTZh6+zQ4+n6zUmQoO1lRmnaoTMF047bJzWOI2I0VXp7GJ1Lf1DMXw8Fnj/TeBvt1OM
	j+XdUO1A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljegq-006KLx-25; Thu, 20 May 2021 09:10:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljegk-006KLn-S0
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 09:09:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=cnuTMgMnHPTqrXYwI90+aE2cGhpDNJPSOwGevU1wBxQ=; b=b6v3FsiUOAZqOlq9H1XSAIlluF
 4t5tAMs4D4nhsx7NAJjzE8FiCpGL/CpFOqnW9EHfzXsV5IMSJ9rr1Umrus5rlXhWEJEv8n3Xia70I
 XZEZ29nAhY5A1S9+cc+YM/0oNwYBVuK7rsljHwPeio2C/1enggYEU7+5YA5FIVqofizS930St9Q9Z
 YDjZIMzpL+VQvyH2W+7LB5NFTRnQFqF1VKekzATz0YvEcW1VjoR45ikP0n2vFKI8ZCWreFiEqRORF
 LTkPqBaA8VaJCOcpTI2i7nVzBepvvKhv3/qfVvHmlTDa0NAiuvWzKe/r7+fuDwaknoPr8x0OVO/Eb
 UEXc9fCQ==;
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljegh-00G5bq-JV
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 09:09:53 +0000
Received: from [192.168.64.199] (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id 7EB1846261A;
 Thu, 20 May 2021 09:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1621501784; bh=Xdd/Ybd6IHeiaGWgcauJpnw1i0jS7JNU3xPyTOR5M4k=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=ULUhUWYskIThbbjD9DKAJSwSxdaOouGBN1FegkUj1OqSo8xxgiA6GgtxkSxEv4lF9
 3sckEkpEwWvG2fZLSgoZYbumyym+rpoqUXuz4HE1e8NeXSVFZl0QKk1uYT0wy88IqP
 pDCKRNrTiXSyaIez6s8HsQbmETYpS4kTkEr1cbr81CDyAnZYMEDlXZDPKc95OTyH4x
 cIa5iUIZ7XpZ2X5Jqw1DnHfFKUorevT/URARUVoQ/WU5oooKQTwh7w7/OCac0OWpll
 RliOWbBuPFT4sPJJ3OO5W+g+63U/nzkUfTm4BkJ1FPASkfsiewOmvT+LjmqCohvJHL
 GCrUMmV/0+vlg==
Subject: Re: [EXT] [PATCH] mtd: mxs_nand: default to legacy bch and rename to
 modern bch option
To: "han.xu" <han.xu@nxp.com>
Cc: peng.fan@nxp.com, ye.li@nxp.com, alice.guo@nxp.com, sjg@chromium.org,
 seanga2@gmail.com, u-boot@lists.denx.de, miquel.raynal@bootlin.com,
 linux-mtd <linux-mtd@lists.infradead.org>
References: <20210510100043.449294-1-sean@geanix.com>
 <20210511024926.t6kunesknbwe7k2x@umbrella>
 <a33cac1f-7988-08ea-7d9d-c9b76b80cc3e@geanix.com>
 <20210513200242.fxvfvwgua35hbqvr@umbrella>
From: Sean Nyekjaer <sean@geanix.com>
Message-ID: <edd64777-ff6a-82fd-63bb-7b2f31f63f44@geanix.com>
Date: Thu, 20 May 2021 11:09:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210513200242.fxvfvwgua35hbqvr@umbrella>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_020952_045543_FF08FEDF 
X-CRM114-Status: GOOD (  15.27  )
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

On 13/05/2021 22.02, han.xu wrote:
> On 21/05/11 07:08AM, Sean Nyekjaer wrote:
>> Caution: EXT Email
>>
>> On 11/05/2021 04.49, han.xu wrote:
>>> On 21/05/10 12:00PM, Sean Nyekjaer wrote:
>>>> Caution: EXT Email
>>>>
>>>> Linux kernel defaults to use legacy bch setting, this was creating a
>>>> mismatch between U-boot and Linux default settings.
>>> Kernel uses the NAND chip specified minimum ecc strength and steps by default
>>> not the legacy bch setting, unless users enable it in DT file.
>>>
>>
>> Hi,
>>
>> Adding, mtd-list and Miquel
>>
>> With u-boot dtb:
>> &gpmi {
>>         pinctrl-names = "default";
>>         pinctrl-0 = <&pinctrl_gpmi_nand1>;
>>         compatible = "fsl,imx7d-gpmi-nand";
>>         nand-on-flash-bbt;
>>         status = "okay";
>> };
>>
>> With linux dtb (mainline 5.10):
>> &gpmi {
>>         pinctrl-names = "default";
>>         pinctrl-0 = <&pinctrl_gpmi_nand1>;
>>         nand-on-flash-bbt;
>>         status = "okay";
>> };
>>
>> U-boot prior to commit 51cdf83eea selected 18 bit ECC, after that commit it selects 8 bits.
>> With legacy option it selects 18.
>> Linux is selecting 18 bits ;) So now we have a mismatch.
>>
>> I have been searching for the legacy option in the mainline kernel can't find it ;)
>> Please show me where it is (is it in the NXP fork?)
> 
> You are right, it's only fixed in NXP fork, with kernel driver modification. We
> prefer the current u-boot bch geometry, so I will send out a kernel patch to
> make them align.
> 
Any progress on this?

I see your patch in:
https://source.codeaurora.org/external/imx/linux-imx/commit/drivers/mtd/nand/raw/gpmi-nand?h=imx_5.4.70_2.3.0&id=ae980dccc6189956fab047958ad0a70ec4951439

But I can't find the option for selecting legacy mode in the devicetree...

/Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
