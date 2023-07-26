Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F4AC0015E
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 09:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vQn+4uHE1xInxNZitkAbg/DvG3SnzTnO/LqSQQhNRGE=; b=QF2aO3pthoWYm8
	3sKKnx/CKUpFeB6Oy5dyaFOchLO2oNes8W//yI5a5iJFHSXuWSAulfqTGTrw8kHtIkQ+Ey3ta5jRj
	1bUtPRaWqUilu6PK1Pq/5iHlrJU2tJItyvf7C02xkSR7sWySqTrqHyFIPc41gNfKQTzVx/jCrSXJ/
	gPdayVNCpQcwnHJD92mJEjbns5O9WeDJQ3IUu9qfvd42KJdrc5AWrtkVm6HNTz8O+rbJXIWGwLIeH
	c5hks1tL58bg/C1yyceUH8LbWzuhT67s0v0ZZGCG3TBa+pL3WCeuGgUUtKrSHFNOfg3ifSzHs3ivC
	42pAoEhiECvTPrl2RF1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOaoZ-009jBG-1W;
	Wed, 26 Jul 2023 09:28:15 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOaoV-009j7B-0v
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 09:28:14 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6864c144897so1488707b3a.1
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 02:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690363681; x=1690968481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3q/836hkNQMpcz/8YX2aFfQHacV0FqcsnRX2KDKmGK4=;
        b=VrX61tolI6lx5cf13TzjBUi7Jr7lyRI0PErux25Ugwzya6Gr7la8Z5mF2+cskv3TWz
         UBVd0Z5Poj3PRTux8odPv45l8gQzAXnTFOr3Tf8UDx7d9uUEKzN37AEVIKYy6agrhmgA
         YruSiWL83SB/lZ95d/ocS5Ez1ClN1w8sLcjpu26a2KNj8aWhEC89NaIXAD4IQeJcJzfH
         uYL7oLGt6F17I0XKTtTRSbeLX7ktBDSzYJstMwVG/599hz7kBf24kzbOMqBXrGbap2ZR
         iYE22Dihl4RYEd6b6MxzHd9sXrRhtrB75dhklT8m88pkRrstmkcW4eCpJX3cURQ8vJOi
         rydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690363681; x=1690968481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3q/836hkNQMpcz/8YX2aFfQHacV0FqcsnRX2KDKmGK4=;
        b=UaE0ALsDiGEHMHUgjpYZNMjQKI9IIkH7tCn09Az4SZIyKLkBLu55/722rmw5y7Jt8Q
         18k0zpClXcHFC6T0stLPdmT+F3KTbjihfwTWRJzTRDkpGDw4Snst+Vd0cBYETiWCcUoz
         HOYAQRMGxGP/FOsvM892lkhYOc9EPZjXkVKbtRyv6owtWZHOGIWoaHJtHm3lvtsl0hen
         YbtNOBMzHby1cD/Wa9zGQ1ZgoApi7D7tnLYUYBpmSINpNcke+xOWkNju1P8/ShVvvqxk
         iumW2YGqKGc+5gci2+dmMAzvg4u8JIH4rSdtYiGQrQ6+mgyhHbxiV9jGQWVeaNqDJqIY
         OwNA==
X-Gm-Message-State: ABy/qLb1PWJc+Zx/CuJDjDp8LOFME4p22UCBvqvPxwawoaIuyJAp9fZt
	3oJPRE4j/3OUFvzDJwXwGKyUNQ==
X-Google-Smtp-Source: APBJJlFbGXVT1jvZWB8OqMMjwV1wWa8tPHrXXzsgQ/SF73jQ8jhDFJz/C4eSTJgkpJW81UF91auuJQ==
X-Received: by 2002:a05:6a20:3c90:b0:134:d4d3:f0a5 with SMTP id b16-20020a056a203c9000b00134d4d3f0a5mr1941746pzj.2.1690363681365;
        Wed, 26 Jul 2023 02:28:01 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id l73-20020a633e4c000000b00563da87a52dsm1901427pga.40.2023.07.26.02.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 02:28:01 -0700 (PDT)
