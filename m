Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848B8C982EA
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2026 03:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryj+wmFxV2JnvFpxddMTKD9me7vY6bjH9Ofq1itN8Ic=; b=kYmyILJH0Zgy1d
	JJR5uHu5L7+Ym7aleriYB4PgzY3M0h6Q+v85cgMC2uxHDSuZ7TKcmpbg/U3toiEizOCvGeOkTnqaY
	jRTeOpromGfsxfF1ZhzYyF/q0acqm85k1bZ7lVGtLEldY00rjA+4/ACgPWigDd8xEOR2Rt2v14iNH
	H/827UQRJp4MoZj5R08FsddAbn7STTQB9ppLvK5HXELVeO2/g9XEq6efWOdMGYjOmo/P0pgIcvcvL
	vCwv7c6mdukIwl/1ITSsq34Vr8Z87UvxxgANJf95dr1dIfPlMANeMFOw/1+PaqvO2k2qjMFteFFaS
	EE9c5/KQReS4vJgCcAIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9DgO-000000073Mq-10qn;
	Wed, 23 Sep 2026 03:30:08 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9DgK-000000073MC-25Zo
	for linux-mtd@lists.infradead.org;
	Wed, 23 Sep 2026 03:30:05 +0000
Received: by mail-yx2-x11.google.com with SMTP id 956f58d0204a3-66e4ab201ebso491212d50.3
        for <linux-mtd@lists.infradead.org>; Tue, 22 Sep 2026 20:30:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790134202; cv=none;
        d=google.com; s=arc-20260327;
        b=n+7Bt4RKhet5wyvB1RfMkUq94DhaU5ak2arqtt6WpnvRLsrPbdkO9Y5nITHZSphBGF
         XFJDt+WyDpdKvH9gCBKE16PSbJGbUuG5OKakJO14dTDg+ItEoLtiGLh3ZuyQDy8ydXNp
         OnNEIrE4lcAJikeoSsISV86bXkYM3ADydkjcBuGU0LwcSGUm3KuIG56Fd9K+YPPPZm6P
         S2UXVMPgRAfVVJ5JFblzqeKVVlerJPi727wY+bYXY1oZuMQB+1uXRLYPFWIXc8RoAOgU
         FGVflTFNgTOx844QR88EPW6j0xboGclxfxC8n7vZp0kCO5rGj2Sik13G2bFGDgODNKN4
         yvdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVLVDH6TaZQvkFTaLEqnaogLAV53Ya1Zy0YVfzmj9i8=;
        fh=OqZpxTFKSgcx38TfTsYEzrOsrbYkMCGUxS5avZY2NSY=;
        b=Th8l6eFg827cKXhaiu4oUKncDCMpEUkhZ/hOO5qNExeohUqiovfTpjKDNltplDGzrw
         5TtOhfSDg32Hro14rmTzQCV/ihqE87hNdoKpPmNBQmCJTNGrkWcdLzobVMmPDkrnosTi
         O6AivTd3gY+DWg1ERGcLP8V16wMwcjn9/jrsu8FNIUfZJzmb2WmgYe5qHiKETnLczd3N
         LppX5yZPe6uum2GIAkIkaBsBbDJkIBGyUAGOLiKRhHNOfUuFlOxuwJ9nPPfxDEKNDQBM
         +WiX9tqdeNbEzGclsZxuCPEMF0rTwpvjZRiVne6VU2YcqGHUqDfCvQ9Ly3NUFXaN4gNx
         +oLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790134202; x=1790739002; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eVLVDH6TaZQvkFTaLEqnaogLAV53Ya1Zy0YVfzmj9i8=;
        b=DHX2oBx+WkC9H2LcmJmZgsvAGJFRZWC590reCnk2C6pKzPYafn4Juaqx8BCWt8oqRF
         p8o5kMbSzVMkn1xI+sIgH5JhnXARfYBynbM3gNhP0Q2nVDnHGyoneuyx1t84mgr4qsG9
         YrsJeqmZRQ7rkKuRD196N55+VZP6Js9vZFBJS6PnMbdwQ4uU1du0Stfr1awiSvM4YMUb
         xA0+/ufCxRmYiM3KiUGqNbFUBaN/WBqEun7ZcknfVQNInuWFae39rRsNUKZzel3RiejE
         ZqYzWnuAqnpBCYdOA3JezBykDu8V9qcGeHPwhfCmCKXTzZ1ImYgwfE+dTa/56Anp1i9A
         7f2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134202; x=1790739002;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVLVDH6TaZQvkFTaLEqnaogLAV53Ya1Zy0YVfzmj9i8=;
        b=kmeoD7YnjIlWLMx9aX9K7g0mRhrHBFejCatmdUQYvRQe8nvLVoMOgK706VS+sd8QqH
         7W9jPSOG3k5t+k8WtAioLgZRQfvDvZSDrpjnKkYakgU5+cgYBQypmprHpnfz80zsl9Ia
         OozKi4MpXdS6gqn3FVP1NXIWBM3OY26itIOYdqy9u3jQGURHmXkVc5Ex4kSNgQ+belZ7
         XQaH0Xy9Ygcig6lev3IrM9gV/geO32I05YGmdAi/EStLsD+rSirbMbZUPC5PweYdN/TK
         e7ubPJq5Cn5xXFx8Ip+0MnB0wMoqTDHe9BXlVk/FTRKF4IKI6RQVRxQRENAvAVBj7FVa
         MHeg==
