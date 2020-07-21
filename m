Return-Path: <SRS0=j43f=BA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07003C433E6
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jul 2020 17:03:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5EF42073A
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jul 2020 17:03:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2E7MwDkD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pensando.io header.i=@pensando.io header.b="4uWpzaBg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5EF42073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pensando.io
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CQeu+8Qrw08kMd6hDmME/8urJQR7cgyUjRqGhSVRfLk=; b=2E7MwDkDmxpZZfHp+guOQDxyl
	8tgXUb1QQXr8ijo01LHnJA55dBrq3zc8T6fZGPInBQrTkG7+K45Bxr5Jy4LuiZ0wryDvXLpnjqd8x
	N7ySgLi12XC6h40gPA70TiyHGkr/39KwySOP/wpWiYKWqd+mqiywqmOJZC5xfY+00Xzb51jIA8vG6
	yciwI0bFh7KVkvUk7fWaRXt/29PdkVPyRImMuaqoQdekEAp5EmaHv7Cft3EHx/ZalGzE4XOCcTpk0
	Qf19J9JKHMU4RE8G+dhuwnrZNdCNJl6tvZgZp8O0QfUiIbFegH/6LfrI6aGQtsPtXmqjCDF/B6Sz3
	NqxHudWfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxvel-00076v-HQ; Tue, 21 Jul 2020 17:02:19 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxvei-00076Y-FS
 for linux-mtd@lists.infradead.org; Tue, 21 Jul 2020 17:02:17 +0000
Received: by mail-wm1-x334.google.com with SMTP id 17so3612516wmo.1
 for <linux-mtd@lists.infradead.org>; Tue, 21 Jul 2020 10:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pensando.io; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T//OL5MjSVPVY19h3G1pYDXrSrNyGC9XieuAk8qRvoE=;
 b=4uWpzaBgrn8VvSP1hSN6d4OG8ArUrFpKjx3Src6tnpsXYUnicCT4ClEBQGWbvq4OWd
 x6UE1JSV3H/Ultyx7E2UGzU4FK9EJRuAYXkqXn7cnH76oaCFmaYoP2A2o4Zx1wKuAqoc
 +50DTNyYbFTh7Usty4J3rgmqU/6PtKC+J/5zJ6vsn+hwhC35AHn/7w8P3VEUqktcfQJa
 SeeMfow1DAnUDaW8VUVjUhulj8CP1nkPEDWOKMttqqy1s8ReiikVrauCGMemRiU/DFFF
 2wZIziBzagCZ6hMT+pbE/jnW9A/HgcB9cwqA5oNtKYIR8lg+s7Xa/8+uhEnsDEoPW9DA
 3dvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T//OL5MjSVPVY19h3G1pYDXrSrNyGC9XieuAk8qRvoE=;
 b=WqEfWas1LoVSO4EdMhEojGU+GleZcDGJS4B804bjR4/XBA38BxNrreZiYDaqpDOFlU
 eTBnQyB1qPUTtOUCAI7SSlfoRokaMlZbrb1egjFvqdC87f+3U3vRovd4G6mS2KMaP4jC
 xoAcCRuS5GnHbF9BBsTkEPmCEO3j+nUsg619eaCAEizZMfL+YjmJXnZ3RBt2+rwclilr
 P5Ns7SA0IyDfT783/Cq41FZK9aPflkSAWw04enVT+gwhIJw8wQ9G1fcRKCpsR8ULelju
 lgsXFvK+/SsGO59ekkw72+Jg2De/fqCPHDUpU2UZ68uQfxr65hdupyVFQAlAtXzcXfjG
 ns6A==
X-Gm-Message-State: AOAM533FvnT0IQ5GCVeStDVvlULDFT1ehMAG72gDZYlMg/z0Ngr0giVz
 ZtxIQujZcfYjUphVz5rNJJzm9yAaWc2pXh3HWV6slA==
X-Google-Smtp-Source: ABdhPJyO2OhwPQSpAB7IYZcnXlxmL5q3KCdQTG8uYl6ijSrnOwmwPQ0HEpdfapQ6GvbOCMm/2bcY8Ao6rvbpb/FJr0U=
X-Received: by 2002:a1c:2dc6:: with SMTP id t189mr5154106wmt.26.1595350933227; 
 Tue, 21 Jul 2020 10:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <CA+nMikGSSc5NA80Z89fz4GCh+6Ux2Pr6UyjB5n+qoBkiOqAh=Q@mail.gmail.com>
 <1ae4f44a-cbd2-b39e-68f7-3d0375c453bf@microchip.com>
In-Reply-To: <1ae4f44a-cbd2-b39e-68f7-3d0375c453bf@microchip.com>
From: David Clear <dac2@pensando.io>
Date: Tue, 21 Jul 2020 10:02:02 -0700
Message-ID: <CA+nMikFjaWtzHnxALYvyHfqkpXnHA-i3K86hPEwFQ+-gOm2O0g@mail.gmail.com>
Subject: Re: [BUG]: spi-nor: spi_nor_init() fails when SR locked
To: Tudor.Ambarus@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_130216_789502_F2D75142 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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
Cc: michael@walle.cc, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2020 at 2:37 AM <Tudor.Ambarus@microchip.com> wrote:
> We tackled the unlock_all stuff in
> the past, Michael did a patch, I'll check how that fits here.

Thanks Tudor.  The new Macronix mx662ug45g flash in my patch also
supports similar block protections, with WP#, but it looks like the driver
doesn't support BP in any of the Macronix flashes.

The functionality is similar to Micron's (power-of-2 sectors, top/bottom,
WP# lock), with two differences:
1. The BP bits in the SR are in different positions
2. The Top/Bottom bit is OTP, and is in the Configuration Register

As Macronix flashes don't declare BP support it looks like they won't suffer
this specific issue (I'll verify in the next few days), but I'd like to
evolve the driver to support BP on these devices.

Thanks for the patch pointer.  I'll take a look at it.

Regards,
David.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
