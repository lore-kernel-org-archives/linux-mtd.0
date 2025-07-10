Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AEBC83F20
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jul 2025 12:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RzGgb6H7iBzdAYekmHrx5twAXZZ3WSELTxqSagafrPQ=; b=V4g0NoSkRBDf2F
	oGETUO2hfmmCXRQwloQcRe0Szjomf3kYVADituXDPXHLv8EnALPz0PV4T1Ol+ZQL495k44uo78MpF
	lrq25Ygv9/JqzXpvyRVDK+/4qNQZW5vIb2JtIuMVGX211aBVg9x1rL+BEVZDsapVzQgN2qgOKuSNL
	Ndc7pOVn9e5hJT1GGN3OctL+RrFZl1ZE/7UAiYnWIPl1XXq/s3FetrDGkKsKkBBGb45iOeA28Udui
	w5TshDmaRtuCpHUDWegfGHXyIWB7jsCwDARUPayZqK5AE3bwf0bGYfCHg1RYe/Fjv4S4+aj2F5/Y4
	3XsGdT2MSN5nw73Ygs2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqUp-0000000Bn3G-3RqH;
	Thu, 10 Jul 2025 12:35:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZp8V-0000000BaMo-1uOP
	for linux-mtd@lists.infradead.org;
	Thu, 10 Jul 2025 11:08:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752145698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W2iF5MdVcoXLNB41BPYMA3hHITImWanFeZV1om8p29w=;
	b=KTPVkvg6VQQrIpG7J2ZUMdO2x16LrcZtviVHCkHeA5GCZd07UjeMHqLDjaxCassjCO1WQm
	Vn3wKcl8rZFMaSBbmd80mAHDF3JeYQJ79bDhli2OEc2BQFyF0pDc+NLEOO+Rfn8hQYz6mG
	+nYA8rGdvrocEUz0C3AbFAUdLO8BC/g=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-HrCnD3MuPQKFHhkkatJ2ug-1; Thu, 10 Jul 2025 07:08:16 -0400
X-MC-Unique: HrCnD3MuPQKFHhkkatJ2ug-1
X-Mimecast-MFC-AGG-ID: HrCnD3MuPQKFHhkkatJ2ug_1752145696
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5314cb7972dso295827e0c.1
        for <linux-mtd@lists.infradead.org>; Thu, 10 Jul 2025 04:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752145696; x=1752750496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2iF5MdVcoXLNB41BPYMA3hHITImWanFeZV1om8p29w=;
        b=RB49CAW+2LSIN7LMN7qq698GseKB9hhJ7FVP0lo5t28l5c4dutH8x0PRph2qLzvsQy
         UN4ya/ziiYhndLvdMKwO/iiVHf8UFcEo/8q1DLeRM1Ns6oZwhfJ69lKWa2THM5Pz+O8Y
         lEad5r24z2IhdDmH+gSLqOfvl4TOT055ihHvBmT91ag6XBP4Aah0scDD3T2y+twc9Pep
         KQluFblh+47tzloYWsmT4UieX7GViTZsF6FevqgMbI5VIL3Hp835WFL9i59ml/vHLDwn
         1TjIbPhhoU9iCSPQJqXG66xNlaor7PfLY4wKz32siSQ4LGUTdAHj1NOZKPBEdaBS/Y2F
         5IDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUFljcq4hnMHmFVyubb2OtH62W1J7Qf0OLpCOHn/G/ZgShyK5ZDhl0ytea2uvTCQxFxh+MWCNcgvY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNlLIYPGrWnh0I/oyQvEtJAN1CddHr/2HlkaNWBKT/XMBWKqSB
	3q3MZr2N+nOVpVuXDYWd+B0mMQEqeJiSNdqEXc4zGpyJ6hoOQbMD7lTaoo5MZRT/hOBVOmnuPpn
	nB7tWjV5G/B6is+u+vbNyWffHKT5LafL+ZQywyt5owLBEQgkBa1TSbr+GSj2gC9geWkSi62AHjC
	CicWylYpplhvW243tyR837FCniK21s2q3rTtYCIdKOBA==
