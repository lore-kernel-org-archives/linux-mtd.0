Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E31EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 23:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TRfjBBUkCfkPGbzUGlTvwF2lF3MOl8rOioRdnh5KslA=; b=x/T8y+QJDW8qo0
	VMvFcKqJlaDhFnCjF6PE+/7Z4/5NeNUnEY7yfj5LiTvmWx+rcKol6MJDURmtAOqiy6JYOwbDDXYrq
	ueas9awW2bX57LR0AMdMPCK/dUFV1B3uLe0Gpu8EMRNFB9hOhLaiMtOVBM1Rg64iIX0gL1L0oRVTr
	Ro8KVZo2pjfZLV1hKW0RAvB1cOIUD+O/a7b6u678+uneLVfaJQDvnh3GYP8of7MskQH/7ZGe9BxJE
	zyasBrKj/mkmuO71KTuUOFXKDqv2H886MIzJSa6XmkUHU7Kixav6z1d4CqCA8CqwLfses0My5+yAi
	DBtNWNVbOHkJpi8tBckA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPAiw-000uJ3-17;
	Thu, 27 Jul 2023 23:48:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPAit-000uHi-0U
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 23:48:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CA7BB61F8A;
	Thu, 27 Jul 2023 23:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5FDC433C7;
	Thu, 27 Jul 2023 23:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690501724;
	bh=Ttxo2VAoV3s10tVDpG1rs4f+uNBtPiAAdsRn7qEPqAI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ak6ozI5MGJ+V/aaPZbipUbe6ZARep0hinqcaIFmiUbGlXqA4l6qqKubv3sXd24Wis
	 E3nRqNpMPjywrGRezhx8kIl9BfOcFGOjuYtEl0wjzGKmd2W/r6L34Y8Q/Asia9+Ai+
	 N65piXMA54Y1i5SwziMjZGbgl+PlpLxLOgApRck3LvpJfpGiaZrCds1yq/RX5+TIOO
	 TcyhaMq04sGg4mmvI/xNg53Zl5ogRkSJoPUjgXBUN2wkW+R/Z24fG4Bcn7szmrfhkb
	 1Y0rUs2KyI/CXZncywoQIP9j5+uNlee3CVuHYo0iSwOTdXpuIWfOUm7reRjWTqpcd1
	 EASuIvTp5UKtQ==
Message-ID: <217f3a7e-7681-0da6-aaa7-252a1451f7ba@kernel.org>
Date: Fri, 28 Jul 2023 08:48:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 28/49] dm zoned: dynamically allocate the dm-zoned-meta
 shrinker
To: Dave Chinner <david@fromorbit.com>
Cc: Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-erofs@lists.ozlabs.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org, linux-mtd@lists.infradead.org,
 rcu@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 Muchun Song <songmuchun@bytedance.com>, akpm@linux-foundation.org,
 tkhai@ya.ru, vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
 cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
 gregkh@linuxfoundation.org, muchun.song@linux.dev
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-29-zhengqi.arch@bytedance.com>
 <baaf7de4-9a0e-b953-2b6a-46e60c415614@kernel.org>
 <56ee1d92-28ee-81cb-9c41-6ca7ea6556b0@bytedance.com>
 <ba0868b2-9f90-3d81-1c91-8810057fb3ce@kernel.org>
 <ZML22YJi5vPBDEDj@dread.disaster.area>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <ZML22YJi5vPBDEDj@dread.disaster.area>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_164847_275505_2F4A48DE 
X-CRM114-Status: GOOD (  21.36  )
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

