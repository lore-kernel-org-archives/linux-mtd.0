Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD3BC41513
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 09:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8uBMBx/JQJP1Zes2nwvD41UfwgZLXvf+yqNePzUqOa8=; b=i/sPWeh36zGHzh
	mxraRnsRgnXlODnvdIVs+gdbfoLDcz/rWGCuMmNPds+M4gJ+cfprQ8z+ej6xdR/iNncJrAGdAZQLx
	zCGHE2AJzZA/xv5uctFyw2wtLODtTRuUYyen6/4kiNf/eyo9hhJ0GsW9RYi22LfOEGfv27Xa5LIj9
	at9TEunzl8Hi842eB/KfnEpi/uFz+93q9Tm/3gCIVbNt7EUN5gsuO4Meyq0BwoXU6gEqzf/AZQk3L
	3EOTT0P4vifFqqVAysQTTJZhVNY2lG0BkkWvsE8lIEZCcr70OvlvI2CKNc5PuZ6N1mGAhZOLm8UNX
	/68qar6g5psrNiRQKRhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOarn-009jv8-0J;
	Wed, 26 Jul 2023 09:31:35 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOark-009jsd-0X
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 09:31:34 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-55c79b62f3aso258783a12.1
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 02:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690363888; x=1690968688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1c1HMAKYJ9E5B+Yw2yBJ71y5Qnnu7lxJRJAz0VpzdjM=;
        b=EQF1AXz3x2yXYd4qjMocTxTPUv5xmp+rmGdaUf3NNuCw5J/jTQ4A7IZT9vF7epjgJn
         KpwUuVkJ6HJRDUdWsR7NfWHbSXC8PWsHFdh4oIHUbaD9e84jeocWSrQORf7q4ywyRFQs
         1LGzZPZFXEkz9W3LLj6dH3mxCQb9lJbVi2esRgVEZwICTBL25qmDvMRXpJTk+hKerksQ
         5luk2+UVNUyo38NcOvmQg3etwWF0YvvBh8PEUa0Itb7+IS99+a0eXqafnZ8swwiJM5Cj
         hj/kRKpfCuHQwUVrKGY+/fSvHLFGiflLsA9oD4Oo9Kuwpr8gW47+Nnd/Sw58xHubMwbF
         Qyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690363888; x=1690968688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1c1HMAKYJ9E5B+Yw2yBJ71y5Qnnu7lxJRJAz0VpzdjM=;
        b=dQl03x7d4tC0/oo9LMDZv52k3xjsSyFOgv8n8S4u0j3U8PNSO7c6ZndGvXQmTaCD51
         0JHS7sbhdEHR+QjC2sBsJNvj0eP/fpZ7d6bbTi9EeEy37wS5PgK0v504chEGlKwWIRv1
         QBBTrXs7U47gfe98yyyPA0wyERZUTfE5mIt/RLN3sA4laPa8ENUxvALFD0DcN1h2Fgmq
         jdEYIOvJ6yz/F/GUve/zPtkXX3IQS0NGRK63ctag/WXK1t7WndJwdYinQ5S9lKPr05Ya
         aUAaLaYAHZcwAhnfvNRTIVXKTMPii6jNXo1x3WcZURqsD7KkMr+E+IfIp5ExjoHibUdO
         4TKQ==
X-Gm-Message-State: ABy/qLb8kjR+NmP7a2yu/BdR7fZRGqn+w7enhEWtDHTZ9cxA3qdSDdkz
	MVuKzTmOj4Y4xNkHlKOvkv0+xw==
X-Google-Smtp-Source: APBJJlEqsGncSKz6JEtDSHUBqLuH7hBKwqIpyMup6VZ4SlPsq4lxhQ8OawAhUiBJ+OlnlseBEBKBeQ==
X-Received: by 2002:a05:6a00:4a10:b0:686:b990:560f with SMTP id do16-20020a056a004a1000b00686b990560fmr1620878pfb.2.1690363888304;
        Wed, 26 Jul 2023 02:31:28 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id z5-20020aa791c5000000b0065446092699sm11395167pfa.141.2023.07.26.02.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 02:31:27 -0700 (PDT)
