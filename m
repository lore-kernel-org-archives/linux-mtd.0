Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89077C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Oct 2022 09:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ctvm72/f9+xAyd81IPATkoPiLoH1qgeyRUbN9GdQx8M=; b=s5EbJsZ35Dsrj64CnRYOh6vVRm
	jcGdhkwWCKfpjBY335/RKN79YejkUetAiRd6ikXICvFW7blRPxc9GO8DqcdYYX43nUnf+xM0MloV7
	D/Yvh9xFTAIU8xWejk33k3m8u7tE08/FRf4So/u8zfTYzC+opVHoWjXbdAo3Zz6wNuzYjRTneBRfA
	mUGetxfyefUKAy88VXRD++LdK1KSN+hRpOH0atzDbC2idDhhdVAqlMPHUdbS1DSDlH1lpSy/tbk4B
	NDVFEN32AsZOvMoEKrLG9ITuwb/OwHPgQyZ1XDharAw152/NriM1CL6UWQxDtZMPXAOniC0/f05y1
	NAhyDEiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olo5d-006huW-Pf; Fri, 21 Oct 2022 09:13:17 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olo5Z-006hoF-MN
	for linux-mtd@lists.infradead.org; Fri, 21 Oct 2022 09:13:16 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MtzJb6fMCzHvCS;
	Fri, 21 Oct 2022 17:12:47 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 17:12:39 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 17:12:38 +0800
Subject: Re: [PATCH 00/11] fix memory leak while kset_register() fails
To: Greg KH <gregkh@linuxfoundation.org>
CC: Luben Tuikov <luben.tuikov@amd.com>, <linux-kernel@vger.kernel.org>,
	<qemu-devel@nongnu.org>, <linux-f2fs-devel@lists.sourceforge.net>,
	<linux-erofs@lists.ozlabs.org>, <ocfs2-devel@oss.oracle.com>,
	<linux-mtd@lists.infradead.org>, <amd-gfx@lists.freedesktop.org>,
	<rafael@kernel.org>, <somlo@cmu.edu>, <mst@redhat.com>, <jaegeuk@kernel.org>,
	<chao@kernel.org>, <hsiangkao@linux.alibaba.com>, <huangjianan@oppo.com>,
	<mark@fasheh.com>, <jlbec@evilplan.org>, <joseph.qi@linux.alibaba.com>,
	<akpm@linux-foundation.org>, <alexander.deucher@amd.com>, <richard@nod.at>,
	<liushixin2@huawei.com>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
 <d559793a-0ce4-3384-e74e-19855aa31f31@amd.com> <Y1IwLOUGayjT9p6d@kroah.com>
 <0591e66f-731a-5f81-fc9d-3a6d80516c65@huawei.com>
 <Y1JZ9IUPL6jZIQ8E@kroah.com>
From: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <1f3aa2ac-fba6-dc7a-d01d-7dd5331c8dc5@huawei.com>
Date: Fri, 21 Oct 2022 17:12:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <Y1JZ9IUPL6jZIQ8E@kroah.com>
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_021314_096922_B68DA7E9 
X-CRM114-Status: GOOD (  26.32  )
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

