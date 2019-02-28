Return-Path: <SRS0=M8pk=RD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4AFC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 17:22:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6F6220857
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 17:22:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nzPipe9k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcG5cyPw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6F6220857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KqbLiVENpSLl0njISvMxGAujf0W5PQqXDqILUuZE1Ig=; b=nzPipe9kWruu1C
	4IXhghzwnCMjD4kJ5mchNob4Pqaz1xlxBM/izsaJySA50M68ZvQz8x0SADKAsBK1fJ6evCTdMBiI1
	/5ohx+5kkDY2ZIoVB5lDqi//AjWABnJSmWzts078vful+H8sq+hNpImQ2FDdIarWl8CLlFDpUsRRv
	HimXUAdFUpOV/4Y+n5ikmj0b7mVTg3+mKXdocMGm7jjHTB0vnX+STyRVfdufT0Q+sSU6deaCOWbUQ
	ugKUH5Bv8kOrP3+O4oaz7LJ1ovBXZtHWq61uwwOUMCJDmfitz5cZmttpoSTIbl0sRMmm/gX9OCwKB
	XUlPZoy5p3kcUyvMRpzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzPNr-0004cY-GY; Thu, 28 Feb 2019 17:22:11 +0000
Received: from mail-it1-x133.google.com ([2607:f8b0:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzPNo-0004c7-4Z
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2019 17:22:09 +0000
Received: by mail-it1-x133.google.com with SMTP id z124so16877684itc.2
 for <linux-mtd@lists.infradead.org>; Thu, 28 Feb 2019 09:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZeAhBZzmzZAwltdjnNaSu2Xf+sVwXHbo4NYUFfQnJ14=;
 b=JcG5cyPwY48Q/fDqvInMi+pvokhwdACwA8x6gH9B85vkezfLAGTrBJzbmUVxR9ZSaW
 2vjlFByuzLDDqlgEWLnhiaa/2AWuQsL8r74lF5RDj9z6DlK21Mw4sRHc5vak8cX+njyn
 td5ZTU+Quq6jtCDKx4IIb2hUGqz/jqRJquKHsPiklSY0qnQ+aCUq38nR3rlkOksjzqcg
 aVgOA+KzsmABwF1TNCBCD/AK1hTRRy4APHiH8yFOayigVwvBbiB9qJQWmqDfYIsQPRWS
 LFmatRLsRtM40RbB6zwS1dRNEcBFRIQTT1cubu8Cqd8ojtESBlpq7Rop9cXCjUbSGWnP
 Ejxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZeAhBZzmzZAwltdjnNaSu2Xf+sVwXHbo4NYUFfQnJ14=;
 b=h5TkPZp2Umv79D3odoUBNZiloQvaYptYEZEvUZA/0kAUsA2Xw8sFTcZ60azZCm24RD
 d9W9rxlL3uyoFXkjkJ9thQvp9g8vEukngDUo4RcgQurXm6m+iD38Tk7+C7CjIEQgWm4X
 dYTwIuGzUAj+EVj0LmaqU2ZhKSzOBSSDsSci3I0Wfdj7GbQpj9KmUjMSiMfPMvVxGJkR
 bWeTjsDMgUv2rvphvdYTBw5jlyvcFBdU4cvP5JTpVYCZFmdLkjjMYqqTgq+UMHpZrg1y
 lfvhjcp7MHldLdJVp5LQqZtsjeH71Xxa6dn0LCD2LpF9GT2otm1dSED0BY1TKLd+WOtL
 tP2Q==
X-Gm-Message-State: APjAAAVy59VwFFas2N2EfFmR6ikvTuxNR9cfAJ6npLO9NQH5CEiIQwjl
 b7rcmYye0CwXk8CLT2BTeEqk77n9c+VGJIfq3I+wIw==
X-Google-Smtp-Source: APXvYqxe1bYEDH+AKs12dNKuqZKXEA/+3n3YUpxPCbz2J7gmxse3NhcwFcXvaWhNWm93PuSp6sI28Lf7fXNgTuY5Nwc=
X-Received: by 2002:a02:3b51:: with SMTP id i17mr79104jaf.68.1551374525035;
 Thu, 28 Feb 2019 09:22:05 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+vNU3sxjVjuPg8NRCBJzRNByM__xFAYdiQo=-ZKXawvZw1yQ@mail.gmail.com>
 <CAFLxGvyFgO-OzgrijL_i0Us5=_VbuYTSCBW0EVyC+8HYpnqOfg@mail.gmail.com>
 <CAJ+vNU1xtj3f7GefcyY=s7RmNxtBjFpefaG57Xmeq80w0=monQ@mail.gmail.com>
 <1778492.l5RC12KMDO@blindfold>
 <CAJ+vNU3VuR_VeN8WsPRBgyvW43UJnEMDKkPzkZEjnvH6TFZ02w@mail.gmail.com>
In-Reply-To: <CAJ+vNU3VuR_VeN8WsPRBgyvW43UJnEMDKkPzkZEjnvH6TFZ02w@mail.gmail.com>
From: Steve deRosier <derosier@gmail.com>
Date: Thu, 28 Feb 2019 09:21:28 -0800
Message-ID: <CALLGbRL6m1P8uoWVrAzfKzqem-pL6q5bbwhEWyHS0iCiuSLyQQ@mail.gmail.com>
Subject: Re: ubi/ubifs performance comparison on two NAND devices
To: Tim Harvey <tharvey@gateworks.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_092208_206431_2CD67508 
X-CRM114-Status: GOOD (  17.34  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Feb 28, 2019 at 8:41 AM Tim Harvey <tharvey@gateworks.com> wrote:
>
> Ok, thanks for the pointer. Is there a sysfs node that contains all of
> those? I didn't see anything obvious. I can printk them for comparison
> but I don't see this as a raw nand issue, I see it as a ubi/ubifs
> issue. There is something going on at the ubi/ubifs layer that makes
> the Cypress FLASH very slow for the ubi scan that occurs on attach and
> the UBIFS resize that occurs on first mount.

I don't follow your assertion. IMHO, if it were at the ubi/ubifs
layer, the time it takes should be symmetrical for both your flashes.
Perhaps you're saying "I don't believe it has to do with the hardware
layer."? Maybe. Though I suggest looking at all layers and prove
things beyond a reasonable doubt, otherwise you're going to likely
spend an inordinate amount of time looking in the wrong place.

UBIFS sits on top of UBI. Which sits on top of the raw flash driver.
Which sits on top of whatever bus or SoC driver that may be necessary
(maybe there, maybe not). Which then sits on the actual hardware.
Unless you have another method of testing the raw flash driver, and
through the exact same pathway the UBI is using, I don't think you've
eliminated it. The most likely scenario is it is doing something
pathological with your flash. Looking at the timing parameters it
chooses is a good start, since IIRC, you've said you're not choosing
them, you're letting the driver do so.

Let's give an example - maybe with the new flash you've got a
write-protect GPIO setup and that wasn't in the old configuration. And
let's say it takes too long to toggle due to some really bad
setup/hold times set by default because they're not configured. And
the NAND driver writer implemented it with gpiolib, and toggles it
even on a read, and there's some horrible timing bug in gpiolib... And
since UBIFS touches every page during the scan...  boom - crazy extra
time. This is a totally made up example, but it illustrates the type
of odd non-obvious interaction that could happen even if you think
everything is fine with the raw nand.

Personally, I'd shove a bus analyzer on your NAND and take a look if
the bus sequences it does on the "good" vs the "bad" chip case are
similar. Likely that will tell you exactly why it takes so long which
in turn will lead you to exactly what the problem is.

If I had to guess, either there is a configuration error OR the nand
driver you're using is choosing bad defaults OR there's a particular
pathway in the driver that the UBI is exercising that isn't what a raw
access would exercise and there's a funky bug there.

Remember though - I'm not saying it isn't a bug in the UBI or UBIFS
code, I just don't feel you've eliminated the more likely spot first:
the code that actually deals with the chip in question. Go examine and
understand the NAND driver and printk those timing parameters.

- Steve

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
