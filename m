Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D113AC32771
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Sep 2022 10:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o1pWrQfhYcHUPBQPbzGDqhf47yJ6Ithi1RUX8ZBDePc=; b=JUUk9n/a8148KD
	fB1vrO3t/a6hD5BB/p3+McXnCokRaXhSEnL4SnNsldnCM+0OjQZvo67VRdNxkdbBz2RjcaaCPoqQs
	QfE1sVO9cxYmE+qBe4YCoa8f9JBAnn330APd2jGIsAFIxTE7+vegtbf0wDRmtnW0geeg6I2RmMAKq
	xLUUCLFJ/5yVHDm8BZZp+sy2krh+U60PQOSMeLWhDFUFsx2vM5sq9mAWiKGjKT7WufgowOO79r/vI
	EyrCF31W3B0ii2FOlev6drLsDDgDkfGPsQ8wprblU/0WY/V7BbMYGy8x5CS229hKjsotoA2k1q5xe
	wgQPe7idZapHIYAvjDvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odU91-00FY1y-0p; Wed, 28 Sep 2022 10:18:23 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odU8q-00FXy6-8s
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2022 10:18:13 +0000
Received: by mail-ej1-x634.google.com with SMTP id lh5so26104575ejb.10
        for <linux-mtd@lists.infradead.org>; Wed, 28 Sep 2022 03:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=skymem-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=iG38fTWzgjZnfWIYDLBzVgwDGvK3OX610NXZacXZwIY=;
        b=Y7fmrvowf17lA82eE9ExP4MyxT8AAPexee7U3aGPyA/IHkrCaTs+G5osHSYdGRuLMu
         AeVfFVenVijIbE6pn8DpuqSxYJ0TVWbupWipa0I8r6WhO7BiIqL8j0UvKRQeYfHqojWY
         JMgaEKaJrPVy4Z/GL135Gky/7HV5RZVjgYifl6omhW7AJn/b5ggC3bCdv3HwG2GYH9VA
         qJWz1InYa+J1dZlSh5VdlgDaocFGrR/6DNDBwbQxpw7yZNViE002Bx46OxW+lAZUi438
         QgdaOPUJMYG6CyVLvfh7sZZpkFulgNJG0fzx3htmq9QlCr352gcgLSPsZweSM5UWU44Z
         PP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=iG38fTWzgjZnfWIYDLBzVgwDGvK3OX610NXZacXZwIY=;
        b=Yv/iUaRpw5kdeJiAUyf4O5/O2ViWBW/amnWwr0gU6+NvYBaGcUqlmJnc8Ys/vMxGZP
         HrgolhdKnOocMyZnrCHlYZZn+KAPILx9hCbW2pUVlReTfmEq9STVdn247IfzmRvYxsAV
         MMrTA3+3WB8R0dUies4SnjWHBnxdbWwvS2m89QXhFRQAAuHT89GIZBHoAkCNdaM1QTzU
         JhtWfGwxInjqkmmkv8H4CgXSPnwuMR6JPdTyqbCCGXbKgPPE20Ow1L84rlJWfJYNy1Sc
         sej2PqqW6jN9xukr4814QhGXO1jJ7oPvAWByRU1ZbEwoazG3ycpdHyaiQ/oKO3IEfIuh
         /zQg==
X-Gm-Message-State: ACrzQf2/XU64DIEToqcygfJYHMNzDm1Y+83kSnIM2WVzwXKYydlIsKFC
	VB3oPJpZxi1rly5vyWYjTMvEdzrb/TROKhkYmVV3xQ==
X-Google-Smtp-Source: AMsMyM4eu83l3cb6gQYO/qxl0BCS6UYT10ULcjeS/rjGfepKmLiQ+DB98b95eR9xD5RX9zXpxBt1iEHhKqzn8QZGAuk=
X-Received: by 2002:a17:907:7625:b0:779:e6f7:a669 with SMTP id
 jy5-20020a170907762500b00779e6f7a669mr27041002ejc.472.1664360288700; Wed, 28
 Sep 2022 03:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220922031440.422193-1-alexhenrie24@gmail.com>
 <5e85eafb-bc6b-a005-fb12-db6940118481@sigma-star.at> <CAMMLpeQnmicqAi+3ZSp+Ep9Tiqm2dD_AdKYJFhi8iTdicTmr4A@mail.gmail.com>
In-Reply-To: <CAMMLpeQnmicqAi+3ZSp+Ep9Tiqm2dD_AdKYJFhi8iTdicTmr4A@mail.gmail.com>
From: Info Skymem <info@skymem.com>
Date: Wed, 28 Sep 2022 12:17:56 +0200
Message-ID: <CAKvd=_hNAtx9dvaamG0qbhj8uN_vEXDXsm1dT_hLa+6nvLp8TA@mail.gmail.com>
Subject: Re: [PATCH] mkfs.jffs2: fix spelling of --compression-mode parameter
 in help text
To: Alex Henrie <alexhenrie24@gmail.com>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_031812_347851_0B71124B 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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

SGksCnRoYW5rIHlvdSBmb3IgeW91ciBpbmZvcm1hdGlvbi4KCk9uIG91ciB3ZWJzaXRlIHlvdSBj
YW4gZmluZCBlbWFpbCBhZGRyZXNzZXMgb2YgY29tcGFuaWVzIGFuZCBwZW9wbGUuCmh0dHBzOi8v
d3d3LnNreW1lbS5pbmZvCgpJbiBzaG9ydCwgaXTigJlzIGxpa2UgR29vZ2xlIGZvciBlbWFpbHMu
CgpCZXN0IHJlZ2FyZHMsClJvYmVydCwKU2t5bWVtIHRlYW0KCk9uIFR1ZSwgU2VwIDI3LCAyMDIy
IGF0IDY6MTkgUE0gQWxleCBIZW5yaWUgPGFsZXhoZW5yaWUyNEBnbWFpbC5jb20+IHdyb3RlOgo+
Cj4gT24gVHVlLCBTZXAgMjcsIDIwMjIgYXQgMTI6MzQgQU0gRGF2aWQgT2JlcmhvbGxlbnplcgo+
IDxkYXZpZC5vYmVyaG9sbGVuemVyQHNpZ21hLXN0YXIuYXQ+IHdyb3RlOgo+ID4KPiA+IEFwcGxp
ZWQgdG8gbXRkLXV0aWxzLmdpdCBtYXN0ZXIuCj4KPiBUaGFuayB5b3UhCj4KPiAtQWxleAo+Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
