Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD98C001DF
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Aug 2023 17:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ES2BNfFV85y8qyY2v9z02kuY1W8oztIN7jypuq7b/nI=; b=yfX8PxirMaig2L
	25TBEuRO+vWR0qgTe7Lb2jsPoj8R/+65ZSQcQ0w8gWNuxQy37QXfhKHKGeVTCpbBdxWefJ8jIrbsc
	wPslD5azgX3RyqJi1qwzfehERN7CM5eolHZGSm1KMzY8P8ORKVJ1myPsyJdiKwmOPOAWwN2ufQVVd
	MfwruJc7iA92yZSCaVKbAsBOqVk/KZBgNsMQp4zKpHvlw7gItUawhKNNFhFw+EmfGU8lO9TleScj+
	FcpcBpvWI7UzKUt9cIWS97EQT0duz4DGHaVQBHZ5grH1L88M8+5d9bfw8fGiyBwT9v0tZn8EEoFoJ
	Iyr3MOv4tmJybIz09TRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWJw4-004ffl-0E;
	Wed, 16 Aug 2023 17:03:56 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWJw0-004ffB-1N
	for linux-mtd@lists.infradead.org;
	Wed, 16 Aug 2023 17:03:54 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-991c786369cso915827366b.1
        for <linux-mtd@lists.infradead.org>; Wed, 16 Aug 2023 10:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692205429; x=1692810229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xA0nxblLEhHPpBIZZtW+HOiojWVRcj+llWDtNwnRsQI=;
        b=krQB+VM3K7SsNBknMDJeZDCGnkEnF65p/NWWUrlcfNPpwjM+NbuU+7Ei7qsy2sWhMD
         /Pw6dKrTOytF6GtMrtn8DIDiB0UNP3QSQ62/uaNFiQPGhLHi7lyuMU871WqOFesquHIE
         p8wI6iDAtwGE/iD3mNkLEKnqEQJ1Z6otLNjcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692205429; x=1692810229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xA0nxblLEhHPpBIZZtW+HOiojWVRcj+llWDtNwnRsQI=;
        b=Y8b4Lpv+VvvMcoaVlKY+i6/Xxs7Arlw9OI6+2vt2iB357dod2R/eudQZpk2oUO7a7s
         WBuGaQvn4d5GHAgvBfpUhtZIxDak4JvTHFo4u4JI+TCibU9VMlyHIo1H4NtJ/c50CTkd
         RNpKqrDzYYVhcifgMVKfqUlx1pekgtHfg8CbLSeaW7XXyv1kTQnHhoP0jyH6EyESqAfR
         a+Vqm5imXLiJr9F31bvMOxy8vJw9TvKau2Im0AhXS6ezGR4UP9f8QZr1KmC1BoSwYB7A
         wE5hYNFNgFW2SiyoTSnuZSedbPvJWJyFe1BTEnejmKt90DFQLTbwOrMWbl+oXK2cfUzc
         hCxg==
X-Gm-Message-State: AOJu0YxVATK5cklh1xrr+9witUtSxVqqXImU3dVaH4nEmimn2siJU3T3
	HFtjEcFeD4ypFukOMpWk3h3m4grNT/17U726UeAM+C8F
X-Google-Smtp-Source: AGHT+IEJ9fFC8G540HkC7c4HfBy8q9gIdSh9WrN1oKMKqZc25r8+thvf/iUxyUKHC6wnBnu+dBSbBw==
X-Received: by 2002:a17:907:930a:b0:99c:57ed:baf1 with SMTP id bu10-20020a170907930a00b0099c57edbaf1mr2017173ejc.51.1692205429017;
        Wed, 16 Aug 2023 10:03:49 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709065aca00b00992d122af63sm8706614ejs.89.2023.08.16.10.03.48
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 10:03:48 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3fe32ec7201so2095e9.1
        for <linux-mtd@lists.infradead.org>; Wed, 16 Aug 2023 10:03:48 -0700 (PDT)
X-Received: by 2002:a05:600c:4fc2:b0:3f1:6fe9:4a95 with SMTP id
 o2-20020a05600c4fc200b003f16fe94a95mr6307wmq.4.1692205427880; Wed, 16 Aug
 2023 10:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230816104245.2676965-1-hsinyi@chromium.org> <20230816104245.2676965-2-hsinyi@chromium.org>