X-Gm-Gg: ASbGnctCUtj9kSORONfA4UfNbQgCYEPKVYJFB3mERKzsEDUerND/OgwJ/0TUYzKUCLu
	ksgycL5r4dELeLPFhkGD/WWzB02HoajxTl2v8Gm9xnYMKaJYwVXR1LAEuaHMCfNBBRJ5yCnb7Oa
	tGBhqd
X-Received: by 2002:a05:6122:62b1:b0:520:6773:e5ea with SMTP id 71dfb90a1353d-535e6cad302mr816374e0c.7.1752145695398;
        Thu, 10 Jul 2025 04:08:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG748xi5tENRlmgUwDPKCpmuUZ5DFZugXu5QWkB94zDKhR5MrrRw1zsQESq2LYQJHkYSg59QTKK/bT7AOAWiHA=
X-Received: by 2002:a05:6122:62b1:b0:520:6773:e5ea with SMTP id
 71dfb90a1353d-535e6cad302mr816305e0c.7.1752145694749; Thu, 10 Jul 2025
 04:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250710060754.637098-1-ebiggers@kernel.org> <20250710060754.637098-6-ebiggers@kernel.org>
In-Reply-To: <20250710060754.637098-6-ebiggers@kernel.org>
From: Alex Markuze <amarkuze@redhat.com>
Date: Thu, 10 Jul 2025 14:08:04 +0300
X-Gm-Features: Ac12FXxQDl3-eJSLjWpXqvFXfUA71G8ntcV5BboxZYjfuEKf_nyCYrk2ELPh9Bg
Message-ID: <CAO8a2Sie5K_jB-UvhAvRpDEQP-ZJ+rXn9gmkAEXthE65Jrtbbg@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] fscrypt: Remove gfp_t argument from fscrypt_encrypt_block_inplace()
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-fscrypt@vger.kernel.org, linux-crypto@vger.kernel.org, 
	Yuwen Chen <ywen.chen@foxmail.com>, linux-mtd@lists.infradead.org, 
	ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H06axyYFRbjdsbVz9gO3TOfPJ0XzQ4DFFOq7CPqW4Kc_1752145696
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_040819_564720_1180E5B0 
X-CRM114-Status: GOOD (  22.07  )
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

