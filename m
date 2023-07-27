Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D432EC001E0
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 10:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+k/SQhfj9ylx/VQbKf29P6ESM6dfQ1NHvgdYr5NavU=; b=I58LaMjQ4vS7dW
	dNa5bkdH10kXyEoqjIgEh5NbnQoMqz4d7xn9poOXYHC0LmatvyRne4uWn5xhhtp8WYa155RxZGy9e
	RqOZ6+XRyxXPHYLOshADEOS518v8l59LUvQfjFSygZ1fQTQ70GRuwkiIsO/diQX3Y+sfVfrlwshoD
	2MSxopYI1oBwbj/3Fmbt+YXO17cCjcfQDWg9/tIrgwpRCKSj4sWTn3IXIirvk3dSivFKjW2swyVRM
	qUgAyWJtlw4/EhjweLos+lvWTNL4upBX36nLqJmDjLKay2G5RbQKUdhzvMb1loSxqVYSoqxRgUxXW
	vxLV5WxzXEQdjR/nct4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOyIM-00D0Xb-0C;
	Thu, 27 Jul 2023 10:32:34 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOyIF-00D0Sz-2q
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 10:32:31 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2680edb9767so163327a91.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 03:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690453945; x=1691058745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4VsKgOIlO7JTMbURB3u+V7Qr/QzOpc+0Bt56AjhAYAM=;
        b=Zr/NhsMbDbdIdSqoueTQTw00LusmUmyLrdR7MeDx+ZO5Q+75jdmzv373GL0Ee5CtKr
         W6fluKiuFJCg5ZU3kW0Km101UvphMU1vBCY7hDEO6TFqab4XzqrIV8fVDPR2Owpqim7U
         N3OX4eAxVQVjc5z6Zvv7YweV9TAIgzv2mVUZoaytYD45Z4tHHiC7Kn023GaYmi5v6RKy
         g9n+r/2KPb5qfD2ZK/MDUQIwCLsfUVl7c4q/2XRu1uefpNinWMEwlZLohyik+zojbFUF
         urJtl81vW3ulTBjRT5ht+WLfC03kh8PaMNuzZ2kESl6uu5dT49u0KrVoAN4kKuQ8SPSD
         k2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690453945; x=1691058745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4VsKgOIlO7JTMbURB3u+V7Qr/QzOpc+0Bt56AjhAYAM=;
        b=Bm1GijRdlIEcqw8OcdGNOsZ08vwTnZwnhEmXsJkqB+gJ6mImQOd8FeUnvYjLjBFxYD
         myS7pb1oAX/PlU7Ek8atfo9T0dtliI2D0UoKh+U5y4azXLT4ANNjRKSm+RBm4KTY4WCF
         8f1ZZi5hNXnYVobkZqN0JQtRrQzKVAkgCyFi/I7/sIRZhhdY87+tH7wCKbTQt3nCjaz1
         i3/W0NJduCgOvnVqauPwGFYAFVH7/cwM/YNg6Lmf/pv7/+Y7kSf8jxqa73F/3ncn8Kbz
         fw1d6xPordA2pV/uFih18FOqtMacwT3NubysvPJGPdu3awC5NOS4fQ1kf21dBUNJOt//
         5vbw==
X-Gm-Message-State: ABy/qLYN4vqu4nR6S5YjCqbTznirPh+ArYFdBpNDgKOcL01ElDbLZKCV
	cZDLacZ9fvnGWIN2+8yjSNhcq1Oas9GKld9AawU=
X-Google-Smtp-Source: APBJJlGmzPZn88CMJAqpsojyTb97uikW28yo5O3pi8rH8SDlSH8BwjASuoOudfeGFyxgCSRxAf0mLA==
X-Received: by 2002:a17:90a:1b06:b0:263:2312:60c2 with SMTP id q6-20020a17090a1b0600b00263231260c2mr4299433pjq.3.1690453945653;
        Thu, 27 Jul 2023 03:32:25 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a018800b0026309d57724sm2755058pjc.39.2023.07.27.03.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 03:32:25 -0700 (PDT)
Message-ID: <cc819e13-cb25-ddaa-e0e3-7328f5ea3a4f@bytedance.com>
Date: Thu, 27 Jul 2023 18:32:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 28/49] dm zoned: dynamically allocate the dm-zoned-meta
 shrinker
Content-Language: en-US
To: Damien Le Moal <dlemoal@kernel.org>
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
 Muchun Song <songmuchun@bytedance.com>, akpm@linux-foundation.org,
 david@fromorbit.com, tkhai@ya.ru, vbabka@suse.cz, roman.gushchin@linux.dev,
 djwong@kernel.org, brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-29-zhengqi.arch@bytedance.com>
 <baaf7de4-9a0e-b953-2b6a-46e60c415614@kernel.org>
 <56ee1d92-28ee-81cb-9c41-6ca7ea6556b0@bytedance.com>
 <ba0868b2-9f90-3d81-1c91-8810057fb3ce@kernel.org>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ba0868b2-9f90-3d81-1c91-8810057fb3ce@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_033228_267210_75E2E62E 
