Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4823C001B0
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Aug 2023 19:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G+MhnklQght1rS2Fzjtp31CoF3xzcvOKZ1rwf55f+wQ=; b=OZDApskDICkfFO
	us1+GJHMsaFhMoFYJXHaGnL14BkhlJD8nRL6v94JOpikUIhYGf/rc7E4ku7gAY+OGplHVFAKoWVK3
	gDr+KOzc7opNkGAelISANu8BMqkOv2pjhpTvlAjpHuZVr5xdtGpCaVCy54va11sL3rkuGP1hXxmIR
	KmzplCpQQk7C0AIevX633ni5lnwzlkcK5hrM48scyWilyBcYYmvXxwweZG5G01ggpI8v5jnN/YPzO
	1iD/sluC4wCqGDs7mtKYK6CK9N8nrHlcyimzMwbY9mJLRyKVu0FgzX/LQo9WJJIc+8L944TrMgqek
	3VaIiZJLIdex/uiIYjHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVzmL-002Jo9-2i;
	Tue, 15 Aug 2023 19:32:33 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVzmI-002Jnc-2U
	for linux-mtd@lists.infradead.org;
	Tue, 15 Aug 2023 19:32:32 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b9f48b6796so88032541fa.3
        for <linux-mtd@lists.infradead.org>; Tue, 15 Aug 2023 12:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692127948; x=1692732748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QUc0x0pjPpKWnmgAca1QOq5TW3L4ejfm50N+84Kmuc=;
        b=U+9a8otbMmnVjbFgXMEnCoJm8TVkeXh0xY9LY/9XIntLFZ2gcaSXOd5OaKNsNUlh+v
         pYxCgltdHPvjFSz/T8e7UcoqiiNpT7JEvMkPj/lvFWFJT6KztSufdlrs59wUz5cVzpwG
         BN6eqW1b20hiIDBlocxmX4HL54b0fv/SvED7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692127948; x=1692732748;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QUc0x0pjPpKWnmgAca1QOq5TW3L4ejfm50N+84Kmuc=;
        b=OxnsWDqhQ0xBEV4ib3VnkSluk178UfYMSopS6GSVW9mrJBSwUhAiIEBq7kgU+Kc5Xh
         242t1RnZTWr5wGsQIjT52FCdKe2kBV+HhpbLtgcAvKgjbSFCcTjctFLZi36xaZc60YmB
         vBbojNeF5smI/C7PXITTEFuveRwhUVwvKfSuhT1Togtsk23MTTd1l34iWMIhuuswkaIi
         hIZzV4bax+kM8ACeHUksNhkzNZyYsruRTEQco1ix5K6Lk8ll2T299FB0CKBMfBNwN9XQ
         1NVo7ipJcWIihkr6NjxSUcnoB+ZFxnLd0gI8L84NWGfpDtiJYCi/R0Ta8yWQUd9CjHck
         cA+A==
X-Gm-Message-State: AOJu0YyeBc35HbuOuXuFkuTdZhzfVOGWoVC2qWZtvdreKKw69ibJKHoa
	jIrvOyEp18TbPiK53k9OXnfUydUKQpcZMWCLGLdh4Q==
X-Google-Smtp-Source: AGHT+IFXY9bibh16No9X7aaRJGJ5xcigwAe9OU7I2Y94pXMx4k1VfartUqXRLG5YvhCS8iR0oPW93A==
X-Received: by 2002:a2e:8744:0:b0:2b6:c4fd:753a with SMTP id q4-20020a2e8744000000b002b6c4fd753amr9717200ljj.34.1692127948017;
        Tue, 15 Aug 2023 12:32:28 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id b12-20020a170906660c00b00992c92af6f4sm7458428ejp.144.2023.08.15.12.32.27
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 12:32:27 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fe2d620d17so21945e9.0
        for <linux-mtd@lists.infradead.org>; Tue, 15 Aug 2023 12:32:27 -0700 (PDT)