Message-ID: <b941338c-56e7-65e7-da45-bfefc484ad80@bytedance.com>
Date: Wed, 26 Jul 2023 17:31:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 23/47] drm/msm: dynamically allocate the drm-msm_gem
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
 <20230724094354.90817-24-zhengqi.arch@bytedance.com>
 <17de3f5b-3bef-be38-9801-0e84cfe8539b@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <17de3f5b-3bef-be38-9801-0e84cfe8539b@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_023132_207626_968A9833 
X-CRM114-Status: GOOD (  20.06  )
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

CgpPbiAyMDIzLzcvMjYgMTU6MjQsIE11Y2h1biBTb25nIHdyb3RlOgo+IAo+IAo+IE9uIDIwMjMv
Ny8yNCAxNzo0MywgUWkgWmhlbmcgd3JvdGU6Cj4+IEluIHByZXBhcmF0aW9uIGZvciBpbXBsZW1l
bnRpbmcgbG9ja2xlc3Mgc2xhYiBzaHJpbmssIHVzZSBuZXcgQVBJcyB0bwo+PiBkeW5hbWljYWxs
eSBhbGxvY2F0ZSB0aGUgZHJtLW1zbV9nZW0gc2hyaW5rZXIsIHNvIHRoYXQgaXQgY2FuIGJlIGZy
ZWVkCj4+IGFzeW5jaHJvbm91c2x5IHVzaW5nIGtmcmVlX3JjdSgpLiBUaGVuIGl0IGRvZXNuJ3Qg
bmVlZCB0byB3YWl0IGZvciBSQ1UKPj4gcmVhZC1zaWRlIGNyaXRpY2FsIHNlY3Rpb24gd2hlbiBy
ZWxlYXNpbmcgdGhlIHN0cnVjdCBtc21fZHJtX3ByaXZhdGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IFFpIFpoZW5nIDx6aGVuZ3FpLmFyY2hAYnl0ZWRhbmNlLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTog
TXVjaHVuIFNvbmcgPHNvbmdtdWNodW5AYnl0ZWRhbmNlLmNvbT4KPiAKPiBBIG5pdCBiZWxsb3cu
Cj4gCj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuY8KgwqDCoMKgwqDC
oMKgwqDCoCB8wqAgNCArKy0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmjCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDQgKy0tCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dl
bV9zaHJpbmtlci5jIHwgMzYgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPj4gwqAgMyBmaWxl
cyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jIAo+PiBiL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vbXNtX2Rydi5jCj4+IGluZGV4IDg5MWVmZjg0MzNhOS4uN2Y2OTMzYmU3MDNmIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYwo+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbXNtL21zbV9kcnYuYwo+PiBAQCAtNDYxLDcgKzQ2MSw5IEBAIHN0YXRpYyBpbnQg
bXNtX2RybV9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgCj4+IHN0cnVjdCBkcm1fZHJp
dmVyICpkcnYpCj4+IMKgwqDCoMKgwqAgaWYgKHJldCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdv
dG8gZXJyX21zbV91bmluaXQ7Cj4+IC3CoMKgwqAgbXNtX2dlbV9zaHJpbmtlcl9pbml0KGRkZXYp
Owo+PiArwqDCoMKgIHJldCA9IG1zbV9nZW1fc2hyaW5rZXJfaW5pdChkZGV2KTsKPj4gK8KgwqDC
oCBpZiAocmV0KQo+PiArwqDCoMKgwqDCoMKgwqAgZ290byBlcnJfbXNtX3VuaW5pdDsKPj4gwqDC
oMKgwqDCoCBpZiAocHJpdi0+a21zX2luaXQpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9
IHByaXYtPmttc19pbml0KGRkZXYpOwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21z
bS9tc21fZHJ2LmggCj4+IGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmgKPj4gaW5kZXgg
ZTEzYThjYmQ2MWM5Li44NDUyM2Q0YTFlNTggMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9tc20vbXNtX2Rydi5oCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5oCj4+
IEBAIC0yMTcsNyArMjE3LDcgQEAgc3RydWN0IG1zbV9kcm1fcHJpdmF0ZSB7Cj4+IMKgwqDCoMKg
wqAgfSB2cmFtOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBub3RpZmllcl9ibG9jayB2bWFwX25vdGlm
aWVyOwo+PiAtwqDCoMKgIHN0cnVjdCBzaHJpbmtlciBzaHJpbmtlcjsKPj4gK8KgwqDCoCBzdHJ1
Y3Qgc2hyaW5rZXIgKnNocmlua2VyOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fYXRvbWljX3N0
YXRlICpwbV9zdGF0ZTsKPj4gQEAgLTI3OSw3ICsyNzksNyBAQCBpbnQgbXNtX2lvY3RsX2dlbV9z
dWJtaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgCj4+IHZvaWQgKmRhdGEsCj4+IMKgIHVuc2ln
bmVkIGxvbmcgbXNtX2dlbV9zaHJpbmtlcl9zaHJpbmsoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
Cj4+IHVuc2lnbmVkIGxvbmcgbnJfdG9fc2Nhbik7Cj4+IMKgICNlbmRpZgo+PiAtdm9pZCBtc21f
Z2VtX3Nocmlua2VyX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldik7Cj4+ICtpbnQgbXNtX2dl
bV9zaHJpbmtlcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOwo+PiDCoCB2b2lkIG1zbV9n
ZW1fc2hyaW5rZXJfY2xlYW51cChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsKPj4gwqAgaW50IG1z
bV9nZW1fcHJpbWVfbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IAo+PiB2
bV9hcmVhX3N0cnVjdCAqdm1hKTsKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
bXNtX2dlbV9zaHJpbmtlci5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbV9zaHJp
bmtlci5jCj4+IGluZGV4IGYzODI5NmFkODc0My4uN2RhYWIxMjk4YzExIDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc2hyaW5rZXIuYwo+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbXNtL21zbV9nZW1fc2hyaW5rZXIuYwo+PiBAQCAtMzQsOCArMzQsNyBAQCBzdGF0
aWMgYm9vbCBjYW5fYmxvY2soc3RydWN0IHNocmlua19jb250cm9sICpzYykKPj4gwqAgc3RhdGlj
IHVuc2lnbmVkIGxvbmcKPj4gwqAgbXNtX2dlbV9zaHJpbmtlcl9jb3VudChzdHJ1Y3Qgc2hyaW5r
ZXIgKnNocmlua2VyLCBzdHJ1Y3QgCj4+IHNocmlua19jb250cm9sICpzYykKPj4gwqAgewo+PiAt
wqDCoMKgIHN0cnVjdCBtc21fZHJtX3ByaXZhdGUgKnByaXYgPQo+PiAtwqDCoMKgwqDCoMKgwqAg
Y29udGFpbmVyX29mKHNocmlua2VyLCBzdHJ1Y3QgbXNtX2RybV9wcml2YXRlLCBzaHJpbmtlcik7
Cj4+ICvCoMKgwqAgc3RydWN0IG1zbV9kcm1fcHJpdmF0ZSAqcHJpdiA9IHNocmlua2VyLT5wcml2
YXRlX2RhdGE7Cj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgY291bnQgPSBwcml2LT5scnUuZG9udG5l
ZWQuY291bnQ7Cj4+IMKgwqDCoMKgwqAgaWYgKGNhbl9zd2FwKCkpCj4+IEBAIC0xMDAsOCArOTks
NyBAQCBhY3RpdmVfZXZpY3Qoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCj4+IMKgIHN0YXRp
YyB1bnNpZ25lZCBsb25nCj4+IMKgIG1zbV9nZW1fc2hyaW5rZXJfc2NhbihzdHJ1Y3Qgc2hyaW5r
ZXIgKnNocmlua2VyLCBzdHJ1Y3QgCj4+IHNocmlua19jb250cm9sICpzYykKPj4gwqAgewo+PiAt
wqDCoMKgIHN0cnVjdCBtc21fZHJtX3ByaXZhdGUgKnByaXYgPQo+PiAtwqDCoMKgwqDCoMKgwqAg
Y29udGFpbmVyX29mKHNocmlua2VyLCBzdHJ1Y3QgbXNtX2RybV9wcml2YXRlLCBzaHJpbmtlcik7
Cj4+ICvCoMKgwqAgc3RydWN0IG1zbV9kcm1fcHJpdmF0ZSAqcHJpdiA9IHNocmlua2VyLT5wcml2
YXRlX2RhdGE7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN0
cnVjdCBkcm1fZ2VtX2xydSAqbHJ1Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYm9vbCAoKnNocmlu
aykoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOwo+PiBAQCAtMTQ4LDEwICsxNDYsMTEgQEAg
bXNtX2dlbV9zaHJpbmtlcl9zaHJpbmsoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgCj4+IHVuc2ln
bmVkIGxvbmcgbnJfdG9fc2NhbikKPj4gwqDCoMKgwqDCoCBzdHJ1Y3Qgc2hyaW5rX2NvbnRyb2wg
c2MgPSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAubnJfdG9fc2NhbiA9IG5yX3RvX3NjYW4sCj4+
IMKgwqDCoMKgwqAgfTsKPj4gLcKgwqDCoCBpbnQgcmV0Owo+PiArwqDCoMKgIHVuc2lnbmVkIGxv
bmcgcmV0ID0gU0hSSU5LX1NUT1A7Cj4+IMKgwqDCoMKgwqAgZnNfcmVjbGFpbV9hY3F1aXJlKEdG
UF9LRVJORUwpOwo+PiAtwqDCoMKgIHJldCA9IG1zbV9nZW1fc2hyaW5rZXJfc2NhbigmcHJpdi0+
c2hyaW5rZXIsICZzYyk7Cj4+ICvCoMKgwqAgaWYgKHByaXYtPnNocmlua2VyKQo+PiArwqDCoMKg
wqDCoMKgwqAgcmV0ID0gbXNtX2dlbV9zaHJpbmtlcl9zY2FuKHByaXYtPnNocmlua2VyLCAmc2Mp
Owo+PiDCoMKgwqDCoMKgIGZzX3JlY2xhaW1fcmVsZWFzZShHRlBfS0VSTkVMKTsKPj4gwqDCoMKg
wqDCoCByZXR1cm4gcmV0Owo+PiBAQCAtMjEwLDE2ICsyMDksMjcgQEAgbXNtX2dlbV9zaHJpbmtl
cl92bWFwKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIsIAo+PiB1bnNpZ25lZCBsb25nIGV2ZW50
LCB2b2lkICpwdHIpCj4+IMKgwqAgKgo+PiDCoMKgICogVGhpcyBmdW5jdGlvbiByZWdpc3RlcnMg
YW5kIHNldHMgdXAgdGhlIG1zbSBzaHJpbmtlci4KPj4gwqDCoCAqLwo+PiAtdm9pZCBtc21fZ2Vt
X3Nocmlua2VyX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPj4gK2ludCBtc21fZ2VtX3No
cmlua2VyX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPj4gwqAgewo+PiDCoMKgwqDCoMKg
IHN0cnVjdCBtc21fZHJtX3ByaXZhdGUgKnByaXYgPSBkZXYtPmRldl9wcml2YXRlOwo+PiAtwqDC
oMKgIHByaXYtPnNocmlua2VyLmNvdW50X29iamVjdHMgPSBtc21fZ2VtX3Nocmlua2VyX2NvdW50
Owo+PiAtwqDCoMKgIHByaXYtPnNocmlua2VyLnNjYW5fb2JqZWN0cyA9IG1zbV9nZW1fc2hyaW5r
ZXJfc2NhbjsKPj4gLcKgwqDCoCBwcml2LT5zaHJpbmtlci5zZWVrcyA9IERFRkFVTFRfU0VFS1M7
Cj4+IC3CoMKgwqAgV0FSTl9PTihyZWdpc3Rlcl9zaHJpbmtlcigmcHJpdi0+c2hyaW5rZXIsICJk
cm0tbXNtX2dlbSIpKTsKPj4gKwo+PiArwqDCoMKgIHByaXYtPnNocmlua2VyID0gc2hyaW5rZXJf
YWxsb2MoMCwgImRybS1tc21fZ2VtIik7Cj4+ICvCoMKgwqAgaWYgKCFwcml2LT5zaHJpbmtlcikg
ewo+IAo+IEp1c3QgImlmIChXQVJOX09OKCFwcml2LT5zaHJpbmtlcikpIgoKQXMgc3VnZ2VzdGVk
IGJ5IFN0ZXZlbiBQcmljIGluIHBhdGNoICMyNCwgdGhpcyB3YXJuaW5nIGlzCnVubmVjZXNzYXJ5
LCBzbyBJIHdpbGwgcmVtb3ZlIGl0IGluIHRoZSBuZXh0IHZlcnNpb24uCgo+IAo+PiArwqDCoMKg
wqDCoMKgwqAgV0FSTl9PTigxKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+
PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIHByaXYtPnNocmlua2VyLT5jb3VudF9vYmplY3Rz
ID0gbXNtX2dlbV9zaHJpbmtlcl9jb3VudDsKPj4gK8KgwqDCoCBwcml2LT5zaHJpbmtlci0+c2Nh
bl9vYmplY3RzID0gbXNtX2dlbV9zaHJpbmtlcl9zY2FuOwo+PiArwqDCoMKgIHByaXYtPnNocmlu
a2VyLT5zZWVrcyA9IERFRkFVTFRfU0VFS1M7Cj4+ICvCoMKgwqAgcHJpdi0+c2hyaW5rZXItPnBy
aXZhdGVfZGF0YSA9IHByaXY7Cj4+ICsKPj4gK8KgwqDCoCBzaHJpbmtlcl9yZWdpc3Rlcihwcml2
LT5zaHJpbmtlcik7Cj4+IMKgwqDCoMKgwqAgcHJpdi0+dm1hcF9ub3RpZmllci5ub3RpZmllcl9j
YWxsID0gbXNtX2dlbV9zaHJpbmtlcl92bWFwOwo+PiDCoMKgwqDCoMKgIFdBUk5fT04ocmVnaXN0
ZXJfdm1hcF9wdXJnZV9ub3RpZmllcigmcHJpdi0+dm1hcF9ub3RpZmllcikpOwo+PiArCj4+ICvC
oMKgwqAgcmV0dXJuIDA7Cj4+IMKgIH0KPj4gwqAgLyoqCj4+IEBAIC0yMzIsOCArMjQyLDggQEAg
dm9pZCBtc21fZ2VtX3Nocmlua2VyX2NsZWFudXAoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPj4g
wqAgewo+PiDCoMKgwqDCoMKgIHN0cnVjdCBtc21fZHJtX3ByaXZhdGUgKnByaXYgPSBkZXYtPmRl
dl9wcml2YXRlOwo+PiAtwqDCoMKgIGlmIChwcml2LT5zaHJpbmtlci5ucl9kZWZlcnJlZCkgewo+
PiArwqDCoMKgIGlmIChwcml2LT5zaHJpbmtlcikgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgV0FS
Tl9PTih1bnJlZ2lzdGVyX3ZtYXBfcHVyZ2Vfbm90aWZpZXIoJnByaXYtPnZtYXBfbm90aWZpZXIp
KTsKPj4gLcKgwqDCoMKgwqDCoMKgIHVucmVnaXN0ZXJfc2hyaW5rZXIoJnByaXYtPnNocmlua2Vy
KTsKPj4gK8KgwqDCoMKgwqDCoMKgIHNocmlua2VyX3VucmVnaXN0ZXIocHJpdi0+c2hyaW5rZXIp
Owo+PiDCoMKgwqDCoMKgIH0KPj4gwqAgfQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
