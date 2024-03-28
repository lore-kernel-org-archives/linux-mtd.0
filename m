Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBF9C54E67
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2024 14:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TpsibNkzKkj4f+UTGJY/+4CyMchMAwHReVytNy7FPNE=; b=gqHDXAD9mn1fVX
	Zix9HdRPDsTME91V8FRjAKrLjGr+Upl11bXxeqTpnZ/50rnsJHYBKqAPVpSwrzeKSNucv+BuCOcg5
	QAnjumKMmAeMtJ5tPe3hv1BkfyaGZt38fTyCIFjGj5kSg9B1Q94GudLAxp4TRG4HNgaxcDyskTecv
	IITYFh5sRIppSode5FeHOXd5lPf4yvj5eESrpzzX+9C9whbxm6alPlxoeXfktupzquwWDzLJ1cfdQ
	Odmu5mg+ysLwFEZA/kvgjnZmmUcUnel3FttEqiz/NWYh/jHrDaYrYXv7GAyVPOukXHDSrlep4K9Ta
	0EjWOzEZ72TWHmHsbBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqbQ-0000000EIKE-2HeL;
	Thu, 28 Mar 2024 14:19:36 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqbN-0000000EIGZ-0e3D
	for linux-mtd@lists.infradead.org;
	Thu, 28 Mar 2024 14:19:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-415455fc8e8so4093175e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2024 07:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711635570; x=1712240370; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WrB39jskNAQxk3poTjDI2WVUKziiXPl2M1zSpgJNL0Y=;
        b=Mjo3coawyJS/nigKi4+pwKnrF+jcCVo5TuMbLiNqbuZj1w0xGHMOkHLvO1IzbNOqsb
         YwC3T9GyZTHttqw4HzBR0ivw7Da9Q09EmgwrmRuxxHSpusm7N/YLTrx5iajN1q8IFz0E
         wq7DC3VSdTsB3N5XShwzieU7u3GCnprX23IPksckRcxZgqwkKyR+GLIJmLkgrHRYC1Nb
         68hfe0/F23EPJWzpXfeH8SEfFJ3olPX8GOlvblKcpPt6PRjXyjM+rfYYD7u7CyaC/2yc
         fZAR2MbLdGaH6dC0FeCFDpJCDXUIgQsOD+pZeQz3RaNr8mgsnS1pRM5I9yRIi0GrdMJf
         bX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711635570; x=1712240370;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WrB39jskNAQxk3poTjDI2WVUKziiXPl2M1zSpgJNL0Y=;
        b=dj2uxpzu1QflUxmOHz0GVyTRk7+xDfWN5cRCUZUkTLYJI6lUMNGAFuKTp3V72RTWjV
         +chuLmxWCR4PB2B1RJ1iGKT7ePamcB42gJgggIA5npYwBaDuw+389jAH5ZTBvnGYGRUK
         0YQgbEcTWQPjiBo4MzUyabnlXrHNvsHju0LDyWEuQ7K8DtnOim+iuZljM1QiJLMxdfFX
         +ZlsUBGfZgl0Id6eUpQNLlr82fs1suq5Az3lYBr8d8u845SBHZoKcLrR8ASUbfoyx1OF
         3xwdCZhoCdIfPzz/l8fOfYTAs8Z5tBeeaZECxMEIF1vErZdQ19r40tVILfLiPUn4KFgl
         Im6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbv+8TmCkYvPryFEMoMHO6MTMqSo6FzL1q5DxQVhpavo0B+vdBEuHx/VvMeAQxoN+KyZx/2dCEJ04/WwPTKqLfDoOeHJVaPH2V2ckTOw==
X-Gm-Message-State: AOJu0YxbmrZzxUVmzgAIOsiBVr6Fgi16mNTjksuMK5wVWP5lJyw9FnIT
	h+ZWhLkB+n5cPYi1wrgQBELj/se12M0bZ6W71ag9Kj2KYnP3JSs5
X-Google-Smtp-Source: AGHT+IHWrLZeKk2CojUjAsEcno3P9RlE2RJMQ3G0SD3pycUW+URPzK2IyGZs4uxY7GtMdfxhVmrWqg==
X-Received: by 2002:a05:600c:45ca:b0:414:8948:621c with SMTP id s10-20020a05600c45ca00b004148948621cmr2718071wmo.8.1711635569770;
        Thu, 28 Mar 2024 07:19:29 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-1-248-55.retail.telecomitalia.it. [87.1.248.55])
        by smtp.gmail.com with ESMTPSA id l14-20020a05600c1d0e00b0041477f95cf6sm2457876wms.13.2024.03.28.07.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 07:19:29 -0700 (PDT)
Message-ID: <66057c71.050a0220.e4ba.97dc@mx.google.com>
X-Google-Original-Message-ID: <ZgV8bS19nCFV8iQm@Ansuel-XPS.>
Date: Thu, 28 Mar 2024 15:19:25 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] mtd: limit OTP NVMEM Cell parse to non Nand devices
References: <20240322040951.16680-1-ansuelsmth@gmail.com>
 <30bc0d38-b610-4397-ba42-46819d5507fc@milecki.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <30bc0d38-b610-4397-ba42-46819d5507fc@milecki.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_071933_381388_027125C3 
X-CRM114-Status: GOOD (  22.60  )
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