X-CRM114-Status: GOOD (  13.20  )
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

CgpPbiAyMDIzLzcvMjcgMTg6MjAsIERhbWllbiBMZSBNb2FsIHdyb3RlOgo+IE9uIDcvMjcvMjMg
MTc6NTUsIFFpIFpoZW5nIHdyb3RlOgo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnI7
Cj4+Pj4gIMKgwqDCoMKgwqAgfQo+Pj4+ICDCoCArwqDCoMKgIHptZC0+bWJsa19zaHJpbmtlci0+
Y291bnRfb2JqZWN0cyA9IGRtel9tYmxvY2tfc2hyaW5rZXJfY291bnQ7Cj4+Pj4gK8KgwqDCoCB6
bWQtPm1ibGtfc2hyaW5rZXItPnNjYW5fb2JqZWN0cyA9IGRtel9tYmxvY2tfc2hyaW5rZXJfc2Nh
bjsKPj4+PiArwqDCoMKgIHptZC0+bWJsa19zaHJpbmtlci0+c2Vla3MgPSBERUZBVUxUX1NFRUtT
Owo+Pj4+ICvCoMKgwqAgem1kLT5tYmxrX3Nocmlua2VyLT5wcml2YXRlX2RhdGEgPSB6bWQ7Cj4+
Pj4gKwo+Pj4+ICvCoMKgwqAgc2hyaW5rZXJfcmVnaXN0ZXIoem1kLT5tYmxrX3Nocmlua2VyKTsK
Pj4+Cj4+PiBJIGZhaWwgdG8gc2VlIGhvdyB0aGlzIG5ldyBzaHJpbmtlciBBUEkgaXMgYmV0dGVy
Li4uIFdoeSBpc24ndCB0aGVyZSBhCj4+PiBzaHJpbmtlcl9hbGxvY19hbmRfcmVnaXN0ZXIoKSBm
dW5jdGlvbiA/IFRoYXQgd291bGQgYXZvaWQgYWRkaW5nIGFsbCB0aGlzIGNvZGUKPj4+IGFsbCBv
dmVyIHRoZSBwbGFjZSBhcyB0aGUgbmV3IEFQSSBjYWxsIHdvdWxkIGJlIHZlcnkgc2ltaWxhciB0
byB0aGUgY3VycmVudAo+Pj4gc2hyaW5rZXJfcmVnaXN0ZXIoKSBjYWxsIHdpdGggc3RhdGljIGFs
bG9jYXRpb24uCj4+Cj4+IEluIHNvbWUgcmVnaXN0cmF0aW9uIHNjZW5hcmlvcywgbWVtb3J5IG5l
ZWRzIHRvIGJlIGFsbG9jYXRlZCBpbiBhZHZhbmNlLgo+PiBTbyB3ZSBjb250aW51ZSB0byB1c2Ug
dGhlIHByZXZpb3VzIHByZWFsbG9jL3JlZ2lzdGVyX3ByZXBhcmVkKCkKPj4gYWxnb3JpdGhtLiBU
aGUgc2hyaW5rZXJfYWxsb2NfYW5kX3JlZ2lzdGVyKCkgaXMganVzdCBhIGhlbHBlciBmdW5jdGlv
bgo+PiB0aGF0IGNvbWJpbmVzIHRoZSB0d28sIGFuZCB0aGlzIGluY3JlYXNlcyB0aGUgbnVtYmVy
IG9mIEFQSXMgdGhhdAo+PiBzaHJpbmtlciBleHBvc2VzIHRvIHRoZSBvdXRzaWRlLCBzbyBJIGNo
b29zZSBub3QgdG8gYWRkIHRoaXMgaGVscGVyLgo+IAo+IEFuZCB0aGF0IHJlc3VsdHMgaW4gbW9y
ZSBjb2RlIGluIG1hbnkgcGxhY2VzIGluc3RlYWQgb2YgbGVzcyBjb2RlICsgYSBzaW1wbGUKPiBp
bmxpbmUgaGVscGVyIGluIHRoZSBzaHJpbmtlciBoZWFkZXIgZmlsZS4uLiBTbyBub3QgYWRkaW5n
IHRoYXQgc3VwZXIgc2ltcGxlCgpJdCBhbHNvIG5lZWRzIHRvIGJlIGV4cG9ydGVkIHRvIHRoZSBk
cml2ZXIgZm9yIHVzZS4KCj4gaGVscGVyIGlzIG5vdCBleGFjdGx5IHRoZSBiZXN0IGNob2ljZSBp
biBteSBvcGluaW9uLgoKSG0sIGVpdGhlciBvbmUgaXMgZmluZSBmb3IgbWUuIElmIG5vIG9uZSBl
bHNlIG9iamVjdHMsIEkgY2FuIGFkZCB0aGlzCmhlbHBlci4gOykKCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
