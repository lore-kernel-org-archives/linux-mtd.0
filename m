Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E94C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 19:48:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E8AC218FD
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 19:48:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eKBy2v4I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="a07YkhAS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E8AC218FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hsrNRB3F93qGfETABdPZW+MXX2c2yc+bucZ0LyDRAmI=; b=eKBy2v4IM6vjT8
	RJ1TaNejH2Y6YdtlHBx3RfPrFC2nLX0Mu+fGxb6prvyHOazJUbgtMIGOhKtG9EK3+nRzYCHLX8yga
	kKeZJKjb5fcue0OGC53uSu1+umZDsiAiKDf2bCEeBQ/s3txPhnSE51OXSuWq1g0Mnmo6saw0CgEkW
	jRQlR2pz1+TjoICJ+GMTcOVP6oJ+b80ikYRDr0Jjx7EJOb1xBFXLzYekCS+Lg3UKeUD5olsl+NHTC
	TNuZwd0ehHK2KUYV7yf4mQLGwKGstaNTTYNNIx+xGdyzpwTKipwADgpQDSY1veKZp2VbM0av4exRA
	ElGcHmIhLUrjGvpX2rJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h73gK-0005Ju-4V; Thu, 21 Mar 2019 19:48:52 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h73gF-0005J1-U6; Thu, 21 Mar 2019 19:48:49 +0000
Received: by mail-oi1-x244.google.com with SMTP id 3so4962131oir.7;
 Thu, 21 Mar 2019 12:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5zcWU2dTLuAsgRn/uaCWzV93GDxkM/l9+qmdryQUun4=;
 b=a07YkhAS3QDm+zZApgI0JQFpYazXYES4DeY36RKnfRsB7vhGXdxt/1g+XHEWWO4pRP
 psGhf65geakQWJyOrs6JbEMyUcIGTx/dRFYqqnTwJTgW5TjdmNfl21NJDG5lSxZP5Fzb
 3lUNCyFxc19TIcry3xz0h0ntpdIGDPElhwmLxG9eVR8wDRwjjQp9Bv8szPbgbjqszdAw
 OTaVd8bKBBKkF545L+zmkaWN0s+JNb2XNtvS/iL/9zu9/UvMtJigTLgsxG1YIfai42MO
 YXpt/va1gYeqhNvR497pGVcwPPpzoH1/YZaGGv11dMpeqmjmSxFDxQRDwpy4/65OwwxY
 x5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5zcWU2dTLuAsgRn/uaCWzV93GDxkM/l9+qmdryQUun4=;
 b=EBEnBTzIYwEIBYsaSSCsB/3wukrL1ti7EqQWgceWFc+5sF1dXMdPIvRPqCID4g3Gx7
 rMrfEIKYQZUwTQXcKDCFcgcdff0vV4FU8xPLFR5QGIvhB3FwntFhaPzhFPn/gZdplXi7
 iv8s5OnO2kAjvTyAvuEqlb0pkDX7Reuu+xy+m2wIpT1WqriJktMcIEORG7LjuhavOaes
 ONfp+jlhlGD8qdD9m5NqnyG3t5n4/yUYX4yFE/qBA8aIiO1dHm9t+tzdGu2jRo10+JkO
 SM/1FsvTuEdgzMiaD4uK8MeOU+ixdv7vLUdcvnsqnCpq3+CuaW9BNulMkI2FWW05UzZB
 Uy9g==
X-Gm-Message-State: APjAAAVfO0x4Y4k45QtAguCpwajol70Tws6xSIfFJ9CLckCCdzu7IC/m
 8ERWObEE4iDtJxSUi5mSL6YJXgzJg/k+fU41naE=
X-Google-Smtp-Source: APXvYqw8cxN35ECNqg92hsr7x3jP3Ry906VaP5u+ReWx8iRv0dqXSon10OTu2dRKboRYnxFDs7LSIn8boqYnzZ/GbbM=
X-Received: by 2002:aca:6209:: with SMTP id w9mr789176oib.47.1553197725400;
 Thu, 21 Mar 2019 12:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <1553170441-23448-1-git-send-email-liang.yang@amlogic.com>
In-Reply-To: <1553170441-23448-1-git-send-email-liang.yang@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 21 Mar 2019 20:48:34 +0100
Message-ID: <CAFBinCD65-e2Kx3vw60FGFJvauof7ADV3e=bt6A4jUNC0K64Ng@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: rawnand: meson: set oob layout ops
To: Liang Yang <liang.yang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_124847_998697_1BD7346D 
X-CRM114-Status: GOOD (  11.66  )
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
Cc: Rob Herring <robh@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 devicetree@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>,
 linux-mtd@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Mar 21, 2019 at 1:14 PM Liang Yang <liang.yang@amlogic.com> wrote:
>
> Specify the oob layout operation to avoid no oob scheme defined for
> some nand flash.
>
> Fixes: 8fae856c5350 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Signed-off-by: Liang Yang <liang.yang@amlogic.com>
this patch solves the "No oob scheme defined for oobsize 1280" on my
Meson8m2 M8S board, so:
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

to give a bit of context on my Tested-by:
I tested this with my work-in-progress series and a hack to make the
kzalloc() in meson_nfc_read_buf() return an aligned address (by
allocating PAGE_SIZE instead of PER_INFO_BYTE) on my Meson8m2 M8S
board.
it's now progressing to the state where Linux tries to find the BBT
which it can't (because the vendor kernel which was used to format the
NAND flash is shipping a custom BBT format).
before this patch I couldn't get past the "No oob scheme defined for
oobsize 1280" error.


Regards
Martin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
