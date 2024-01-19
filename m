Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FD3C47DB7
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jan 2024 14:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFfaiwMN/bcDC3sMGv8v21bkarzWYs6Gl8wy5Cx9C3I=; b=gSdzfasRjJC9oG51vdMyFtaJwH
	S7X5b+5LFSfeZ6fYPLivLAZS/pHfcdu0IEYiHWdUHIjeICzdcCzOEidkoY51sPBS5+YJogZcsvKPS
	0WIHVpV6GJklD7bbF1UHNpmtoEeybeAOKq1+R6qT3UHzsRZhs7pCX3HCccXYCdwznXEY1VFnEf384
	kz1ayxXT1WegzMgaH0BOeqFPhxOyVgYIaNEGu32SacQfRQWH5nw8qhYFG0hQMuhdNBnyZlNc7iUvS
	4Mml5BIxBloGp7vpazhLoCrndo5jHKWadETv2HifrlJTOhMgijhdXJQzNyE4w0GeT/4dEK7CjSW1L
	4qxZ9Ncg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQpR7-005mYR-1O;
	Fri, 19 Jan 2024 14:01:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQoKD-005XNw-31
	for linux-mtd@lists.infradead.org;
	Fri, 19 Jan 2024 12:50:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 69818617AE;
	Fri, 19 Jan 2024 12:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3510C433C7;
	Fri, 19 Jan 2024 12:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705668587;
	bh=yfKKsyBYowPyfAj6pxcaXG66MB0dgMKY7wwBmnCdQC8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fUbbolTvZeWx21gSexBVA/ML/p4+1z6euDSPJmnNN93Y40G/aebzWhKR+1FLWJrpD
	 8gu3L7onxsf14siV0J3xHJ0vgeOGP4bywMY5TZ9Mu1ivIXlhpxHqF6uJ3MKDY2aBIb
	 VgzBrHyDg9VHv1137Qwp/XGfRM/UlI77NK8A3UkpI0meFJo5VJj49l1SwSK+uKhAmy
	 l7wTCDJ1VIWjJ2LG5KKN0xkR1o8ylG18NlMpwotW0NsZ/+j12uoaGldfk/TK1/yi/j
	 rZi7TOQOeHJG25dVcLhV6cnP/6dlNOJej4lIO9bowbWoOTHZrR9pKyO9cIeJyztgV6
	 Tnz2LYjQnVpwg==
MIME-Version: 1.0
Date: Fri, 19 Jan 2024 13:49:43 +0100
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Takahiro Kuwano <tkuw584924@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Bacem.Daassi@infineon.com, Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH] mtd: spi-nor: core: Set mtd->eraseregions for non-uniform
 erase map
In-Reply-To: <de7d244c-9e0b-4d8b-a04b-e3c701cdec7c@linaro.org>
References: <20231225080349.17222-1-Takahiro.Kuwano@infineon.com>
 <740bf235110e05eae9ec7768603e6e2a@walle.cc>
 <d9cf5631-951e-45a0-930f-cc3afac05df9@gmail.com>
 <d63b6363-2d90-4fed-97c3-be69948aae57@gmail.com>
 <de7d244c-9e0b-4d8b-a04b-e3c701cdec7c@linaro.org>
Message-ID: <c8b29efeda7b464af75bf8fe23ad0008@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_045022_038274_6851A258 
X-CRM114-Status: UNSURE (   6.41  )
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

> Do you mean xilinx? That's a dead weight, I haven't seen patches for it
> since its introduction. I'm thinking of getting rid of the xilinx s3an
> flashes from the SPI NOR. Michael, Pratyush?

Yes, please! Then all these special handling with the not-power-of-2 
sectors
can be dropped.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
