Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16903C001DE
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 09:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wtJSnqWDUEOY6MUmSOR2+BtJMI9qhSyMZdtnu6hz8h8=; b=31Br9cRQqgCWco
	T6x356Q3UJZACaAU+8tZnirRXisK3h5JCylvBUV2H3SliiJG7r3sNoyfj1uSpdaPlZbQvUg4SaOdU
	O1V4yhhqVxgyHLpxeql/BFCHmoq0si4xNgqqi9PyK/F9sefNBstwt1t0uu+BLiiiFmntSgg9sr95e
	0LdAKdF863tPXLxX6NfXjeadnBGfDi2vug1HeHRdy9OD4sEEfvNczyWxBmBw3ofKnMHNSw0IZ+fJm
	SgL4TUVgVp2Pu+Tl7lKgFCMrDfK21tLXUztiMoQOWw073SRLKHzCXSKYQtLdmtuV5RAmW5yWe3ReO
	XxxpZ9s7uP8tg7UMVtJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOau1-009kRF-2J;
	Wed, 26 Jul 2023 09:33:53 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOaty-009kQ0-30
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 09:33:52 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-682a5465e9eso1487410b3a.1
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 02:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690364030; x=1690968830;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0oULOTnWb1HIc+jcDQkyDbPD+ewEuK6cRZsxNFZBJHs=;
        b=QJhhRpaTfMAfucHkCz2d9TS31hpYk30s2kQKv681O+Sl1mLTZQhZq5VKb4l9mXe+gX
         5Eax6ixoNcCSNY9H6aAkwgnBd/g9cM9X43ylT+UhHbYekfmlgjo/JXqlix6WaCFQ7jVV
         2D4QfnYhGItzA17GFTgozRmivkdC7H5IwsXEWhmkOBzQK5UpXhnT6Ls+I4I3tsoeozxU
         24KbqK2Cq3sIWZ8RaqWYBiX9Q9627K0AND5qR2t9+dtM8IjHsDiCPK6lh5ggLgTON/bP
         sMZVbirBGOz1XlXtXsxmGmw+9U7+KmVQpZdmOnau0hPanAHKCfZx0jR+DbnWSE4a/7ep
         yq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690364030; x=1690968830;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0oULOTnWb1HIc+jcDQkyDbPD+ewEuK6cRZsxNFZBJHs=;
        b=Vf7Mcs8lha/Du71CtHQ++rfSV6nPt/ePEDB7eRCWvYB2mA8KHwQzkml0w1r75Dpw80
         LRAQps/Xff28ON4topGFeX3xPBEk8OZbK+ErABh9ZrT60UUhEgf/2E4HJwUoMExNp9J7
         cj41Xa4ijGSaqX8PvM5oXqwNma8OwYhfZsgwvKHETHBU6GQAZZ2ZKGauCRLbIEed09fI
         us+1KUd2P3DDCyxyaYqZC6qJ8s3L1Jr98tM2mbiHgevAoV7Km8ROo8zEcOclU0TUXJaC
         piSzTZAT3I6SbuMffgC2QpcAJvFp74yUaZKs7WkggLOBxG3tl7l05BEo1ctVwUdWHnzO
         kRCg==
X-Gm-Message-State: ABy/qLYwrgHTyVy7Idmg0PME6WbTVPrtmmVG55I24d4IhSS2825MWcvc
	hF5ygvWAGfOYc60+aobhr7g/bVBW/mtlFO+4ccA=
X-Google-Smtp-Source: APBJJlG8LKe8O0SB++JE7Hsj6dMankp6b2TdGG8KZmgQCX7ZvwrXNm6kysx08G1J6PXDjDRRJyafNA==
X-Received: by 2002:a17:903:32c9:b0:1b8:5827:8763 with SMTP id i9-20020a17090332c900b001b858278763mr2037984plr.4.1690364030014;
        Wed, 26 Jul 2023 02:33:50 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id n5-20020a170902d2c500b001b89466a5f4sm12582766plc.105.2023.07.26.02.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 02:33:49 -0700 (PDT)
