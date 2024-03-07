Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D17EC54798
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2024 12:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dzZhTRYI4WC80hOG+yXJ/A7lrHBRfqMwb1MFQVPHODM=; b=l+7ZoOOtKB4byp
	1I57szm7NaVhaVhW4JM7c6CCq+50T0fK83ZKJlNORn11pwgSl/3/0w1ESSzTkQ8U4HyV+djhYl2iO
	fY4xOZHT7GM1c6iHBfzO//eHiTj52UW6U9CtXOsW3arnaxh7pC9MAZr67D4FV5EbQRQcuz9efniIK
	MeLPlzu0dMRYJge+XodpoE+1gMa6KljXg7yGeo25/E8TrJOlj2JrNfwBr493nPiju3VY8h4VNpBl8
	+G5KZtWiSm3xLc3LWbLMvw3Lnqd+Asl0K+PDrnJ7R03MrTy0Rz3CInqd3rw6620uxMXhs/jYORTKO
	Uvtu/6nzor5/gyNK1MWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riCTq-00000004TzR-1feA;
	Thu, 07 Mar 2024 12:04:10 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riCTm-00000004TwM-085h
	for linux-mtd@lists.infradead.org;
	Thu, 07 Mar 2024 12:04:08 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5133d26632fso811265e87.2
        for <linux-mtd@lists.infradead.org>; Thu, 07 Mar 2024 04:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709813043; x=1710417843; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F2Fyfk0Z5Z7LzM4ubY4N0WUN8/ihkIdQocELKuF3SZk=;
        b=xZ/xty8lsc7hf7FPrhsRyw9WwALNvZuwzjqmsKZELujr+U3+b2fbfyALPtBCKr1GEX
         Vq9iFkOwr/T7/YMbLhSFZeKh4dhfIGX4kPZKqN+Vrni6f2jQNs1TybAy3Oj1Qii4OYhB
         L3blzhzj5yWL9ezv9mSuOBjzAivLrMC13D1uJxRZXtWLbKgcrMSasWmuGroSQigqR2pW
         ujSZbn+4a6XupCtktldFO1MF6sxhk0oi1bnIGjqJeqPus5wLUTgIvyitak1PgYU+eoSS
         eD3JgFJ73GPs4SoUwYx9lMKG42qsiHroYHt1LSbfV0jjv37Pn4aNpB2hpNKsIyynrbCZ
         UXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709813043; x=1710417843;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F2Fyfk0Z5Z7LzM4ubY4N0WUN8/ihkIdQocELKuF3SZk=;
        b=A5q0nVv+TYyd+KY43tq99Kh2atF81FsCw6whGBTGfOsg+cIrSP3cHinB7puL9W8urM
         veF8l6EOBssSYXdo1VuUkMAPoI+OyLLS1ZGdEKJWwq8sm6wF3fHMCAUMQpnqwupcErHM
         iyNxlStrt6xb9dwj8GEGitS5oq0U/0oTz3KebFw7TGOGi3Lr+uUdNqg4nfCsQ34K8smG
         F+RYvcj5+YA9e8+UClEtToOgCSCSzc3uUygyayKPHNHwRgKM2n1OnL78UZgPZhEfDCrU
         zD1aGmOXFTWBNNXUaiq4VRdk//i6lht7da7/lJByCCraZb+kgcVNOvSA8IVyyOOzVcpg
         ybxg==
X-Gm-Message-State: AOJu0YxPjNkNX3sV5D3VJ+WS4v8O7hxHAtptyn8GA/P8JQKU3cv10WHA
	ButlIYh/8kGVGCsfXp3WAPDkj6QfFKAhXFV/lMe+bJB8Bt2CvkiQoQ0rierelNw=
X-Google-Smtp-Source: AGHT+IFnwdhtwPsEP5oZPW0CnfMI15eNBkLQXmofIyA7OiFWrgmhnEk2RBJxkYTJufQTd/r6sVxagw==
X-Received: by 2002:a19:9155:0:b0:512:ec79:3be5 with SMTP id y21-20020a199155000000b00512ec793be5mr1093760lfj.43.1709813042704;
        Thu, 07 Mar 2024 04:04:02 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id n20-20020a05600c501400b00412ea92f1b4sm2547606wmr.19.2024.03.07.04.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 04:04:02 -0800 (PST)
