Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE62C41513
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 09:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9XHxadNi3kdm/LPQScHe+2ta7+aDOrxPZ1d6gTc8P0=; b=rHSJGcnMi08a9x
	6ZeVfPeIUvC+M2XnlX9j/PmYW2p0Z4AxF8HW5ksnCP+dNe3cyzmOHxF2kVdrbJBMy791TUro7qbZo
	jjgR7pqEr2gIDeGhIaoNXT9rieAUr0Aptzri/xcA0L/sXMmHmLYrZnST+WlAz6FlTTr5vSWOW0H2n
	q0+smrcJbJiWsh/p6UJUWzsZ7I1L7saNxJOgs9RkigJ/KgN7Bk8B1kCkuWsNZrGzVFTL+BU62oZFQ
	GYarMgck60FaRtN/hK7zP9lPsInXOkvDcZlJ3sCDR0ecEks5WtsY1RMska/VHWM/n52dDYXcXNeaB
	nwfYkmthT0BWGse31IVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOEKJ-006vY6-2h;
	Tue, 25 Jul 2023 09:27:31 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOEIx-006ukF-1P
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jul 2023 09:26:10 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-55b22f82ac8so4225230a12.1
        for <linux-mtd@lists.infradead.org>; Tue, 25 Jul 2023 02:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690277164; x=1690881964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mwvK2Bl93HrIlvutIv1Mb5oG/T2yAEj32miHlVULszg=;
        b=e4Sr1p8oI0sxj21uh7vvJlYw3wGRqOqzr827mY+yVwvTf8XZzN49km3ClnubJECNfE
         92TZzY+8lIsYsidRDHq6qhGcNEXHxHB8QMXkRtzvujrB8q39azNu0EoZkH9iilLFy17R
         VocTZxwNszLgdR54lqLvKGlSnI9hHX3zldsTQiWme6e4aT+LWr10KPOHqF+OAzuu+IZ5
         AgcKWHNIq4QzgGVjJL/jVMX5XhBaYmhlHzKl+JrVadFwW5hkrxuaz/t25S8b6C4LhLsf
         rgmaOEuEhXmr45Obw2U/p3FqeUT/2kgh73vlIqIK6Fow67j9aDECr7/LmBfLctP4F++l
         ArIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690277164; x=1690881964;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwvK2Bl93HrIlvutIv1Mb5oG/T2yAEj32miHlVULszg=;
        b=ehiuMXwQ49FS69EnUj942+ujcqXKyalbRJ+xSX0Hiuqzz5ECj1fVSbwopCglCWPeCt
         6juBtPxhSObwvqMDnJiUFDgpt0xQ/3L9pqp7aYUXkQCHyD6uuddwYOt7nRU0c0hV+SRG
         LmqxenFh3QtNqWZTcrI+/t6XNgIkJHz/C92BDe0GUYiGcgjc2es59d3PHHgyUI4V9850
         KB5855T5DJ2ylSyiiET/FQU+gc7Pc4hvTtrAi/8BcjPlw3VD6MxpfE0WeW9s6LD/H0LH
         eroHb7ixiuIVOyr9WZkzxcdNbvVVfP2Lx5fICYIEJenQpA+b2oB6G7+9cwh0I1cOQBul
         WvFA==
X-Gm-Message-State: ABy/qLaUvzCmpF8uDWRD39VTve7CU6Yc3pvsrOvgHvYeAtqs0ztyXIlC
	d/j5E5e9EdF6DCH2bIIMoJoD/7bvaChojZ7ljd4=
X-Google-Smtp-Source: APBJJlFw1kS9zsuLHwJr3VpVDg9BdczS0TXcD7lA2u48rHd8lmcalPMi5aAAex6AubMbv5ezuikqsrgWi0sdBm9jsZY=
X-Received: by 2002:a17:90b:128f:b0:268:1084:3780 with SMTP id
 fw15-20020a17090b128f00b0026810843780mr2346076pjb.22.1690277164290; Tue, 25
 Jul 2023 02:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230725022302.210275-1-jaimeliao.tw@gmail.com>
 <15276c56-011c-1b55-d905-d0fbb822c4ef@linaro.org> <e2058fb379fb0b0d80b2b8c0d07c23ce@walle.cc>
 <be262828-b36b-1d2b-519c-c6951b063aac@linaro.org>
In-Reply-To: <be262828-b36b-1d2b-519c-c6951b063aac@linaro.org>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Tue, 25 Jul 2023 17:25:25 +0800
Message-ID: <CAAQoYRkSoT4=g-YqTAdAbDckS=h1y9DuPXtHbE68_RQ5z2YBOw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add octal DTR support for Macronix flash
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, pratyush@kernel.org, 
	miquel.raynal@bootlin.com, leoyu@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_022607_502432_5C43DEFA 
X-CRM114-Status: GOOD (  14.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor


>
>
>
> On 7/25/23 09:28, Michael Walle wrote:
> > Am 2023-07-25 10:01, schrieb Tudor Ambarus:
> >> On 7/25/23 03:23, Jaime Liao wrote:
> >>> From: JaimeLiao <jaimeliao.tw@gmail.com>
> >>>
> >>> This series add method for Macronix Octal DTR Eable/Disable
> >>> and add Macronix Octal flash support.
> >>
> >> Do all these flashes swap the bytes in octal DTR mode? If yes,
> >> you should add the infrastructure so that controllers can swap
> >> the bytes back, otherwise you'll break bootloaders which work
> >> in 1-1-1 mode, and breaking the boot chain is unacceptable.
No, only parts of flashes.
MX25UM51345G : flash without swap bytes in octal dtr mode
MX25UM51245G : flash will swap bytes in octal dtr mode
So that I hope flashes without swap the bytes can be support.
And I will send new patch for mention flashes which swap the bytes
in Octal DTR mode.

> >
> > It might also be the SPI controller. Was the zynq SPI controller
> > used before with octal flashes?
> >
>
> No, it's the macronix flashes that swap the bytes by default. At least
> the one which I've worked with few years ago. Some controllers can
> swap the bytes back, but they have to be informed from mtd.
Yes, it should inform mtd.



Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