T24gNy8yOC8yMyAwNzo1OSwgRGF2ZSBDaGlubmVyIHdyb3RlOgo+IE9uIFRodSwgSnVsIDI3LCAy
MDIzIGF0IDA3OjIwOjQ2UE0gKzA5MDAsIERhbWllbiBMZSBNb2FsIHdyb3RlOgo+PiBPbiA3LzI3
LzIzIDE3OjU1LCBRaSBaaGVuZyB3cm90ZToKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8g
ZXJyOwo+Pj4+PiDCoMKgwqDCoMKgIH0KPj4+Pj4gwqAgK8KgwqDCoCB6bWQtPm1ibGtfc2hyaW5r
ZXItPmNvdW50X29iamVjdHMgPSBkbXpfbWJsb2NrX3Nocmlua2VyX2NvdW50Owo+Pj4+PiArwqDC
oMKgIHptZC0+bWJsa19zaHJpbmtlci0+c2Nhbl9vYmplY3RzID0gZG16X21ibG9ja19zaHJpbmtl
cl9zY2FuOwo+Pj4+PiArwqDCoMKgIHptZC0+bWJsa19zaHJpbmtlci0+c2Vla3MgPSBERUZBVUxU
X1NFRUtTOwo+Pj4+PiArwqDCoMKgIHptZC0+bWJsa19zaHJpbmtlci0+cHJpdmF0ZV9kYXRhID0g
em1kOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgc2hyaW5rZXJfcmVnaXN0ZXIoem1kLT5tYmxrX3No
cmlua2VyKTsKPj4+Pgo+Pj4+IEkgZmFpbCB0byBzZWUgaG93IHRoaXMgbmV3IHNocmlua2VyIEFQ
SSBpcyBiZXR0ZXIuLi4gV2h5IGlzbid0IHRoZXJlIGEKPj4+PiBzaHJpbmtlcl9hbGxvY19hbmRf
cmVnaXN0ZXIoKSBmdW5jdGlvbiA/IFRoYXQgd291bGQgYXZvaWQgYWRkaW5nIGFsbCB0aGlzIGNv
ZGUKPj4+PiBhbGwgb3ZlciB0aGUgcGxhY2UgYXMgdGhlIG5ldyBBUEkgY2FsbCB3b3VsZCBiZSB2
ZXJ5IHNpbWlsYXIgdG8gdGhlIGN1cnJlbnQKPj4+PiBzaHJpbmtlcl9yZWdpc3RlcigpIGNhbGwg
d2l0aCBzdGF0aWMgYWxsb2NhdGlvbi4KPj4+Cj4+PiBJbiBzb21lIHJlZ2lzdHJhdGlvbiBzY2Vu
YXJpb3MsIG1lbW9yeSBuZWVkcyB0byBiZSBhbGxvY2F0ZWQgaW4gYWR2YW5jZS4KPj4+IFNvIHdl
IGNvbnRpbnVlIHRvIHVzZSB0aGUgcHJldmlvdXMgcHJlYWxsb2MvcmVnaXN0ZXJfcHJlcGFyZWQo
KQo+Pj4gYWxnb3JpdGhtLiBUaGUgc2hyaW5rZXJfYWxsb2NfYW5kX3JlZ2lzdGVyKCkgaXMganVz
dCBhIGhlbHBlciBmdW5jdGlvbgo+Pj4gdGhhdCBjb21iaW5lcyB0aGUgdHdvLCBhbmQgdGhpcyBp
bmNyZWFzZXMgdGhlIG51bWJlciBvZiBBUElzIHRoYXQKPj4+IHNocmlua2VyIGV4cG9zZXMgdG8g
dGhlIG91dHNpZGUsIHNvIEkgY2hvb3NlIG5vdCB0byBhZGQgdGhpcyBoZWxwZXIuCj4+Cj4+IEFu
ZCB0aGF0IHJlc3VsdHMgaW4gbW9yZSBjb2RlIGluIG1hbnkgcGxhY2VzIGluc3RlYWQgb2YgbGVz
cyBjb2RlICsgYSBzaW1wbGUKPj4gaW5saW5lIGhlbHBlciBpbiB0aGUgc2hyaW5rZXIgaGVhZGVy
IGZpbGUuLi4KPiAKPiBJdCdzIG5vdCBqdXN0IGEgInNpbXBsZSBoZWxwZXIiIC0gaXQncyBhIGZ1
bmN0aW9uIHRoYXQgaGFzIHRvIHRha2UgNgo+IG9yIDcgcGFyYW1ldGVycyB3aXRoIGEgcmV0dXJu
IHZhbHVlIHRoYXQgbXVzdCBiZSBjaGVja2VkIGFuZAo+IGhhbmRsZWQuCj4gCj4gVGhpcyB3YXMg
ZG9uZSBpbiB0aGUgZmlyc3QgdmVyc2lvbnMgb2YgdGhlIHBhdGNoIHNldCAtIHRoZSBhbW91bnQg
b2YKPiBjb2RlIGluIGVhY2ggY2FsbGVyIGRvZXMgbm90IGdvIGRvd24gYW5kLCBJTU8sIHdhcyBt
dWNoIGhhcmRlciB0bwo+IHJlYWQgYW5kIGRldGVybWluZSAidGhpcyBpcyBvYnZpb3VzbHkgY29y
cmVjdCIgdGhhdCB3aGF0IHdlIGhhdmUKPiBub3cuCj4gCj4+IFNvIG5vdCBhZGRpbmcgdGhhdCBz
dXBlciBzaW1wbGUKPj4gaGVscGVyIGlzIG5vdCBleGFjdGx5IHRoZSBiZXN0IGNob2ljZSBpbiBt
eSBvcGluaW9uLgo+IAo+IEVhY2ggdG8gdGhlaXIgb3duIC0gSSBtdWNoIHByZWZlciB0aGUgZXhp
c3Rpbmcgc3R5bGUvQVBJIG92ZXIgaGF2aW5nCj4gdG8gZ28gbG9vayB1cCBhIGhlbHBlciBmdW5j
dGlvbiBldmVyeSB0aW1lIEkgd2FudCB0byBjaGVjayBzb21lCj4gcmFuZG9tIHNocmlua2VyIGhh
cyBiZWVuIHNldCB1cCBjb3JyZWN0bHkuLi4uCgpPSy4gQWxsIGZhaXIgcG9pbnRzLgoKCi0tIApE
YW1pZW4gTGUgTW9hbApXZXN0ZXJuIERpZ2l0YWwgUmVzZWFyY2gKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
