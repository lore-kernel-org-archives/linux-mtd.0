Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861A2C3DA6E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Dec 2023 09:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QCft/wEL+IQ6PXXGw9mnfOnaECcyy3ApgB0bBqOfCQ=; b=LA4SEeB46LCLosLDoUq2jjPSyf
	cPRDLgqqmp2uGd5VfTuOgV31AvgF5/dZuSfTWarKArA9Rf5fpZDIcdrWK2iYVZ2FnMFr77aIUyvdP
	nFuBl4MzXh4ArB6lE59P8ZzmiO7v9JRb/L4unUegypRqoV78XRmOViWY/YV9N3l0l8A6DiIhvow8W
	DwK+f6nUcreSfqAIX2rQJb4Duoxg3lmfp8TicQ7x/oZtAzP5hU5wyd45egFLLhcSSbm4SdOpdJ8RQ
	pWSJX7+sNfyDglwk6mDTgsJzRkDTh6wlI3JHnf04nNX8Fcz9PxGecoJkXuJaX9ARNkY24T7x+LZVh
	OTGwEEqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsTA-00Gflx-2T;
	Wed, 20 Dec 2023 09:02:24 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsT7-00GflK-16
	for linux-mtd@lists.infradead.org;
	Wed, 20 Dec 2023 09:02:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 170A6CE1BD3;
	Wed, 20 Dec 2023 09:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B33F3C433C8;
	Wed, 20 Dec 2023 09:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703062938;
	bh=wPL+DCtz5kf2VJZ6yMG27iEyDOmPlWz7uZw1Lxdp9ZQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=buoXqkHgsCN9qJYF4m0SHMgkdhdQ7WaunLofQgN7f10YEFN0LvShiXrDlSI0ZbTkZ
	 BTDvbkOTaLZUZ4wKFjGOm5riPbOQU8pJUV6scBiK8J2Oj5+6hSQ/vyGLRbArdxzY+k
	 zCl/ZtRsbPYE70qM+sf65k6xfNvzFxUIcAOYeiT6SNJjinQSxmErwoYw2fXy6CEmjQ
	 Mx9JLRUUEQszJDbyk4+8axNHlbB5DpWm2FMx+ab5Q1So7mCq3iK3CJnRvvqtiCDdzS
	 MQna7QhUl9AgvKnyMOKfow+Dxt4YT9ueR/yuAQVylbASSdOvifcKQNfyP6Z3PD05SY
	 PhdXqV6vT45pQ==
MIME-Version: 1.0
Date: Wed, 20 Dec 2023 10:02:14 +0100
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v2] mtd: spi-nor: core: Discard HW capabilities if no
 enable function
In-Reply-To: <ae720ccc-3e37-43f4-94ba-a5441d70f186@linaro.org>
References: <20231219102103.92738-1-jaimeliao.tw@gmail.com>
 <43eac7ba-1648-4e99-80b8-3132523189c7@linaro.org>
 <0b3aa661e5151aba8e32633e709fdbdc@kernel.org>
 <ae720ccc-3e37-43f4-94ba-a5441d70f186@linaro.org>
Message-ID: <33e303f6e37b14b28f1e1bdb3624fce8@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_010221_610162_3173F1DA 
X-CRM114-Status: UNSURE (   9.93  )
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

Hi,

>>> and these should have been in the late init hook, and instead discard
>>> them from the params->hwcaps.mask.
>> 
>> Maybe there is a better place to mask these bits. But IMHO the core
>> should do it on itself and we shouldn't need to provide an extra
>> hook function for every driver ourselves. The core knows that there
>> is no .octal_enable op and thus it shouldn't even try to enable
>> this mode.
> 
> I meant in the core, at the end of the late_init_params(). Here:
> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/drivers/mtd/spi-nor/core.c?h=spi-nor/next#n2962

Sounds good.

>> No it is for completeness and correctness. At the moment we are always
>> setting a (random) default quad enable op, due to legacy reasons.
>> 
> 
> Still, the commit message shall indicate this. Can't add extra checks
> out of the blue. Especially since nobody is affected.

Ok :)

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
