Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C07E7D0D7
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 07:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p5t3BH47hGoSlxuhWuDdx4Ep4GAphtZJ2LUW89KLq0E=; b=uEV59BDrKDK1t1
	1QBNQ/9tlwkVs5wbG03n3/BA+W5LlN8vaH3Y9JpTVdZ38GuDCUz25kalILK+T3/vj0XmdZydW3JER
	IyWqNFXcP2R06oTAZ0205Cp/atIyYGVHPTeBhlP55TLcr1X8fXvpGezw+XekRGZrovjnRoO2+jNH+
	M6duYqdCtfeL/mQ1bAZ/mfsIpnnblla2HVIXaY4aGZY/f2OSEykr3OawpTl9cX5h/NQHeeygC4evy
	0O/taJ8E+FDs/LlcpkC0hibnLILKG1z4P75D/nsk+gDNbFrnDeIuYEohP4srHB9wqG29DJwccjhNX
	3TCeQS+hyPkSaXVIV1EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjaJN-0088Xa-1N;
	Fri, 22 Sep 2023 07:10:49 +0000
Received: from mail-yw1-f180.google.com ([209.85.128.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjaJK-0088Wt-2S
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 07:10:48 +0000
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-59c0d329a8bso21257917b3.1
        for <linux-mtd@lists.infradead.org>; Fri, 22 Sep 2023 00:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695366645; x=1695971445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNNKeiWdrHi1JK275O0aat5lgv03VJfdBdgbH4hvBr8=;
        b=Oq1Bd/R5BSZFcmTa0z/8Icu3RzKlDZSvp/WiUEQ3q4Dev+5oruP5a/kTNDQvSNFVXv
         UanvB+/tSggggDp1+rnFEG8o31nSL2WIpC0oO9Z5BiWdLLFhMwNKioyWPOAjQjp4xaYT
         gLV+dhLAQZKDZ6lj64ttoKHrlzQD1PeNzAY4E6ao1UDqQP9LfA8Hjghz673ZFud1PFyn
         eK880b4S3BKfgiMQzd8+S/iWZ8caTzhgcpSKNRIxumHEKzYeC3UGnLiL2JvQzwsOtEUi
         xmsY07xSAFdFHH6FitrCLnUnlRahWTHTyFZErJXlmANaMDG/6/kjyEoMtQftlGPHvKlw
         VanA==
X-Gm-Message-State: AOJu0Yylka6M8n/ShMjnCKmvIa3Abf8L1HyALGsjTN3Yu4/Xq4GJ87Aa
	pmIstnsR67zHOZxhwTr99MBvsRrYUhc21GEn
X-Google-Smtp-Source: AGHT+IF7FuuaL3IeqzQ9Fh2pWP/xAEZD1GQcXEZNemT1PZyuyLJL48QcHr1jYzBtBssX9kt1GOQo/Q==
X-Received: by 2002:a0d:db93:0:b0:592:97c3:18d2 with SMTP id d141-20020a0ddb93000000b0059297c318d2mr7256974ywe.15.1695366644703;
        Fri, 22 Sep 2023 00:10:44 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id d64-20020a0df443000000b0059511008958sm748312ywf.76.2023.09.22.00.10.44
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 00:10:44 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-59bc956b029so21050267b3.2
        for <linux-mtd@lists.infradead.org>; Fri, 22 Sep 2023 00:10:44 -0700 (PDT)
X-Received: by 2002:a0d:c8c1:0:b0:59b:c6a4:15c7 with SMTP id
 k184-20020a0dc8c1000000b0059bc6a415c7mr7945698ywd.46.1695366644065; Fri, 22
 Sep 2023 00:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
 <1503a3857107e3a4f34e0c7fb5dada39@walle.cc> <CAMuHMdXN+HJb=zGeG=3t=Pie9cVpnBLYuEb_qX6=oSxG8eTkAw@mail.gmail.com>
 <20221205163306.GB2012644-robh@kernel.org> <CAMuHMdUcrh26MNYuiqiC0_FMkeHtq1YnJrZKHEV_WQm5Dgzoaw@mail.gmail.com>
 <ee03d150-51cf-4e12-ae2c-9475a192fb6c@linaro.org> <CAMuHMdW_-0f8DOmEzYb28XABqU3oFL4KXf9M-qKVyyrE_Lo+jQ@mail.gmail.com>
 <d4d998cff934328f58cec767f93a59b5@walle.cc> <CAMuHMdUK=HvvjeTDefzX9sbY-vaRFVixcSvKVqDPgBpGVt2dQA@mail.gmail.com>
In-Reply-To: <CAMuHMdUK=HvvjeTDefzX9sbY-vaRFVixcSvKVqDPgBpGVt2dQA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Sep 2023 09:10:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUKxJDPs3Ow8E-g2bLr7c7jREf5gSqWZ+o5aWbGj6uO=w@mail.gmail.com>
Message-ID: <CAMuHMdUKxJDPs3Ow8E-g2bLr7c7jREf5gSqWZ+o5aWbGj6uO=w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document support for
 more MT25QU parts
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_001046_800443_99E34BB8 
X-CRM114-Status: GOOD (  27.69  )
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

T24gVGh1LCBTZXAgMjEsIDIwMjMgYXQgNzowMeKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOgo+IE9uIFRodSwgU2VwIDIxLCAyMDIzIGF0IDY6MDHi
gK9QTSBNaWNoYWVsIFdhbGxlIDxtaWNoYWVsQHdhbGxlLmNjPiB3cm90ZToKPiA+ID4+IFdlIHdv
bid0IGJyZWFrIGNvbXBhdGliaWxpdHkgd2l0aCBvbGRlciBEVEJzIGlmIHdlIHVzZSBhIGxpc3Qg
b2YKPiA+ID4+IGNvbXBhdGlibGVzLiBGaXJzdCB0aGUgdmVuZG9yIHNwZWNpZmljIG9uZSB3aGlj
aCB3aWxsIHVzZSBzb21lIHF1aXJrcywKPiA+ID4+IGFuZCBpZiB0aGF0J3Mgbm90IGF2YWlsYWJs
ZSwgaGF2ZSBhcyBzZWNvbmQgdGhlIGdlbmVyaWMgamVkZWMsc3BpLW5vcgo+ID4gPj4gdG8KPiA+
ID4+IGZhbGxiYWNrIHRvLgo+ID4gPgo+ID4gPiBTdXJlLCB5b3Ugc2hvdWxkIHVzZSBhIGxpc3Qu
Cj4gPiA+Cj4gPiA+IEJ1dCB0aGUgY3VycmVudCByZWNvbW1lbmRlZCBwcmFjdGljZSBpcyB0byBu
b3QgaGF2ZSBhIGxpc3QsCj4gPiA+IGJ1dCBqdXN0ICJqZWRlYyxzcGktbm9yIiAodXNpbmcgYSBs
aXN0IHdpdGggYSBuZXcgRkxBU0ggcGFydCBuYW1lCj4gPiA+IGNhdXNlcyBjaGVja3BhdGNoIGFu
ZCBkdGJzX2NoZWNrIHdhcm5pbmdzKS4gSGVuY2UgaWYgeW91IGZvbGxvdyB0aGF0Cj4gPiA+IHJl
Y29tbWVuZGF0aW9uLCB5b3Ugd2lsbCBydW4gaW50byBjb21wYXRpYmlsaXR5IGlzc3VlcyB3aXRo
IG9sZGVyIERUQnMKPiA+ID4gd2hlbiB5b3UgZGlzY292ZXIgdGhlIHF1aXJrIGxhdGVyLCBhbmQg
ZGVjaWRlIHRvIGFkZCBpdCB0byB0aGUgbGlzdC4KPiA+Cj4gPiBUaGUgU1BJIE5PUiBmbGFzaGVz
IHNob3VsZCBiZSBhdXRvIGRpc2NvdmVyYWJsZS4gV2h5IGRvIHlvdSBuZWVkIGEKPiA+IGNvbXBh
dGlibGUgc3RyaW5nPyBRdWlya3MgY2FuIGJlIGFkZGVkIHRvIHRoZSBmbGFzaF9pbmZvIGRhdGFi
YXNlLgo+Cj4gVGhpcyBhc3N1bWVzIHlvdSBkb24ndCBuZWVkIHRoZSBxdWlyayBiZWZvcmUgeW91
IGNhbiBpZGVudGlmeSB0aGUgcGFydC4KPiBJJ20gbm90IHN1cmUgdGhhdCBpcyBhbHdheXMgdGhl
IGNhc2UuCgpSZW1pbmRlciB3aGVyZSB0aGlzIGlzIGFwcGFyZW50bHkgbm90IHRoZSBjYXNlOgpo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yL09TMFBSMDFNQjU5MjJBNEYxNkRFODkyMzM3M0FBNURE
ODg2RjdBQE9TMFBSMDFNQjU5MjIuanBucHJkMDEucHJvZC5vdXRsb29rLmNvbS8KCkdye29ldGpl
LGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0
ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxp
bnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBl
b3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
