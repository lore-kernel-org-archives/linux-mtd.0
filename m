Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA9FC001DE
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jul 2023 09:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=moERmvc/kw/uEomtpBGFEfccurzddrRWzgNjiypKxFY=; b=jbCLuvvGQDJM3D
	uMEPr7RsqAKFr9PCucGbWSnbGoBkdWX+C/Xj1Zi0X7hvKSle0kiQHz8V1xmv5myRKJdKr2rdOkOk0
	NlXN6zYOPlQAxyqZ8hRhY69SF7ItjNDsNrfHSChioxM+l+2N9hcMpKgtiDTBHdI9JQffLUUw57Fxl
	MB2K3bTxK88Xnr1OnbbDJ12RW3N7vB6+dqhweW0Jl53aMIGndEikzqxUTGBdfqNtt1+RPt6+i7qvv
	uilu1SxRektG3/zhnM8d2Pfmj5PBTnK9ZF23F7au3woUIoXONpWFFYGqSZsW0rD9ziuXxCzx62JU4
	ZLaTVvixVtq4hwapsgLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOaiq-009i51-2Q;
	Wed, 26 Jul 2023 09:22:20 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOaio-009i34-0L
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jul 2023 09:22:19 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-66d6a9851f3so1487678b3a.0
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jul 2023 02:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690363335; x=1690968135;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xHFf+qIXuXcHU2hnpeM9isQldhnSqSauyHf1oBu4R8I=;
        b=jAMndxc3vAfZ9MlugwiN2m1td4+ENgo1ZcEkULNu4w0l2e+7SjL15Aj8xsnH/hg6mq
         Yuh7Pj+WIpy+9FKbmqcmIZPowwXwCsZ/HE/uYPa/USpf5RWRvsmKXdX1EOhGqDHtCRhA
         5Tx4ycmmPjyUjagwQ6weN00EPkG2yYEGVkFAeT+5NL38WWOxpIAWxDe7x+TtdzGSmFXw
         AaN6OIhFdWcuFQV9AajQEHTHNR/HQhAWIjBkgsz+1GmBQBDd2nNKfKbDgsLcpETIdF18
         CdbQtqtDxhcETBnzscklNfC8QDSVXvKpexDlKf4G6IIrjU6vkXpbe5y1T2yEBA/OqHN2
         vBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690363335; x=1690968135;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xHFf+qIXuXcHU2hnpeM9isQldhnSqSauyHf1oBu4R8I=;
        b=bYs3LlMafyHwdgr4oyaCVveWtbrBYYHnLKVi7fkB9LF37WKm0Yc+ky5DpRiJPZyE3e
         5zFrzHIideMEZWriFRlAM0niI+jyXLPhSaBMI+AKxB9iNZipJb0TlFztklUcvD39bwsj
         D5x+AG2XMzu/pLXF4v1MuX+nv8NFJNyuXP4IDPo+U9QjycVhIsr3rJmKETp4ZeIojtIq
         l73Q+B3wt8FSnjyeLxDuOlytQNj12gcL83jfv0YtLybs/NJ2mVAzgDzn7SrBKc7NAM/x
         1UbW58IXQyA/hZ7Kks9R9cxkaAWWXRYDZ6f8rabOSxACQ8lNs4M7RyD9LIEVJaZdvTc7
         IHYg==
X-Gm-Message-State: ABy/qLaFJdm2Vbwcvc0sBChra5gxr9cGOyhM9aMnP/knjg2Z0/Pg3Czh
	4HXxCDCe2Hnj3VUA7LS94qnkqQ==
X-Google-Smtp-Source: APBJJlGzKLkoeooTK7rnc1fJ6mfD6dUCrzzNETRC7Ci4c1Yh8zXhisYlXfajH5gn3qqQbLizO8XVQA==
X-Received: by 2002:a05:6a20:729a:b0:100:b92b:e8be with SMTP id o26-20020a056a20729a00b00100b92be8bemr1779967pzk.2.1690363335131;
        Wed, 26 Jul 2023 02:22:15 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id k11-20020aa790cb000000b006827c26f147sm10955045pfk.138.2023.07.26.02.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 02:22:14 -0700 (PDT)
Message-ID: <d96777ce-be8a-1665-dd00-1e696e5575a8@bytedance.com>
Date: Wed, 26 Jul 2023 17:22:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 11/47] gfs2: dynamically allocate the gfs2-qd shrinker
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
 <20230724094354.90817-12-zhengqi.arch@bytedance.com>
 <e7204276-9de5-17eb-90ae-e51657d73ef4@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <e7204276-9de5-17eb-90ae-e51657d73ef4@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_022218_143545_36CDB53C 
X-CRM114-Status: GOOD (  15.16  )
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