UmV2aWV3ZWQtYnk6IEFsZXggTWFya3V6ZSBhbWFya3V6ZUByZWRoYXQuY29tCgpPbiBUaHUsIEp1
bCAxMCwgMjAyNSBhdCA5OjE04oCvQU0gRXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0BrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IFRoaXMgYXJndW1lbnQgaXMgbm8gbG9uZ2VyIHVzZWQsIHNvIHJlbW92ZSBp
dC4KPgo+IFNpZ25lZC1vZmYtYnk6IEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAa2VybmVsLm9yZz4K
PiAtLS0KPiAgZnMvY2VwaC9jcnlwdG8uYyAgICAgICAgfCAzICstLQo+ICBmcy9jcnlwdG8vY3J5
cHRvLmMgICAgICB8IDMgKy0tCj4gIGZzL3ViaWZzL2NyeXB0by5jICAgICAgIHwgMiArLQo+ICBp
bmNsdWRlL2xpbnV4L2ZzY3J5cHQuaCB8IDUgKystLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvY2VwaC9jcnlw
dG8uYyBiL2ZzL2NlcGgvY3J5cHRvLmMKPiBpbmRleCAzYjNjNGQ4ZDQwMWVjLi42ZDA0ZDUyOGVk
MDM4IDEwMDY0NAo+IC0tLSBhL2ZzL2NlcGgvY3J5cHRvLmMKPiArKysgYi9mcy9jZXBoL2NyeXB0
by5jCj4gQEAgLTUyMSwxMiArNTIxLDExIEBAIGludCBjZXBoX2ZzY3J5cHRfZW5jcnlwdF9ibG9j
a19pbnBsYWNlKGNvbnN0IHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4gIHsKPiAgICAgICAgIHN0cnVj
dCBjZXBoX2NsaWVudCAqY2wgPSBjZXBoX2lub2RlX3RvX2NsaWVudChpbm9kZSk7Cj4KPiAgICAg
ICAgIGRvdXRjKGNsLCAiJXAgJWxseC4lbGx4IGxlbiAldSBvZmZzICV1IGJsayAlbGx1XG4iLCBp
bm9kZSwKPiAgICAgICAgICAgICAgIGNlcGhfdmlub3AoaW5vZGUpLCBsZW4sIG9mZnMsIGxibGtf
bnVtKTsKPiAtICAgICAgIHJldHVybiBmc2NyeXB0X2VuY3J5cHRfYmxvY2tfaW5wbGFjZShpbm9k
ZSwgcGFnZSwgbGVuLCBvZmZzLCBsYmxrX251bSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBnZnBfZmxhZ3MpOwo+ICsgICAgICAgcmV0dXJuIGZzY3J5cHRf
ZW5jcnlwdF9ibG9ja19pbnBsYWNlKGlub2RlLCBwYWdlLCBsZW4sIG9mZnMsIGxibGtfbnVtKTsK
PiAgfQo+Cj4gIC8qKgo+ICAgKiBjZXBoX2ZzY3J5cHRfZGVjcnlwdF9wYWdlcyAtIGRlY3J5cHQg
YW4gYXJyYXkgb2YgcGFnZXMKPiAgICogQGlub2RlOiBwb2ludGVyIHRvIGlub2RlIGFzc29jaWF0
ZWQgd2l0aCB0aGVzZSBwYWdlcwo+IGRpZmYgLS1naXQgYS9mcy9jcnlwdG8vY3J5cHRvLmMgYi9m
cy9jcnlwdG8vY3J5cHRvLmMKPiBpbmRleCBiYWIwYWFjZDRkYTM2Li5iNmNjYWI1MjRmZGVmIDEw
MDY0NAo+IC0tLSBhL2ZzL2NyeXB0by9jcnlwdG8uYwo+ICsrKyBiL2ZzL2NyeXB0by9jcnlwdG8u
Ywo+IEBAIC0yMTUsMTEgKzIxNSwxMCBAQCBFWFBPUlRfU1lNQk9MKGZzY3J5cHRfZW5jcnlwdF9w
YWdlY2FjaGVfYmxvY2tzKTsKPiAgICogQGxlbjogICAgICAgU2l6ZSBvZiBibG9jayB0byBlbmNy
eXB0LiAgVGhpcyBtdXN0IGJlIGEgbXVsdGlwbGUgb2YKPiAgICogICAgICAgICAgICAgRlNDUllQ
VF9DT05URU5UU19BTElHTk1FTlQuCj4gICAqIEBvZmZzOiAgICAgIEJ5dGUgb2Zmc2V0IHdpdGhp
biBAcGFnZSBhdCB3aGljaCB0aGUgYmxvY2sgdG8gZW5jcnlwdCBiZWdpbnMKPiAgICogQGxibGtf
bnVtOiAgRmlsZXN5c3RlbSBsb2dpY2FsIGJsb2NrIG51bWJlciBvZiB0aGUgYmxvY2ssIGkuZS4g
dGhlIDAtYmFzZWQKPiAgICogICAgICAgICAgICAgbnVtYmVyIG9mIHRoZSBibG9jayB3aXRoaW4g
dGhlIGZpbGUKPiAtICogQGdmcF9mbGFnczogTWVtb3J5IGFsbG9jYXRpb24gZmxhZ3MKPiAgICoK
PiAgICogRW5jcnlwdCBhIHBvc3NpYmx5LWNvbXByZXNzZWQgZmlsZXN5c3RlbSBibG9jayB0aGF0
IGlzIGxvY2F0ZWQgaW4gYW4KPiAgICogYXJiaXRyYXJ5IHBhZ2UsIG5vdCBuZWNlc3NhcmlseSBp
biB0aGUgb3JpZ2luYWwgcGFnZWNhY2hlIHBhZ2UuICBUaGUgQGlub2RlCj4gICAqIGFuZCBAbGJs
a19udW0gbXVzdCBiZSBzcGVjaWZpZWQsIGFzIHRoZXkgY2FuJ3QgYmUgZGV0ZXJtaW5lZCBmcm9t
IEBwYWdlLgo+ICAgKgo+IEBAIC0yMjcsMTEgKzIyNiwxMSBAQCBFWFBPUlRfU1lNQk9MKGZzY3J5
cHRfZW5jcnlwdF9wYWdlY2FjaGVfYmxvY2tzKTsKPiAgICoKPiAgICogUmV0dXJuOiAwIG9uIHN1
Y2Nlc3M7IC1lcnJubyBvbiBmYWlsdXJlCj4gICAqLwo+ICBpbnQgZnNjcnlwdF9lbmNyeXB0X2Js
b2NrX2lucGxhY2UoY29uc3Qgc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IHBhZ2UgKnBhZ2Us
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBsZW4sIHVu
c2lnbmVkIGludCBvZmZzLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1NjQg
bGJsa19udW0sIGdmcF90IGdmcF9mbGFncykKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdTY0IGxibGtfbnVtKQo+ICB7Cj4gICAgICAgICBpZiAoV0FSTl9PTl9PTkNFKGlub2Rl
LT5pX3NiLT5zX2NvcC0+c3VwcG9ydHNfc3ViYmxvY2tfZGF0YV91bml0cykpCj4gICAgICAgICAg
ICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPiAgICAgICAgIHJldHVybiBmc2NyeXB0X2NyeXB0
X2RhdGFfdW5pdChpbm9kZS0+aV9jcnlwdF9pbmZvLCBGU19FTkNSWVBULAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxibGtfbnVtLCBwYWdlLCBwYWdlLCBsZW4sIG9m
ZnMpOwo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9jcnlwdG8uYyBiL2ZzL3ViaWZzL2NyeXB0by5j
Cj4gaW5kZXggOTIxZjkwMzNkMGQyZC4uZmI1YWMzNTgwNzdiMSAxMDA2NDQKPiAtLS0gYS9mcy91
Ymlmcy9jcnlwdG8uYwo+ICsrKyBiL2ZzL3ViaWZzL2NyeXB0by5jCj4gQEAgLTQ5LDExICs0OSwx
MSBAQCBpbnQgdWJpZnNfZW5jcnlwdChjb25zdCBzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3Qg
dWJpZnNfZGF0YV9ub2RlICpkbiwKPiAgICAgICAgIC8qIHBhZCB0byBmdWxsIGJsb2NrIGNpcGhl
ciBsZW5ndGggKi8KPiAgICAgICAgIGlmIChwYWRfbGVuICE9IGluX2xlbikKPiAgICAgICAgICAg
ICAgICAgbWVtc2V0KHAgKyBpbl9sZW4sIDAsIHBhZF9sZW4gLSBpbl9sZW4pOwo+Cj4gICAgICAg
ICBlcnIgPSBmc2NyeXB0X2VuY3J5cHRfYmxvY2tfaW5wbGFjZShpbm9kZSwgdmlydF90b19wYWdl
KHApLCBwYWRfbGVuLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgb2Zmc2V0X2luX3BhZ2UocCksIGJsb2NrLCBHRlBfTk9GUyk7Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvZmZzZXRfaW5fcGFnZShwKSwgYmxvY2spOwo+
ICAgICAgICAgaWYgKGVycikgewo+ICAgICAgICAgICAgICAgICB1Ymlmc19lcnIoYywgImZzY3J5
cHRfZW5jcnlwdF9ibG9ja19pbnBsYWNlKCkgZmFpbGVkOiAlZCIsIGVycik7Cj4gICAgICAgICAg
ICAgICAgIHJldHVybiBlcnI7Cj4gICAgICAgICB9Cj4gICAgICAgICAqb3V0X2xlbiA9IHBhZF9s
ZW47Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZnNjcnlwdC5oIGIvaW5jbHVkZS9saW51
eC9mc2NyeXB0LmgKPiBpbmRleCA1NmZhZDMzMDQzZDUzLi44ZDBlM2FkODliOTQwIDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvbGludXgvZnNjcnlwdC5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9mc2Ny
eXB0LmgKPiBAQCAtMzEyLDExICszMTIsMTEgQEAgdm9pZCBmc2NyeXB0X2VucXVldWVfZGVjcnlw
dF93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqKTsKPgo+ICBzdHJ1Y3QgcGFnZSAqZnNjcnlwdF9l
bmNyeXB0X3BhZ2VjYWNoZV9ibG9ja3Moc3RydWN0IGZvbGlvICpmb2xpbywKPiAgICAgICAgICAg
ICAgICAgc2l6ZV90IGxlbiwgc2l6ZV90IG9mZnMsIGdmcF90IGdmcF9mbGFncyk7Cj4gIGludCBm
c2NyeXB0X2VuY3J5cHRfYmxvY2tfaW5wbGFjZShjb25zdCBzdHJ1Y3QgaW5vZGUgKmlub2RlLCBz
dHJ1Y3QgcGFnZSAqcGFnZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50IGxlbiwgdW5zaWduZWQgaW50IG9mZnMsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHU2NCBsYmxrX251bSwgZ2ZwX3QgZ2ZwX2ZsYWdzKTsKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdTY0IGxibGtfbnVtKTsKPgo+ICBpbnQgZnNjcnlwdF9k
ZWNyeXB0X3BhZ2VjYWNoZV9ibG9ja3Moc3RydWN0IGZvbGlvICpmb2xpbywgc2l6ZV90IGxlbiwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IG9mZnMpOwo+ICBp
bnQgZnNjcnlwdF9kZWNyeXB0X2Jsb2NrX2lucGxhY2UoY29uc3Qgc3RydWN0IGlub2RlICppbm9k
ZSwgc3RydWN0IHBhZ2UgKnBhZ2UsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGludCBsZW4sIHVuc2lnbmVkIGludCBvZmZzLAo+IEBAIC00ODUsMTIgKzQ4NSwx
MSBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBwYWdlICpmc2NyeXB0X2VuY3J5cHRfcGFnZWNhY2hl
X2Jsb2NrcyhzdHJ1Y3QgZm9saW8gKmZvbGlvLAo+ICB9Cj4KPiAgc3RhdGljIGlubGluZSBpbnQg
ZnNjcnlwdF9lbmNyeXB0X2Jsb2NrX2lucGxhY2UoY29uc3Qgc3RydWN0IGlub2RlICppbm9kZSwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
cGFnZSAqcGFnZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBpbnQgbGVuLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBvZmZzLCB1NjQgbGJsa19udW0sCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2ZwX3QgZ2ZwX2ZsYWdz
KQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCBvZmZzLCB1NjQgbGJsa19udW0pCj4gIHsKPiAgICAgICAgIHJldHVybiAtRU9QTk9U
U1VQUDsKPiAgfQo+Cj4gIHN0YXRpYyBpbmxpbmUgaW50IGZzY3J5cHRfZGVjcnlwdF9wYWdlY2Fj
aGVfYmxvY2tzKHN0cnVjdCBmb2xpbyAqZm9saW8sCj4gLS0KPiAyLjUwLjEKPgo+CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
