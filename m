Return-Path: <SRS0=tjU8=CX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 159D1C43461
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 11:25:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AFCE20759
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 11:25:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sAol7bdD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="WbXvk1B0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AFCE20759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pofZmTQaeAc6/2SOSeX5uL22Yf28aU+MVwrgG89Czgw=; b=sAol7bdDbCQLSz+pP1RhpV7Zv
	/P09VGZneaTQJ4vw1kf+IPvbfpFwpWfZ8Qt1gx5mC8Y5lvjViPXVQku7s+Fd98lq1TirRjfRbIDXd
	iOYI0j/1/59poiOdBJvJH1v2m4leNlC1uJsuoUppy6x9g5DPWs6+GsfL0fBRZqoC1EXlLA5ms7mX+
	JoGh87hwPi6O7sHTJFHhrA7e70saiZUFUZClpLprB1OCLdUeF+4KJMpYjDBvNjqcEysuap7hLgPye
	ESDqQCbuhU4iVaqem58B2y2LPaN8jCJQQiv1Jkbuj/7e3SRwwSioms/0c0z9hT45A1OtjoWrcX1yk
	j5SMVwdWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHmb5-00044N-Si; Mon, 14 Sep 2020 11:24:35 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHmb2-00043q-QT
 for linux-mtd@lists.infradead.org; Mon, 14 Sep 2020 11:24:33 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id ADD1C2250C;
 Mon, 14 Sep 2020 13:24:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1600082671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TSIenT/eAdfWHsMzr+7fvwJvSwJevHUBTg8/EDHXEAI=;
 b=WbXvk1B0PQEhKBAqE5pX/daD7i4tV8zaQsMadEivSvPhV4tUoEeoBeBAtKNQ8AsDD6sq2C
 30H8jvQKhIO2M334SGFHZJluZ3NdqUlyV9UOnANuwI6yIoZsk/mET0hdZn6oyHDq91IhAI
 LgQRf+K8/cAl8j8PhrNLh8JonEfb2uU=
MIME-Version: 1.0
Date: Mon, 14 Sep 2020 13:24:30 +0200
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] mtd: spi-nor: OTP support
In-Reply-To: <20200911222634.31804-1-michael@walle.cc>
References: <20200911222634.31804-1-michael@walle.cc>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <fd6562b7771c2dc18292b588ae75d17d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_072432_995558_40CCB1DA 
X-CRM114-Status: GOOD (  16.13  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Jungseung Lee <js07.lee@samsung.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2020-09-12 00:26, schrieb Michael Walle:
> This patchset implements the MTD OTP functions to allow access to the 
> SPI
> OTP data. Specific support is added for the Adesto, Macronix and 
> Winbond
> flash chips.
> 
> In the past there was already an attempt by Rahul Bedarkar to add this, 
> but
> there was no response. These patches are slightly based on his work.
> 
> https://lore.kernel.org/linux-mtd/1489754636-21461-1-git-send-email-rahul.bedarkar@imgtec.com/
> 

I've missed appending the changelog:

changes since v1:
  - rebased to latest tree
  - correctly check return code of otp_ops->is_locked() in 
spi_nor_mtd_otp_info()
  - use correct bouncebuf for spi command in spi_nor_otp_lock_sr2()
  - add cleanup patch to consolidate some of the "if (spimem) {} else {}" 
patterns
  - add otp support for macronix and similar flashes
  - moved otp code into core.c because it is used across different 
vendors
  - use generic naming, eg. spi_nor_otp_lock_sr2() instead of 
winbond_otp_lock()

-michael

> Michael Walle (4):
>   mtd: spi-nor: cleanup common code
>   mtd: spi-nor: add OTP support
>   mtd: spi-nor: implement OTP support for Macronix and similar flashes
>   mtd: spi-nor: implement OTP support for Winbond and similar flashes
> 
>  drivers/mtd/chips/Kconfig      |   2 +-
>  drivers/mtd/spi-nor/atmel.c    |  13 +-
>  drivers/mtd/spi-nor/core.c     | 769 ++++++++++++++++++++++++---------
>  drivers/mtd/spi-nor/core.h     |  61 +++
>  drivers/mtd/spi-nor/macronix.c |  13 +-
>  drivers/mtd/spi-nor/winbond.c  |  18 +-
>  include/linux/mtd/spi-nor.h    |  16 +
>  7 files changed, 676 insertions(+), 216 deletions(-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
