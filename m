Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF979C54FB9
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Nov 2023 10:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MN/KdcoZFQp8kFkJavJNSndZb9784QNTlQYZrT5wEo=; b=PJhRauj1b+wt2+2arCRFkc7aXc
	0uyE/J0V9yn3mxjPRBO4zJN29Xk8MQ73lq5sTgIiER6RFcPHujOjmhdge+KbnHke+wV/JQiK8yqQx
	4/BKohHRC09PcRXmugKmFubu48lbi0Li4+NagGmlhnXFc4RmeF5iOasljiBmsa/Ho5WJxXKioAv9B
	aUvUwZU0vmYZSSFEmzVeqBU+crEC6gqC80TrYdY7rQlc2UNNsaq1FbHRK9ZTbhHAMkcKetK8k1rN3
	o0OT7TPu1gcoduVc1O32pRQPIRlNLCLDzVtGzOzsJVbeYnx7fJFQyzVBubp2fVHn7UIZEieGrjj4O
	yn4TViLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3w3y-006DQv-0R;
	Fri, 17 Nov 2023 10:27:02 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3w3v-006DPu-0l
	for linux-mtd@lists.infradead.org;
	Fri, 17 Nov 2023 10:27:00 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 64DF5AA;
	Fri, 17 Nov 2023 11:26:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1700216814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kdLfoMuPU6C9tv/XypbqMEo/LtvHKSyNgq1+Geb0GgE=;
	b=ms7bH9DAzV9Z7x/AJ61ikvnwAsn/8z0evA7CQDKwdxxhpSGTq1FWlHRu+KBMiKFef1NOio
	QQloa1s+Uv4BW95XJ7IBwqla1tmq8UuWtzUMWl4ZxY8jctINV/ykxUWyikmHGGnMzyhgH8
	IDlIspGKvl+NAdiCiYSeFGOOfiuc22SsYjHIjQDSNWyc5tkxhyaPMyKbthHI3eEfGAv0gx
	AFk2WymCqK+xezIkgXINqSMM0t7COUIHbUefayThf+2+g/ezh80OsbS9eqsVMY5ZY2sHlX
	zi2c917LrGFJ6AZ5GJ0YciIiy4o7HpbDcR+WegwF35sA5YzRe9jlgoC5qIHhwQ==
MIME-Version: 1.0
Date: Fri, 17 Nov 2023 11:26:54 +0100
From: Michael Walle <michael@walle.cc>
To: liao jaime <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v5 0/6] Add octal DTR support for Macronix flash
In-Reply-To: <CAAQoYRkMjq6R+6ZpyW0upDz0ScBQQd00gCx=BcS-_K9nypnUCQ@mail.gmail.com>
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
 <bdcaa357da0d1d3861831761b428dee9@walle.cc>
 <CAAQoYRkMjq6R+6ZpyW0upDz0ScBQQd00gCx=BcS-_K9nypnUCQ@mail.gmail.com>
Message-ID: <1e36423d84074b8056985a08737a7768@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_022659_433305_C2E97DF0 
X-CRM114-Status: GOOD (  13.87  )
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

>> > Add method for Macronix Octal DTR Eable/Disable.
>> > Merge Tudor's patch "Allow specifying the byte order in DTR mode"
>> > Add support for Macronix flash
>> 
>> I skimmed over the patches and they look good, but where is the
>> controller part of this? I.e. which driver is using the dtr_swab16
>> bit?
>> There should be a working setup.
> I think controller should info dtr_swab16 support in 
> spi_controller_mem_caps.
> 8d-8d-8d will not be enable if the flash swap bytes and controller
> driver not support
> dtr_swab16.

What I meant is that this patchset is missing a driver for the 
controller.
Which controller does support it? We don't add code which is then not 
used
at all. Or what I am missing here?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