In-Reply-To: <20230816104245.2676965-2-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Aug 2023 10:03:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UH0NFH9LGk663WeWodD9oN7o8M70jy26CYBXd7=o5-VA@mail.gmail.com>
Message-ID: <CAD=FV=UH0NFH9LGk663WeWodD9oN7o8M70jy26CYBXd7=o5-VA@mail.gmail.com>
Subject: Re: [PATCH v2,2/2] arm64: dts: mediatek: mt8183: set bus rx width to
 disable quad mode
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
X-CRM114-CacheID: sfid-20230816_100352_484497_175545A9 
X-CRM114-Status: GOOD (  16.65  )
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

SGksCgpPbiBXZWQsIEF1ZyAxNiwgMjAyMyBhdCAzOjQz4oCvQU0gSHNpbi1ZaSBXYW5nIDxoc2lu
eWlAY2hyb21pdW0ub3JnPiB3cm90ZToKPgo+IFNvbWUgb2YgdGhlIFNLVXMgYXJlIHVzaW5nIGdp
Z2FkZXZpY2UgZ2QyNWxxNjRjIGZsYXNoIGNoaXAuIFRoZSBjaGlwCj4gZGVmYXVsdCBlbmFibGVz
IHF1YWQgbW9kZSwgd2hpY2ggcmVzdWx0cyBpbiB0aGUgd3JpdGUgcHJvdGVjdCBwaW4gc2V0IHRv
Cj4gSU8gcGluLiBJbiBtdDgxODMga3VrdWksIHdlIHdvbid0IHVzZSBxdWFkIGVuYWJsZSBmb3Ig
YWxsIFNLVXMsIHNvIGFwcGx5Cj4gdGhlIHByb3BlcnR5IHRvIGRpc2FibGUgc3BpIG5vcidzIHF1
YWQgbW9kZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEhzaW4tWWkgV2FuZyA8aHNpbnlpQGNocm9taXVt
Lm9yZz4KPiAtLS0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMta3VrdWku
ZHRzaSB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE4My1rdWt1aS5kdHNpIGIvYXJj
aC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMta3VrdWkuZHRzaQo+IGluZGV4IDZjZTE2
YTI2NWUwNTMuLmVmNDcyYjUyMmYyZTcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDgxODMta3VrdWkuZHRzaQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ4MTgzLWt1a3VpLmR0c2kKPiBAQCAtODc3LDYgKzg3Nyw3IEBAIHcyNXE2NGR3
OiBmbGFzaEAwIHsKPiAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJ3aW5ib25kLHcyNXE2
NGR3IiwgImplZGVjLHNwaS1ub3IiOwo+ICAgICAgICAgICAgICAgICByZWcgPSA8MD47Cj4gICAg
ICAgICAgICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0gPDI1MDAwMDAwPjsKPiArICAgICAgICAg
ICAgICAgc3BpLXJ4LWJ1cy13aWR0aCA9IDwyPjsKClRoaXMgZmVlbHMgd3JvbmcgdG8gbWUuIElz
IHlvdXIgY29udHJvbGxlciBhY3R1YWxseSBjYXBhYmxlIG9mICJkdWFsClNQSSI/IElmIHNvLCB3
aHkgd2Fzbid0IHRoZSByeC1idXMtd2lkdGggc3BlY2lmaWVkIGJlZm9yZT8gLi4uYW5kIGlmCnlv
dSdyZSB0cnVseSBjYXBhYmxlIG9mICJkdWFsIFNQSSIgdGhlbiB3aHkgYXJlbid0IHlvdSBhbHNv
IHNldHRpbmcKdGhlIHR4LWJ1cy13aWR0aD8KCk15IGJlc3QgZ3Vlc3MgKEkgY2FuIGxvb2sgdXAg
dGhlIHNjaGVtYXRpYyBpZiBuZWVkZWQpIGlzIHRoYXQgeW91J3JlCmFjdHVhbGx5IF9zaW5nbGVf
IGxhbmUsIG5vdCBkdWFsIGxhbmUgU1BJLiBUaHVzLCBhIG1vcmUgYWNjdXJhdGUKZGVzY3JpcHRp
b24gd291bGQgcHJvYmFibHkgYmU6CgpzcGktcngtYnVzLXdpZHRoID0gPDE+OwpzcGktdHgtYnVz
LXdpZHRoID0gPDE+OwoKLi4uYnV0Li4uIEkgdGhpbmsgdGhhdCB0aGUgZGVmYXVsdCBvZiByeC90
eCBidXMgd2lkdGggaXNuJ3Qgc3BlY2lmaWVkCmlzICIxIi4gVGh1cyBJIHRoaW5rIHlvdSBzaG91
bGQgZHJvcCB0aGlzIHBhdGNoLgoKLURvdWcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