Date: Thu, 7 Mar 2024 15:03:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mtd@lists.infradead.org, Zhihao Cheng <chengzhihao1@huawei.com>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH v2] mtd: ubi: fix NVMEM over UBI volumes on 32-bit systems
Message-ID: <831b4af1-f6a2-4bc2-ac9d-7227c28121d0@moroto.mountain>
References: <31a20aead3419209991bf01aaeaefe07ab94d23a.1709081052.git.daniel@makrotopia.org>
 <8ae44e8e-fc3d-28bd-5d1e-e900ce53529f@huawei.com>
 <27c875fb-9507-4034-8468-c4d46c952754@moroto.mountain>
 <005448D3-A311-4B2D-B515-C7A9399B48E4@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <005448D3-A311-4B2D-B515-C7A9399B48E4@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_040406_105976_9C89E8E6 
X-CRM114-Status: GOOD (  27.20  )
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

T24gVGh1LCBNYXIgMDcsIDIwMjQgYXQgMTE6NDI6MTJBTSArMDAwMCwgRGFuaWVsIEdvbGxlIHdy
b3RlOgo+IAo+IAo+IE9uIDcgTWFyY2ggMjAyNCAwOToxNzo0NSBVVEMsIERhbiBDYXJwZW50ZXIg
PGRhbi5jYXJwZW50ZXJAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPk9uIFdlZCwgRmViIDI4LCAyMDI0
IGF0IDA5OjQ1OjEzQU0gKzA4MDAsIFpoaWhhbyBDaGVuZyB3cm90ZToKPiA+PiDlnKggMjAyNC8y
LzI4IDg6NDYsIERhbmllbCBHb2xsZSDlhpnpgZM6Cj4gPj4gPiBBIGNvbXBpbGVyIHdhcm5pbmcg
cmVsYXRlZCB0byBzaXplb2YoaW50KSAhPSA4IHdoZW4gY2FsbGluZyBkb19kaXYoKQo+ID4+ID4g
aXMgdHJpZ2dlcmVkIHdoZW4gYnVpbGRpbmcgb24gMzItYml0IHBsYXRmb3Jtcy4KPiA+PiA+IEFk
ZHJlc3MgdGhpcyBieSB1c2luZyBpbnRlZ2VyIHR5cGVzIGhhdmluZyBhIHdlbGwtZGVmaW5lZCBz
aXplLgo+ID4+ID4gCj4gPj4gPiBGaXhlczogM2NlNDg1ODAzZGExICgibXRkOiB1Ymk6IHByb3Zp
ZGUgTlZNRU0gbGF5ZXIgb3ZlciBVQkkgdm9sdW1lcyIpCj4gPj4gPiBTaWduZWQtb2ZmLWJ5OiBE
YW5pZWwgR29sbGUgPGRhbmllbEBtYWtyb3RvcGlhLm9yZz4KPiA+PiA+IC0tLQo+ID4+ID4gdjI6
IHVzZSBzaXplX3QgZm9yICdieXRlc19sZWZ0JyB2YXJpYWJsZSB0byBtYXRjaCBwYXJhbWV0ZXIg
dHlwZQo+ID4+ID4gCj4gPj4gPiAgIGRyaXZlcnMvbXRkL3ViaS9udm1lbS5jIHwgNSArKysrLQo+
ID4+ID4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4g
Pj4gPiAKPiA+PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91YmkvbnZtZW0uYyBiL2RyaXZl
cnMvbXRkL3ViaS9udm1lbS5jCj4gPj4gPiBpbmRleCBiN2E5M2M0OTVkMTcyLi5lNjhiODU4OWM0
Mjc5IDEwMDY0NAo+ID4+ID4gLS0tIGEvZHJpdmVycy9tdGQvdWJpL252bWVtLmMKPiA+PiA+ICsr
KyBiL2RyaXZlcnMvbXRkL3ViaS9udm1lbS5jCj4gPj4gPiBAQCAtMjMsOSArMjMsMTIgQEAgc3Ry
dWN0IHViaV9udm1lbSB7Cj4gPj4gPiAgIHN0YXRpYyBpbnQgdWJpX252bWVtX3JlZ19yZWFkKHZv
aWQgKnByaXYsIHVuc2lnbmVkIGludCBmcm9tLAo+ID4+ID4gICAJCQkgICAgICB2b2lkICp2YWws
IHNpemVfdCBieXRlcykKPiA+PiA+ICAgewo+ID4+ID4gLQlpbnQgZXJyID0gMCwgbG51bSA9IGZy
b20sIG9mZnMsIGJ5dGVzX2xlZnQgPSBieXRlcywgdG9fcmVhZDsKPiA+PiA+ICAgCXN0cnVjdCB1
YmlfbnZtZW0gKnVudiA9IHByaXY7Cj4gPj4gPiAgIAlzdHJ1Y3QgdWJpX3ZvbHVtZV9kZXNjICpk
ZXNjOwo+ID4+ID4gKwlzaXplX3QgYnl0ZXNfbGVmdCA9IGJ5dGVzOwo+ID4+ID4gKwl1aW50MzJf
dCBvZmZzLCB0b19yZWFkOwo+ID4+IFRoZXJlIHN0aWxsIGV4aXN0IGEgdHlwZSB0cnVuY2F0aW9u
IGFzc2lnbm1lbnQgJ3RvX3JlYWQgPSBieXRlc19sZWZ0JyBiZWxvdywKPiA+PiBhbHRob3VnaCBp
dCdzIHNhZmUgaW4gbG9naWMuCj4gPgo+ID5ZZWFoLiAgQXMgeW91IHNheSwgZnJvbSBsb29raW5n
IGF0IHRoZSBsb2dpYyB3ZSBrbm93IGl0J3Mgc2FmZS4KPiA+Cj4gPiAgICA0MSAgICAgICAgICAg
ICAgICAgIGlmICh0b19yZWFkID4gYnl0ZXNfbGVmdCkKPiA+ICAgIDQyICAgICAgICAgICAgICAg
ICAgICAgICAgICB0b19yZWFkID0gYnl0ZXNfbGVmdDsKPiA+Cj4gPk9idmlvdXNseSB0aGUgbmV3
IHZhbHVlIGlzIHNtYWxsZXIgdGhhbiB0aGUgb3JpZ2luYWwsIHNvIGl0IG11c3QgZml0Cj4gPndp
dGhpbiBhIHUzMiByYW5nZS4uLgo+IAo+IAo+IEkndmUgc2VudCB2MyBvZiB0aGlzIGZpeCB3aGlj
aCBzaG91bGQgYmUgZmluYWxseSBiZSB3YXJuaW5nIGZyZWUgbm93Lgo+IAo+IGh0dHBzOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1tdGQvcGF0Y2gvZmYyOTQ0N2RjZWU4MzRj
MTdlNGUxZTk5NzI1Yjk0NTRjOTAxMzZjYS4xNzA5MTc4MzI1LmdpdC5kYW5pZWxAbWFrcm90b3Bp
YS5vcmcvCj4gCgpUaGFua3MhCgo+ID4KPiA+VGhpcyBidWcgaGFzIGJlZW4gYnJlYWtpbmcgdGhl
IGJ1aWxkIHNpbmNlIERlYyAxOS4gIAo+IAo+IEkgaGF2ZSBhIGhhcmQgdGltZSBiZWxpZXZpbmcg
dGhhdCBhcyB0aGUgb2ZmZW5kaW5nIGNvbW1pdCB3YXMgb25seSBhcHBsaWVkIG9uIEZlYiAyNS4K
PiAKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0
L2xpbnV4LW5leHQuZ2l0L2NvbW1pdC8/aWQ9M2NlNDg1ODAzZGExYjc5YjI2OTJiNmQwYzI3OTI4
MjkyOTJhZDgzOAo+IAoKQWguLi4gIE9rYXkuICBJIHdhcyBsb29raW5nIGF0IHRoZSBhdXRob3Ig
ZGF0ZS4gIE5vdCB0aGUgbWVyZ2UgZGF0ZS4gIE15CmJhZC4KCnJlZ2FyZHMsCmRhbiBjYXJwZW50
ZXIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
