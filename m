Return-Path: <SRS0=fen1=WJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3187BC32750
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 21:42:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0032220842
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 21:42:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hh3x0u2H";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYsBtfJh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0032220842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AfjasifAfWqTqz1q43t4xr0z+48rY66WTa5xWjG3zd0=; b=hh3x0u2HJuElw0
	f2uKWBES/488u1kTKL0cOlF2iKaRq3MGbbJbyH+NqJGn2cHEAOOZDGOX4AC/asdusKv0ecWJc6HBB
	4eys8mZSFFL/aRCitSGQF5eg9hFzi6HOEwOuU7miSX6XfOwQet0vo2cFZpXiuA4paDyZEfEn0oYcL
	PnwAT+mrydKlUUTtsTtjQBz0QSDS83L4o7iiVB+1HmiRPkXsqSJpZplsO/Yi0WodyWPTiVLoaZqej
	8NHfJAM0JpZuzluMni/qpOMs5OajknDdsOJHLfSM/ubboV9ZshkIv974p5iOPJze19CpRLl2v9UNl
	poGrkup+krG2RnoeXEtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxeYR-0004V6-4B; Tue, 13 Aug 2019 21:42:07 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxeYO-0004UR-8I
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2019 21:42:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id v19so2685078wmj.5
 for <linux-mtd@lists.infradead.org>; Tue, 13 Aug 2019 14:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zviBgTXdd7Wd5QwCSfPwok1v4P7y0MIR4OVe9mdX+ik=;
 b=IYsBtfJhY7dH6PRfT4VCXl4G+2qGIE6SK7cZE3iYweIes0ORt/NuA7OrnzC64hz78R
 CvcS4dw0UiGeMNpCa04V3FGpii8KAeN/NHZdNUxV5zwqjSAbkJT1u4qhMt3+cj9qdlS+
 6PvOT/SrA9AijdgZfcHc7dj8hrAxnX8ujXKp8bB6scBtzhQqHM/Vzk4CAqM7ldrP0r6y
 JKosRe9BtJqeXDg/zMg9nNwG18O6/ymKPoIj+DCgAAWAYeHGcgZZA0g+fpv+HPdaLugf
 rtME5yvjuHV5OO0VP8xeh4WtrSfGcgXs1hwAotAcAj1VL4vHdyHn6FvP1WI7vFV+w2Tq
 CZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zviBgTXdd7Wd5QwCSfPwok1v4P7y0MIR4OVe9mdX+ik=;
 b=DiCxMj7FMqNXhECpcpYpwMY7D8TDM6Fusf9mf4jSZBneTR2yKmAHbqX059Ctd8OSFr
 AiuXoIsbb7Co6bVKw6Vk3R2MI1VyV4g9cciUOGDV0XTKBkQ86JZDgLPEjQmwC2b/SHXY
 Iol52ozYvA+gtAqGTP3BU4iLpHrA7QFzgIVlKjSRkSBg1QE0zJXqBUASWFFU+5AUJwh8
 iFeHgk/ojCvIyxzRJbEI835l1YY9Bk/VpgTZeI6JrdiKfdPmkASN8hWLZedy7EYPmX9U
 5n+BVbYvJ8QhkM1KKMc9PRidWrDyxcqyGpaFUGXTVrtDE0IttEdxd615QrlxjHp43Lnm
 GWoQ==
X-Gm-Message-State: APjAAAWorPlpbfT9hVZEZdSHUlGlBngUFTQRCWUEAp6/e449wnAXlzWL
 mbNm89KhjXKW3P543D+1isLmozAPfLZbCNW0q0Oe+Q==
X-Google-Smtp-Source: APXvYqxe2hGOV3nimkIFh36hHjq+Yy7XFCKZtOuhPEH4op9edh4PMP91tk9aPLc0CUfDHkoUekYQftH4bYFF1m74DS0=
X-Received: by 2002:a1c:9e4d:: with SMTP id h74mr5204646wme.9.1565732522393;
 Tue, 13 Aug 2019 14:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <5D3EF488.6010307@etictelecom.com>
 <CAFLxGvyicArpTC_VmE8GPXeHwXVT3CV-Z_5v-+qo=MB9i_-6-w@mail.gmail.com>
 <5D3FF1A6.7050407@etictelecom.com>
In-Reply-To: <5D3FF1A6.7050407@etictelecom.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 13 Aug 2019 23:41:50 +0200
Message-ID: <CAFLxGvzF8iDJG_rTqGwrLdmFsehaLxD4os50_QLZTMjytVQ9Dw@mail.gmail.com>
Subject: Re: ubifs_check_node: bad CRC
To: Mickael Chazaux <mickael.chazaux@etictelecom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_144204_298836_56E3DAFD 
X-CRM114-Status: GOOD (  13.02  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jul 30, 2019 at 9:28 AM Mickael Chazaux
<mickael.chazaux@etictelecom.com> wrote:
> > That easy?
> > Hmm, sounds a bit like a bug in your NAND driver. Did you test it?
> >
>
> Sorry, I meant : the "nand-image.img" file is coming from a corrupted device.
> I ran the mtd_* kernel module tests yesterday. All seems good, but the torture test
> is not yet finished (see below).

Ahh, now it makes more sense.

> The problem occured in the field on several devices, and I cannot reproduce it
> in the lab.

It sounds a bit like a memory corruption.

> > Please also disable compression in UBIFS, then the read back data maybe gives
> > you a hint what went wrong.
>
> In the corrupted node I see data from syslog. This system is a bit different
> than the others we usually make, as there are more power cuts and more log writes.

Hmm. Power cuts or many writes should not trigger such a corruption.
I'd expect ECC errors or data structure errors in UBIFS. But not a good ECC
with bad UBIFS data CRC.

But with only one sample it is almost impossible to figure...

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
