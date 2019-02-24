Return-Path: <SRS0=v7BG=Q7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCFDC43381
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Feb 2019 09:21:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E119220663
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Feb 2019 09:21:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UmIDSpSo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pdsoEtaY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E119220663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o6CWyVGoIcWunfYmfH3wpuYeZXw4w6MAoYePwnXLV+U=; b=UmIDSpSoVIJORR
	S2ITdG3aZK1yzsKA1nsmGblXcUWUj3zFNZN5c0cyLOPIkmBUc6FBag9lopUa0gEgyxjMcz85opwX8
	xeYktz1ZAztZs6aCXadOGVu4NK0KjKrQHbYwWVp7j4tnvUPzOb0u8rRkKlAK2fSStxphYbKEiWoYH
	7FIIHlmsCGo4L9kaWxT/b6pRffYAD1S2yopqk5+b22m8M614LSev5lZugqSUOCApFmYEJTUitj5Ko
	sOHAkOpPaIxay0pDafO/Ldw4zP12/KNTCaKX63L/BFywQz0Yz9ulhsmOX43pQh3idExtB6n6q5Dm1
	QILQhGi/Bw/fzx2un/nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxpyB-0004rK-Uf; Sun, 24 Feb 2019 09:21:11 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxpy9-0004r3-0Q
 for linux-mtd@lists.infradead.org; Sun, 24 Feb 2019 09:21:10 +0000
Received: by mail-wm1-x32a.google.com with SMTP id z84so5423141wmg.4
 for <linux-mtd@lists.infradead.org>; Sun, 24 Feb 2019 01:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XA6x8141+2Gd5lO9ijVKd47AjEXRWFF+scVgX4iNzjc=;
 b=pdsoEtaYNjZ2e0mxFahd4xC+l6eJaqvO+ND8qZhsnzz4e0NTPqT+MAc7dAtErumvUL
 /aT3lebEtGH8sIiiJD13QRq16EcljvZIncue6HMDO8a2GVYXizmV1nCN/aKdMbD3On0S
 zg3qCCBLt44FQcj/CZytB8R0ZchbuwLYhYatCE+lsD1XXugeiDyNpYyVUWdn352dcLMk
 XHTe/NYFFnXPiKUvNdSViTXZwqt+e44gHSbk8+VjxXWKOeGs3NNXrPCzkkuthh149ezw
 Dtn5+F9JpVXujV2Orcbm0Wi5xwHsS3MvXK8zf7sPIRWjlAh4GoorXyxNJUtmY4dM8aYH
 njgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XA6x8141+2Gd5lO9ijVKd47AjEXRWFF+scVgX4iNzjc=;
 b=lhWJg9VitS50Bl7/yTg/ixCQwFPFZjwd/MO1UvTxY/Lmcy1TLuRIqdpNTVW7CH9eTY
 yUg9vP8M5SJq9CbnQtwFeU4focJc+l0yz6xN7x3cvgYLVR9FpOORkbMjLWdUXbFPpaVs
 +9EzpRFm2cJfLeiWkgE6P2Mf6iwTLQvaR/zADTX52FBY25SEe8rPHTYNcjXWfa/Skwuu
 FJRfqJQuO8YCHMM8WOr+Iu2LzuyMtuBM1hL2fS4PIqrVeTEK7WWLayyzyC96OTm1wwLx
 j/O0X4B/2Rh7lYLxDg3bajiRAQurG0sJMF8eyqKuHA44YTYYLTApFNJuc0qV5Ofyh+Mf
 N8Pw==
X-Gm-Message-State: AHQUAuYDicrsF7hdW85IB1CIZDOEkIfXhSq1NPfP9SG5aDJcVAhLrC9O
 Oz4SuQVoc+b6BSwbx9jmIlc798c9Tb46yxkQQ3U=
X-Google-Smtp-Source: AHgI3IbzI+qn1dIEUAnEM5JPT8g5YEdeoQl5ow81sd96CQqr57LRFKPaX4WjevcPqLM4u/OiOfq/ZlZ0jsBn22mAn94=
X-Received: by 2002:a1c:96c5:: with SMTP id y188mr7516930wmd.103.1551000066619; 
 Sun, 24 Feb 2019 01:21:06 -0800 (PST)
MIME-Version: 1.0
References: <cMCf6e-7A9hCUl29t7xLtWy9cUfo7cj7Wr1L1i47ZnErTNqBquZ-tGlHbUNaL8L1MCId_0Ke0x9eV0tOfG-hN0ytN6m3lBb0XTxAOQFP8OQ=@protonmail.com>
In-Reply-To: <cMCf6e-7A9hCUl29t7xLtWy9cUfo7cj7Wr1L1i47ZnErTNqBquZ-tGlHbUNaL8L1MCId_0Ke0x9eV0tOfG-hN0ytN6m3lBb0XTxAOQFP8OQ=@protonmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 24 Feb 2019 10:20:54 +0100
Message-ID: <CAFLxGvwVGFs-6gtYXb1Nba6RE3Nx2hx03kmWziET6aaXcK=6hA@mail.gmail.com>
Subject: Re: securely wipe sensitive data from mtd?
To: coreassumption <coreassumption@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190224_012109_105395_D5B7B289 
X-CRM114-Status: UNSURE (   8.68  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Feb 24, 2019 at 9:04 AM coreassumption
<coreassumption@protonmail.com> wrote:
>
> What is the proper way to clean a mtd of any sensitive data that may be located on them (NOR and NAND)?
>
> Would flashing a new image via uBoot be enough?  Or would the wear leveling mechanism prevent this from clearing everything?
>
> Would writing 0's from a running OS's be sufficient?  Or is the device 'smart' and not write zero streams?

This is not how flash works. You cannot overwrite anything.

> Are multiple passes of writing suggested or is this just a holdover from myths of magnetic mediums?

Well, if you do a block erase the data should be gone. But you can
never be sure that the flash chip really does.
So, like for any other storage type, encrypt the data and throw the
key away. :-)

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
