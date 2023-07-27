Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0935CC04FDF
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 10:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QNTohSrF9iLs3klwf8RtUYDQxDB0R+gcuuP++irxk8U=; b=Fitmyp2mhhU/3J
	Xk9pY9RPEaw8cUYpo4F2Qu29ayTs674fGSW4FAFN4H/ALF+7XJleusZVQbcPQgxvHd+i0JDzdVnFW
	en86g5jn20sdo/jPeKRq6uTRl5sjnPje/nPvLr2tgwPuAQyuXnh84cUesu1KilY2OdcxpEnapNI6Q
	IQwHmTwmYwkEBpdrgItCkpnmGgQMKvAFfV6JTlGsDzggVkTBlkh/cSyvUejCxSWIOQwxM2Mge6leK
	yQEWU+4SYpy6iiiUN3i/lnq8C8HsItFWyXtgEknAL0owUgaU4tF6W24X+hvehvMcUg0IuyHNLpnCb
	e5gxyyNXHAPkaVql/zNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOy76-00Cyez-1k;
	Thu, 27 Jul 2023 10:20:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOy72-00Cye4-3C
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 10:20:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 44B6761DD3;
	Thu, 27 Jul 2023 10:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9266C433C8;
	Thu, 27 Jul 2023 10:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690453251;
	bh=Uv0jglg4XDxm5uiOcl1Fs0VDdmS3vnj5J06IHksC3j0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VjGCTE5fXWQGMkstr5mWfG/olGcukHbx9MJ5gIHM1kJfwo/BiFcjiuEaiA2TxQad6
	 b/CL9D78jYHhDiLBxLD9gCBB6CtR9Pngnq1E4RM+cWQl1ITCzXzhPBEMorh0UStJGb
	 V5QypMia7H1mT7Yv9W7oIRfkDRB1G3xJIxfo7Y/Lymzj+mXx3lcBAFmRFbWxhh8lk9
	 h4N9LjcMkMC3/ZfJEah0qCVly/fWQ4ostsbFgLI1m7GG/WQbkHJ87BAgn9cUsNUERW
	 XrnUyEDaK9+tFU+Iukly/qv+tfC9IZiVkgJJJYsmEkH+2gmJEivzAz4IAcCpkEsNUW
	 WY8rxT9ubVHrA==
Message-ID: <ba0868b2-9f90-3d81-1c91-8810057fb3ce@kernel.org>
Date: Thu, 27 Jul 2023 19:20:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 28/49] dm zoned: dynamically allocate the dm-zoned-meta
 shrinker
Content-Language: en-US
To: Qi Zheng <zhengqi.arch@bytedance.com>
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
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <56ee1d92-28ee-81cb-9c41-6ca7ea6556b0@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_032053_113338_355F5918 
X-CRM114-Status: GOOD (  13.78  )
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

T24gNy8yNy8yMyAxNzo1NSwgUWkgWmhlbmcgd3JvdGU6Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
Z290byBlcnI7Cj4+PiDCoMKgwqDCoMKgIH0KPj4+IMKgICvCoMKgwqAgem1kLT5tYmxrX3Nocmlu
a2VyLT5jb3VudF9vYmplY3RzID0gZG16X21ibG9ja19zaHJpbmtlcl9jb3VudDsKPj4+ICvCoMKg
wqAgem1kLT5tYmxrX3Nocmlua2VyLT5zY2FuX29iamVjdHMgPSBkbXpfbWJsb2NrX3Nocmlua2Vy
X3NjYW47Cj4+PiArwqDCoMKgIHptZC0+bWJsa19zaHJpbmtlci0+c2Vla3MgPSBERUZBVUxUX1NF
RUtTOwo+Pj4gK8KgwqDCoCB6bWQtPm1ibGtfc2hyaW5rZXItPnByaXZhdGVfZGF0YSA9IHptZDsK
Pj4+ICsKPj4+ICvCoMKgwqAgc2hyaW5rZXJfcmVnaXN0ZXIoem1kLT5tYmxrX3Nocmlua2VyKTsK
Pj4KPj4gSSBmYWlsIHRvIHNlZSBob3cgdGhpcyBuZXcgc2hyaW5rZXIgQVBJIGlzIGJldHRlci4u
LiBXaHkgaXNuJ3QgdGhlcmUgYQo+PiBzaHJpbmtlcl9hbGxvY19hbmRfcmVnaXN0ZXIoKSBmdW5j
dGlvbiA/IFRoYXQgd291bGQgYXZvaWQgYWRkaW5nIGFsbCB0aGlzIGNvZGUKPj4gYWxsIG92ZXIg
dGhlIHBsYWNlIGFzIHRoZSBuZXcgQVBJIGNhbGwgd291bGQgYmUgdmVyeSBzaW1pbGFyIHRvIHRo
ZSBjdXJyZW50Cj4+IHNocmlua2VyX3JlZ2lzdGVyKCkgY2FsbCB3aXRoIHN0YXRpYyBhbGxvY2F0
aW9uLgo+IAo+IEluIHNvbWUgcmVnaXN0cmF0aW9uIHNjZW5hcmlvcywgbWVtb3J5IG5lZWRzIHRv
IGJlIGFsbG9jYXRlZCBpbiBhZHZhbmNlLgo+IFNvIHdlIGNvbnRpbnVlIHRvIHVzZSB0aGUgcHJl
dmlvdXMgcHJlYWxsb2MvcmVnaXN0ZXJfcHJlcGFyZWQoKQo+IGFsZ29yaXRobS4gVGhlIHNocmlu
a2VyX2FsbG9jX2FuZF9yZWdpc3RlcigpIGlzIGp1c3QgYSBoZWxwZXIgZnVuY3Rpb24KPiB0aGF0
IGNvbWJpbmVzIHRoZSB0d28sIGFuZCB0aGlzIGluY3JlYXNlcyB0aGUgbnVtYmVyIG9mIEFQSXMg
dGhhdAo+IHNocmlua2VyIGV4cG9zZXMgdG8gdGhlIG91dHNpZGUsIHNvIEkgY2hvb3NlIG5vdCB0
byBhZGQgdGhpcyBoZWxwZXIuCgpBbmQgdGhhdCByZXN1bHRzIGluIG1vcmUgY29kZSBpbiBtYW55
IHBsYWNlcyBpbnN0ZWFkIG9mIGxlc3MgY29kZSArIGEgc2ltcGxlCmlubGluZSBoZWxwZXIgaW4g
dGhlIHNocmlua2VyIGhlYWRlciBmaWxlLi4uIFNvIG5vdCBhZGRpbmcgdGhhdCBzdXBlciBzaW1w
bGUKaGVscGVyIGlzIG5vdCBleGFjdGx5IHRoZSBiZXN0IGNob2ljZSBpbiBteSBvcGluaW9uLgoK
LS0gCkRhbWllbiBMZSBNb2FsCldlc3Rlcm4gRGlnaXRhbCBSZXNlYXJjaAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
