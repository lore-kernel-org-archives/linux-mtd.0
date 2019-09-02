Return-Path: <SRS0=1hFJ=W5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF9AC3A59B
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Sep 2019 07:06:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CB4F21881
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Sep 2019 07:06:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RUOez/UF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vX+Kj9Sr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CB4F21881
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nzM+kRECLO1EvmEZoHTjUuS7J9NgeKQo43di7FICNbg=; b=RUOez/UFFebT5D
	WgV4WVSIgPBBtoEfobIkxI4av/85sbXt03hS1Oh72Nba8YeYYm//LT032PO9ehBDZVfMgT9AfuCpL
	MxSewLx2EBndhWDDjPrYFi7pGZ/DXbe4TUlMKJhRzHQW211u4ce5FUd8R9BginKEYn2KxB//rBEEn
	HCey6JsbdpzCDZjWUFlIMnzKtuvNLkzi1J7jVc0wd6I0vFsCNYCAHSrlfbn9XVo5fmXrDrhOx5HUK
	XgcnbABRPDvxHgNiL908z/pMecja9jGN/U5I4UhgVxd+rCJMySiRQOK5CTK3xXSQoNUGwpBniMYeY
	I/b3CXsAJLIMtRIgHsDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4gPu-0004sJ-S6; Mon, 02 Sep 2019 07:06:23 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4gPc-0004jk-5N
 for linux-mtd@lists.infradead.org; Mon, 02 Sep 2019 07:06:05 +0000
Received: by mail-wm1-x343.google.com with SMTP id c10so1339716wmc.0
 for <linux-mtd@lists.infradead.org>; Mon, 02 Sep 2019 00:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=64OQf2pr3McmMwwkBGAqwTjDXkvI31p1+ph2Ex8v9n0=;
 b=vX+Kj9SriDEymjT8Qbdi25ZCmvhmghxHjPlg3xNvRkg3ZK55IGHvGnkgGKnUvEx5es
 OK/EPM13MXDCW4ibmIN2eS9VUaqrRI4Rn+UIZ9qTH3mPHZS159Y/dshTiIBFtUiWSDO7
 GjMDRxDCBr6oRIpt6dChOTBAfpoYQKlZmAyCg9Yy9DMaEzb5hbOFArPyQ7cYHgOI161z
 TGRxGCvK+LH6CLxTcEfEU5WvPmW3RcsYU4iBD4E1MCi49TXvF/Y1Xj4POyIFW1kOCCGj
 D9xtf1un573mCkESRm+DdqYhS4J271DS773PBPPAz92MBsSh555rakOCn3TCD/SKZAgY
 yTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=64OQf2pr3McmMwwkBGAqwTjDXkvI31p1+ph2Ex8v9n0=;
 b=uVAW2cX/HnlaAy37SBWWeQcsnWazbA35MSzrajTjhYRbv/yx6rCKn3EnC7Sg+vjnQu
 nwcb29gKoiaYcURJiDqOi3Wbx7KHZLtIUxoDCcSkNZIL+TnTzXmYOUhcW0PSN+ZmmuGE
 mkOzvFf2c9g7OQwFbezjcwCJIkzOXuQshMLfBgbYxyoucb560xZ3CFYZDZXitO3aZRxQ
 5sxrQjjZvpL+OCCaRa3N+UkkXXSjIEjp0IYP7ACjI7bwl3evM3ZkqYFQA47D3ioVS2fz
 LO/Dt7wbGl99jgzsIHtJA0QORj3uJATk61vi773geLY6sbjW5We5564hSWFgPVlCpHd2
 mwfg==
X-Gm-Message-State: APjAAAWZrZEi5Srx08CaFpRPQkuXLh/qwAabyRxJGXxWOyVW5lLFKNFT
 fbwUnnkkh9xx4u6M+EWuFznRUSrr4Uj6khAhlbw=
X-Google-Smtp-Source: APXvYqwkzQ/PL1iNnbMXeVU/K3oC9f1m3PREeIvuYuGYPi6X7TdEL+3fLyK8EKD5nbobCsQ/whl/nZOY2IBA02izxpU=
X-Received: by 2002:a7b:c5c2:: with SMTP id n2mr35655594wmk.9.1567407961503;
 Mon, 02 Sep 2019 00:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <1566280428-4159-1-git-send-email-masonccyang@mxic.com.tw>
 <20190824130329.68f310aa@xps13>
 <OF22C5A579.E2E7676F-ON48258465.002F7F69-48258465.00322849@mxic.com.tw>
 <20190830115100.3fec9bf1@xps13>
 <OF08E1C5EC.4DAEB179-ON48258469.0025AFFA-48258469.0025D2F2@mxic.com.tw>
In-Reply-To: <OF08E1C5EC.4DAEB179-ON48258469.0025AFFA-48258469.0025D2F2@mxic.com.tw>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 2 Sep 2019 09:05:49 +0200
Message-ID: <CAFLxGvyAk33SZY2J-WYzKMW6N9mKiJ=y0XfmMd8RjUVV2Rp5vg@mail.gmail.com>
Subject: Re: [PATCH] Add support for Macronix NAND randomizer
To: masonccyang@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190902_000604_308665_1BACFA90 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>,
 juliensu@mxic.com.tw, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>, frieder.schrempf@kontron.de,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Sep 2, 2019 at 8:54 AM <masonccyang@mxic.com.tw> wrote:
> > >                 nand@0 {
> > >                         reg = <0>;
> > >                         nand-reliability = "randomizer";
> >
> >                           mxic,enable-randomizer-otp;
> >
> > Would be better (with the proper documentation in the bindings).
> >
>
> okay, thanks for your opinions.

Please document also when/why one wants to enable the randomizer.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
