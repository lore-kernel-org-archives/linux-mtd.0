Return-Path: <SRS0=velq=QK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0109C169C4
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 14:11:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FB4120823
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 14:11:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yk7E4yKX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="M+4jiIAb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FB4120823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qosyPn9B+AIPYRgt65bDCDmGDeO/yPjE7MEhX6/Y07M=; b=Yk7E4yKXfbbBPb/vyYZEmUgne
	Ugb48C8z1acVPnkkxICLs7Ucna+DxzdttCNq0WY0ZMl9qGsxwoLpbFoMV8M3+Eo3PoSz2mHTkbmRe
	mhb2XJjwbhbaXxxY3ALgWo5Ds/IMqZkdDo1m7tepA45x9a1QstLSAHGXyDy+evQzq+Y6oQlISbBX5
	DMHHGem47beP/8oY6yqW+0Qi9Mvgju5qdvk/hZmXcdVxalLNqCQaR6St0ub0ovOyrgTG5TydE41R7
	imAhFX+P5loaS/bgwO4oTv2mFyOTcS5kJdwt1xhNVN7Tkps+GH/21XIlAPYKqK3R8VHTuSsS4fl/H
	EaC5wk4wg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqIUK-0001Nw-SH; Sun, 03 Feb 2019 14:11:12 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqIUH-0001NH-OB
 for linux-mtd@lists.infradead.org; Sun, 03 Feb 2019 14:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1549203063; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vUeJSVJNTKtOcKFUhT370ooy6U0g+chsEkJDoeiumD0=;
 b=M+4jiIAbmOwI1plKXIUhjrhGOVVvZk2JahwIcdvsOsBrFjwwj7YT/px/x4bNyApNootNdW
 xFihVc6T1GXa9M+s/UBUbmsDmNwjU0zD4qPWnDDv/Ng6snfA4++mzo9/TSgW8GKsZAwUu2
 g1dl8VpxaS7I42bb4jnmj3RxVP7NGh8=
Date: Sun, 03 Feb 2019 11:10:50 -0300
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 4/9] mtd: rawnand: jz4780: Add support for the JZ4740
To: Boris Brezillon <bbrezillon@kernel.org>
Message-Id: <1549203050.1950.3@crapouillou.net>
In-Reply-To: <20190203150827.401ac31d@bbrezillon>
References: <20190202231926.2444-1-paul@crapouillou.net>
 <20190202231926.2444-5-paul@crapouillou.net>
 <20190203083151.4fc29c5b@bbrezillon> <1549202213.1950.1@crapouillou.net>
 <20190203150827.401ac31d@bbrezillon>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_061109_974753_09F0112C 
X-CRM114-Status: GOOD (  17.12  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Mathieu Malaterre <malat@debian.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



Le dim. 3 f=E9vr. 2019 =E0 11:08, Boris Brezillon <bbrezillon@kernel.org> =

a =E9crit :
> On Sun, 03 Feb 2019 10:56:53 -0300
> Paul Cercueil <paul@crapouillou.net> wrote:
> =

>>  Le dim. 3 f=E9vr. 2019 =E0 4:31, Boris Brezillon =

>> <bbrezillon@kernel.org>
>>  a =E9crit :
>>  > On Sat,  2 Feb 2019 20:19:21 -0300
>>  > Paul Cercueil <paul@crapouillou.net> wrote:
>>  >
>>  >>  Add support for probing the jz4780-nand driver on the JZ4740 SoC
>>  >> from
>>  >>  Ingenic.
>>  >>
>>  >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  >>  ---
>>  >>
>>  >>  Changes:
>>  >>
>>  >>  v2: - Add support for the JZ4740 and not the JZ4725B: they =

>> behave
>>  >> the
>>  >>        same, and JZ4740 is fully upstream while JZ4725B is not. =

>> The
>>  >>        JZ4725B devicetree will then simply use the
>>  >> "ingenic,jz4740-nand"
>>  >>        compatible string.
>>  >>      - Fix the number of bytes for the ECC when the ECC strength =

>> is
>>  >> 4.
>>  >>        This is needed for the JZ4740, which uses Reed-Solomon
>>  >> instead of
>>  >>        BCH.
>>  >>
>>  >>   drivers/mtd/nand/raw/ingenic/jz4780_nand.c | 48
>>  >> +++++++++++++++++-----
>>  >
>>  > If we're going to make the driver compatible with jz4740 and =

>> jz4725b
>>  > maybe we should rename the source files jz47xx_{nand,bch}.{c,h}.
>> =

>>  I don't know about that. Adding support for new hardware isn't a =

>> good
>>  reason to
>>  rename the driver, or so I've been told around here, as you then =

>> make
>>  it harder
>>  to review the git history of the driver.
> =

> You already move files to a sub-directory so that doesn't make a huge
> difference, history will be hard to follow because of this move =

> anyway.

Yes, but if I merge the *_bch.c files together, and eventually drop
jz4740-nand.c, does it still make sense to move to a sub-directory?


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