Message-ID: <0f12022e-5dd2-fb1c-f018-05f8ff0303ae@bytedance.com>
Date: Wed, 26 Jul 2023 17:33:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 28/47] bcache: dynamically allocate the md-bcache
 shrinker
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, rcu@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru, vbabka@suse.cz,
 roman.gushchin@linux.dev, djwong@kernel.org, brauner@kernel.org,
 paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com, cel@kernel.org,
 senozhatsky@chromium.org, yujie.liu@intel.com, gregkh@linuxfoundation.org
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-29-zhengqi.arch@bytedance.com>
 <4ee26da4-314e-0517-5d9a-31fb107368ef@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <4ee26da4-314e-0517-5d9a-31fb107368ef@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_023350_971101_5C400A85 
X-CRM114-Status: GOOD (  21.63  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDIzLzcvMjYgMTU6MzIsIE11Y2h1biBTb25nIHdyb3RlOgo+IAo+IAo+IE9uIDIwMjMv
Ny8yNCAxNzo0MywgUWkgWmhlbmcgd3JvdGU6Cj4+IEluIHByZXBhcmF0aW9uIGZvciBpbXBsZW1l
bnRpbmcgbG9ja2xlc3Mgc2xhYiBzaHJpbmssIHVzZSBuZXcgQVBJcyB0bwo+PiBkeW5hbWljYWxs
eSBhbGxvY2F0ZSB0aGUgbWQtYmNhY2hlIHNocmlua2VyLCBzbyB0aGF0IGl0IGNhbiBiZSBmcmVl
ZAo+PiBhc3luY2hyb25vdXNseSB1c2luZyBrZnJlZV9yY3UoKS4gVGhlbiBpdCBkb2Vzbid0IG5l
ZWQgdG8gd2FpdCBmb3IgUkNVCj4+IHJlYWQtc2lkZSBjcml0aWNhbCBzZWN0aW9uIHdoZW4gcmVs
ZWFzaW5nIHRoZSBzdHJ1Y3QgY2FjaGVfc2V0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBRaSBaaGVu
ZyA8emhlbmdxaS5hcmNoQGJ5dGVkYW5jZS5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL21kL2Jj
YWNoZS9iY2FjaGUuaCB8wqAgMiArLQo+PiDCoCBkcml2ZXJzL21kL2JjYWNoZS9idHJlZS5jwqAg
fCAyNyArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KPj4gwqAgZHJpdmVycy9tZC9iY2FjaGUv
c3lzZnMuY8KgIHzCoCAzICsrLQo+PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMo
KyksIDEzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9iY2FjaGUv
YmNhY2hlLmggYi9kcml2ZXJzL21kL2JjYWNoZS9iY2FjaGUuaAo+PiBpbmRleCA1YTc5YmIzYzI3
MmYuLmM2MjJiYzUwZjgxYiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tZC9iY2FjaGUvYmNhY2hl
LmgKPj4gKysrIGIvZHJpdmVycy9tZC9iY2FjaGUvYmNhY2hlLmgKPj4gQEAgLTU0MSw3ICs1NDEs
NyBAQCBzdHJ1Y3QgY2FjaGVfc2V0IHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgYmlvX3NldMKgwqDC
oMKgwqDCoMKgIGJpb19zcGxpdDsKPj4gwqDCoMKgwqDCoCAvKiBGb3IgdGhlIGJ0cmVlIGNhY2hl
ICovCj4+IC3CoMKgwqAgc3RydWN0IHNocmlua2VywqDCoMKgwqDCoMKgwqAgc2hyaW5rOwo+PiAr
wqDCoMKgIHN0cnVjdCBzaHJpbmtlcsKgwqDCoMKgwqDCoMKgICpzaHJpbms7Cj4+IMKgwqDCoMKg
wqAgLyogRm9yIHRoZSBidHJlZSBjYWNoZSBhbmQgYW55dGhpbmcgYWxsb2NhdGlvbiByZWxhdGVk
ICovCj4+IMKgwqDCoMKgwqAgc3RydWN0IG11dGV4wqDCoMKgwqDCoMKgwqAgYnVja2V0X2xvY2s7
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21kL2JjYWNoZS9idHJlZS5jIGIvZHJpdmVycy9tZC9i
Y2FjaGUvYnRyZWUuYwo+PiBpbmRleCBmZDEyMWE2MWYxN2MuLmMxNzZjN2ZjNzdkOSAxMDA2NDQK
Pj4gLS0tIGEvZHJpdmVycy9tZC9iY2FjaGUvYnRyZWUuYwo+PiArKysgYi9kcml2ZXJzL21kL2Jj
YWNoZS9idHJlZS5jCj4+IEBAIC02NjcsNyArNjY3LDcgQEAgc3RhdGljIGludCBtY2FfcmVhcChz
dHJ1Y3QgYnRyZWUgKmIsIHVuc2lnbmVkIGludCAKPj4gbWluX29yZGVyLCBib29sIGZsdXNoKQo+
PiDCoCBzdGF0aWMgdW5zaWduZWQgbG9uZyBiY2hfbWNhX3NjYW4oc3RydWN0IHNocmlua2VyICpz
aHJpbmssCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBz
aHJpbmtfY29udHJvbCAqc2MpCj4+IMKgIHsKPj4gLcKgwqDCoCBzdHJ1Y3QgY2FjaGVfc2V0ICpj
ID0gY29udGFpbmVyX29mKHNocmluaywgc3RydWN0IGNhY2hlX3NldCwgCj4+IHNocmluayk7Cj4+
ICvCoMKgwqAgc3RydWN0IGNhY2hlX3NldCAqYyA9IHNocmluay0+cHJpdmF0ZV9kYXRhOwo+PiDC
oMKgwqDCoMKgIHN0cnVjdCBidHJlZSAqYiwgKnQ7Cj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgbG9u
ZyBpLCBuciA9IHNjLT5ucl90b19zY2FuOwo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgZnJl
ZWQgPSAwOwo+PiBAQCAtNzM0LDcgKzczNCw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIGJjaF9t
Y2Ffc2NhbihzdHJ1Y3Qgc2hyaW5rZXIgCj4+ICpzaHJpbmssCj4+IMKgIHN0YXRpYyB1bnNpZ25l
ZCBsb25nIGJjaF9tY2FfY291bnQoc3RydWN0IHNocmlua2VyICpzaHJpbmssCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHNocmlua19jb250cm9sICpz
YykKPj4gwqAgewo+PiAtwqDCoMKgIHN0cnVjdCBjYWNoZV9zZXQgKmMgPSBjb250YWluZXJfb2Yo
c2hyaW5rLCBzdHJ1Y3QgY2FjaGVfc2V0LCAKPj4gc2hyaW5rKTsKPj4gK8KgwqDCoCBzdHJ1Y3Qg
Y2FjaGVfc2V0ICpjID0gc2hyaW5rLT5wcml2YXRlX2RhdGE7Cj4+IMKgwqDCoMKgwqAgaWYgKGMt
PnNocmlua2VyX2Rpc2FibGVkKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+IEBA
IC03NTIsOCArNzUyLDggQEAgdm9pZCBiY2hfYnRyZWVfY2FjaGVfZnJlZShzdHJ1Y3QgY2FjaGVf
c2V0ICpjKQo+PiDCoMKgwqDCoMKgIGNsb3N1cmVfaW5pdF9zdGFjaygmY2wpOwo+PiAtwqDCoMKg
IGlmIChjLT5zaHJpbmsubGlzdC5uZXh0KQo+PiAtwqDCoMKgwqDCoMKgwqAgdW5yZWdpc3Rlcl9z
aHJpbmtlcigmYy0+c2hyaW5rKTsKPj4gK8KgwqDCoCBpZiAoYy0+c2hyaW5rKQo+PiArwqDCoMKg
wqDCoMKgwqAgc2hyaW5rZXJfdW5yZWdpc3RlcihjLT5zaHJpbmspOwo+PiDCoMKgwqDCoMKgIG11
dGV4X2xvY2soJmMtPmJ1Y2tldF9sb2NrKTsKPj4gQEAgLTgyOCwxNCArODI4LDE5IEBAIGludCBi
Y2hfYnRyZWVfY2FjaGVfYWxsb2Moc3RydWN0IGNhY2hlX3NldCAqYykKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIGMtPnZlcmlmeV9kYXRhID0gTlVMTDsKPj4gwqAgI2VuZGlmCj4+IC3CoMKgwqAgYy0+
c2hyaW5rLmNvdW50X29iamVjdHMgPSBiY2hfbWNhX2NvdW50Owo+PiAtwqDCoMKgIGMtPnNocmlu
ay5zY2FuX29iamVjdHMgPSBiY2hfbWNhX3NjYW47Cj4+IC3CoMKgwqAgYy0+c2hyaW5rLnNlZWtz
ID0gNDsKPj4gLcKgwqDCoCBjLT5zaHJpbmsuYmF0Y2ggPSBjLT5idHJlZV9wYWdlcyAqIDI7Cj4+
ICvCoMKgwqAgYy0+c2hyaW5rID0gc2hyaW5rZXJfYWxsb2MoMCwgIm1kLWJjYWNoZTolcFUiLCBj
LT5zZXRfdXVpZCk7Cj4+ICvCoMKgwqAgaWYgKCFjLT5zaHJpbmspIHsKPj4gK8KgwqDCoMKgwqDC
oMKgIHByX3dhcm4oImJjYWNoZTogJXM6IGNvdWxkIG5vdCBhbGxvY2F0ZSBzaHJpbmtlclxuIiwg
X19mdW5jX18pOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9NRU07Cj4gCj4gU2VlbXMg
eW91IGhhdmUgY2hlYW5nZWQgdGhlIHNlbWFudGljIG9mIHRoaXMuIEluIHRoZSBwYXN0LAo+IGl0
IGlzIGJldHRlciB0byBoYXZlIGEgc2hyaW5rZXIsIGJ1dCBub3cgaXQgYmVjb21lcyBhIG1hbmRh
dG9yeS4KPiBSaWdodD8gSSBkb24ndCBrbm93IGlmIGl0IGlzIGFjY2VwdGFibGUuIEZyb20gbXkg
cG9pbnQgb2YgdmlldywKPiBqdXN0IGRvIHRoZSBjbGVhbnVwLCBkb24ndCBjaGFuZ2UgYW55IGJl
aGF2aW91ci4KCk9oLCBzaG91bGQgcmV0dXJuIDAgaGVyZSwgd2lsbCBkby4KCj4gCj4+ICvCoMKg
wqAgfQo+PiArCj4+ICvCoMKgwqAgYy0+c2hyaW5rLT5jb3VudF9vYmplY3RzID0gYmNoX21jYV9j
b3VudDsKPj4gK8KgwqDCoCBjLT5zaHJpbmstPnNjYW5fb2JqZWN0cyA9IGJjaF9tY2Ffc2NhbjsK
Pj4gK8KgwqDCoCBjLT5zaHJpbmstPnNlZWtzID0gNDsKPj4gK8KgwqDCoCBjLT5zaHJpbmstPmJh
dGNoID0gYy0+YnRyZWVfcGFnZXMgKiAyOwo+PiArwqDCoMKgIGMtPnNocmluay0+cHJpdmF0ZV9k
YXRhID0gYzsKPj4gLcKgwqDCoCBpZiAocmVnaXN0ZXJfc2hyaW5rZXIoJmMtPnNocmluaywgIm1k
LWJjYWNoZTolcFUiLCBjLT5zZXRfdXVpZCkpCj4+IC3CoMKgwqDCoMKgwqDCoCBwcl93YXJuKCJi
Y2FjaGU6ICVzOiBjb3VsZCBub3QgcmVnaXN0ZXIgc2hyaW5rZXJcbiIsCj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgX19mdW5jX18pOwo+PiArwqDCoMKgIHNocmlua2VyX3JlZ2lz
dGVyKGMtPnNocmluayk7Cj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+IMKgIH0KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWQvYmNhY2hlL3N5c2ZzLmMgYi9kcml2ZXJzL21kL2JjYWNoZS9zeXNm
cy5jCj4+IGluZGV4IDBlMmMxODgwZjYwYi4uNDVkOGFmNzU1ZGU2IDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL21kL2JjYWNoZS9zeXNmcy5jCj4+ICsrKyBiL2RyaXZlcnMvbWQvYmNhY2hlL3N5c2Zz
LmMKPj4gQEAgLTg2Niw3ICs4NjYsOCBAQCBTVE9SRShfX2JjaF9jYWNoZV9zZXQpCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBzYy5nZnBfbWFzayA9IEdGUF9LRVJORUw7Cj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBzYy5ucl90b19zY2FuID0gc3RydG91bF9vcl9yZXR1cm4oYnVmKTsKPj4gLcKgwqDCoMKg
wqDCoMKgIGMtPnNocmluay5zY2FuX29iamVjdHMoJmMtPnNocmluaywgJnNjKTsKPj4gK8KgwqDC
oMKgwqDCoMKgIGlmIChjLT5zaHJpbmspCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGMtPnNo
cmluay0+c2Nhbl9vYmplY3RzKGMtPnNocmluaywgJnNjKTsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKg
wqDCoMKgwqAgc3lzZnNfc3RydG91bF9jbGFtcChjb25nZXN0ZWRfcmVhZF90aHJlc2hvbGRfdXMs
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
