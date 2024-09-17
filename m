Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5CFCAC592
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2024 17:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SHkNxBMsY+j8oXjYnwom8XVE3ag1DW5Is1csiJ9SuZM=; b=q2z+PPHz3WYKyl
	6nGaMfoRrQxxnMJwQIxSyOcTOjR2S6HR7pKMaG4NebEzAt4mABGe04W58TmuaITdktrX+7D79O0HV
	mxYzIAZcZKJcZr0mXA3IqGqMa3AusifrJS1S42kdyqlc4rEXgYQslkZfrfDlRGOs0e7grBE90ls1k
	GGmweOZuQ7ZNLPokpnF419lnHClEtBBqUXS2Y+tr0bd2X5rh8Um95UuWZb3sh4zO4s70zG1fPGpFi
	l73YjIeV81zP5sC80rRAnpMCnxQ4c5EEYSmr4/bu7cSXPrde44UaH0YaJCvl7aRrcACVNMYJu56+E
	ca1/dvGIED1EpjKgh6AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqbpH-00000006aAs-3bAK;
	Tue, 17 Sep 2024 17:17:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqbpD-00000006a92-3kNI
	for linux-mtd@lists.infradead.org;
	Tue, 17 Sep 2024 17:17:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 309D85C5C88;
	Tue, 17 Sep 2024 17:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436E1C4CEC5;
	Tue, 17 Sep 2024 17:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726593433;
	bh=fmDfbRwe9CfPOnof2be3cKpz85D/y4WnwkurNAiLbwE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GG3mX/0jkn+pYcBuZvD35KENr2LMZNwW6DjalirywwLWNWOm/6dmR0O60nEAhyob2
	 IZQO6eZWJa9zerY+EX0jQnlBUcz0tKYU1iBCC4cfT4GcC4INugvtSh9YukbkByOXjM
	 elcgLZh3F71AJptTtzGY82cOkckjoQLEduDS3SGHuZTxCHcqb1zb8Kmlxn8jc2KEAo
	 G+MCGDVaSrtiNK2xAQM/v8Iibcn+gFUEVlaYfjAC6XRrvt+uXPvHZOdCEivmiq66za
	 0oznR3Gp6zb/uIJ95DRjRu6j+JxfUD1V4oYk18E4SiZ+xsrejlu3jrAB+0//BvSDlJ
	 EkFDDs/wWv4xA==
Message-ID: <e0db2f62-b2fd-4b61-932c-cc2caf5dd647@kernel.org>
Date: Tue, 17 Sep 2024 19:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: mtd: spi-nor: add OTP parameters
To: Erez <erezgeva2@gmail.com>
Cc: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Esben Haabendal <esben@geanix.com>
References: <20240917094956.437078-1-erezgeva@nwtime.org>
 <20240917094956.437078-4-erezgeva@nwtime.org>
 <9c273945-5a70-408e-a9da-a0797aa6d935@kernel.org>
 <CANeKEMN+ZUAGKGsqnaToDB3AxX9NN_JeCBWHwd-wwnTWLU3R+g@mail.gmail.com>
 <64ef46b1-7908-4b15-866d-9cabe2e5dc9e@kernel.org>
 <CANeKEMPwgtECfksgz6jXkR+bjVFwCB9DOh1q7t_3WeojReqxbA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CANeKEMPwgtECfksgz6jXkR+bjVFwCB9DOh1q7t_3WeojReqxbA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_101716_377399_2A4526B8 
X-CRM114-Status: GOOD (  18.88  )
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

On 17/09/2024 19:11, Erez wrote:
> On Tue, 17 Sept 2024 at 19:00, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 17/09/2024 12:42, Erez wrote:
>>> On Tue, 17 Sept 2024 at 12:36, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On 17/09/2024 11:49, Erez Geva wrote:
>>>>> From: Erez Geva <ErezGeva2@gmail.com>
>>>>>
>>>>> Some flash devices need OTP parameters in device tree.
>>>>> As we can not deduce the parameters based on JEDEC ID or SFDP.
>>>>>
>>>>> Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
>>>>> ---
>>>>>  .../bindings/mtd/jedec,spi-nor.yaml           | 37 +++++++++++++++++++
>>>>>  1 file changed, 37 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>>>>> index 6e3afb42926e..d502b7fab2ce 100644
>>>>> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>>>>> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
>>>>> @@ -90,6 +90,43 @@ properties:
>>>>>        the SRWD bit while writing the status register. WP# signal hard strapped to GND
>>>>>        can be a valid use case.
>>>>>
>>>>> +  opt_n_regions:
>>>>
>>>> No underscores, but hyphens.
>>>
>>> I'll fix this.
>>>
>>>>
>>>>> +    type: u32
>>>>
>>>> It does not look like you tested the bindings, at least after quick
>>>> look. Please run `make dt_binding_check` (see
>>>
>>> I run "make dt_binding_check" on kernel 6.6.
>>
>> Yeah, we are no on kernel 6.6. You can run it also on kernel v4.1 -
>> still does not matter.
>>
>> Don't develop on ancient code because then you ask us to review same
>> broken stuff we already fixed.
> 
> I test with Beaglebone black for testing, it is difficult to run the
> last vanille version.
> I did backport the spi-nor driver.
> As for "make dt_binding_check" on last kernel, it need to upgrade the tools,
>  and I did not think it could change that much.
> 

Well, it is possible to build kernel on small embedded board, but that's
quite cumbersone, slow and inefficient, considering that it's just
easier to cross compile. But anyway, binding check does not even need
cross compilation.

Sorry, the code is obviously wrong, there is no such thing as u32, so
you did not test it. I provided link which explains how to test it. You
must do it on latest mainline kernel. Just like you must develop and
generate patches on latest mainline kernel, because this is where we
apply the patches. We do not apply them to v6.6.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