X-Forwarded-Encrypted: i=1; AKwUvBwj5rUCuWhBPceBFKxiJFNNxupqPmd63mdi3u9OnuBsXSrZhbott1Mp5vMsgGIGJXpB8Fwq5Di9TjI=@lists.infradead.org
X-Gm-Message-State: AFuF++kGdGIpbL6Hsq3fs6BWoQov68dvvWvnW0zi6phG4mgQiormBvrv
	6V2uGMLUn92xLB8raneWjK+qYipvWHxeRGdYjVfQOBOHSB6EY/bZ+V7Q0lHZFDr/DWBVm/n4XC5
	3uko5d7Qlvvig0wCp/XTti+gZK5TIcnA=
X-Gm-Gg: AYBFou2gTieBrl8oWZLL6GHlnhGt/SUm9ser1RDpqC/gbhkaycJH2ua6a8Fsc8XskTj
	HZ/lXbYMVxjE9DqSX18ZaZE+5Z7mrMaIYfYer3AQABfTH5jRF2/E10hBrBZwmchbfaosjGm71jI
	2Qr0U1pSl2E4bNY2bpAN5HQxUzYJeqYCl775Lg5Vc18n1775DOuKi3vn1yTwzDYrica9V/qWsZz
	9yQSJN2kFpCQlx+aejCmpm8xWCGutgTPWKQv7XsTzsGdrtIgYQ8qSL7NxDrp7fxUZIXYuJsbtl0
	xduLVWfh3BiqHssBsmISMSw/voLnyBBWfrfSw0QmKYFJHwFkl6Y5aNuFPM0h6hz6ptLoPfgktWf
	WcdN19ucfn+fCQdmMQaQwvF+oFYeLXJaamEF+zzyT0EkeNk0xW4brmw==
X-Received: by 2002:a05:690e:4088:b0:66f:c1bc:87e8 with SMTP id
 956f58d0204a3-672d57d716emr714278d50.65.1790134202308; Tue, 22 Sep 2026
 20:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260823152648.23136-1-kartikey406@gmail.com> <CADhLXY5uco9Wq8ZmW5UnvGgTrrcLtj+X5Ne+AqaNyyBdKrQ8qg@mail.gmail.com>
 <mty190q3.779eb778-4fb7-41bb-9c12-561cc0980b10@nod.at> <CADhLXY44kq1XamTjXgrfcLc-_HnK3T2b9TVPxjzB4kc0fKdEqQ@mail.gmail.com>
 <mtymovca.dedd95e8-081c-455b-aec6-7abc19484945@nod.at> <CADhLXY7otiYPCw+fzzqNWw8P4dPx2xTm+zUeGwc=Lc3tZq=6Fw@mail.gmail.com>
In-Reply-To: <CADhLXY7otiYPCw+fzzqNWw8P4dPx2xTm+zUeGwc=Lc3tZq=6Fw@mail.gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 23 Sep 2026 08:59:50 +0530
X-Gm-Features: AcwNN1UJ-dFynLjOAyoQZkW5E38EP6eUiHJerbKwLx638FvdkYV2ms2o365n1bo
Message-ID: <CADhLXY7TaChqpBz4m1xLLCc6aGEE9x4kZ8XCvk0CXuFMXreSgw@mail.gmail.com>
Subject: Re: [PATCH] jffs2: fix double-free of f->target in jffs2_alloc_inode()
To: Richard Weinberger <richard@nod.at>
Cc: dwmw2@infradead.org, kees@kernel.org, viro@zeniv.linux.org.uk, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	syzbot+675e84fdf3dde67b4946@syzkaller.appspotmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_203004_566318_A7B7194F 
X-CRM114-Status: GOOD (  12.98  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBTZXAgMTMsIDIwMjYgYXQgODo1NOKAr0FNIERlZXBhbnNodSBLYXJ0aWtleQo8a2Fy
dGlrZXk0MDZAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFNhdCwgU2VwIDEyLCAyMDI2IGF0IDEw
OjI34oCvUE0gUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JvdGU6Cj4gPgo+
ID4gQW0gU2F0LCBTZXAgMTIsIDIwMjYsIDEwOjAwIHNjaHJpZWIgRGVlcGFuc2h1IEthcnRpa2V5
IDxrYXJ0aWtleTQwNkBnbWFpbC5jb20+Ogo+ID4gPiBPbiBTYXQsIFNlcCAxMiwgMjAyNiBhdCAx
MjoyOOKAr1BNIFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+IHdyb3RlOgo+ID4g
PiBJIGZlZWwgdGhlIHBhdGNoIHlvdSBhcmUgcG9pbnRpbmcgYXQgZml4ZXMgYSBkaWZmZXJlbnQg
a2luZCBvZiBpc3N1ZSA/Cj4gPgo+ID4gV2VsbCwgZGlmZmVyZW50IHN5bXB0b21zIG9mIGEgY29t
bW9uIHJvb3QgY2F1c2UuCj4gPgo+ID4gVGhhbmtzLAo+ID4gLy9yaWNoYXJkCj4KPiBUb3RhbGx5
IHVuZGVyc3Rvb2QgdGhpcy4gQnV0IGl0IGlzIGdvb2QgdG8gaGF2ZSBhIGRlZmVuc2l2ZSBjaGVj
ayBzbyB0aGF0Cj4gdGhlcmUgaXMgbm8gZGFuZ2xpbmcgcG9pbnRlci4gSXQgd2lsbCBwcmV2ZW50
IGZ1dHVyZSBbVUFGLCBkb3VibGUgZnJlZSBidWdzXS4KPgo+IFRoYW5rcwo+Cj4gRGVlcGFuc2h1
CgpMZXQgbWUga25vdyB0aGUgc3RhdHVzIG9mIHRoaXMgcGF0Y2gKClRoYW5rcwoKRGVlcGFuc2h1
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
