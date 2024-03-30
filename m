Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB7AC47DD9
	for <linux-mtd@archiver.kernel.org>; Sat, 30 Mar 2024 09:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JG7YjlstyXDXA9wAODYaUCPRhkCr40TTaCKV0yAww7U=; b=Y2wx9xxrxOXEx1
	kHl60LuLfKCzAEvgZTIVT/HCS1DVrxALjmwVYIMw/UUs8S/rb8VL1HdWxIlFnFgVN25zFf4ksucyE
	XddvuvzZB+3JbcIIjtT9YWK5C+8cY6qfghZNhShrzS7BcnZbP0WtjlgXAfX+sxsWpFt8RQvqx0VO9
	VMfaCiF1R5+1v9v07vzaR4gV+XJU5l3WNbDydd1eEl4wF3x5+ft8Kqr+BzEriXis595JETVV7hyR1
	Yxr/9HTEjNd6Nzp4QBW53BGuCBCi4OmhN3ltfFu/519t2fFB7l9tPPDS+Oa/VQu4fnyVofn45r83k
	zKc2sfKYv3vJgHyxr5sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqUmW-000000038cJ-3uQL;
	Sat, 30 Mar 2024 09:13:44 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqUmU-000000038aF-1BRA
	for linux-mtd@lists.infradead.org;
	Sat, 30 Mar 2024 09:13:43 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-34175878e3cso1956904f8f.0
        for <linux-mtd@lists.infradead.org>; Sat, 30 Mar 2024 02:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711790020; x=1712394820; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rWGcxGDGq3xifasgBFf2SllwrhRtj5a20lnw94qc54Q=;
        b=BbS9BLsduW4pZDmYRl5UHA3I1mu182ipPs1eWhYKHbZ80cwRE+DuRWxmLH2/AC5rDt
         TduhnX4c1fnWCwXJyJqkolKFcXl+HwM5OCHOifskCnaBlllTxqWcA0/rRRzmxDojoT/U
         DuTFbN/fsHumR2ew92RKHHODwMzVue7xlxYteli19s9EwsRCLZMQMk1xC85ctUUSv8cc
         elLNEM8awybbzJ7lY2wgku/9gCECfTQWq6bFNctR7fVIR3J6TYyFtUBz2tmLq+EJFvVS
         EKmiHQ87sBeHNTkQqu0sxUD+1TfGfMxdr6i0FHIaUwlWKBX70K+WBsB6eOHEyfoFppm3
         hedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711790020; x=1712394820;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rWGcxGDGq3xifasgBFf2SllwrhRtj5a20lnw94qc54Q=;
        b=WWNbqRc2BxOnzfL/D83mnYoxxgAj3VAK0SOFRD+W5YuLgPdGqW6yx5u1dbccJnzSss
         nt1SHEoB42xSlxp3f+10bUhJMR8ysmG/H6VKsXDhcXtxu+YFwtUaXXKydDNUFvfbNBBy
         n+TYOZwMqNyfqBZT57tjSeKIZHAIWMpcOL0+kE2L2dL9M0t/0lxGBY69fSjkoCLaC35q
         +ZL3zWz66IFk7vRzgcyvftq1KB1k97DqQj7RCc+xpS2Ws3kzKmN33ORebddvf+exT2fv
         l7bKkoC/G8eT80bQui++IYjETxgjTTMPksdpZFnhYqftBAqSzjGKaTq8JZ1UmGFVIDwn
         XZ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWz+AJ3A2zTz7XdNXUsFqG/RWuBXSBRE4nN6RkugpzumcXfLpn3VAzyU388XkfEfHkf0NF8LSwE1prEve1Tv2jEIfSWVs8jBxEShcm4Lg==
X-Gm-Message-State: AOJu0YyrvIUtLE9mLMdWDhWRDfMTiJR1x18fgGAOPXUGa0sWORzC02Zl
	+fGKrynQDGF4TygN0j13xpKvPRV9g0xPpNqlqJ6wfH9KeZnjF5KB
X-Google-Smtp-Source: AGHT+IEFg1PCtfc0ais3QcJd/zwznPWHY+i4QrwBtyXVy6XGZcTwh0pDVlKiHAYbNtSIUepg0CfukQ==
X-Received: by 2002:adf:f091:0:b0:343:34af:2954 with SMTP id n17-20020adff091000000b0034334af2954mr2009357wro.28.1711790019576;
        Sat, 30 Mar 2024 02:13:39 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-1-165-123.retail.telecomitalia.it. [87.1.165.123])
        by smtp.gmail.com with ESMTPSA id v17-20020adfe291000000b0034174566ec4sm6010243wri.16.2024.03.30.02.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 02:13:39 -0700 (PDT)
Message-ID: <6607d7c3.df0a0220.498b4.86f3@mx.google.com>
X-Google-Original-Message-ID: <ZgfXv53uqXH-gnUI@Ansuel-XPS.>
Date: Sat, 30 Mar 2024 10:13:35 +0100
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
 <66057c71.050a0220.e4ba.97dc@mx.google.com>
 <a4632f1ba701f6b333c50a5366723cf4@milecki.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a4632f1ba701f6b333c50a5366723cf4@milecki.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_021342_353384_580B2729 
