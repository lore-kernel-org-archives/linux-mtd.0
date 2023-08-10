Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 290E9C001DE
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Aug 2023 07:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyPaZBsX+VoW4SREqELwrSS5iGQiyqFyGsZ4nVb73bI=; b=tA7ZGeKnLVuq/ml8tcLPVDIUF6
	Xppfl2v2GUvZ8TzG6jNBOiPwNF6mCpmimLlBId+q7scsdDZRFxLIX6p9achjKY+/xm5K+08NaMGsV
	cgKtM5Y0Wkr+WrRHb1UfijypjT40UoLTfpSSg4307k/pWDyRXNeKkWYQjpqmtAUKwGSnNWq+wFf2e
	4NfAghwkqLQI7znKhUEhn9as5Lh6XaThqa8/SB6miE9pnGmfSGsVfipzDnDIPnwfd+e3/H856ESKK
	7A0nl9pqiLIv8eOFWIQoivKrMvxlpZ6EL6taJkuzDVoCJqznf+feE1BOHaeStP0SfRJmoL8U7bWfD
	CUjFYkgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU08V-006ksV-2o;
	Thu, 10 Aug 2023 07:31:11 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU08S-006krv-12
	for linux-mtd@lists.infradead.org;
	Thu, 10 Aug 2023 07:31:10 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 7B46F132;
	Thu, 10 Aug 2023 09:31:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1691652663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fVw5NxE1R+4QXpXsrsoGk6V5tVYQaoQiywFAjXga/SU=;
	b=OCNzBD9UwtFRvxxnEIEtrLi50KQsuyo1sA+QbQ+bnXgv9b++oeX05iVOPz04jYKHZIkFGL
	upiuGGlnw3c8iaFFOvonyrBr1dsQrm2iuCHy5N4FkWklYtyO5L1KKZX7i7bA10foOHdXnx
	3AdE4QpJdzGHKi6INJPHYElwP4yltGOxdb5iSV/KRlfi24PLroPSGV5boYTIbEddIxob/4
	TS50mwmO7ZPrYw4ZNnmrZETCk7Ihg+VHV+zIOw9AF/+vG/l84jQlje+7GPTWop4+8p4Yaq
	/wFPTYnSzczbLntf2fKCAcFbthvugX+cUu059iL67wGEAYeI9wIgSmgk/96sYQ==
MIME-Version: 1.0
Date: Thu, 10 Aug 2023 09:31:03 +0200
From: Michael Walle <michael@walle.cc>
To: liao jaime <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, JaimeLiao
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v3 3/5] spi: spi-mem: Allow specifying the byte order in
 DTR mode
In-Reply-To: <CAAQoYRmtUvnU-SmT1sLRgDGQr6UFwsd8=EyN31pv2cghK6apUg@mail.gmail.com>
References: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
 <20230804095409.278419-4-jaimeliao.tw@gmail.com>
 <49a226a128a908c4d99238246bbd09b2@walle.cc>
 <CAAQoYRmtUvnU-SmT1sLRgDGQr6UFwsd8=EyN31pv2cghK6apUg@mail.gmail.com>
Message-ID: <1c47df564bca7a28c8f99e8105613dd5@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_003108_511939_B6D3B5DA 
X-CRM114-Status: GOOD (  17.30  )
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

>> > There are NOR flashes (Macronix) that swap the bytes on a 16-bit
>> > boundary when configured in Octal DTR mode. The byte order of
>> > 16-bit words is swapped when read or written in Octal Double
>> > Transfer Rate (DTR) mode compared to Single Transfer Rate (STR)
>> > modes. If one writes D0 D1 D2 D3 bytes using 1-1-1 mode, and uses
>> > 8D-8D-8D SPI mode for reading, it will read back D1 D0 D3 D2.
>> > Swapping the bytes may introduce some endianness problems. It can
>> > affect the boot sequence if the entire boot sequence is not handled
>> > in either 8D-8D-8D mode or 1-1-1 mode. So we must swap the bytes
>> > back to have the same byte order as in STR modes. Fortunately there
>> > are controllers that could swap the bytes back at runtime,
>> > addressing the flash's endiannesses requirements. Provide a way for
>> > the upper layers to specify the byte order in Octal DTR mode.
>> >
>> > Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> 
>> .. this. If you pick up a patch from another author, you should
>> keep the author of the patch.
> How could I do for this?
> Because of Tudor's patch is on old Linux kernel version, it need
> a small changes for suiting on v6.5-rc3.

Ahh I see, you changed that patch. I'd pick up the patch, leave the
original author and SoB, describe your changes and add your SoB
after the one from Tudor.

But I still don't see how these patches will help with your current
problem.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
