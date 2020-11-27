Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6455C3E8C5
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 17:36:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D4A3206CA
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 17:36:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QRI0n80s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="xnH3Mpdn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D4A3206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nbp7uaACELDph8dhEu0qFC69Dmur9b7xy9VocnePwCI=; b=QRI0n80suoziNzuaD5kTUaj6m
	HRiPbhOfNphGkljCP5OTo8JOmr+wvQmFLPo0M/AHlF7XiJAxQ72F8vlnuMBogO+xBMl8XKiq6paLf
	wtDigxAfvl7PRlcm3m8F6TPwssWp21g5ct43VrQQavf73N7vBFGa6JS+W6FrqDLfGlq7HX/pdMIrS
	r/j356wYUVln8t2gG1Sm+TIf9biuMh1LZijvdqSBYJMW3PpsWJNTuQdBMPwxzvFTuHqT9hpzPBEeW
	iwUkttx7BBpHEgI9pmtZYw1ejjPd5ryqvfQQsHFWLKHpQ6uptczGXLxPM0IXxyVOAVNrW2Mhk+1TX
	oW+Hcxndw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiheb-0000zG-4C; Fri, 27 Nov 2020 17:35:29 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiheZ-0000yj-34
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 17:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1606498525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TRZqemWaOhYT7No0jAIADxHkJYRzEpFq4s+Pznmd268=;
 b=xnH3Mpdn/b9LKnKOH5BHXnlUFYof9GEI5VOcfPZs8EOKAP1mrSGJ54f7bHzd9WDOMBTQbo
 LrPMEUAmBK6B+k0+fiB3oPc8ewU73hsByh7WN7PmxVSBJKN0TpR02DTa4ir6jR/XSaqRau
 Jbhxa4sSUP1L/HRNPpcKfBgztnaX+4I=
From: Sven Eckelmann <sven@narfation.org>
To: ron minnich <rminnich@gmail.com>
Subject: Re: [PATCH] mtd: parser: cmdline: Support MTD names containing one or
 more colons
Date: Fri, 27 Nov 2020 18:35:18 +0100
Message-ID: <2124367.HovnAMPojK@sven-edge>
In-Reply-To: <CAP6exY+hHrVvaMcF2tWUUJT=JS_J9NHx=92DzO=GAN==ACSh1Q@mail.gmail.com>
References: <20200429165347.48909-1-rminnich@google.com>
 <2666350.AiC22s8V5E@sven-edge>
 <CAP6exY+hHrVvaMcF2tWUUJT=JS_J9NHx=92DzO=GAN==ACSh1Q@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_123527_274988_FAA567AD 
X-CRM114-Status: GOOD (  17.18  )
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
Cc: Sasha Levin <sashal@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Ron Minnich <rminnich@google.com>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Schmutzler <freifunk@adrianschmutzler.de>, jstefek@datto.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 John Audia <graysky@archlinux.us>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: multipart/mixed; boundary="===============8400618154909411060=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8400618154909411060==
Content-Type: multipart/signed; boundary="nextPart3050561.0WQXIW03uk"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3050561.0WQXIW03uk
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ron minnich <rminnich@gmail.com>
Cc: linux-mtd@lists.infradead.org, John Audia <graysky@archlinux.us>, Adrian Schmutzler <freifunk@adrianschmutzler.de>, jstefek@datto.com, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Boris Brezillon <boris.brezillon@collabora.com>, Ron Minnich <rminnich@google.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] mtd: parser: cmdline: Support MTD names containing one or more colons
Date: Fri, 27 Nov 2020 18:35:18 +0100
Message-ID: <2124367.HovnAMPojK@sven-edge>
In-Reply-To: <CAP6exY+hHrVvaMcF2tWUUJT=JS_J9NHx=92DzO=GAN==ACSh1Q@mail.gmail.com>
References: <20200429165347.48909-1-rminnich@google.com> <2666350.AiC22s8V5E@sven-edge> <CAP6exY+hHrVvaMcF2tWUUJT=JS_J9NHx=92DzO=GAN==ACSh1Q@mail.gmail.com>

