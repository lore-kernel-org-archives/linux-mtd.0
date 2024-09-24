Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60266CF9C6B
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Sep 2024 06:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oN4MR9/4AVEIohQfjEqwyPWg//kvDIkvWCwrz2p32hA=; b=0Rmz+QJ99Om9UP
	1OQFUMAOGGtR9YAINeqvzDAR0BIfYvTEp9kHtbce0mQ8ZLue4m5cF+wBEc1LekceWcJ725d8LTOhn
	y9sjVE+rQnPvz3ZeZsAO6T1smK3cXds2cnleeMGdB19updHIOBv4TrH4X3zgOklObHGdYsF6SW8hf
	S4QmJBFcNUVnQyNbvXhiH+WsDcNRKVEim4mnA0jvCp4SqQnqc9i2VGntaVfameH2W994qd80BbcNi
	Kto33GMW+RvA62SA2nluz0uLohOzWapaDObad4U6+hxafY2F0WhDSUVObcZ3X42oLH/MXjVDU7zKc
	8Fj9qUDPV57YkIIW8Geg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssz9o-00000001GxC-06GK;
	Tue, 24 Sep 2024 06:36:20 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssz9k-00000001Gwo-2rtE
	for linux-mtd@lists.infradead.org;
	Tue, 24 Sep 2024 06:36:17 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-42cd74c0d16so49313735e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 23 Sep 2024 23:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727159774; x=1727764574; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s5O9hi7/yXg+YxoIrnEDuOK7KeUqbocdowl5jauyzj8=;
        b=MaCgyPNEIY86ChIa4uUvU/sO0iUhjy99w8o0nqDUTMhCLhe3rwIqWW+COBGdH4oSB9
         pG98TtgvuGSlD6hbmFssB8lKura2EDyT53EaryBORswzpdunFI8SHGGBudC5B1wRXlH3
         qOFaGTsCZw33E/llmf8NE4wKj1zzDAf/gTh388gU/FkRd+rqxlXPZRZL7jQeNzSn7p3A
         ptrLsj3K3Y6ijr2RtjCX2IyXtZFoR4I51jUC38yNzbovzYdm4OM5XFcp5xnjThSWOzFi
         gjOnrgryealgvMfaCBzo+y2r91dzqoXB1NI/3jpuX5BjpPT78RtK1B4MD6P3FvBPftAe
         aSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727159774; x=1727764574;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s5O9hi7/yXg+YxoIrnEDuOK7KeUqbocdowl5jauyzj8=;
        b=U0NRLojS/CBiGcUuydsfi2WXjbqKYnTYDrh85VItTZmHdWWo+/xMM7MTi7UVzYtC9r
         k8neCgs4P7W0muwVfZDtBd19TJX9W3tvPCViW3/dSIHMewptY/Rt+EMpntr2eiR/GiYH
         O3+XfA7TEEa/yW9VJwgu9kt3KrhRt4Cp67aUGq7Ifc+3xgen09N7Hul/0NTNzs91/618
         xEWq2Bf+Yp6zsaQBCYXPkzvXtX+CdMSO89n/qPKLCTtjqK22K0DdNf4DbdvA406Q1hNY
         +9arQdAUNWN/4qLlGySikc8hgPpM9Ia6O4V57HLlNAp8XoPD3X25Jw8fy4CNM3KMjY9C
         T7Ug==
X-Gm-Message-State: AOJu0Yw9GBkGcA0s/eiOpvCuAGZ9tSP6k2mVf4hfj6CNPMjeZHkuNi/L
	SOuZYtTvxwaMmtzUguJCDxhunW9BEwW9hsEVw7msnChK5E5dorGOOYLA/kp9bMs=
X-Google-Smtp-Source: AGHT+IH5FhoHbJ9IDBbAUP30tScNk63Y9tGAEtEwCMUDmUad60Ilu2dLIg4b9hx0dvztT+6CqWGaog==
X-Received: by 2002:a05:600c:1ca2:b0:42c:b52b:4335 with SMTP id 5b1f17b1804b1-42e7abf43c3mr102426065e9.10.1727159774479;
        Mon, 23 Sep 2024 23:36:14 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2f9811sm710709f8f.86.2024.09.23.23.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 23:36:13 -0700 (PDT)
Message-ID: <618e4514-791b-4a73-a1ba-45170a21e453@linaro.org>
Date: Tue, 24 Sep 2024 07:36:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] mtd: spi-nor: add support for Macronix Octal flash
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Alvin Zhou <alvinzhou.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratyush@kernel.org, mwalle@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 broonie@kernel.org, chengminglin@mxic.com.tw, leoyu@mxic.com.tw,
 AlvinZhou <alvinzhou@mxic.com.tw>, JaimeLiao <jaimeliao@mxic.com.tw>,
 Bough Chen <haibo.chen@nxp.com>
References: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
 <20240718034614.484018-7-alvinzhou.tw@gmail.com>
 <97134efb-398d-4c21-a915-87a5b4f1b29a@linaro.org>
 <CAPhrvRR3U9=0DuG_FQ81ZJq+RLe6Bn9YO831Mx2n3NkeV3MCdA@mail.gmail.com>
 <368cd6fb-cab1-44ad-af46-651d9323bc19@linaro.org>
Content-Language: en-US
In-Reply-To: <368cd6fb-cab1-44ad-af46-651d9323bc19@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_233616_756462_9C978FDF 
X-CRM114-Status: GOOD (  17.23  )
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

