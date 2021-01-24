Return-Path: <SRS0=HfhP=G3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368ACC433E6
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jan 2021 20:15:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4FD322C7B
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Jan 2021 20:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4FD322C7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m+X7fXkB/do4peK1ruPBRDGRF1cSC+9UwzSvVvcSSCY=; b=FCjxWAkxAsfjwFXXoPWZKkubO
	IvvLmm+Td0yD9eZXmzxDr7PvK4y4vIWLcoxAlZn8D2Bk0RPFcHn9PxjP+hQLjJZzR3BwiX8cnE4+O
	ghR7XC2oIsyEXk/VVEt+06cnDU0D4gmFtaf9S7pTzrjJ/A1rGSqI/tIsMb37jJ+Uw4oVc0zOHpnq7
	qnO3vxQ+vGnX8qitrxz367Fe57ad+rQLjnsGYWrQIIrWmPJ7bw8/kdqDkc/rbQbyO26xSIUn8TNRu
	LY1gCxCaAdjVTdCwH+gboa9u/uVAjMZJ6yW3GCYC3Krx0GakyRbhjrMPjaQ3A06V/eEjUXqMCD/OV
	WZxPdcN5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3lmc-0002vy-As; Sun, 24 Jan 2021 20:14:50 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3lmZ-0002vB-6f
 for linux-mtd@lists.infradead.org; Sun, 24 Jan 2021 20:14:48 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 2so5315693qvd.0
 for <linux-mtd@lists.infradead.org>; Sun, 24 Jan 2021 12:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OSqM/+hDSvLrv13lOWN3p2jAOoGEE3+xx2u807DxGhI=;
 b=b3lztcn5pSshC/3esauyTw+hxCipPz+MJyymarpFLFxQhyqJRiK0Q5Glo6b7KifBk8
 f55+fm+KG4Hp913zv0oxXC3KyC8LgnsIjloAmXIq2wCyIablTcUrwIraJ0h7O9EXSpR0
 Wr6V8hzjL1U+31FiHwpqqh9bYJltn8zh8jssuRfjJAJQt0YuMFT5W6AaXSuyjnn3hOmo
 En0Au3qkMCJkc0EiQC+yEBuoFYSTDpZ/vyPsK+ggc778kKLn06Q3hahskXu2svqNBRqk
 XJTWw7Y7JCmJ5tXoaphmclJk8oREYPAkefDB7jWG4XjJ/yDeVkTTonLaKvi8HS6QexBn
 Y0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OSqM/+hDSvLrv13lOWN3p2jAOoGEE3+xx2u807DxGhI=;
 b=WkW1orQuypo2M2/0aV1Y5RROoJBdgkWgT93krVT+Jo+/OM3OLHIsKEkm/4Wo5PVDRE
 UeZlVGcgQKW7z6sxqNtapYDdlVFy9/EhCpseywkeRLCUev3zLiyhDMk/OiDde0Ux8apt
 BE56CoLjPOls4WUx8FdR8y6B738JIEOHyg9zy9WGp4EHXWIxAwUKfusW8qefX7g3MoJR
 kYiwFfDiNwavw7f9AFRpSErqNafL2RX716uM3T3XL2oi4/t5/HbHRF+ruGlY170hxazP
 ifQOr7m5MPA2vGvVIxSe3IyHFYqMRw7w5qbsaT7lofa/1mK6qocPOlCCUYlFs6oDLG6s
 4hfQ==
X-Gm-Message-State: AOAM530m+N5PROUQaRaqEN4mOQvKWpBDuI73vfHAP/1sPpkQJynMCdeL
 LcNbBJxLLwH4SQzaVqf6PlbOeBBcsWaFdUklhqg=
X-Google-Smtp-Source: ABdhPJxVOToYv0HkdS45AHJioCJ8pGX18Nrco3AhpQ3fAv/W1LW+yvun2Ke603zBouNanpWWNdyQ/PX8p+H6laXhHYQ=
X-Received: by 2002:a0c:9e5e:: with SMTP id z30mr4524736qve.56.1611519283494; 
 Sun, 24 Jan 2021 12:14:43 -0800 (PST)