CgpPbiAyMDIzLzcvMjYgMTQ6NDksIE11Y2h1biBTb25nIHdyb3RlOgo+IAo+IAo+IE9uIDIwMjMv
Ny8yNCAxNzo0MywgUWkgWmhlbmcgd3JvdGU6Cj4+IFVzZSBuZXcgQVBJcyB0byBkeW5hbWljYWxs
eSBhbGxvY2F0ZSB0aGUgZ2ZzMi1xZCBzaHJpbmtlci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUWkg
WmhlbmcgPHpoZW5ncWkuYXJjaEBieXRlZGFuY2UuY29tPgo+PiAtLS0KPj4gwqAgZnMvZ2ZzMi9t
YWluLmPCoCB8wqAgNiArKystLS0KPj4gwqAgZnMvZ2ZzMi9xdW90YS5jIHwgMjYgKysrKysrKysr
KysrKysrKysrKystLS0tLS0KPj4gwqAgZnMvZ2ZzMi9xdW90YS5oIHzCoCAzICsrLQo+PiDCoCAz
IGZpbGVzIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvZnMvZ2ZzMi9tYWluLmMgYi9mcy9nZnMyL21haW4uYwo+PiBpbmRleCBhZmNi
MzI4NTRmMTQuLmU0N2IxY2M3OWY1OSAxMDA2NDQKPj4gLS0tIGEvZnMvZ2ZzMi9tYWluLmMKPj4g
KysrIGIvZnMvZ2ZzMi9tYWluLmMKPj4gQEAgLTE0Nyw3ICsxNDcsNyBAQCBzdGF0aWMgaW50IF9f
aW5pdCBpbml0X2dmczJfZnModm9pZCkKPj4gwqDCoMKgwqDCoCBpZiAoIWdmczJfdHJhbnNfY2Fj
aGVwKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBmYWlsX2NhY2hlcDg7Cj4+IC3CoMKgwqAg
ZXJyb3IgPSByZWdpc3Rlcl9zaHJpbmtlcigmZ2ZzMl9xZF9zaHJpbmtlciwgImdmczItcWQiKTsK
Pj4gK8KgwqDCoCBlcnJvciA9IGdmczJfcWRfc2hyaW5rZXJfaW5pdCgpOwo+PiDCoMKgwqDCoMKg
IGlmIChlcnJvcikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZmFpbF9zaHJpbmtlcjsKPj4g
QEAgLTE5Niw3ICsxOTYsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBpbml0X2dmczJfZnModm9pZCkK
Pj4gwqAgZmFpbF93cTI6Cj4+IMKgwqDCoMKgwqAgZGVzdHJveV93b3JrcXVldWUoZ2ZzX3JlY292
ZXJ5X3dxKTsKPj4gwqAgZmFpbF93cTE6Cj4+IC3CoMKgwqAgdW5yZWdpc3Rlcl9zaHJpbmtlcigm
Z2ZzMl9xZF9zaHJpbmtlcik7Cj4+ICvCoMKgwqAgZ2ZzMl9xZF9zaHJpbmtlcl9leGl0KCk7Cj4+
IMKgIGZhaWxfc2hyaW5rZXI6Cj4+IMKgwqDCoMKgwqAga21lbV9jYWNoZV9kZXN0cm95KGdmczJf
dHJhbnNfY2FjaGVwKTsKPj4gwqAgZmFpbF9jYWNoZXA4Ogo+PiBAQCAtMjI5LDcgKzIyOSw3IEBA
IHN0YXRpYyBpbnQgX19pbml0IGluaXRfZ2ZzMl9mcyh2b2lkKQo+PiDCoCBzdGF0aWMgdm9pZCBf
X2V4aXQgZXhpdF9nZnMyX2ZzKHZvaWQpCj4+IMKgIHsKPj4gLcKgwqDCoCB1bnJlZ2lzdGVyX3No
cmlua2VyKCZnZnMyX3FkX3Nocmlua2VyKTsKPj4gK8KgwqDCoCBnZnMyX3FkX3Nocmlua2VyX2V4
aXQoKTsKPj4gwqDCoMKgwqDCoCBnZnMyX2dsb2NrX2V4aXQoKTsKPj4gwqDCoMKgwqDCoCBnZnMy
X3VucmVnaXN0ZXJfZGVidWdmcygpOwo+PiDCoMKgwqDCoMKgIHVucmVnaXN0ZXJfZmlsZXN5c3Rl
bSgmZ2ZzMl9mc190eXBlKTsKPj4gZGlmZiAtLWdpdCBhL2ZzL2dmczIvcXVvdGEuYyBiL2ZzL2dm
czIvcXVvdGEuYwo+PiBpbmRleCA3MDQxOTJiNzM2MDUuLmJjOTg4M2NlYTg0NyAxMDA2NDQKPj4g
LS0tIGEvZnMvZ2ZzMi9xdW90YS5jCj4+ICsrKyBiL2ZzL2dmczIvcXVvdGEuYwo+PiBAQCAtMTg2
LDEzICsxODYsMjcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgZ2ZzMl9xZF9zaHJpbmtfY291bnQo
c3RydWN0IAo+PiBzaHJpbmtlciAqc2hyaW5rLAo+PiDCoMKgwqDCoMKgIHJldHVybiB2ZnNfcHJl
c3N1cmVfcmF0aW8obGlzdF9scnVfc2hyaW5rX2NvdW50KCZnZnMyX3FkX2xydSwgc2MpKTsKPj4g
wqAgfQo+PiAtc3RydWN0IHNocmlua2VyIGdmczJfcWRfc2hyaW5rZXIgPSB7Cj4+IC3CoMKgwqAg
LmNvdW50X29iamVjdHMgPSBnZnMyX3FkX3Nocmlua19jb3VudCwKPj4gLcKgwqDCoCAuc2Nhbl9v
YmplY3RzID0gZ2ZzMl9xZF9zaHJpbmtfc2NhbiwKPj4gLcKgwqDCoCAuc2Vla3MgPSBERUZBVUxU
X1NFRUtTLAo+PiAtwqDCoMKgIC5mbGFncyA9IFNIUklOS0VSX05VTUFfQVdBUkUsCj4+IC19Owo+
PiArc3RhdGljIHN0cnVjdCBzaHJpbmtlciAqZ2ZzMl9xZF9zaHJpbmtlcjsKPj4gKwo+PiAraW50
IGdmczJfcWRfc2hyaW5rZXJfaW5pdCh2b2lkKQo+IAo+IEl0J3MgYmV0dGVyIHRvIGRlY2xhcmUg
dGhpcyBhcyBfX2luaXQuCgpPSywgV2lsbCBkby4KCj4gCj4+ICt7Cj4+ICvCoMKgwqAgZ2ZzMl9x
ZF9zaHJpbmtlciA9IHNocmlua2VyX2FsbG9jKFNIUklOS0VSX05VTUFfQVdBUkUsICJnZnMyLXFk
Iik7Cj4+ICvCoMKgwqAgaWYgKCFnZnMyX3FkX3Nocmlua2VyKQo+PiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIC1FTk9NRU07Cj4+ICsKPj4gK8KgwqDCoCBnZnMyX3FkX3Nocmlua2VyLT5jb3VudF9v
YmplY3RzID0gZ2ZzMl9xZF9zaHJpbmtfY291bnQ7Cj4+ICvCoMKgwqAgZ2ZzMl9xZF9zaHJpbmtl
ci0+c2Nhbl9vYmplY3RzID0gZ2ZzMl9xZF9zaHJpbmtfc2NhbjsKPj4gK8KgwqDCoCBnZnMyX3Fk
X3Nocmlua2VyLT5zZWVrcyA9IERFRkFVTFRfU0VFS1M7Cj4+ICsKPj4gK8KgwqDCoCBzaHJpbmtl
cl9yZWdpc3RlcihnZnMyX3FkX3Nocmlua2VyKTsKPj4gK8KgwqDCoCByZXR1cm4gMDsKPj4gK30K
Pj4gKwo+PiArdm9pZCBnZnMyX3FkX3Nocmlua2VyX2V4aXQodm9pZCkKPj4gK3sKPj4gK8KgwqDC
oCBzaHJpbmtlcl91bnJlZ2lzdGVyKGdmczJfcWRfc2hyaW5rZXIpOwo+PiArfQo+PiDCoCBzdGF0
aWMgdTY0IHFkMmluZGV4KHN0cnVjdCBnZnMyX3F1b3RhX2RhdGEgKnFkKQo+PiDCoCB7Cj4+IGRp
ZmYgLS1naXQgYS9mcy9nZnMyL3F1b3RhLmggYi9mcy9nZnMyL3F1b3RhLmgKPj4gaW5kZXggMjFh
ZGEzMzJkNTU1Li5mOWNiODYzMzczZjcgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2dmczIvcXVvdGEuaAo+
PiArKysgYi9mcy9nZnMyL3F1b3RhLmgKPj4gQEAgLTU5LDcgKzU5LDggQEAgc3RhdGljIGlubGlu
ZSBpbnQgZ2ZzMl9xdW90YV9sb2NrX2NoZWNrKHN0cnVjdCAKPj4gZ2ZzMl9pbm9kZSAqaXAsCj4+
IMKgIH0KPj4gwqAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBxdW90YWN0bF9vcHMgZ2ZzMl9xdW90YWN0
bF9vcHM7Cj4+IC1leHRlcm4gc3RydWN0IHNocmlua2VyIGdmczJfcWRfc2hyaW5rZXI7Cj4+ICtp
bnQgZ2ZzMl9xZF9zaHJpbmtlcl9pbml0KHZvaWQpOwo+PiArdm9pZCBnZnMyX3FkX3Nocmlua2Vy
X2V4aXQodm9pZCk7Cj4+IMKgIGV4dGVybiBzdHJ1Y3QgbGlzdF9scnUgZ2ZzMl9xZF9scnU7Cj4+
IMKgIGV4dGVybiB2b2lkIF9faW5pdCBnZnMyX3F1b3RhX2hhc2hfaW5pdCh2b2lkKTsKPiAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