X-CRM114-Status: GOOD (  33.92  )
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

T24gVGh1LCBNYXIgMjgsIDIwMjQgYXQgMDM6NDQ6MTVQTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IE9uIDIwMjQtMDMtMjggMTU6MTksIENocmlzdGlhbiBNYXJhbmdpIHdyb3RlOgo+
ID4gT24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMTE6MTU6MDJQTSArMDEwMCwgUmFmYcWCIE1pxYJl
Y2tpIHdyb3RlOgo+ID4gPiBPbiAyMi4wMy4yMDI0IDA1OjA5LCBDaHJpc3RpYW4gTWFyYW5naSB3
cm90ZToKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkY29yZS5jIGIvZHJpdmVy
cy9tdGQvbXRkY29yZS5jCj4gPiA+ID4gaW5kZXggNTg4N2ZlYjM0N2E0Li4wZGU4N2JjNjM4NDAg
MTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gPiA+ID4gKysrIGIv
ZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gPiA+ID4gQEAgLTkwMCw3ICs5MDAsNyBAQCBzdGF0aWMg
c3RydWN0IG52bWVtX2RldmljZSAqbXRkX290cF9udm1lbV9yZWdpc3RlcihzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCwKPiA+ID4gPiAgIAljb25maWcubmFtZSA9IGNvbXBhdGlibGU7Cj4gPiA+ID4gICAJ
Y29uZmlnLmlkID0gTlZNRU1fREVWSURfQVVUTzsKPiA+ID4gPiAgIAljb25maWcub3duZXIgPSBU
SElTX01PRFVMRTsKPiA+ID4gPiAtCWNvbmZpZy5hZGRfbGVnYWN5X2ZpeGVkX29mX2NlbGxzID0g
dHJ1ZTsKPiA+ID4gPiArCWNvbmZpZy5hZGRfbGVnYWN5X2ZpeGVkX29mX2NlbGxzID0gIW10ZF90
eXBlX2lzX25hbmQobXRkKTsKPiA+ID4gPiAgIAljb25maWcudHlwZSA9IE5WTUVNX1RZUEVfT1RQ
Owo+ID4gPiA+ICAgCWNvbmZpZy5yb290X29ubHkgPSB0cnVlOwo+ID4gPiA+ICAgCWNvbmZpZy5p
Z25vcmVfd3AgPSB0cnVlOwo+ID4gPiAKPiA+ID4gSSB0aGluayB0aGVyZSBtYXkgYmUgZXZlbiBt
b3JlIHVud2FudGVkIGJlaGF2aW91ciBoZXJlLiBJZgo+ID4gPiBtdGRfb3RwX252bWVtX3JlZ2lz
dGVyKCkgZmFpbHMgdG8gZmluZCBub2RlIHdpdGggInVzZXItb3RwIiAvCj4gPiA+ICJmYWN0b3J5
LW90cCIgY29tcGF0aWJsZSB0aGVuIGl0IHNldHMgImNvbmZpZy5vZl9ub2RlIiB0byBOVUxMIGJ1
dAo+ID4gPiB0aGF0Cj4gPiA+IG1lYW5zIE5WTUVNIGNvcmUgc3RpbGwgbG9va3MgZm9yIE5WTUVN
IGNlbGxzIGluIGRldmljZSdzICJvZl9ub2RlIi4KPiA+ID4gCj4gPiA+IEkgYmVsaWV2ZSB3ZSBz
aG91bGQgbm90IGxvb2sgZm9yIE9UUCBOVk1FTSBjZWxscyBvdXQgb2YgdGhlCj4gPiA+ICJ1c2Vy
LW90cCIgLwo+ID4gPiAiZmFjdG9yeS1vdHAiIGNvbXBhdGlibGUgbm9kZXMuCj4gPiA+IAo+ID4g
PiBTbyBtYXliZSB3aGF0IHdlIG5lZWQgaW4gdGhlIGZpcnN0IHBsYWNlIGlzIGp1c3Q6Cj4gPiA+
IGNvbmZpZy5hZGRfbGVnYWN5X2ZpeGVkX29mX2NlbGxzID0gISFucDsKPiA+ID4gPwo+ID4gPiAK
PiA+ID4gQW55IGV4dHJhIGxpbWl0YXRpb24gb2YgLmFkZF9sZWdhY3lfZml4ZWRfb2ZfY2VsbHMg
c2hvdWxkIHByb2JhYmx5IGJlCj4gPiA+IHVzZWQgb25seSBpZiB3ZSB3YW50IHRvIHByZXZlbnQg
bmV3IHVzZXJzIG9mIHRoZSBsZWdhY3kgc3ludGF4LiBUaGUKPiA+ID4gcHJvYmxlbSBpcyB0aGF0
IG10ZC55YW1sIGJpbmRpbmcgYWxsb3dlZCAidXNlci1vdHAiIGFuZCAiZmFjdG9yeS1vdHAiCj4g
PiA+IHdpdGggb2xkIHN5bnRheCBjZWxscy4gSXQgbWVhbnMgZXZlcnkgTVREIGRldmljZSB3YXMg
YWxsb3dlZCB0byBoYXZlCj4gPiA+IHRoZW0uCj4gPiA+IAo+ID4gPiBObyBpbi1rZXJuZWwgRFRT
IGV2ZW4gdXNlZCAidXNlci1vdHAiIG9yICJmYWN0b3J5LW90cCIgd2l0aCBOVk1FTQo+ID4gPiBs
ZWdhY3kKPiA+ID4gY2VsbHMgYnV0IEknbSBub3Qgc3VyZSBhYm91dCBkb3duc3RyZWFtIERUUyBm
aWxlcy4gSWRlYWxseSB3ZSB3b3VsZCBkbwo+ID4gPiBjb25maWcuYWRkX2xlZ2FjeV9maXhlZF9v
Zl9jZWxscyA9IGZhbHNlOwo+ID4gPiBidXQgdGhhdCBjb3VsZCBicmVhayBjb21wYXRpYmlsaXR5
IHdpdGggc29tZSBkb3duc3RyZWFtIERUUyBmaWxlcy4KPiA+IAo+ID4gWWVzIHRoZSBtYWluIHBy
b2JsZW0gaXMgcHJldmVudCByZWdyZXNzaW9uIGluIGRvd25zdHJlYW0uIEkgZmVlbCBmb3IgdGhl
Cj4gPiBuYW5kIHVzYWdlLCB0aGlzIGlzIDEwMCUgb2YgdGhlIHRpbWVzIGJyb2tlbi4gRm9yIFNQ
SSBhbmQgb3RoZXIgY29ybmVyCj4gPiBjYXNlIE1URCBkZXZpY2VzIGl0J3Mgbm90Pwo+ID4gCj4g
PiBBbnl3YXkgZGlkIHlvdSBieSBjaGFuY2UgaGF2ZSBhIHN1Z2dlc3Rpb24gZm9yIGEgYmV0dGVy
IGZpeGVzIHRhZz8KPiAKPiBNeSBwZXJzb25hbCBpZGVhIGZvciB0aGF0IHdvdWxkIGJlIHRvIHB1
dCB0d28gRml4ZXMgd2l0aCB0d28gY29tbWl0cyBhbmQKPiBkZXNjcmliZSBpbiBjb21taXQgYm9k
eSB0aGF0IG9uZSBqdXN0IGV4cG9zZWQgZXhpc3RpbmcgYnVnLgo+IAo+IFlvdSBtYXkgY2hlY2sg
bXkgT3BlbldydCBxdWljayBwYXRjaCBmb3IgYW4gaWRlYSBob3cgSSdkIGhhbmRsZSB0aGF0Ogo+
IGh0dHBzOi8vZ2l0Lm9wZW53cnQub3JnLz9wPW9wZW53cnQvb3BlbndydC5naXQ7YT1ibG9iO2Y9
dGFyZ2V0L2xpbnV4L2dlbmVyaWMvcGVuZGluZy02LjYvNDQwLW10ZC1kb24tdC1sb29rLWZvci1P
VFAtbGVnYWN5LU5WTUVNLWNlbGxzLWlmLXByb3Blci0ucGF0Y2g7aD1kOWQxNWE0MDQ4YzE0NGQ4
NTY1YzhlYTM4ZTE1YTc5ZjdmNGE1ZmUxO2hiPWRkNzhhNTljZDdiMDI5NTYwYjMzY2IzYWMwZTFh
YThiNzQ3YmQ4MDcKPgoKTXkgY29uY2VybiBpcyB0aGF0IHVzaW5nICEhbnAgbWlnaHQgcG9zZSBz
b21lIHJlZ3Jlc3Npb24gcHJvYmxlbS4gQWxzbyBJCmZlZWwgYWRkaW5nIHRoZSBtYWNyb25peCBj
b21taXQgaW4gZml4ZXMgdGFnIG1pZ2h0IGJlIGNvbmZ1c2luZz8KClRoaW5rIEkgd2lsbCBqdXN0
IHVzZSB0aGUgbmFuZCBjaGVjayBqdXN0IHRvIGJlIGV4dHJhIHNhZmUgYW5kIGFkZCBhCmtlcm5l
bCBkZXBlbmRlbmN5IGZvciB3aGVuIHRoZSBhZGRfbGVnYWN5X2ZpeGVkX29mX2NlbGxzIHdhcyBp
bnRyb2R1Y2VkCnNpbmNlIGJlZm9yZSB0aGF0IGEgZGlmZmVyZW50IHBhdGNoIGlzIG5lZWRlZC4g
V2hhdCBkbyB5b3UgdGhpbms/CgotLSAKCUFuc3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
