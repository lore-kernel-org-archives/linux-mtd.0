Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96826C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 12:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHIjkbajZqIxtPoIe2xX7079ALAtvMr6z1I+9j3cV2E=; b=I1LSVtItCliKODFJhBmHcQNmjW
	ewNo1Gy0x182M/AS7Qnc7wo5TeUETimctW6SmOldKzMNUDU1cAAvjJwdHH+p30LEyPUakvnxAZir2
	O+Ky6KyPrDNfvHlZ5KiG0/CNoqHjkdz0+WVRxREibhBwAIP4TgMJNo6k0xY+Dw7eWEdT6aVMJSC8r
	p5nLjt8/0xPH9jeJWIAklp+BNSjYT82D7IS5HGo124+lr5rShZm820O3K/WBGxPeXTqo9IxvFCbSp
	734MFZKEGou3VK16w7EB2XqGO8Pzdsy+1TnLtW6P9tDHLslcNtZBPfVD2du5Gq2oiCBfryu8ex1Rr
	hs8u4cAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt7AJ-0048Ej-NU; Mon, 23 May 2022 12:28:04 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt6j0-003vlV-2F
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 11:59:51 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 22F972223A;
 Mon, 23 May 2022 13:59:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1653307188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GjI89bBVBNYnSTDQZKUlbIdHxFPg4x3K6Xc0o7sm16I=;
 b=ALuZrs/k5xOFbSyl9YATUpIJiqKP23YLuq3Nw3VoTtJmJrpUGPF7d/CZufQnFm7GyPN/br
 yMtMCucPAPw65GAGAdWWviWi0Zpih3ZhMXqcjM/d3y6NyB8twK8ASK8ziPWs1kgnENUCpA
 /t9zQutZ3K+8RmvGDlkr59K8l7NKsTc=
MIME-Version: 1.0
Date: Mon, 23 May 2022 13:59:47 +0200
From: Michael Walle <michael@walle.cc>
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: macronix: Add support for mx66l2g45g
In-Reply-To: <2bf3394e-0a78-c760-16ce-936c12b66b93@linux.intel.com>
References: <20220522054802.1719443-1-jiaqing.zhao@linux.intel.com>
 <04c432289041752d113c15245361ade8@walle.cc>
 <b3e85d41-9415-b911-6f61-941885af1955@linux.intel.com>
 <fac4b7877f600a4067534fca672dc842@walle.cc>
 <2bf3394e-0a78-c760-16ce-936c12b66b93@linux.intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <24cf182693a522ed1f7afd61c7c37029@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_045950_323183_C32E9513 
X-CRM114-Status: GOOD (  13.00  )
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

Hi,

Am 2022-05-23 12:12, schrieb Jiaqing Zhao:
>> Am 2022-05-23 10:50, schrieb Jiaqing Zhao:
>>> Yes this one supports SFDP according to its spec.
>>> 
>>> On my setup, I cannot see the sysfs object. Do I need to enable some 
>>> specific
>>> kernel config or it's SPI controller related? My setup is running 
>>> kernel 5.15.
>> 
>> No, it should be there since v5.14. See commit 36ac02286265. And you 
>> shouldn't
>> need to enable any special configuration option.
>> 
>> Did you do a "find /sys -name sfdp"?
>> 
>> -michael
> 
> I tried, it give empty result. The system I'm working on disables 
> kernel module,
> and the SPI controller driver calls spi_nor_probe() directly, will this 
> be the
> issue?
> 
> And is it possible to manually load the spi-nor driver via the bind 
> interface?
> If it is possible, what should the parameters be?

Is your spi flash probed at all?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