X-Received: by 2002:a05:600c:35c7:b0:3fd:e15:41e3 with SMTP id
 r7-20020a05600c35c700b003fd0e1541e3mr24772wmq.2.1692127947638; Tue, 15 Aug
 2023 12:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230815154412.713846-1-hsinyi@chromium.org> <20230815154412.713846-5-hsinyi@chromium.org>
In-Reply-To: <20230815154412.713846-5-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 15 Aug 2023 12:32:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UvDZOgJ0TxeBYGgDMqSUYUX9am+QAMEXpRQ0C-Hh=kVw@mail.gmail.com>
Message-ID: <CAD=FV=UvDZOgJ0TxeBYGgDMqSUYUX9am+QAMEXpRQ0C-Hh=kVw@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc7180: disable quad mode for spi nor
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
	"Miquel Raynal )" <miquel.raynal@bootlin.com>, "Richard Weinberger )" <richard@nod.at>, 
	"Vignesh Raghavendra )" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_123230_834125_DB3682CF 
X-CRM114-Status: GOOD (  16.46  )
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

SGksCgoKT24gVHVlLCBBdWcgMTUsIDIwMjMgYXQgODo0NeKAr0FNIEhzaW4tWWkgV2FuZyA8aHNp
bnlpQGNocm9taXVtLm9yZz4gd3JvdGU6Cj4KPiBTb21lIG9mIHRoZSBTS1VzIGFyZSB1c2luZyBn
aWdhZGV2aWNlIGdkMjVscTY0YyBmbGFzaCBjaGlwLiBUaGUgY2hpcAo+IGRlZmF1bHQgZW5hYmxl
cyBxdWFkIG1vZGUsIHdoaWNoIHJlc3VsdHMgaW4gdGhlIHdyaXRlIHByb3RlY3QgcGluIHNldCB0
bwo+IElPIHBpbi4gSW4gdHJvZ2RvciBwbGF0Zm9ybXMsIHdlIHdvbid0IHVzZSBxdWFkIGVuYWJs
ZSBmb3IgYWxsIFNLVXMsIHNvCj4gYXBwbHkgdGhlIHByb3BlcnR5IHRvIGRpc2FibGUgc3BpIG5v
cidzIHF1YWQgbW9kZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEhzaW4tWWkgV2FuZyA8aHNpbnlpQGNo
cm9taXVtLm9yZz4KPiAtLS0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9xY29tL3NjNzE4MC10cm9n
ZG9yLmR0c2kgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9xY29tL3NjNzE4MC10cm9nZG9yLmR0c2kgYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL3Fjb20vc2M3MTgwLXRyb2dkb3IuZHRzaQo+IGluZGV4IDVhMzNl
MTZhOGI2NzcuLjA4MDZjZThlODZiZWEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0
cy9xY29tL3NjNzE4MC10cm9nZG9yLmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3Fj
b20vc2M3MTgwLXRyb2dkb3IuZHRzaQo+IEBAIC00MzYsNiArNDM2LDcgQEAgZmxhc2hAMCB7Cj4g
ICAgICAgICAgICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0gPDM3NTAwMDAwPjsKPiAgICAgICAg
ICAgICAgICAgc3BpLXR4LWJ1cy13aWR0aCA9IDwyPjsKPiAgICAgICAgICAgICAgICAgc3BpLXJ4
LWJ1cy13aWR0aCA9IDwyPjsKPiArICAgICAgICAgICAgICAgZGlzYWJsZS1xdWFkLW1vZGU7CgpU
aGlzIHNlZW1zIHVubmVjZXNzYXJ5LiBVbmxlc3MgInR4LWJ1cy13aWR0aCIgb3IgInJ4LWJ1cy13
aWR0aCIgaXMgNAp0aGVuIFF1YWQgU1BJIGlzbid0IGVuYWJsZWQuIFlvdSBkb24ndCBuZWVkIGFu
IGV4cGxpY2l0IHByb3BlcnR5IHNpbmNlCnRoaXMgY2FuIGp1c3QgYmUgaW5mZXJyZWQgZnJvbSB0
aGUgdHggYW5kIHJ4IGJ1cyB3aWR0aC4KCi1Eb3VnCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
