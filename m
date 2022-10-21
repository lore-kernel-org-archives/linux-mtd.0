Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDF6C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8Rqt1HkhNzGl0jjPCEdGypztORiyKzKOkK9ac1kQg4=; b=vdes12DgS5dR22Qr5ein1Rm66A
	xoYRA4As+Nnh2FdWHeC/UyXqrShWx5flcmBp4Jzi90PXzfe79SIcJc13oqTZnGWhedkOxHEwUZDA2
	WAgq3rIZRGSCL4q0NSRKa0L9H7+pc1VLqZVoGcCTuzYejjHa5NNlRiqXh2oSuGNWletccVUsgS7hh
	iF61r4vsPyiMNA6vSjxXNlB+ogH4mRlhhpoXLrUgqbj0BB7GW2+U9b4j+jjW+gs1XCLUSDFBaVbD4
	whrNaeJFiElLm9klb4tdQaExFSnijM61MItdQ5piq8lf61dmW2gJsb8u5rLHCWG/L9IpA/7gDty0r
	QMqffefw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnKv-006KR7-5V; Fri, 21 Oct 2022 08:25:01 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olnKr-006KOi-BB
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 08:24:59 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Mty7v25HnzVj06;
	Fri, 21 Oct 2022 16:20:11 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 16:24:25 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 16:24:24 +0800
Subject: Re: [PATCH 00/11] fix memory leak while kset_register() fails
To: Greg KH <gregkh@linuxfoundation.org>, Luben Tuikov <luben.tuikov@amd.com>
CC: <linux-kernel@vger.kernel.org>, <qemu-devel@nongnu.org>,
	<linux-f2fs-devel@lists.sourceforge.net>, <linux-erofs@lists.ozlabs.org>,
	<ocfs2-devel@oss.oracle.com>, <linux-mtd@lists.infradead.org>,
	<amd-gfx@lists.freedesktop.org>, <rafael@kernel.org>, <somlo@cmu.edu>,
	<mst@redhat.com>, <jaegeuk@kernel.org>, <chao@kernel.org>,
	<hsiangkao@linux.alibaba.com>, <huangjianan@oppo.com>, <mark@fasheh.com>,
	<jlbec@evilplan.org>, <joseph.qi@linux.alibaba.com>,
	<akpm@linux-foundation.org>, <alexander.deucher@amd.com>, <richard@nod.at>,
	<liushixin2@huawei.com>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
 <d559793a-0ce4-3384-e74e-19855aa31f31@amd.com> <Y1IwLOUGayjT9p6d@kroah.com>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <0591e66f-731a-5f81-fc9d-3a6d80516c65@huawei.com>
Date: Fri, 21 Oct 2022 16:24:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <Y1IwLOUGayjT9p6d@kroah.com>
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_012457_749229_B8F0BDD3 
X-CRM114-Status: GOOD (  17.27  )
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

