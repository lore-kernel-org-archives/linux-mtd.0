Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A37C10F04
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Dec 2023 12:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9trB5Ac7vk+FJe/fkDcTPJMifZbQ/y1Xyk0E6O7s9qw=; b=bGQ3XXGlREGDasxLb4C1RsYKxM
	mnVvDmRT5uTcrS3N7/thuhmfRexYtwTlMgxpzkpGmv8ovOmuLrArMaHNrnq2gURm3TVIhKgIK6SAX
	alzLVRg6N3gFso5G5/BXUnz5BAiWrLRajYvC7DGuJsi1doP4uKqqPyhJjSxJQ1Ze0sl1U9z1p/iCN
	Rae2WMAm4LTX0zXANV1FZ0i6tfDarV7vBhO1FVbYz1X9ppRFNK3yiyBFzas/nYKlHCpfbidVtnXuU
	0scR0vqiHqthb+OXSWYzwt4Y3wNNMoFIARi0hCgSoN+s9wW597wmM38fKfcsEcO2YyS0Maz8MCMqc
	YFWzQ05g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBDfE-00Coze-26;
	Thu, 07 Dec 2023 12:39:36 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBDfB-00CoyK-2e
	for linux-mtd@lists.infradead.org;
	Thu, 07 Dec 2023 12:39:35 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id E7A8F1027;
	Thu,  7 Dec 2023 13:39:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1701952769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pQMmgybEFScVK9jItN/K11eIFanNyCEoo4Hz60gEvJc=;
	b=nLj6vEawY/49kIRa6r4nl3Diw1dpVmHqBqaQsBS4MIV9wJSiLvFDEbsh9JII43VK/WnU8Q
	C87gd7YzuSYJXjnranUoBfNnxH09ERSAZnyGoaqU89VHS269hMvZPnpUnUnzGIX29mpVak
	7UuuhCQTFWGAXNlBG/+uZQGDO8anu69THCRpoHbGnHuh2+t+dtALmOj+/jAjT51x+R1IOw
	VXZvMz447GLbp4GMMhgMDdgybAh+G015MAOP2HR/m7/W9r0Xk3QWPWKhk0hE83fRxW5uOy
	KHzpChyOGYeq3IRLU65ycac4b28k0qMvf1gBW3LVHjhaq5c5iyqYGr7CkYFBTA==
MIME-Version: 1.0
Date: Thu, 07 Dec 2023 13:39:28 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: liao jaime <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v6 5/7] spi: mxic: Add support for swapping byte
In-Reply-To: <d32f9632-7d03-4a78-9bf9-622de518cb28@linaro.org>
References: <20231130083854.55221-1-jaimeliao.tw@gmail.com>
 <20231130083854.55221-6-jaimeliao.tw@gmail.com>
 <eb145cfb0cf10330f5125f0c7d2224eb@walle.cc>
 <CAAQoYRm=5smXRSRJki8MB3yOuh4UeQO4oBYG8JSG29bbyADHGA@mail.gmail.com>
 <d42c102528ac8d4188147b6e23b18612@walle.cc>
 <CAAQoYRnF5zn+RH6LaQfPioOnbRADG8LXBuVpBbQvDGGYqJX1-g@mail.gmail.com>
 <d32f9632-7d03-4a78-9bf9-622de518cb28@linaro.org>
Message-ID: <d754407b5e7a6cbe58ac3ac4af8e1acc@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_043934_504126_283B69C0 
X-CRM114-Status: GOOD (  15.23  )
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

> I know for sure that mchp's sama7g5 xSPI controller can swap the bytes
> back on the fly. What I did was to check the dtr_swab16 bool at runtime
> in the exec_op() method and if it was true, I had to write a
> configuration bit. I can't remember why I haven't posted a v2 on that
> series, maybe I'll do it if I find some time or I ever get bored. I 
> have
> a board. Anyway, knowing that there's a board out there, sama7g5ek, 
> that
> contains a macronix flash that swaps bytes and also have a controller
> that can swap them back, would it be acceptable to queue just the SPI
> NOR patches for now?

I'm still leaning towards not putting any unused code into the kernel
and (maybe) increase maintenance. Or code which might need to be 
adjusted
later if it will actually be used. Without a user, we won't see the
whole picture and - at least I - cannot judge whether that approach is
correct then.

I'd say, if you ever get board, take this patch again together with the
user :)

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
