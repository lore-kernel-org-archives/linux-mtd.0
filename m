Return-Path: <SRS0=IhQK=BN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C26C433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 10:19:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0CF920678
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 10:19:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XyBpQ61K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGZ0QXkM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0CF920678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RPnA4Yj9sHN0areV7EcK6m1F0GoZjz93UPSMmCWSKZo=; b=XyBpQ61Kl7XAFGcEdKW+UzR3s
	3469rHsAOErPwLUIIy2c59vLUntVCxd0cjjC1nL6Q/ApVzoDP7lJO0/RjcEWxUH8JHaUGLg+leZVp
	xlp1VdlH1mp+alEIKK0WFZrR2JmRi3GU45VwqvYDMdApMcU3Chg+VPt0BRIKk5UhrYSdp02JOY0EX
	Tao2QC+YFFH42XmE+YHOBcLHCFsPrGp0Tnj2Hc49VlA8aygik7OBhImwv0nelczFT8iVil9aMyQCH
	DA8z1UUzzokVj/niIQbi5+dtLq25xVrGa6RdRvswxXNlzuJ7/xPNCSifS0YNCOJPunrVIVdv0NG44
	TAJH4iJOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2XY5-0007f6-UW; Mon, 03 Aug 2020 10:18:29 +0000
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2XY2-0007di-RO
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2020 10:18:28 +0000
Received: by mail-ua1-x941.google.com with SMTP id y17so5534007uaq.6
 for <linux-mtd@lists.infradead.org>; Mon, 03 Aug 2020 03:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rnGkiTDp9E3rHzKy6YghTS3W9G53uuf3g0jyIUWx/X0=;
 b=eGZ0QXkMDfZSBr593z40Ozez0QyFSDV1hNy8UFRCYTx6p8fiM25n4T8MwpfXFskY/G
 emzpfy/R4uHBg4EtND4UOGHWc8gNPnFyZXyC0J3CocwU2QVf/vieXAWYuWyxMIjnX7Bl
 CRrMO7md4uUbAypGQdz6S65U0PjTqjQq9ixOT/WmKhPpdyJXseZj3E0nBvs3dB6xA8E2
 0nXf5XY8faXUfaV7WIw7kXCPPAbKM+/6h6WTcHbBlJyc8hyZ7agReGbUAxKlPZrEnpw/
 TrcxxBR6Mw15fvg/7WP8QyIm9F9lXF9hlGnRZ0DMmqBWtUFbmtW1BC2IdKSIk2Uf5Dpe
 Y1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rnGkiTDp9E3rHzKy6YghTS3W9G53uuf3g0jyIUWx/X0=;
 b=mw3Wpa8QMQ1qs5zzvo5NzCjzFicXdwlzgRE72xXz6mmhfjDJbHZa8FHIJ6opJ7Jwol
 JirK2JlcgjE5nrsWfOnq2+eK68JrC0fXAcvCW72W86KKuRDF9KLMJPb2qs1TveyNHXPj
 0l92TtsiYTg7z76MzJsLJzhEYCcL1u2MhZJiQm9LRPXqT4LDfIxFjsCHS6E9MPWvN2Ks
 srHrJg4ZL0CP7j0PNw/JFN45cm9WsNeUsNR1oSS7Tc/doP3Tcd67KJ0A7/Ef8Yg7BDbv
 RFrFR9jduAOpd/ZAxum1dqNRLEdXsLgm1JFHg6n5199aqFZYOLXA3dY4M8ZseCZ324E3
 SaFA==
X-Gm-Message-State: AOAM532t/HoN4e1+QH5Wlw9aOxGIHrpfYZzeTkY4QXHqMYZ9gfLtkTb8
 YlCkyFTQIZrmPNbMaUI9T289dHFXSV/dfe84SaI=
X-Google-Smtp-Source: ABdhPJzBwQ6qtnjisxk6h/1XBYxCcUnUvMtpeFdzghcFrthLpr5cK3BVOyTshFL2tGRaO01KTn7ytL8cx/hbnhdF/Io=
X-Received: by 2002:ab0:5a6c:: with SMTP id m41mr10374387uad.61.1596449903550; 
 Mon, 03 Aug 2020 03:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200724212853.11601-1-daniel.gutson@eclypsium.com>
 <20200803095720.GC1375436@lahna.fi.intel.com>
In-Reply-To: <20200803095720.GC1375436@lahna.fi.intel.com>
From: Richard Hughes <hughsient@gmail.com>
Date: Mon, 3 Aug 2020 11:18:12 +0100
Message-ID: <CAD2FfiFt6=OueX3E0g2ckPU+7F69yCmM0+bzF_6UD1sd4E_k_A@mail.gmail.com>
Subject: Re: [PATCH] Module argument to control whether intel-spi-pci attempts
 to turn the SPI flash chip writeable
To: Mika Westerberg <mika.westerberg@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_061826_951418_376908A5 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Daniel Gutson <daniel.gutson@eclypsium.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 3 Aug 2020 at 10:57, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> I think instead of this we should simply make it so that the driver
> never tries to make the chip writable.

I think this is a good idea, but I wasn't sure if it was an acceptable
behaviour change. Should the driver still try to set BCR_WPD when
writing an image (i.e. defer the setting of write enable until later),
or just not set the BCR register at all? I think your last comment was
the latter, but wanted to check.

Richard.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