Message-ID: <665ccd89-8434-fc45-4813-c6412ef80c10@bytedance.com>
Date: Wed, 26 Jul 2023 17:27:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 19/47] mm: thp: dynamically allocate the thp-related
 shrinkers
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
 <20230724094354.90817-20-zhengqi.arch@bytedance.com>
 <d41d09bc-7c1c-f708-ecfa-ffac59bf58ad@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <d41d09bc-7c1c-f708-ecfa-ffac59bf58ad@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_022811_363656_054FCCCD 
X-CRM114-Status: GOOD (  19.04  )
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

CgpPbiAyMDIzLzcvMjYgMTU6MTAsIE11Y2h1biBTb25nIHdyb3RlOgo+IAo+IAo+IE9uIDIwMjMv
Ny8yNCAxNzo0MywgUWkgWmhlbmcgd3JvdGU6Cj4+IFVzZSBuZXcgQVBJcyB0byBkeW5hbWljYWxs
eSBhbGxvY2F0ZSB0aGUgdGhwLXplcm8gYW5kIHRocC1kZWZlcnJlZF9zcGxpdAo+PiBzaHJpbmtl
cnMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFFpIFpoZW5nIDx6aGVuZ3FpLmFyY2hAYnl0ZWRhbmNl
LmNvbT4KPj4gLS0tCj4+IMKgIG1tL2h1Z2VfbWVtb3J5LmMgfCA2OSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQ1
IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvbW0vaHVn
ZV9tZW1vcnkuYyBiL21tL2h1Z2VfbWVtb3J5LmMKPj4gaW5kZXggOGM5NGIzNDAyNGEyLi40ZGI1
YTE4MzRkODEgMTAwNjQ0Cj4+IC0tLSBhL21tL2h1Z2VfbWVtb3J5LmMKPj4gKysrIGIvbW0vaHVn
ZV9tZW1vcnkuYwo+PiBAQCAtNjUsNyArNjUsMTEgQEAgdW5zaWduZWQgbG9uZyB0cmFuc3BhcmVu
dF9odWdlcGFnZV9mbGFncyAKPj4gX19yZWFkX21vc3RseSA9Cj4+IMKgwqDCoMKgwqAgKDE8PFRS
QU5TUEFSRU5UX0hVR0VQQUdFX0RFRlJBR19LSFVHRVBBR0VEX0ZMQUcpfAo+PiDCoMKgwqDCoMKg
ICgxPDxUUkFOU1BBUkVOVF9IVUdFUEFHRV9VU0VfWkVST19QQUdFX0ZMQUcpOwo+PiAtc3RhdGlj
IHN0cnVjdCBzaHJpbmtlciBkZWZlcnJlZF9zcGxpdF9zaHJpbmtlcjsKPj4gK3N0YXRpYyBzdHJ1
Y3Qgc2hyaW5rZXIgKmRlZmVycmVkX3NwbGl0X3Nocmlua2VyOwo+PiArc3RhdGljIHVuc2lnbmVk
IGxvbmcgZGVmZXJyZWRfc3BsaXRfY291bnQoc3RydWN0IHNocmlua2VyICpzaHJpbmssCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHNocmlua19j
b250cm9sICpzYyk7Cj4+ICtzdGF0aWMgdW5zaWduZWQgbG9uZyBkZWZlcnJlZF9zcGxpdF9zY2Fu
KHN0cnVjdCBzaHJpbmtlciAqc2hyaW5rLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgc2hyaW5rX2NvbnRyb2wgKnNjKTsKPj4gwqAgc3RhdGljIGF0
b21pY190IGh1Z2VfemVyb19yZWZjb3VudDsKPj4gwqAgc3RydWN0IHBhZ2UgKmh1Z2VfemVyb19w
YWdlIF9fcmVhZF9tb3N0bHk7Cj4+IEBAIC0yMjksMTEgKzIzMyw3IEBAIHN0YXRpYyB1bnNpZ25l
ZCBsb25nIAo+PiBzaHJpbmtfaHVnZV96ZXJvX3BhZ2Vfc2NhbihzdHJ1Y3Qgc2hyaW5rZXIgKnNo
cmluaywKPj4gwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gwqAgfQo+PiAtc3RhdGljIHN0cnVjdCBz
aHJpbmtlciBodWdlX3plcm9fcGFnZV9zaHJpbmtlciA9IHsKPj4gLcKgwqDCoCAuY291bnRfb2Jq
ZWN0cyA9IHNocmlua19odWdlX3plcm9fcGFnZV9jb3VudCwKPj4gLcKgwqDCoCAuc2Nhbl9vYmpl
Y3RzID0gc2hyaW5rX2h1Z2VfemVyb19wYWdlX3NjYW4sCj4+IC3CoMKgwqAgLnNlZWtzID0gREVG
QVVMVF9TRUVLUywKPj4gLX07Cj4+ICtzdGF0aWMgc3RydWN0IHNocmlua2VyICpodWdlX3plcm9f
cGFnZV9zaHJpbmtlcjsKPiAKPiBTYW1lIGFzIHBhdGNoICMxNy4KCk9LLCB3aWxsIGRvLgoKPiAK
Pj4gwqAgI2lmZGVmIENPTkZJR19TWVNGUwo+PiDCoCBzdGF0aWMgc3NpemVfdCBlbmFibGVkX3No
b3coc3RydWN0IGtvYmplY3QgKmtvYmosCj4+IEBAIC00NTQsNiArNDU0LDQwIEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCBodWdlcGFnZV9leGl0X3N5c2ZzKHN0cnVjdCAKPj4ga29iamVjdCAqaHVnZXBh
Z2Vfa29iaikKPj4gwqAgfQo+PiDCoCAjZW5kaWYgLyogQ09ORklHX1NZU0ZTICovCj4+ICtzdGF0
aWMgaW50IHRocF9zaHJpbmtlcl9pbml0KHZvaWQpCj4gCj4gQmV0dGVyIHRvIGRlY2xhcmUgaXQg
YXMgX19pbml0LgoKV2lsbCBkby4KCj4gCj4+ICt7Cj4+ICvCoMKgwqAgaHVnZV96ZXJvX3BhZ2Vf
c2hyaW5rZXIgPSBzaHJpbmtlcl9hbGxvYygwLCAidGhwLXplcm8iKTsKPj4gK8KgwqDCoCBpZiAo
IWh1Z2VfemVyb19wYWdlX3Nocmlua2VyKQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9N
RU07Cj4+ICsKPj4gK8KgwqDCoCBkZWZlcnJlZF9zcGxpdF9zaHJpbmtlciA9IHNocmlua2VyX2Fs
bG9jKFNIUklOS0VSX05VTUFfQVdBUkUgfAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNIUklOS0VSX01FTUNHX0FXQVJFIHwKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTSFJJTktFUl9OT05TTEFC
LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJ0
aHAtZGVmZXJyZWRfc3BsaXQiKTsKPj4gK8KgwqDCoCBpZiAoIWRlZmVycmVkX3NwbGl0X3Nocmlu
a2VyKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBzaHJpbmtlcl9mcmVlX25vbl9yZWdpc3RlcmVkKGh1
Z2VfemVyb19wYWdlX3Nocmlua2VyKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVN
Owo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIGh1Z2VfemVyb19wYWdlX3Nocmlua2VyLT5j
b3VudF9vYmplY3RzID0gCj4+IHNocmlua19odWdlX3plcm9fcGFnZV9jb3VudDsKPj4gK8KgwqDC
oCBodWdlX3plcm9fcGFnZV9zaHJpbmtlci0+c2Nhbl9vYmplY3RzID0gc2hyaW5rX2h1Z2VfemVy
b19wYWdlX3NjYW47Cj4+ICvCoMKgwqAgaHVnZV96ZXJvX3BhZ2Vfc2hyaW5rZXItPnNlZWtzID0g
REVGQVVMVF9TRUVLUzsKPj4gK8KgwqDCoCBzaHJpbmtlcl9yZWdpc3RlcihodWdlX3plcm9fcGFn
ZV9zaHJpbmtlcik7Cj4+ICsKPj4gK8KgwqDCoCBkZWZlcnJlZF9zcGxpdF9zaHJpbmtlci0+Y291
bnRfb2JqZWN0cyA9IGRlZmVycmVkX3NwbGl0X2NvdW50Owo+PiArwqDCoMKgIGRlZmVycmVkX3Nw
bGl0X3Nocmlua2VyLT5zY2FuX29iamVjdHMgPSBkZWZlcnJlZF9zcGxpdF9zY2FuOwo+PiArwqDC
oMKgIGRlZmVycmVkX3NwbGl0X3Nocmlua2VyLT5zZWVrcyA9IERFRkFVTFRfU0VFS1M7Cj4+ICvC
oMKgwqAgc2hyaW5rZXJfcmVnaXN0ZXIoZGVmZXJyZWRfc3BsaXRfc2hyaW5rZXIpOwo+PiArCj4+
ICvCoMKgwqAgcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyB2b2lkIHRocF9zaHJpbmtl
cl9leGl0KHZvaWQpCj4gCj4gU2FtZSBhcyBoZXJlLgoKV2lsbCBkby4KCj4gCj4+ICt7Cj4+ICvC
oMKgwqAgc2hyaW5rZXJfdW5yZWdpc3RlcihodWdlX3plcm9fcGFnZV9zaHJpbmtlcik7Cj4+ICvC
oMKgwqAgc2hyaW5rZXJfdW5yZWdpc3RlcihkZWZlcnJlZF9zcGxpdF9zaHJpbmtlcik7Cj4+ICt9
Cj4+ICsKPj4gwqAgc3RhdGljIGludCBfX2luaXQgaHVnZXBhZ2VfaW5pdCh2b2lkKQo+PiDCoCB7
Cj4+IMKgwqDCoMKgwqAgaW50IGVycjsKPj4gQEAgLTQ4MiwxMiArNTE2LDkgQEAgc3RhdGljIGlu
dCBfX2luaXQgaHVnZXBhZ2VfaW5pdCh2b2lkKQo+PiDCoMKgwqDCoMKgIGlmIChlcnIpCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9zbGFiOwo+PiAtwqDCoMKgIGVyciA9IHJlZ2lzdGVy
X3Nocmlua2VyKCZodWdlX3plcm9fcGFnZV9zaHJpbmtlciwgInRocC16ZXJvIik7Cj4+IC3CoMKg
wqAgaWYgKGVycikKPj4gLcKgwqDCoMKgwqDCoMKgIGdvdG8gZXJyX2h6cF9zaHJpbmtlcjsKPj4g
LcKgwqDCoCBlcnIgPSByZWdpc3Rlcl9zaHJpbmtlcigmZGVmZXJyZWRfc3BsaXRfc2hyaW5rZXIs
IAo+PiAidGhwLWRlZmVycmVkX3NwbGl0Iik7Cj4+ICvCoMKgwqAgZXJyID0gdGhwX3Nocmlua2Vy
X2luaXQoKTsKPj4gwqDCoMKgwqDCoCBpZiAoZXJyKQo+PiAtwqDCoMKgwqDCoMKgwqAgZ290byBl
cnJfc3BsaXRfc2hyaW5rZXI7Cj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9zaHJpbmtlcjsK
Pj4gwqDCoMKgwqDCoCAvKgo+PiDCoMKgwqDCoMKgwqAgKiBCeSBkZWZhdWx0IGRpc2FibGUgdHJh
bnNwYXJlbnQgaHVnZXBhZ2VzIG9uIHNtYWxsZXIgc3lzdGVtcywKPj4gQEAgLTUwNSwxMCArNTM2
LDggQEAgc3RhdGljIGludCBfX2luaXQgaHVnZXBhZ2VfaW5pdCh2b2lkKQo+PiDCoMKgwqDCoMKg
IHJldHVybiAwOwo+PiDCoCBlcnJfa2h1Z2VwYWdlZDoKPj4gLcKgwqDCoCB1bnJlZ2lzdGVyX3No
cmlua2VyKCZkZWZlcnJlZF9zcGxpdF9zaHJpbmtlcik7Cj4+IC1lcnJfc3BsaXRfc2hyaW5rZXI6
Cj4+IC3CoMKgwqAgdW5yZWdpc3Rlcl9zaHJpbmtlcigmaHVnZV96ZXJvX3BhZ2Vfc2hyaW5rZXIp
Owo+PiAtZXJyX2h6cF9zaHJpbmtlcjoKPj4gK8KgwqDCoCB0aHBfc2hyaW5rZXJfZXhpdCgpOwo+
PiArZXJyX3Nocmlua2VyOgo+PiDCoMKgwqDCoMKgIGtodWdlcGFnZWRfZGVzdHJveSgpOwo+PiDC
oCBlcnJfc2xhYjoKPj4gwqDCoMKgwqDCoCBodWdlcGFnZV9leGl0X3N5c2ZzKGh1Z2VwYWdlX2tv
YmopOwo+PiBAQCAtMjg1MSw3ICsyODgwLDcgQEAgdm9pZCBkZWZlcnJlZF9zcGxpdF9mb2xpbyhz
dHJ1Y3QgZm9saW8gKmZvbGlvKQo+PiDCoCAjaWZkZWYgQ09ORklHX01FTUNHCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAobWVtY2cpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNldF9z
aHJpbmtlcl9iaXQobWVtY2csIGZvbGlvX25pZChmb2xpbyksCj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlZmVycmVkX3NwbGl0X3Nocmlua2VyLmlkKTsKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVmZXJyZWRfc3BsaXRf
c2hyaW5rZXItPmlkKTsKPj4gwqAgI2VuZGlmCj4+IMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKg
IHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRzX3F1ZXVlLT5zcGxpdF9xdWV1ZV9sb2NrLCBmbGFn
cyk7Cj4+IEBAIC0yOTI1LDE0ICsyOTU0LDYgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgZGVmZXJy
ZWRfc3BsaXRfc2NhbihzdHJ1Y3QgCj4+IHNocmlua2VyICpzaHJpbmssCj4+IMKgwqDCoMKgwqAg
cmV0dXJuIHNwbGl0Owo+PiDCoCB9Cj4+IC1zdGF0aWMgc3RydWN0IHNocmlua2VyIGRlZmVycmVk
X3NwbGl0X3Nocmlua2VyID0gewo+PiAtwqDCoMKgIC5jb3VudF9vYmplY3RzID0gZGVmZXJyZWRf
c3BsaXRfY291bnQsCj4+IC3CoMKgwqAgLnNjYW5fb2JqZWN0cyA9IGRlZmVycmVkX3NwbGl0X3Nj
YW4sCj4+IC3CoMKgwqAgLnNlZWtzID0gREVGQVVMVF9TRUVLUywKPj4gLcKgwqDCoCAuZmxhZ3Mg
PSBTSFJJTktFUl9OVU1BX0FXQVJFIHwgU0hSSU5LRVJfTUVNQ0dfQVdBUkUgfAo+PiAtwqDCoMKg
wqDCoMKgwqDCoCBTSFJJTktFUl9OT05TTEFCLAo+PiAtfTsKPj4gLQo+PiDCoCAjaWZkZWYgQ09O
RklHX0RFQlVHX0ZTCj4+IMKgIHN0YXRpYyB2b2lkIHNwbGl0X2h1Z2VfcGFnZXNfYWxsKHZvaWQp
Cj4+IMKgIHsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
