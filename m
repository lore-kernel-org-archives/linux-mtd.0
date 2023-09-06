Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A81CEB8FAD
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 06:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7nvXbRqjglt6F8H+KflgxmbYonHWUerxLppD8qQAK0=; b=tOfumJbE5YmjciMjlqqazfII0Z
	vSu9Ce0/7fmWi0l6tyjmtGFSlA4rL48b3U2xXjPX2iZkoFHZtpc89tJq/Rkj4oEAL7ffB/eDIhawT
	tLe7DvmDsLv4gjFylLC6NnbSXf2ut5t/79SCK59hhgyPIsDr/DSGy7zo7vCTdMy6FPf2d+gEjsvoH
	i6vBLJtSelbhbz7/i/EtXaU/RC3aXDFvywh0K5a0KMjboEhf4vfdJVcSxYslR9WX3pTIxJSGwwiAw
	uiu4wgasptDPqQEv9ymdeLsGf+TuGVRQMzJYkFIHKuV83XuNPYVPJ6E7j3aZ5sUE++3SPdh+pdLZA
	7pFBa34g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmOv-007PRP-0r;
	Wed, 06 Sep 2023 06:52:33 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdmOs-007PQk-1e
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 06:52:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id D5F18CE13BB;
	Wed,  6 Sep 2023 06:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89AEBC433C8;
	Wed,  6 Sep 2023 06:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693983146;
	bh=0NziAyuGDsV9zXfsHJVohBzLH3NbghzsK2C3zeEmOlU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gIHMpLZ2j2JcyfddgSOW5mPefsoYHmmBV43KCrjcOWquBPojSBHPQee3eeGAPahP9
	 gqKT9O7KVc+VEScR9cfZ+wWoDiXyD9jn/ROjG42hfdIsU1JqWHBUyaqsZ6Xgt1ZJ8H
	 ph/HRjSm34hOC8X5JdCWj/fEUkD6XKayu+278+/d3af931gfuR0BWBw+yYc+FqJBWc
	 6Gx37ZeZmwHRZLGmyIbekyy37tnTddyoonhAzAiwaTdFWh0jqFh63nATiSeqjg0GjM
	 brSt+mWDh5KDR1Pcvvt63i8SFbEtwX7QnuEwWku8dtVz8YcIjSRpQti9cAH6k6a+Y9
	 gfWf7jvR0pYFQ==
MIME-Version: 1.0
Date: Wed, 06 Sep 2023 08:52:22 +0200
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 10/41] mtd: spi-nor: make sector_size optional
In-Reply-To: <21cd9421-52e6-432a-b612-a8bb9c48f98b@linaro.org>
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-10-291a0f39f8d8@kernel.org>
 <21cd9421-52e6-432a-b612-a8bb9c48f98b@linaro.org>
Message-ID: <8ce4677710a5a19677ab86aaa41a70ab@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_235230_734107_684803B8 
X-CRM114-Status: UNSURE (   8.57  )
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

>>  #define SPI_NOR_GEOMETRY(_sector_size, _n_sectors, _n_banks)		\
>>  	.size = (_sector_size) * (_n_sectors),				\
>> -	.sector_size = (_sector_size),					\
>> +	.sector_size = (_sector_size == SZ_64K) ? 0 : (_sector_size),	\
> 
> why do you clear the sector_size?

Because that is also a preparation for the large conversion, where the
default value of 64k is dropped. And to be able to verify (because you
can't really review these conversion patches) the ro segments are the
same, this patch already set it to zero if the INFO entry has the
default size.

I'll amend the commit message.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