On Friday, 27 November 2020 18:16:54 CET ron minnich wrote:
> What none of the people involved in the original patch knew was that
> there would be other ':' in use. Sorry!
> 
> But you are right, my idea is a complete non-starter, don't know what
> I was thinking.

I am still not sure because I still didn't get what you actually wanted to 
change. I first thought that you wanted to change

    mtdparts=spi0.0:256k(0:SBL1)

to

    mtdparts=spi0.0!256k(0:SBL1)

which wouldn't work for me when ":" is not supported anymore. And it would 
break a lot of already working installations.

But maybe I completely misread it. Maybe you wanted to introduce an 
optional(!!!) stop marker like !

    mtdparts=spi0.0!:256k(0:SBL1)

to inform the parser that it doesn't have to search for : before the !. While 
this could work for me, I am not qualified enough to say which character is 
not yet used and can be utilized.

But the note about [ and ] at least makes sense to me (if it is optional):

    mtdparts=[spi0.0]:256k(0:SBL1)

But I am not sure if this will be a problem for people which already adopted 
PCI IDs inside the mtdparts without [ and ].
 
> So it seems your patch, if it works, is the way to go?

At least this is a workaround [1] which can be pushed to all the stable 
kernels which broke with the "Support MTD names containing one or more colons" 
patch. And the one which OpenWrt adopted now to get the devices booting again. 
It is only waiting for a Tested-by from you.

> I can't think
> of anything better that lets us preserve current behavior and support
> PCI device specifiers?

I am not that deep in this topic. So I am not sure what else could be done.

Kind regards,
	Sven

[1] https://patchwork.ozlabs.org/project/linux-mtd/patch/20201124062506.185392-1-sven@narfation.org/
--nextPart3050561.0WQXIW03uk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl/BONYACgkQXYcKB8Em
e0YqYQ//eZ0ELo+2rGIVY7/IGWv75TByV0jRWWSx4r+P86XbsVZ1m4wS0NV4c3+H
3HbLgvNe3F3JNJLOusL86+ycVOXSmSSqNrFIv8wR/QJDGlMMNHfGX4f5pmFzx3Ut
ubxOd2tKRKfvEjLhHllZPYyUU+xwMx2xm7KGS0A38+0g4M9KsWavXbbqOjK+c2hZ
vEagwsFdGaogYQagv8qllAgJG+Qf/7e9azcFIXM9g6V1C4QpsodnpPZh8Ro7SG3r
Ev4p4falqGb5jd0ajCNnVATpLvQCCSqEGf5UsdzcGd+kwMzYn+30lZe1Wo3eiwO9
sEfnwdyJINTJu9uPQihuYd9V51uP2i0mnNBOEnrCTVMhEMV4gMFMNPUIgrj6vPQi
YnPx4EbkRSeX1XESX5/crdTQTDrodfzHEXxcbuCEbJgMXOlF7F1gWiUlj+wTSXP5
Zg08AeIFR0AM7lV2zLfNmxLQrF8kj4n3pCUfI3ArDYmqkw4VdUPkl0XSSmNZFcvQ
e3NTslUuUtNk4Q/QD6746Ol8e0kIA88JR48RueRrtvy6AmYKN6I4ypoWrATpgsq1
jt+ZNDXuaofGmsrPhqoBcAskat25ZRXCdr9MqD2TBoRLxkAsfmVrqEpS94WWejqe
JRdTcZI8VHlP/agPF1FBnLOY5JkRt9tgBH7ma0jH2CEK+LrYEaE=
=Yxrb
-----END PGP SIGNATURE-----

--nextPart3050561.0WQXIW03uk--





--===============8400618154909411060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8400618154909411060==--