Ck9uIDIwMjIvMTAvMjEgMTM6MzcsIEdyZWcgS0ggd3JvdGU6Cj4gT24gRnJpLCBPY3QgMjEsIDIw
MjIgYXQgMDE6Mjk6MzFBTSAtMDQwMCwgTHViZW4gVHVpa292IHdyb3RlOgo+PiBPbiAyMDIyLTEw
LTIwIDIyOjIwLCBZYW5nIFlpbmdsaWFuZyB3cm90ZToKPj4+IFRoZSBwcmV2aW91cyBkaXNjdXNz
aW9uIGxpbms6Cj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzBkYjQ4NmViLTY5Mjct
OTI3ZS0zNjI5LTk1OGY4ZjIxMTE5NEBodWF3ZWkuY29tL1QvCj4+IFRoZSB2ZXJ5IGZpcnN0IGRp
c2N1c3Npb24gb24gdGhpcyB3YXMgaGVyZToKPj4KPj4gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQv
bGlzdHMvZHJpLWRldmVsL21zZzM2ODA3Ny5odG1sCj4+Cj4+IFBsZWFzZSB1c2UgdGhpcyBsaW5r
LCBhbmQgbm90IHRoZSB0aGF0IG9uZSB1cCB0aGVyZSB5b3Ugd2hpY2ggcXVvdGVkIGFib3ZlLAo+
PiBhbmQgd2hvc2UgY29tbWl0IGRlc2NyaXB0aW9uIGlzIHRha2VuIHZlcmJhdGltIGZyb20gdGhl
IHRoaXMgbGluay4KPj4KPj4+IGtzZXRfcmVnaXN0ZXIoKSBpcyBjdXJyZW50bHkgdXNlZCBpbiBz
b21lIHBsYWNlcyB3aXRob3V0IGNhbGxpbmcKPj4+IGtzZXRfcHV0KCkgaW4gZXJyb3IgcGF0aCwg
YmVjYXVzZSB0aGUgY2FsbGVycyB0aGluayBpdCBzaG91bGQgYmUKPj4+IGtzZXQgaW50ZXJuYWwg
dGhpbmcgdG8gZG8sIGJ1dCB0aGUgZHJpdmVyIGNvcmUgY2FuIG5vdCBrbm93IHdoYXQKPj4+IGNh
bGxlciBkb2luZyB3aXRoIHRoYXQgbWVtb3J5IGF0IHRpbWVzLiBUaGUgbWVtb3J5IGNvdWxkIGJl
IGZyZWVkCj4+PiBib3RoIGluIGtzZXRfcHV0KCkgYW5kIGVycm9yIHBhdGggb2YgY2FsbGVyLCBp
ZiBpdCBpcyBjYWxsZWQgaW4KPj4+IGtzZXRfcmVnaXN0ZXIoKS4KPj4gQXMgSSBleHBsYWluZWQg
aW4gdGhlIGxpbmsgYWJvdmUsIHRoZSByZWFzb24gdGhlcmUncwo+PiBhIG1lbW9yeSBsZWFrIGlz
IHRoYXQgb25lIGNhbm5vdCBjYWxsIGtzZXRfcmVnaXN0ZXIoKSB3aXRob3V0Cj4+IHRoZSBrc2V0
LT5rb2JqLm5hbWUgYmVpbmcgc2V0LS1rb2JqX2FkZF9pbnRlcm5hbCgpIHJldHVybnMgLUVJTlZB
TCwKPj4gaW4gdGhpcyBjYXNlLCBpLmUuIGtzZXRfcmVnaXN0ZXIoKSBmYWlscyB3aXRoIC1FSU5W
QUwuCj4+Cj4+IFRodXMsIHRoZSBtb3N0IGNvbW1vbiB1c2FnZSBpcyBzb21ldGhpbmcgbGlrZSB0
aGlzOgo+Pgo+PiAJa29ial9zZXRfbmFtZSgma3NldC0+a29iaiwgZm9ybWF0LCAuLi4pOwo+PiAJ
a3NldC0+a29iai5rc2V0ID0gcGFyZW50X2tzZXQ7Cj4+IAlrc2V0LT5rb2JqLmt0eXBlID0ga3R5
cGU7Cj4+IAlyZXMgPSBrc2V0X3JlZ2lzdGVyKGtzZXQpOwo+Pgo+PiBTbywgd2hhdCBpcyBiZWlu
ZyBsZWFrZWQsIGlzIHRoZSBtZW1vcnkgYWxsb2NhdGVkIGluIGtvYmpfc2V0X25hbWUoKSwKPj4g
YnkgdGhlIGNvbW1vbiBpZGlvbSBzaG93biBhYm92ZS4gVGhpcyBuZWVkcyB0byBiZSBtZW50aW9u
ZWQgaW4KPj4gdGhlIGRvY3VtZW50YXRpb24sIGF0IGxlYXN0LCBpbiBjYXNlLCBpbiB0aGUgZnV0
dXJlIHRoaXMgaXMgYWJzb2x2ZWQKPj4gaW4ga3NldF9yZWdpc3RlcigpIHJlZGVzaWduLCBldGMu
Cj4gQmFzZWQgb24gdGhpcywgY2FuIGtzZXRfcmVnaXN0ZXIoKSBqdXN0IGNsZWFuIHVwIGZyb20g
aXRzZWxmIHdoZW4gYW4KPiBlcnJvciBoYXBwZW5zPyAgSWRlYWxseSB0aGF0IHdvdWxkIGJlIHRo
ZSBjYXNlLCBhcyB0aGUgb2RkcyBvZiBhIGtzZXQKPiBiZWluZyBlbWJlZGRlZCBpbiBhIGxhcmdl
ciBzdHJ1Y3R1cmUgaXMgcHJvYmFibHkgc2xpbSwgYnV0IHdlIHdvdWxkIGhhdmUKPiB0byBzZWFy
Y2ggdGhlIHRyZWUgdG8gbWFrZSBzdXJlLgpJIGhhdmUgc2VhcmNoIHRoZSB3aG9sZSB0cmVlLCB0
aGUga3NldCB1c2VkIGluIGJ1c19yZWdpc3RlcigpIC0gcGF0Y2ggCiMzLCBrc2V0X2NyZWF0ZV9h
bmRfYWRkKCkgLSBwYXRjaCAjNApfX2NsYXNzX3JlZ2lzdGVyKCkgLSBwYXRjaCAjNSzCoCBmd19j
ZmdfYnVpbGRfc3ltbGluaygpIC0gcGF0Y2ggIzYgYW5kIAphbWRncHVfZGlzY292ZXJ5LmMgLSBw
YXRjaCAjMTAKaXMgZW1iZWRkZWQgaW4gYSBsYXJnZXIgc3RydWN0dXJlLiBJbiB0aGVzZSBjYXNl
cywgd2UgY2FuIG5vdCBjYWxsIAprc2V0X3B1dCgpIGluIGVycm9yIHBhdGggaW4ga3NldF9yZWdp
c3RlcigpCml0c2VsZi4KClRoYW5rcywKWWFuZwo+Cj4gdGhhbmtzLAo+Cj4gZ3JlZyBrLWgKPiAu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
