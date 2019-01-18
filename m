Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E590C43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 14:15:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F16282087E
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 14:15:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mZL8jmWw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="G579AefQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F16282087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=htKrK3RXqUbVXKOIZ9lUe/CXlwTJjK3XViZIwadHEJI=; b=mZL8jmWwiN1b3RuFUJH6nhKxZ
	ZsyRXiWhPY8K55xiwYFg2CocaDRtNIrR2xA4Guyjjzb0e1wbv4MLdTSHmvkxnOfYTIN9NFQHpe4lK
	lRvhQqNuUmzvPCmTbDcQPiab8HBa+9+JVfXSjvRGGEuurgNRDjI3EXxSbuhAO8VQLcO8S8IrnFnuz
	qbttmYmbyJbfAEb21L0u65+dd7DfZ7wRxCPc+APN750BUyxhvlLuwugiIc9fsz6v6yf72ALjP3XVr
	NgGVo3kA/RziJSUCQLfDLs9t5TY0Y9B0RV8jB0U+TcOAic9ab4qf9UIpw3E9fXiiL9qAkAYHFaqIN
	xZd3xj/9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkUvn-00027S-Ua; Fri, 18 Jan 2019 14:15:35 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkUvl-000271-2L
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 14:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1547820929; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QkNNW/dI81cbH2kw0vmnMq2W7RjddJVYl94J+FIvKqk=;
 b=G579AefQ/4l83VXzQhtgVi4FJMr+Q1CzPAc4EzaHWHYyclT9q6pRHVoUBEeQmMTP9qcCBa
 koJ+LUmMymY1GRsN60EHSQwbiqYWyMF3IycGHiURZPOq8iCEXcZT3o+5A61ISS5wyKu6LM
 UFfJ/DtpucV9jxSqnmfNKAsCX568MDQ=
Date: Fri, 18 Jan 2019 11:15:14 -0300
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/8] MIPS: DTS: CI20: Set BCH clock to 200 MHz
To: Boris Brezillon <bbrezillon@kernel.org>
Message-Id: <1547820914.1909.1@crapouillou.net>
In-Reply-To: <20190118090736.6f1283bd@bbrezillon>
References: <20190118010634.27399-1-paul@crapouillou.net>
 <20190118090736.6f1283bd@bbrezillon>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_061533_295999_EBC18FA8 
X-CRM114-Status: GOOD (  16.96  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 linux-mips@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Paul Burton <paul.burton@mips.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Harvey Hunt <harveyhuntnexus@gmail.com>,
 James Hogan <jhogan@kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Fri, Jan 18, 2019 at 5:07 AM, Boris Brezillon 
<bbrezillon@kernel.org> wrote:
> Hi Paul,
> 
> On Thu, 17 Jan 2019 22:06:27 -0300
> Paul Cercueil <paul@crapouillou.net <mailto:paul@crapouillou.net>> 
> wrote:
> 
>>  This is currently done inside the jz4780-bch driver, but it really
>>  should be done here instead.
>> 
> 
> I disagree with that statement. If it's a per-SoC constraint then you
> can select the appropriate rate based on the compatible in the driver.
> If the clock rate depends on the NAND chip it probably means it's used
> to generate the RE/WE pulse and should depend on the NAND timings
> passed to ->setup_data_interface(). In either case, this should not be
> specified in the DT.

Alright, I'll drop the patch.

> Regards,
> 
> Boris
> 
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net 
>> <mailto:paul@crapouillou.net>>
>>  ---
>>   arch/mips/boot/dts/ingenic/ci20.dts | 3 +++
>>   1 file changed, 3 insertions(+)
>> 
>>  diff --git a/arch/mips/boot/dts/ingenic/ci20.dts 
>> b/arch/mips/boot/dts/ingenic/ci20.dts
>>  index 50cff3cbcc6d..aa892ec54d0a 100644
>>  --- a/arch/mips/boot/dts/ingenic/ci20.dts
>>  +++ b/arch/mips/boot/dts/ingenic/ci20.dts
>>  @@ -111,6 +111,9 @@
>>   		pinctrl-names = "default";
>>   		pinctrl-0 = <&pins_nemc>;
>> 
>>  +		assigned-clocks = <&cgu JZ4780_CLK_BCH>;
>>  +		assigned-clock-rates = <200000000>;
>>  +
>>   		nand@1 {
>>   			reg = <1>;
>> 
> 



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