CgpPbiA5LzI0LzI0IDc6MjYgQU0sIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4gCj4gCj4gT24gOS8y
NC8yNCA0OjI1IEFNLCBBbHZpbiBaaG91IHdyb3RlOgo+PiBIaSBUdWRvciwKPj4KPj4gVHVkb3Ig
QW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiDmlrwgMjAyNOW5tDnmnIgyM+aXpSDp
gLHkuIAg5LiL5Y2IMjo1NOWvq+mBk++8mgo+Pj4KPj4+IEhpLCBBbHZpbiwKPj4+Cj4+PiBJIHF1
aWNrbHkgc2tpbW1lZCBvdmVyIHRoZSBwcmV2aW91cyA1IHBhdGNoZXMgYW5kIHRoZXkgYXJlIGxv
b2tpbmcgZmluZS4KPj4+Cj4+PiBJIGRvbid0IGdldCB0aGlzIHBhdGNoIGhvd2V2ZXIuCj4+Pgo+
Pj4gT24gNy8xOC8yNCA0OjQ2IEFNLCBBbHZpblpob3Ugd3JvdGU6Cj4+Pj4gRnJvbTogQWx2aW5a
aG91IDxhbHZpbnpob3VAbXhpYy5jb20udHc+Cj4+Pj4KPj4+PiBBZGRpbmcgTWFudWZhY3R1cmUg
SUQgMHhDMiBpbiBsYXN0IG9mIElEIHRhYmxlIGJlY2F1c2Ugb2YKPj4+PiBPY3RhbCBGbGFzaCBu
ZWVkIG1hbnVmYWN0dXJlciBmaXh1cCBmb3IgZW5hYmxpbmcvZGlzYWJsaW5nCj4+Pj4gT2N0YWwg
RFRSIG1vZGUuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKYWltZUxpYW8gPGphaW1lbGlhb0Bt
eGljLmNvbS50dz4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbHZpblpob3UgPGFsdmluemhvdUBteGlj
LmNvbS50dz4KPj4+PiAtLS0KPj4+PiAgZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5jIHwg
NCArKystCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMg
Yi9kcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMKPj4+PiBpbmRleCBmMDM5ODE5YTUyNTIu
LjFhOGNjZWJkZmUwZSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL21hY3Jv
bml4LmMKPj4+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMKPj4+PiBAQCAt
MjAwLDcgKzIwMCw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmxhc2hfaW5mbyBtYWNyb25peF9u
b3JfcGFydHNbXSA9IHsKPj4+PiAgICAgICAgICAgICAgIC5uYW1lID0gIm14MjVsMzI1NWUiLAo+
Pj4+ICAgICAgICAgICAgICAgLnNpemUgPSBTWl80TSwKPj4+PiAgICAgICAgICAgICAgIC5ub19z
ZmRwX2ZsYWdzID0gU0VDVF80SywKPj4+PiAtICAgICB9Cj4+Pj4gKyAgICAgfSwKPj4+PiArICAg
ICAvKiBOZWVkIHRoZSBtYW51ZmFjdHVyZXIgZml4dXBzLCBLZWVwIHRoaXMgbGFzdCAqLwo+Pj4+
ICsgICAgIHsgLmlkID0gU05PUl9JRCgweGMyKSB9Cj4+Pj4gIH07Cj4+Pj4KPj4+Cj4+PiBDb3Vs
ZCB5b3UgcGxlYXNlIGVsYWJvcmF0ZSB3aHkgeW91IG5lZWQganVzdCB0aGUgbWFudWZhY3R1cmVy
IGlkIGhlcmU/IEkKPj4+IHdvdWxkIGhhdmUgZXhwZWN0ZWQgdG8gc2VlIGEgc3BlY2lmaWMgZmxh
c2ggZW50cnkgaW5zdGVhZC4KPj4KPj4gR3JhdGVmdWwgdG8gTWljaGFlbCBmb3IgdGhlIHZhbHVh
YmxlIHN1Z2dlc3Rpb24uIFRoaXMgYWRkaXRpb24gb2YgdGhlCj4+IE1hY3Jvbml4IG1hbnVmYWN0
dXJlciBJRCBlbmFibGVzIHRoZSBmaXh1cCBmdW5jdGlvbnMgc3VjaCBhcwo+PiBtYWNyb25peF9u
b3Jfc2V0X29jdGFsX2R0ciB0byBiZSBleGVjdXRlZCB3aXRob3V0IHRoZSBuZWVkIHRvCj4+IGNy
ZWF0ZSBzZXBhcmF0ZSBJRCBlbnRyaWVzIGZvciBlYWNoIE9jdGFsIERUUiBOT1IgRmxhc2ggaW4g
dGhlCj4+IGZsYXNoX2luZm8uCj4+Cj4gCj4gQWgsIG5pY2UuIE9rYXkgdGhlbi4gSSdtIGdvaW5n
IHRvIHJldmlldyB0aGUgcmVzdCBvZiB0aGUgcGF0Y2hlcy4gVGhleQo+IGxvb2sgcHJvbWlzaW5n
IDspLgoKYWgsIGJ1dCB0aGVuIHlvdSdsbCBhbHdheXMgaGF2ZSBhIG1hdGNoZWQgSUQsIHNvIHlv
dSBicmVhayB0aGUgZ2VuZXJpYwpmbGFzaCBwcm9iaW5nIGZvciBtYWNyb25peC4gSXMgdGhhdCBj
b3JyZWN0PwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
