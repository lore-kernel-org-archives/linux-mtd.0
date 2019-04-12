Return-Path: <SRS0=Ifuc=SO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8977FC10F0E
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2019 07:34:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59BC52077C
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2019 07:34:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MeFv1hZV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fiB6UsaN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59BC52077C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8z/xtII0cMMkJgsgk3BNbwYTPz6RgJdYZdDfYoCy+k=; b=MeFv1hZVOqAgfe
	jafGRKTRCOWnhw84/eAj20pz74rVnsT1eum0Cgk0y6vTxT7iR7nOmRjSv9XjM1TSGv1Cx0cl4CmvI
	IC/vqS5yB/7nHMmUG6N1odqvtEx5jT6Vt/w5doKZZfruVXMxejE/hFVsyPBGMS0Vjh8rFO8zY1zNK
	zmmJ3YYjjgrl7xFZM9vd7vJh2eu8nJWqmx4yVkrZi7PeS1yZldts7+pzP0NOGi865qtr2TcqjihHW
	Z+O1PY+NQqM4MDcL8/+mMEEUXgWXBUoS2gynVC+kiU8ux02il7CIrGPUMlx8h0uvqKX6D/8G4fuD9
	ODsKgw3mWShzL3cfVlyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEqhh-0004rU-5f; Fri, 12 Apr 2019 07:34:29 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEqhe-0004bh-Ey
 for linux-mtd@lists.infradead.org; Fri, 12 Apr 2019 07:34:27 +0000
Received: by mail-wm1-x344.google.com with SMTP id c1so9895972wml.4
 for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2019 00:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aqq+UF+ojp/snsJOkpobyrt5mA8FIQ871yZlmtH3vo8=;
 b=fiB6UsaNoJdNjU8RtmOl7mLmFzly7dzQbFKrU3tqXdb3lrqjvZImBudaRTCSKir11y
 XGYiOQv+3IL4Y9Fa7dPfzSJshMRyJ/K88JXyhDpWAFfomimld7T3KLZ1tJnpYkEC/Fmz
 9NNtubyUnPCeZ1jsCCWTIWiByyclEKRCUuamqVa9S+vu7SAS6qDJFFNRC0KGQ3d3KUzo
 bHcsAgL8O0S5f6qiYGsjPkb8/FejE8K0bVXHTL7We2SbNGR3PcWLUXKzdN1ZTiNp37fV
 zB8Zdsvk8elBrBOe6kgeBk9Tp3+VEgbdl8qAKjOiCNx/uJinlK08tRSBqvETJoASRsbb
 OZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aqq+UF+ojp/snsJOkpobyrt5mA8FIQ871yZlmtH3vo8=;
 b=AM2y/K2CRJ0xRERHAaWjmcJ+QXOITKCSpicK1vuGBEkjsXJEEzt0QacVuPWKIEvA5Z
 qUyjtotr6S7sAuxPenTvi1PitrKzjN0GZg4PlEak1219A9FKKLM9JmCZLwZIORmTQI4y
 3gBsu7cxMy1pbcKPCiRdpao+uzTTNp1jUAb0g41KvrSmf+Y6IOqp2Xttykh49PzD6Liy
 4/cPWYQiKdZKxKmTOsOG7CajBXd0I3lmjnGf/WVAJ2Zl9RIPd5CCh9jHomKevZ1SUhV3
 R6f3S546v003Vf/GmUIAtkr6/KHYadgEJpXGQwGHj2ZweWWxvcShsxfkDJTuFKkSq9uc
 gm6g==
X-Gm-Message-State: APjAAAVKqC0E1O2Xt2fN5fgZWSzsgYC5aPBesYYwFPx00CK6v+pDVDEJ
 dPk+nmiof7145A2sYl4GH8YTwxXa9Ia71FBFXZY=
X-Google-Smtp-Source: APXvYqzgpwDhKG9AoqBoRV/UGSH2nPd0T8cvITrlzgp35LOZ2kPfwblCDPpUggQRt5oX+yh1olEUTbOraqpL/19UXKE=
X-Received: by 2002:a1c:7008:: with SMTP id l8mr9530257wmc.49.1555054464562;
 Fri, 12 Apr 2019 00:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190212002501.96725-1-brandon.maier@rockwellcollins.com>
 <CA+fik51fDL4i9VYeo7dkYvz_fKjdsF71nbQuvWU8qUSSQez-Bg@mail.gmail.com>
In-Reply-To: <CA+fik51fDL4i9VYeo7dkYvz_fKjdsF71nbQuvWU8qUSSQez-Bg@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 12 Apr 2019 09:34:13 +0200
Message-ID: <CAFLxGvwcscrzsRmF39kZNHqfHSwSTkq_8gfJ3EVkHkgW34gZCw@mail.gmail.com>
Subject: Re: [PATCH] jffs2: Fix use of uninitialized erase_completion_lcok
To: Brandon Maier <brandon.maier@rockwellcollins.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_003426_531628_482A167C 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Apr 11, 2019 at 6:09 PM Brandon Maier
<brandon.maier@rockwellcollins.com> wrote:
>
> Ping
>
> Should I CC JFFS2 patches somewhere else? I don't see any traction on
> JFFS patches in linux-mtd nor any emails from the maintainer Woodhouse
> since November.

I'll take this patch.
Thanks for fixing.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
