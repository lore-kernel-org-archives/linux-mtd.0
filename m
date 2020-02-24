Return-Path: <SRS0=aChT=4M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EAEC3567B
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2020 05:27:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D6BF20661
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2020 05:27:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="czOtocAm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vDygJm2o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D6BF20661
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=cR+0C3Jy36a1X8jdYeBJ+5qynk9DuzOoNpCugE3aRoA=; b=czOtocAmJhT2pt3OwvYxoWPLFe
	6CeWKXQ0RKmR/X3t8NLskA41a+X84nEbLIv5GzBynlQoRseb6ELdaYDRVI+lWgHsMBpQxnIkaZQDb
	gqRtN2CdtJFQhgLs+7fVZ/mONHMGed2FZod4/giNJvVkq6vx8lJ4z4hjINqbrqQRgkmlhvNzEWCZf
	XkzgHvZVPlWNbZl0gbthubdDXSZ+rh9AvdaZAtJt3sygqoD017Y2hZZfCmhPtfzyDkz0dCunk9PH5
	+zVKlejOYxuo4nXJWc5Sbra6cGdVM+emihm8FKom7Ik1Q9e1pMUIGTzkVC/EqyehM2A66Km1Cs59x
	x71DMgjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j66HJ-0007Rs-7D; Mon, 24 Feb 2020 05:27:37 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j66HG-0007RX-E9
 for linux-mtd@lists.infradead.org; Mon, 24 Feb 2020 05:27:36 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01O5RNVu047678;
 Sun, 23 Feb 2020 23:27:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1582522043;
 bh=kx5mhIRt4fXNYGg7D4CfOrWl7sWv0FjmAHnouDn9SS0=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=vDygJm2oBoKIbRVIQ1tZX1v8sLLNuaaNDEffUXi7ZTP2I+/XxBizNNp9p3+fQVbRs
 HqgwbTl/QBBiOuwg1OMprELhzLSZaEf7ewipsUdBjfzNRnUxQJ0xX2iJng1XAXrb8z
 IabW5m/OPSmpBDVAwDEIqLHWW6EUmgxk9I82I5AM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01O5RNV1098754
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 23 Feb 2020 23:27:23 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sun, 23
 Feb 2020 23:27:23 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sun, 23 Feb 2020 23:27:22 -0600
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01O5RJ9J052463;
 Sun, 23 Feb 2020 23:27:21 -0600
Subject: Re: [PATCH RFT 0/2/2] mtd: hyperbus: add Renesas RPC-IF driver
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, "Behme Dirk
 (CM/ESO2)" <dirk.behme@de.bosch.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 Mark Brown <broonie@kernel.org>
References: <fd1360ab-8872-f750-1314-77c6d432b413@cogentembedded.com>
 <eba43289-3cb2-406b-cc5f-1209778621bf@cogentembedded.com>
 <16309076-4378-d9ff-30c3-93a46af1d803@ti.com>
 <eed17a25-e21c-b493-98e8-e25150216731@de.bosch.com>
 <aef44eb7-78df-8505-ad37-d67fd499532e@ti.com>
 <d6fd2da7-d1c4-0148-258c-826d8a7da469@cogentembedded.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <b8224f46-fc2e-de35-0a90-a2a86cacb489@ti.com>
Date: Mon, 24 Feb 2020 10:57:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <d6fd2da7-d1c4-0148-258c-826d8a7da469@cogentembedded.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200223_212734_561426_871CA2D1 
X-CRM114-Status: GOOD (  25.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

[...]

>>> So I wonder if it would be a valid option to have a functioning Renesas
>>> Hypeflash driver, first. And in a second step abstract that in a more
>>> generic way to support additional controllers. While in parallel having
>>> a functional driver for the Renesas people, already.
>>
>> AFAICS, the backend driver is not merged and is still in RFC phase.
> 
>    It was still marked RFC back in December and I haven't received any
> feedback since, other than Dirk's request. Where have you been? Well,
> I should have CCed linux-mtd back then... :-/
> 

Well, as you said, this should have been discussed in linux-mtd :-/ And
therefore why my first question on this thread was where is the backend
driver.


>> Therefore I don't see any benefit of two step approach here. Besides
>> you'll have to throw away this new driver (hyperbus/rpc-if.c) entirely
>> later on.
> 
>    Why did you create this directory for, anyway? :-/
> 


This directory is not just for HyperBus controllers but also for flash
drivers.
While HF uses CFI command set, its not necessary that other HyperBus
memory devices do. For example HyperRAM would need a separate driver
which would be under this directory. Even, HF would need a translation
layer from map_* APIs for controllers that can't use map_ APIs directly
and to add HF only features

Then there is need to support HF only controllers such as TI's
HyperBus controller which does not support any of the SPI modes or full
xSPI specification but just initial HyperBus protocol.
I don't think drivers/spi is the right place for such controllers.


>> How difficult is it to rewrite backend to be spi-mem driver? There is
>> already has a spi_mem_ops frontend implementation, so I don't see much
>> of an issue.
> 
>    Really? This may be not much of an issue with coding this but it's
> certainly time consuming (I'm sure there's s/th to think about yet in
> this case)? My management (and also me, so far) believes I'm in the
> final stage with these drivers... what should I say to my boss now?
> 

That's is not my concern and above statements on ML won't help either..
Lets have a constructive discussion and come up with solution is that
maintainable in long term :-/

My aim was to explore whether its possible to support OSPI and HF using
a single driver without needing two frontend drivers and avoid switching
b/w two drivers when supporting xSPI compliant HFs

Again, I did not insist on extending spi_mem_op to be the _only_
option. I said we should have a generic framework to support controllers
such as RPC-IF which supports both OSPI and HF and one of the options is
to extend spi_mem_op.

And I am not responsible for RPC-IF series to go to v19 :(

>> Extending hyperbus core to use spi-mem should also straight forward
>> Would involve moving this patch into core file.
> 
>    Seriously, only "moving"?
> 


HyperBus framework is pretty small and can be refractored quite easily
to support spi_mem_op extension

>>> Is the support for [1] a more or less theoretical one, at the moment? Or
>>> are there users of that which need support "now", too?
>>
>> Its not theoretical, I do see patches for xSPI controller here:
>> https://patchwork.kernel.org/cover/11354193/
> 
>    Which (surprise!) only adds support for the SPI part...
> 
>> So, its best to sort this out now so as to avoid possible backward
>> compatibility issues (especially with DT bindings)
> 
>    What DT issues do you mean exactly? I think that other than changing
> the "home" dir for the bindings, there'd little to change. The "front ends"
> don't deal with the DT probing...
> 

OK, if there are no DT bindings for each of the frontend drivers then
this should not be concern.

Since, Mark seems okay with current approach (per IRC discussions)
and is not keen on extending spi_mem_ops, I will look at this patch as is.

PS: I cannot reply to you on IRC as I am on the opposite end of timezone.

--
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
