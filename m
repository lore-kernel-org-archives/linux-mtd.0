Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11811CF9C6F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 10:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Iv2AVsgB7DNguv3KO/u0dfF76lNoeUAor3BokEes1k=; b=0ZQK0HKSuJycFd
	hyc+pkOvIj91IxXmgBwGF14qv8OibxMCgZZCyfGtHvVREcmoZ6a5vxUujmk4mAVgQ4JTfFDG1jdXU
	n3uWC5YCnGlriLWyRBbnBUH1LZcEZJt9EO87XGiYil14BmgBf77/T4tclSzHiDKZLMHazSBh2E3OF
	zN1mfmuRvd0HR5F0MydM+qMFNY3aTWk1r3HkzbjmsmA90jHpkThSAb+bCy8wYwzdp/urL0HGJX7Ev
	/l646wBeHiyB0Av8hZKkGNslqUkCN++TexCY9CLsKUxPLYzStaWd3QnubaOkZl4gmf2VxuP0hoGRc
	enl5iizSa1j2rVuZLJ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssgaI-0000000H0Ep-0kGa;
	Mon, 23 Sep 2024 10:46:26 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssgaF-0000000H0DR-28Bp
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 10:46:24 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4340:4ee9:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 5BF0D67;
	Mon, 23 Sep 2024 12:46:20 +0200 (CEST)
Mime-Version: 1.0
Date: Mon, 23 Sep 2024 12:46:20 +0200
Message-Id: <D4DLQGLJSKPB.3OOW4RU9Q3K5O@kernel.org>
Subject: Re: [PATCH v5 1/5] mtd: spi-nor: core: add manufacturer flags
Cc: "Erez Geva" <erezgeva@nwtime.org>, <linux-mtd@lists.infradead.org>,
 "Pratyush Yadav" <pratyush@kernel.org>, <linux-kernel@vger.kernel.org>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 <devicetree@vger.kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Esben Haabendal" <esben@geanix.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Erez" <erezgeva2@gmail.com>, "Tudor Ambarus" <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.16.0
References: <20240920181231.20542-1-erezgeva@nwtime.org>
 <20240920181231.20542-2-erezgeva@nwtime.org>
 <4e0cf43c-4843-451c-ac6f-86775dbccb2b@linaro.org>
 <CANeKEMOmhAPM1j1_ihzcC2wL6jKsWXPCGfZs+euS8mRvtqgE5A@mail.gmail.com>
In-Reply-To: <CANeKEMOmhAPM1j1_ihzcC2wL6jKsWXPCGfZs+euS8mRvtqgE5A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_034623_713058_FB69AA0F 
X-CRM114-Status: GOOD (  21.83  )
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

Hi,

> I would gladly remove the obsolete mx25l12805d.

Why? I don't see any need for that.

> > If there isn't any way to distinguish the flashes at runtime (which I
> > doubt/challenge btw), then as a last resort we introduce a dedicated
> > compatible for the flash in cause and specify all needed parameters in a
> > dedicated flash entry. This shall be more generic as further flash
> > parameters can be statically specified in the dedicated flash entry,
> > less invasive for dt, and less confusing for people when they decide
> > whether to use OTP or not. OTP params in device tree is a no-go.
> >
> > But again, you have to prove why you can't distinguish the flash at
> > runtime before introducing a new flash compatible. So don't go this path
> > before sharing with us what you're trying to achieve.
>
> You keep sending me contradictory messages.
>
> I told you we can not "guess" OTP settings based on JEDEC ID and
> SFDP existence.

What are you trying to achieve here? I've told you we are trying
hard to figure out everything out at runtime. I'd suggest you start
with one particular device where you want OTP support for. If the
flash id is already in our database, find a way to distinguish
between the old and the new one; probably by looking at some SFDP
parameters. No need for any new compatible. Don't try to solve the
problem for all the chips out there.

Again, the reason why we are trying hard to determine that at
runtime is that these flashes are usually second source devices and
a manufacturer might just replace it with a (more or less)
compatible one. Therefore, the less information we put into the
devicetree the better. So before you are sending a new version with
the flash compatibles, you actually have to convince us that there
is no other way of knowing what kind of flash there is on your
board except for providing the name by the firmware.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