Ck9uIDIwMjIvMTAvMjEgMTY6MzYsIEdyZWcgS0ggd3JvdGU6Cj4gT24gRnJpLCBPY3QgMjEsIDIw
MjIgYXQgMDQ6MjQ6MjNQTSArMDgwMCwgWWFuZyBZaW5nbGlhbmcgd3JvdGU6Cj4+IE9uIDIwMjIv
MTAvMjEgMTM6MzcsIEdyZWcgS0ggd3JvdGU6Cj4+PiBPbiBGcmksIE9jdCAyMSwgMjAyMiBhdCAw
MToyOTozMUFNIC0wNDAwLCBMdWJlbiBUdWlrb3Ygd3JvdGU6Cj4+Pj4gT24gMjAyMi0xMC0yMCAy
MjoyMCwgWWFuZyBZaW5nbGlhbmcgd3JvdGU6Cj4+Pj4+IFRoZSBwcmV2aW91cyBkaXNjdXNzaW9u
IGxpbms6Cj4+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMGRiNDg2ZWItNjkyNy05
MjdlLTM2MjktOTU4ZjhmMjExMTk0QGh1YXdlaS5jb20vVC8KPj4+PiBUaGUgdmVyeSBmaXJzdCBk
aXNjdXNzaW9uIG9uIHRoaXMgd2FzIGhlcmU6Cj4+Pj4KPj4+PiBodHRwczovL3d3dy5zcGluaWNz
Lm5ldC9saXN0cy9kcmktZGV2ZWwvbXNnMzY4MDc3Lmh0bWwKPj4+Pgo+Pj4+IFBsZWFzZSB1c2Ug
dGhpcyBsaW5rLCBhbmQgbm90IHRoZSB0aGF0IG9uZSB1cCB0aGVyZSB5b3Ugd2hpY2ggcXVvdGVk
IGFib3ZlLAo+Pj4+IGFuZCB3aG9zZSBjb21taXQgZGVzY3JpcHRpb24gaXMgdGFrZW4gdmVyYmF0
aW0gZnJvbSB0aGUgdGhpcyBsaW5rLgo+Pj4+Cj4+Pj4+IGtzZXRfcmVnaXN0ZXIoKSBpcyBjdXJy
ZW50bHkgdXNlZCBpbiBzb21lIHBsYWNlcyB3aXRob3V0IGNhbGxpbmcKPj4+Pj4ga3NldF9wdXQo
KSBpbiBlcnJvciBwYXRoLCBiZWNhdXNlIHRoZSBjYWxsZXJzIHRoaW5rIGl0IHNob3VsZCBiZQo+
Pj4+PiBrc2V0IGludGVybmFsIHRoaW5nIHRvIGRvLCBidXQgdGhlIGRyaXZlciBjb3JlIGNhbiBu
b3Qga25vdyB3aGF0Cj4+Pj4+IGNhbGxlciBkb2luZyB3aXRoIHRoYXQgbWVtb3J5IGF0IHRpbWVz
LiBUaGUgbWVtb3J5IGNvdWxkIGJlIGZyZWVkCj4+Pj4+IGJvdGggaW4ga3NldF9wdXQoKSBhbmQg
ZXJyb3IgcGF0aCBvZiBjYWxsZXIsIGlmIGl0IGlzIGNhbGxlZCBpbgo+Pj4+PiBrc2V0X3JlZ2lz
dGVyKCkuCj4+Pj4gQXMgSSBleHBsYWluZWQgaW4gdGhlIGxpbmsgYWJvdmUsIHRoZSByZWFzb24g
dGhlcmUncwo+Pj4+IGEgbWVtb3J5IGxlYWsgaXMgdGhhdCBvbmUgY2Fubm90IGNhbGwga3NldF9y
ZWdpc3RlcigpIHdpdGhvdXQKPj4+PiB0aGUga3NldC0+a29iai5uYW1lIGJlaW5nIHNldC0ta29i
al9hZGRfaW50ZXJuYWwoKSByZXR1cm5zIC1FSU5WQUwsCj4+Pj4gaW4gdGhpcyBjYXNlLCBpLmUu
IGtzZXRfcmVnaXN0ZXIoKSBmYWlscyB3aXRoIC1FSU5WQUwuCj4+Pj4KPj4+PiBUaHVzLCB0aGUg
bW9zdCBjb21tb24gdXNhZ2UgaXMgc29tZXRoaW5nIGxpa2UgdGhpczoKPj4+Pgo+Pj4+IAlrb2Jq
X3NldF9uYW1lKCZrc2V0LT5rb2JqLCBmb3JtYXQsIC4uLik7Cj4+Pj4gCWtzZXQtPmtvYmoua3Nl
dCA9IHBhcmVudF9rc2V0Owo+Pj4+IAlrc2V0LT5rb2JqLmt0eXBlID0ga3R5cGU7Cj4+Pj4gCXJl
cyA9IGtzZXRfcmVnaXN0ZXIoa3NldCk7Cj4+Pj4KPj4+PiBTbywgd2hhdCBpcyBiZWluZyBsZWFr
ZWQsIGlzIHRoZSBtZW1vcnkgYWxsb2NhdGVkIGluIGtvYmpfc2V0X25hbWUoKSwKPj4+PiBieSB0
aGUgY29tbW9uIGlkaW9tIHNob3duIGFib3ZlLiBUaGlzIG5lZWRzIHRvIGJlIG1lbnRpb25lZCBp
bgo+Pj4+IHRoZSBkb2N1bWVudGF0aW9uLCBhdCBsZWFzdCwgaW4gY2FzZSwgaW4gdGhlIGZ1dHVy
ZSB0aGlzIGlzIGFic29sdmVkCj4+Pj4gaW4ga3NldF9yZWdpc3RlcigpIHJlZGVzaWduLCBldGMu
Cj4+PiBCYXNlZCBvbiB0aGlzLCBjYW4ga3NldF9yZWdpc3RlcigpIGp1c3QgY2xlYW4gdXAgZnJv
bSBpdHNlbGYgd2hlbiBhbgo+Pj4gZXJyb3IgaGFwcGVucz8gIElkZWFsbHkgdGhhdCB3b3VsZCBi
ZSB0aGUgY2FzZSwgYXMgdGhlIG9kZHMgb2YgYSBrc2V0Cj4+PiBiZWluZyBlbWJlZGRlZCBpbiBh
IGxhcmdlciBzdHJ1Y3R1cmUgaXMgcHJvYmFibHkgc2xpbSwgYnV0IHdlIHdvdWxkIGhhdmUKPj4+
IHRvIHNlYXJjaCB0aGUgdHJlZSB0byBtYWtlIHN1cmUuCj4+IEkgaGF2ZSBzZWFyY2ggdGhlIHdo
b2xlIHRyZWUsIHRoZSBrc2V0IHVzZWQgaW4gYnVzX3JlZ2lzdGVyKCkgLSBwYXRjaCAjMywKPj4g
a3NldF9jcmVhdGVfYW5kX2FkZCgpIC0gcGF0Y2ggIzQKPj4gX19jbGFzc19yZWdpc3RlcigpIC0g
cGF0Y2ggIzUswqAgZndfY2ZnX2J1aWxkX3N5bWxpbmsoKSAtIHBhdGNoICM2IGFuZAo+PiBhbWRn
cHVfZGlzY292ZXJ5LmMgLSBwYXRjaCAjMTAKPj4gaXMgZW1iZWRkZWQgaW4gYSBsYXJnZXIgc3Ry
dWN0dXJlLiBJbiB0aGVzZSBjYXNlcywgd2UgY2FuIG5vdCBjYWxsCj4+IGtzZXRfcHV0KCkgaW4g
ZXJyb3IgcGF0aCBpbiBrc2V0X3JlZ2lzdGVyKCkKPiBZZXMgeW91IGNhbiBhcyB0aGUga29iamVj
dCBpbiB0aGUga3NldCBzaG91bGQgTk9UIGJlIGNvbnRyb2xpbmcgdGhlCj4gbGlmZXNwYW4gb2Yg
dGhvc2UgbGFyZ2VyIG9iamVjdHMuClJlYWQgdGhyb3VnaCB0aGUgY29kZSB0aGUgb25seSBsZWFr
IGluIHRoaXMgY2FzZSBpcyB0aGUgbmFtZSwgc28gY2FuIHdlIApmcmVlIGl0CmRpcmVjdGx5IGlu
IGtzZXRfcmVnaXN0ZXIoKToKCi0tLSBhL2xpYi9rb2JqZWN0LmMKKysrIGIvbGliL2tvYmplY3Qu
YwpAQCAtODQ0LDggKzg0NCwxMSBAQCBpbnQga3NldF9yZWdpc3RlcihzdHJ1Y3Qga3NldCAqaykK
CiDCoMKgwqDCoMKgwqDCoCBrc2V0X2luaXQoayk7CiDCoMKgwqDCoMKgwqDCoCBlcnIgPSBrb2Jq
ZWN0X2FkZF9pbnRlcm5hbCgmay0+a29iaik7Ci3CoMKgwqDCoMKgwqAgaWYgKGVycikKK8KgwqDC
oMKgwqDCoCBpZiAoZXJyKSB7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGtmcmVlX2Nv
bnN0KGstPmtvYmoubmFtZSk7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGstPmtvYmou
bmFtZSA9IE5VTEw7CiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGVycjsK
K8KgwqDCoMKgwqDCoCB9CiDCoMKgwqDCoMKgwqDCoCBrb2JqZWN0X3VldmVudCgmay0+a29iaiwg
S09CSl9BREQpOwogwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7CiDCoH0KCm9yIHVuc2V0IGt0eXBl
IG9mIGtvYmplY3QsIHRoZW4gY2FsbCBrc2V0X3B1dCgpOgoKLS0tIGEvbGliL2tvYmplY3QuYwor
KysgYi9saWIva29iamVjdC5jCkBAIC04NDQsOCArODQ0LDExIEBAIGludCBrc2V0X3JlZ2lzdGVy
KHN0cnVjdCBrc2V0ICprKQoKIMKgwqDCoMKgwqDCoMKgIGtzZXRfaW5pdChrKTsKIMKgwqDCoMKg
wqDCoMKgIGVyciA9IGtvYmplY3RfYWRkX2ludGVybmFsKCZrLT5rb2JqKTsKLcKgwqDCoMKgwqDC
oCBpZiAoZXJyKQorwqDCoMKgwqDCoMKgIGlmIChlcnIpIHsKK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgay0+a29iai5rdHlwZSA9IE5VTEw7CivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGtzZXRfcHV0KGspOwogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBl
cnI7CivCoMKgwqDCoMKgwqAgfQogwqDCoMKgwqDCoMKgwqAga29iamVjdF91ZXZlbnQoJmstPmtv
YmosIEtPQkpfQUREKTsKIMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwogwqB9Cgo+Cj4gSWYgaXQg
aXMsIHBsZWFzZSBwb2ludCBvdXQgdGhlIGNhbGwgY2hhaW4gaGVyZSBhcyBJIGRvbid0IHRoaW5r
IHRoYXQKPiBzaG91bGQgYmUgcG9zc2libGUuCj4KPiBOb3RlIGFsbCBvZiB0aGlzIGlzIGEgbWVz
cyBiZWNhdXNlIHRoZSBrb2JqZWN0IG5hbWUgc3R1ZmYgd2FzIGFkZGVkIG11Y2gKPiBsYXRlciwg
YWZ0ZXIgdGhlIGRyaXZlciBtb2RlbCBoYWQgYmVlbiBjcmVhdGVkIGFuZCBydW5uaW5nIGZvciBh
IHdoaWxlLgo+IFdlIG1pc3NlZCB0aGlzIGVycm9yIHBhdGggd2hlbiBhZGRpbmcgdGhlIGR5bmFt
aWMga29iamVjdCBuYW1lIGxvZ2ljLAo+IHRoYW5rIGZvciBsb29raW5nIGludG8gdGhpcy4KPgo+
IElmIHlvdSBjb3VsZCB0ZXN0IHRoZSBwYXRjaCBwb3N0ZWQgd2l0aCB5b3VyIGVycm9yIGluamVj
dGlvbiBzeXN0ZW1zLAo+IHRoYXQgY291bGQgbWFrZSB0aGlzIGFsbCBtdWNoIHNpbXBsZXIgdG8g
c29sdmUuCj4KPiB0aGFua3MsCj4KPiBncmVnIGstaAo+IC4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