MIME-Version: 1.0
References: <20210124073955.728797-1-christophe.jaillet@wanadoo.fr>
 <fe72d1d2-8222-5cda-74ff-9327725f196a@web.de>
In-Reply-To: <fe72d1d2-8222-5cda-74ff-9327725f196a@web.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 24 Jan 2021 21:14:32 +0100
Message-ID: <CAFLxGvzFDPBGY1uoB7vqJreOSfs9N2PGMDTbQ24PYBWBRVR4oQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: Fix an error handling path in
 'ebu_dma_start()'
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210124_151447_355779_E45B8B54 
X-CRM114-Status: GOOD (  16.65  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBKYW4gMjQsIDIwMjEgYXQgOToxMyBQTSBNYXJrdXMgRWxmcmluZyA8TWFya3VzLkVs
ZnJpbmdAd2ViLmRlPiB3cm90ZToKPgo+ID4gSWYgJ2RtYWVuZ2luZV9wcmVwX3NsYXZlX3Npbmds
ZSgpJyBmYWlscywgd2UgbXVzdCB1bmRvIGEgcHJldmlvdXMKPiA+ICdkbWFfbWFwX3NpbmdsZSgp
JyBjYWxsLCBhcyBhbHJlYWR5IGRvbmUgaW4gYWxsIHRoZSBvdGhlciBlcnJvciBoYW5kbGluZwo+
ID4gcGF0aHMgb2YgdGhpcyBmdW5jdGlvbi4KPgo+IFdvdWxkIHlvdSBldmVyIGxpa2UgdG8gdXNl
IGFuIGltcGVyYXRpdmUgd29yZGluZyBmb3IgdGhlIGNoYW5nZSBkZXNjcmlwdGlvbj8KPiBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51
eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdD9p
ZD1mZGJjODBiZGM0MzY1MDc4YTBmN2Q2NTYzMTE3MWNiODBlM2ZmZDZlI244OQo+Cj4KPiDigKYK
PiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2ludGVsLW5hbmQtY29udHJvbGxlci5jCj4g
PiBAQCAtMzE4LDggKzMxOCwxMCBAQCBzdGF0aWMgaW50IGVidV9kbWFfc3RhcnQoc3RydWN0IGVi
dV9uYW5kX2NvbnRyb2xsZXIgKmVidV9ob3N0LCB1MzIgZGlyLAo+ID4gICAgICAgfQo+ID4KPiA+
ICAgICAgIHR4ID0gZG1hZW5naW5lX3ByZXBfc2xhdmVfc2luZ2xlKGNoYW4sIGJ1Zl9kbWEsIGxl
biwgZGlyLCBmbGFncyk7Cj4gPiAtICAgICBpZiAoIXR4KQo+ID4gLSAgICAgICAgICAgICByZXR1
cm4gLUVOWElPOwo+ID4gKyAgICAgaWYgKCF0eCkgewo+ID4gKyAgICAgICAgICAgICByZXQgPSAt
RU5YSU87Cj4gPiArICAgICAgICAgICAgIGdvdG8gZXJyX3VubWFwOwo+ID4gKyAgICAgfQo+ID4K
PiA+ICAgICAgIHR4LT5jYWxsYmFjayA9IGNhbGxiYWNrOwo+IOKApgo+Cj4gQnkgdGhlIHdheToK
PiBDYW4gaXQgYmUgbmljZXIgdG8gYWNoaWV2ZSB0aGUgc3RhdGVtZW50IOKAnHJldCA9IC1FSU87
4oCdIGJ5IGEganVtcCBmb3IKPiBhIHRhcmdldCBsaWtlIOKAnGVfaW/igJ0gc28gdGhhdCBsZXNz
IGV4Y2VwdGlvbiBoYW5kbGluZyBjb2RlIHdvdWxkIGJlIGR1cGxpY2F0ZWQKPiBmb3IgdGhpcyBm
dW5jdGlvbiBpbXBsZW1lbnRhdGlvbj8KClBsZWFzZSBmZWVsIGZyZWUgdG8gaWdub3JlIE1hcmt1
cy4KCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvWCt4M3BJYW5yMThFcDRnYUBrcm9haC5j
b20vCgotLSAKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
