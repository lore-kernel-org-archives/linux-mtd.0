Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED25EB64DC
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jul 2023 20:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6G02gL2sszEsdI6xeXmE8sdCaaxUmuBZfvDE2nRndUs=; b=xOUG7DTw4TRrm3
	iGTbyntVM4sUUGkyWvBquQKopSvekuJfedOyuTeLFJXRSRt5i+juhJI8EnPr/4lwxKCqfVEqF04r9
	Sjzu5QK/m3x9I9h5HqqOX3u47SiiuTn8ZoEorISel6vpGM8uW82eaqW5quddqiBDY2DN/vth/Q2KJ
	wJld5w6t+p/dkaoWruZaFeccJ63aI25ekL3DTEnABAl4XR0uWo2CPbJMK6YtsBTSZ6u/Q3YSZU9Be
	7BboKZVHXUV4RYhsMvA472IQ5xOFqrKKTtEGKgN/meQyOb1mrIUbJYRgGh5PbKiaXNJAYgqSlFoxA
	YnqTePFGkvDTn8Ja+wCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKP8e-007Adi-1V;
	Fri, 14 Jul 2023 20:11:40 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKP8b-007AdH-1u
	for linux-mtd@lists.infradead.org;
	Fri, 14 Jul 2023 20:11:39 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-566e793e0a0so1539817eaf.2
        for <linux-mtd@lists.infradead.org>; Fri, 14 Jul 2023 13:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689365495; x=1691957495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7W8NCwpSyklTkb4rETzDttOa2ACeTzVgjQgXJUjD0Q=;
        b=v57yn+FXE2Ah3+xQYLvAp0FTCYt6xcStEOs9r6zqBFMCs7MjujiO2MnP7P+oXa954z
         ByVU1A0ByxNhBElwQAd1JWNVKmIzI2U/h1MZSrQ7Z5kJyovB78rdAbHNMFrgh7uhp5Mu
         WUqBJiF3d6y5nZQOIarkvzEs+LbHs2UCvavCtmoOxmqbdZJeQdstRJyOtfQ4ZEHjyytb
         Rosqnp9vb17UhJoIP0HMpS9MVXM/HajFQ2jHAmh/TZ6+rgGRHCVU+y9/k6aHhpbAblOp
         5QvjzR2+rhlUpJ21pdkjjlscdbc8LIZB07J6z70IpyrZpZan2vGX/3/1O21AenZxFZpB
         f4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689365495; x=1691957495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7W8NCwpSyklTkb4rETzDttOa2ACeTzVgjQgXJUjD0Q=;
        b=fbQO9Alo0LeXwo+xVgbtO/2yq7Lux3LBUQIg/YEvta64ozrlBRmlDpk6PblhywtSEd
         pQ2rrgfQc9352AW3vXRPskhkR9hKGTaLZMSmSQvygMJj9ny6faEfwuzCe0u0uetTN4k9
         tGl+ELOenBY877fDHk27Stju0PMg1mYig7lgG02NJh/8EF8/oeVbQlznqfCAScjpW0F6
         ZLpxvQHINg1ZQxKQdObInrwKTfcragOcKGLDmJPz607O86kaeZ9bJtqqA6xYFRxSEvd/
         HbJ7ys8NQczqU25QQXP8DhQLszBl6lcHnyI6fv/hV4277le53l1aD7EscAOSG6PmL0Dl
         4o/A==
X-Gm-Message-State: ABy/qLYzXAEribpWDxGJbWwXTEmL/QfCOP/AIa9jjff6o+LzdXaYhZ2C
	7AtAWn4WEvv4WjMDQ8njcWcY0njWuZkOk99Fdinl8g==
X-Google-Smtp-Source: APBJJlGzqcXNYOaf26GWRDbgRF0BlYkN7nDSQ7PtfSGo4JNIEjflJS1TU/2UaziT3AZYvDKoN9YkFclH2J7R+a4MMpA=
X-Received: by 2002:a05:6358:7f0e:b0:132:fcf6:f311 with SMTP id
 p14-20020a0563587f0e00b00132fcf6f311mr6602950rwn.0.1689365493838; Fri, 14 Jul
 2023 13:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230714-spi-nor-winbond-w25q128-v3-1-bdb2192f079b@linaro.org> <a5dd9f7d14c94c9be99c93b9475683bf@walle.cc>
In-Reply-To: <a5dd9f7d14c94c9be99c93b9475683bf@walle.cc>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Jul 2023 22:11:21 +0200
Message-ID: <CACRpkdYWEtHsTRwCYNt7sNtMfs39wKgP8CeuW4cp6VZ+F_y6dQ@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: spi-nor: Correct flags for Winbond w25q128
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_131137_717161_753ABEC7 
X-CRM114-Status: GOOD (  11.72  )
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

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgOTozMOKAr1BNIE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxA
d2FsbGUuY2M+IHdyb3RlOgo+IEFtIDIwMjMtMDctMTQgMjA6MjksIHNjaHJpZWIgTGludXMgV2Fs
bGVpajoKCj4gPiBUaGUgV2luYm9uZCAidzI1cTEyOCIgKGFjdHVhbCB2ZW5kb3IgbmFtZSBXMjVR
MTI4SlYpIGhhcwo+ID4gZXhhY3RseSB0aGUgc2FtZSBmbGFncyBhcyB0aGUgc2libGluZyBkZXZp
Y2UgIncyNXExMjhqdiIuCj4gPiBUaGUgZGV2aWNlcyBib3RoIHJlcXVpcmUgdW5sb2NraW5nIHRv
IGVuYWJsZSB3cml0ZSBhY2Nlc3MuCj4gPgo+ID4gVGhlIGFjdHVhbCBwcm9kdWN0IG5hbWluZyBi
ZXR3ZWVuIGRldmljZXMgdnMgdGhlIExpbnV4Cj4gPiBzdHJpbmdzIGluIHdpbmJvbmQuYzoKPiA+
Cj4gPiAweGVmNDAxODogIncyNXExMjgiICAgVzI1UTEyOEpWLUlNL0pNCj4gPiAweGVmNzAxODog
IncyNXExMjhqdiIgVzI1UTEyOEpWLUlOL0lRL0pRCj4KPiBUaGlzIGlzIHN0aWxsIHdyb25nIGJ0
dy4gQWNjb3JkaW5nIHRvOgo+IGh0dHBzOi8vd3d3LndpbmJvbmQuY29tL3Jlc291cmNlLWZpbGVz
L1cyNVExMjhKViUyMFJldkklMjAwODIzMjAyMSUyMFBsdXMucGRmCj4KPiBUaGlzIHNob3VsZCBi
ZQo+IDB4ZWY0MDE4OiAidzI1cTEyOCIgICBXMjVRMTI4SlYtSU4vSVEvSlEKPiAweGVmNzAxODog
IncyNXExMjhqdiIgVzI1UTEyOEpWLUlNL0pNCj4KPiBPdGhlcndpc2UsIGxvb2tzIGdvb2QuIEVp
dGhlciBUdWRvciBjYW4gY2hhbmdlIHRoYXQgaW4KPiBwbGFjZSB3aGlsZSBwaWNraW5nIHVwIHRo
ZSBwYXRjaCBvciB5b3UgY291bGQgc2VuZCBhIG5ldwo+IHZlcnNpb24uCgpPb29wcyB5b3UncmUg
cmlnaHQsIEknbGwganVzdCBwaWNrIHVwIHlvdXIgdGFnIGFuZCByZS1zZW5kLApzb3JyeSEKCllv
dXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
