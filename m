Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC92C0015E
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 08:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6uqmDwvwMimadzw1ViaaxvVs2E2lqcTdBFOjco1I4k=; b=U+fy9dW5VR+p/n95xbfoC41XBK
	v2P/44o7kB4E02GlX01OG96LJ6R2SwzX0dY8k3B+ufI9KzQ9cvUEmgaDhNDJSIKnySduN8gl3wMdS
	pR59gaX4Khjkrl6+SpzyQOQY9mH9LBczQArf1P9xox7Yepm/Kd9dHxBjc98y0jn58lFNkAmmwJXR5
	ZJmC2xW3AsFVhu/SmH/9qIXOo2XXN8aKbGIA1y8cM6g7sNwYSbZq1XSTJMS22sRbwI1MumiTmvmMF
	SOFi0gZkrCZjpXBCSGGVmxGhmkBNeJvu0oJb6kwsIO7pY0FSRRFb3PyUVYWgLAwGSHmmDEld9Pnjq
	HjDf7O3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qODOw-006jt8-0t;
	Tue, 25 Jul 2023 08:28:14 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qODOu-006jsD-0x
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jul 2023 08:28:13 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id A8D27A57;
	Tue, 25 Jul 2023 10:28:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1690273687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gxK7xS/hKSGHvjR3izt0MxYvu5l8tikoF6ndmTaAxvU=;
	b=iYauYo2tVtsnI9hr9Mk/cZT7jGL4p+9ob68nNBw+Efwa8g9iyPLiQy1sk9LTDuFfSYFK3h
	l45JLlDSkb12utfhP0VrkakGXVMX71gGkULzMH7/PTjzuWRobqqY3WotnOO41KwTgRZPMa
	nFEOKrXWIP0sjE9GrInO+9RCXpVOauAlyio+Ph9Qgd98x+u02ioANziaPW/ivK0CI7g/Ap
	kVFaS/o8kfPaSXj9of8IE98x+86r4CsY9SjxxJYSS2jQQx2+awu7D/cxeOl/JHlQ/mOVlG
	BVAr5ZMQQoQ/3+89XgO/KfABbeEBIL/N6+1Om7Pj2QzWUvpvERmFT2mKgWC8UQ==
MIME-Version: 1.0
Date: Tue, 25 Jul 2023 10:28:07 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw
Subject: Re: [PATCH v1 0/2] Add octal DTR support for Macronix flash
In-Reply-To: <15276c56-011c-1b55-d905-d0fbb822c4ef@linaro.org>
References: <20230725022302.210275-1-jaimeliao.tw@gmail.com>
 <15276c56-011c-1b55-d905-d0fbb822c4ef@linaro.org>
Message-ID: <e2058fb379fb0b0d80b2b8c0d07c23ce@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_012812_485862_F4D60C33 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
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

Am 2023-07-25 10:01, schrieb Tudor Ambarus:
> On 7/25/23 03:23, Jaime Liao wrote:
>> From: JaimeLiao <jaimeliao.tw@gmail.com>
>> 
>> This series add method for Macronix Octal DTR Eable/Disable
>> and add Macronix Octal flash support.
> 
> Do all these flashes swap the bytes in octal DTR mode? If yes,
> you should add the infrastructure so that controllers can swap
> the bytes back, otherwise you'll break bootloaders which work
> in 1-1-1 mode, and breaking the boot chain is unacceptable.

It might also be the SPI controller. Was the zynq SPI controller
used before with octal flashes?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