T24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMTE6MTU6MDJQTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IE9uIDIyLjAzLjIwMjQgMDU6MDksIENocmlzdGlhbiBNYXJhbmdpIHdyb3RlOgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYyBiL2RyaXZlcnMvbXRkL210ZGNv
cmUuYwo+ID4gaW5kZXggNTg4N2ZlYjM0N2E0Li4wZGU4N2JjNjM4NDAgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL210ZC9tdGRjb3JlLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+
ID4gQEAgLTkwMCw3ICs5MDAsNyBAQCBzdGF0aWMgc3RydWN0IG52bWVtX2RldmljZSAqbXRkX290
cF9udm1lbV9yZWdpc3RlcihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwKPiA+ICAgCWNvbmZpZy5uYW1l
ID0gY29tcGF0aWJsZTsKPiA+ICAgCWNvbmZpZy5pZCA9IE5WTUVNX0RFVklEX0FVVE87Cj4gPiAg
IAljb25maWcub3duZXIgPSBUSElTX01PRFVMRTsKPiA+IC0JY29uZmlnLmFkZF9sZWdhY3lfZml4
ZWRfb2ZfY2VsbHMgPSB0cnVlOwo+ID4gKwljb25maWcuYWRkX2xlZ2FjeV9maXhlZF9vZl9jZWxs
cyA9ICFtdGRfdHlwZV9pc19uYW5kKG10ZCk7Cj4gPiAgIAljb25maWcudHlwZSA9IE5WTUVNX1RZ
UEVfT1RQOwo+ID4gICAJY29uZmlnLnJvb3Rfb25seSA9IHRydWU7Cj4gPiAgIAljb25maWcuaWdu
b3JlX3dwID0gdHJ1ZTsKPiAKPiBJIHRoaW5rIHRoZXJlIG1heSBiZSBldmVuIG1vcmUgdW53YW50
ZWQgYmVoYXZpb3VyIGhlcmUuIElmCj4gbXRkX290cF9udm1lbV9yZWdpc3RlcigpIGZhaWxzIHRv
IGZpbmQgbm9kZSB3aXRoICJ1c2VyLW90cCIgLwo+ICJmYWN0b3J5LW90cCIgY29tcGF0aWJsZSB0
aGVuIGl0IHNldHMgImNvbmZpZy5vZl9ub2RlIiB0byBOVUxMIGJ1dCB0aGF0Cj4gbWVhbnMgTlZN
RU0gY29yZSBzdGlsbCBsb29rcyBmb3IgTlZNRU0gY2VsbHMgaW4gZGV2aWNlJ3MgIm9mX25vZGUi
Lgo+IAo+IEkgYmVsaWV2ZSB3ZSBzaG91bGQgbm90IGxvb2sgZm9yIE9UUCBOVk1FTSBjZWxscyBv
dXQgb2YgdGhlICJ1c2VyLW90cCIgLwo+ICJmYWN0b3J5LW90cCIgY29tcGF0aWJsZSBub2Rlcy4K
PiAKPiBTbyBtYXliZSB3aGF0IHdlIG5lZWQgaW4gdGhlIGZpcnN0IHBsYWNlIGlzIGp1c3Q6Cj4g
Y29uZmlnLmFkZF9sZWdhY3lfZml4ZWRfb2ZfY2VsbHMgPSAhIW5wOwo+ID8KPiAKPiBBbnkgZXh0
cmEgbGltaXRhdGlvbiBvZiAuYWRkX2xlZ2FjeV9maXhlZF9vZl9jZWxscyBzaG91bGQgcHJvYmFi
bHkgYmUKPiB1c2VkIG9ubHkgaWYgd2Ugd2FudCB0byBwcmV2ZW50IG5ldyB1c2VycyBvZiB0aGUg
bGVnYWN5IHN5bnRheC4gVGhlCj4gcHJvYmxlbSBpcyB0aGF0IG10ZC55YW1sIGJpbmRpbmcgYWxs
b3dlZCAidXNlci1vdHAiIGFuZCAiZmFjdG9yeS1vdHAiCj4gd2l0aCBvbGQgc3ludGF4IGNlbGxz
LiBJdCBtZWFucyBldmVyeSBNVEQgZGV2aWNlIHdhcyBhbGxvd2VkIHRvIGhhdmUKPiB0aGVtLgo+
IAo+IE5vIGluLWtlcm5lbCBEVFMgZXZlbiB1c2VkICJ1c2VyLW90cCIgb3IgImZhY3Rvcnktb3Rw
IiB3aXRoIE5WTUVNIGxlZ2FjeQo+IGNlbGxzIGJ1dCBJJ20gbm90IHN1cmUgYWJvdXQgZG93bnN0
cmVhbSBEVFMgZmlsZXMuIElkZWFsbHkgd2Ugd291bGQgZG8KPiBjb25maWcuYWRkX2xlZ2FjeV9m
aXhlZF9vZl9jZWxscyA9IGZhbHNlOwo+IGJ1dCB0aGF0IGNvdWxkIGJyZWFrIGNvbXBhdGliaWxp
dHkgd2l0aCBzb21lIGRvd25zdHJlYW0gRFRTIGZpbGVzLgoKWWVzIHRoZSBtYWluIHByb2JsZW0g
aXMgcHJldmVudCByZWdyZXNzaW9uIGluIGRvd25zdHJlYW0uIEkgZmVlbCBmb3IgdGhlCm5hbmQg
dXNhZ2UsIHRoaXMgaXMgMTAwJSBvZiB0aGUgdGltZXMgYnJva2VuLiBGb3IgU1BJIGFuZCBvdGhl
ciBjb3JuZXIKY2FzZSBNVEQgZGV2aWNlcyBpdCdzIG5vdD8KCkFueXdheSBkaWQgeW91IGJ5IGNo
YW5jZSBoYXZlIGEgc3VnZ2VzdGlvbiBmb3IgYSBiZXR0ZXIgZml4ZXMgdGFnPwoKLS0gCglBbnN1
ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
