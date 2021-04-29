Return-Path: <SRS0=3Xy9=J2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4932AC43460
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 16:29:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2E0C6140C
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 16:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2E0C6140C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4GIIX8aqjCaqDwxSb9XgDVglExyhXZSDxq5lGgFTXBE=; b=RzNvGn1NMih2rNH+RRxT1RsPW
	WQTuZT13+R7J7i9F6aeo6/Xj1sGSZSy5IJLgdf/DFifoe5wTy64YnumFu3kBGSLGbsDguOqtTu4fx
	ZbZapbOw31QVpOrI5bSGMQyNzX6Ps1RrQx2/Y22Lg3gcCBDfoizo7ljnqo97mUMLebNi4kE3hdyxk
	ZemaiYm9DuLob6Gdgw0XxC3Wg88UZjzCx6dF3LncZWCpoVONWhnSPncaR7MT/Df09g7/hgZHKreav
	j7U8ebKdiWFaK0uN7Kf4cXrZ1ERyToSRJsGloS/68Z4hbJUh4i8Jp6FkN3PQB0H64SHru2Fvvo3JH
	E7hojWu8w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc9Wk-00637I-HF; Thu, 29 Apr 2021 16:28:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc9WU-00635n-7u; Thu, 29 Apr 2021 16:28:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=KgbDNNHtI08G/Bd19jixZ4ooSityYmie7rX0EBgQRDk=; b=hQRdzd3vhj0sjUj/Aphrgvuh28
 VrA5nvJBvQy0QksRaAsgMnbPPdcK//rdKnL/o1cywDt0FgnicaoA7CEwTM0SYcviqJO01cCfVIz4G
 XCws+XwIKUTf3fCFestgCGt5SAAXhRW8lGG1kLQfJ6Li+o48swsNI/8+s6ZwqZXSgFdbcTpPSDMKv
 U2C3pBustmns8Y5HGj3NgugzvNyEN+ZtCTlIHSxeRz2OYvYD5sytuQ422taumIxr00x/aUU3sr/CB
 O7G20MmLU0dl99t5pnkQ75a1eEfxIqIGsVRd/+4ttTP1IbUGf9ukH4oHvtZ1oenWliRHpcjCLdjli
 JEQ+sazQ==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc9WR-000lOD-8b; Thu, 29 Apr 2021 16:28:16 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 9968222173;
 Thu, 29 Apr 2021 18:28:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1619713693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KgbDNNHtI08G/Bd19jixZ4ooSityYmie7rX0EBgQRDk=;
 b=kBkA5zcgkuCUSwxygLw883KezMw5l+6jZDLjPTXG4h5DhGO07rPZzP9g/4/bneXr4TwxYe
 mvYjvRkrqAnBgc/4zpAKv5h0/QMnaAMzLaXx48OhAYsI8+wfbSrjNd38WkpQm+rB2ig2Jj
 Yh/d9aXzSJqDTANxVBEMIobGc119c3Q=
MIME-Version: 1.0
Date: Thu, 29 Apr 2021 18:28:13 +0200
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor.Ambarus@microchip.com, nm@ti.com, kristo@kernel.org,
 robh+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, lokeshvutla@ti.com
Subject: Re: [RFC PATCH 4/6] spi: cadence-qspi: Use PHY for DAC reads if
 possible
In-Reply-To: <20210312101757.sqeyledbwjnpqdoy@ti.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <20210311191216.7363-5-p.yadav@ti.com>
 <2f26456e-59ff-2625-5d65-c1537052839d@microchip.com>
 <20210312101757.sqeyledbwjnpqdoy@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <ee2b753b16e76ecbede4c1373b6f2d77@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_092815_661391_66883740 
X-CRM114-Status: GOOD (  12.88  )
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

Am 2021-03-12 11:17, schrieb Pratyush Yadav:
> On 12/03/21 09:13AM, Tudor.Ambarus@microchip.com wrote:
>> On 3/11/21 9:12 PM, Pratyush Yadav wrote:
>> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>> >
>> > Check if a read is eligible for PHY and if it is, enable PHY and DQS.
>> 
>> DQS as in data strobe? Shouldn't the upper layer inform the QSPI 
>> controller
>> whether DS is required or not?
> 
> Yes, DQS as in data strobe. I need to check this again, but IIRC the
> controller cannot run in PHY mode unless DS is used. Ideally the upper
> layer should indeed inform the controller whether DS is 
> supported/in-use
> or not. That can be used to decide whether PHY mode (and consequently
> the DS line) is to be used or not.
> 
> Currently there are only two flashes that use 8D-8D-8D mode (S28HS512T
> and MT35XU512ABA), and both of them drive the DS line.

The LS1028A datasheet explicitly states that the calibration is only
used for non-DQS flashes. Which makes sense, because it just determine 
at
which point the input data is sampled. And if the flash provides a data
strobe, it already know when to sample it. What I am missing here?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
