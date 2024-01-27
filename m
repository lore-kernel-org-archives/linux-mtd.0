Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83739C46CD2
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Jan 2024 10:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHkArP3PTlYiuWHex/6kDwTcLUFWQYPVBp4EpsTA/Rs=; b=Tgbvxv9dlgTWtFRvLrcbKeagz1
	VYETLnoXOnRuzMUsitB8kpqPiztiED5MnSjtq80sA7SaYgT4j2ODtNKBSoqw3F7znsK8UPPiMNOjR
	sowk8yBKclIzBC7nL7mbwLHki/ITuwGjwqpdTvuyklSOI/u4GDIdBy3GSy7CIFSW0wBfbzHuZvZuu
	x/GxIK5m9dZfBc9oofdeAxpJIAALUH3tqdQmlhuOXB1onP/CsgZc9oGCPNwqY5idyJzSNtz/K2UtC
	cVE62UOz33+LBbIAfMS/D73EBtN+px1ghMUYMEZFLUP1OsJNHGO53/KLIFyG8C0YLHLE/bXDFeC00
	0qLhECCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTfoi-00000007Lr9-29VE;
	Sat, 27 Jan 2024 10:21:40 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTfof-00000007Lqh-3Aqg
	for linux-mtd@lists.infradead.org;
	Sat, 27 Jan 2024 10:21:39 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4TMVv55c48zNlgg
	for <linux-mtd@lists.infradead.org>; Sat, 27 Jan 2024 18:20:33 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id CD9B9180079
	for <linux-mtd@lists.infradead.org>; Sat, 27 Jan 2024 18:21:29 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 27 Jan 2024 18:21:29 +0800
Subject: Re: ubifs: master area fails to recover when master node 1 is
 corrupted
From: Zhihao Cheng <chengzhihao1@huawei.com>
To: Ryder Wang <rydercoding@hotmail.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
References: <MEYP282MB3164FE84067710E5AC8D34A9BF7A2@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
 <45ef54d1-582b-e6a8-f8f7-291f9b4c98c4@huawei.com>
 <MEYP282MB3164A9167C34C14EAC15663ABF782@MEYP282MB3164.AUSP282.PROD.OUTLOOK.COM>
 <628521b7-36c1-ab83-4e98-752d6ff71017@huawei.com>
Message-ID: <f598a16b-336b-3943-f648-e58970258e75@huawei.com>
Date: Sat, 27 Jan 2024 18:21:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <628521b7-36c1-ab83-4e98-752d6ff71017@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_022138_182422_142CA55E 
X-CRM114-Status: GOOD (  20.42  )
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

5ZyoIDIwMjQvMS8yNyAxNzozOSwgWmhpaGFvIENoZW5nIOWGmemBkzoKPiDlnKggMjAyNC8xLzI3
IDE1OjIxLCBSeWRlciBXYW5nIOWGmemBkzoKPj4gSGkgWmhpaGFvLAo+Pgo+PiBZb3VyIGV4cGxh
bmF0aW9uIGlzIHZlcnkgcHJvZmVzc2lvbmFsLiBUaGFua3MgZm9yIGl0Lgo+Pgo+PiBCdXQgSSBz
dGlsbCBoYXZlIGEgZG91YnQgYWJvdXQgdGhlIGNvZGUgbG9naWM6Cj4+IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiDCoMKgIGlmIChtc3QxKSAvLyBmYWxzZQo+PiDCoMKg
IGVsc2Ugewo+PiDCoMKgwqAgb2ZmczIgPSAodm9pZCAqKW1zdDIgLSBidWYyO8KgIC8vIG9mZnMy
ID0gMAo+PiDCoMKgwqAgaWYgKG9mZnMyICsgc3ogKyBzeiA8PSBjLT5sZWJfc2l6ZSkgLy8gdHJ1
ZSwgbXN0MiBpcyB0aGUgZmlyc3QgCj4+IG5vZGUgaW4gTEVCIDIKPj4gwqDCoMKgwqDCoCBnb3Rv
IG91dF9lcnIKPj4gwqDCoCB9Cj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+PiAxLiBNeSB0ZXN0aW5nIHJlc3VsdCBqdXN0IHByb3ZlZCB0aGF0IENSQy1jb3JydXB0ZWQg
bWFzdGVyIzEgYWxzbyBydW5zIAo+PiB0byAiZWxzZSIgY2xhdXNlIG9mIHRoZSBjb2RlIGFib3Zl
LCBqdXN0IGxpa2UgbWFzdGVyIzEgaXMgdW5tYXBwZWQuCj4+IDIuIEZvciBDUkMgY29ycnVwdGVk
IG1hc3RlciMxIGNhc2UsIHRoZSBjb2RlIGxvZ2ljIGxvb2tzIGluY29uc2lzdGVudDoKPj4gwqDC
oCAyLjEuIElmIG1hc3RlciMyIExFQiBpcyBqdXN0IHRvIGJlIGZ1bGwsIG1hc3RlciMyIHdpbGwg
YmUgdXNlZCB0byAKPj4gcmVjb3ZlciBtYXN0ZXIgYXJlYS4KPj4gwqDCoCAyLjIuIElmIG1hc3Rl
ciMyIExFQiBpcyBub3QgdG8gYmUgZnVsbCwgbWFzdGVyIHJlY292ZXJpbmcgd2lsbCBiZSAKPj4g
YWJvcnRlZCB3aXRoIGVycm9yLgo+Pgo+PiBJIHRoaW5rIHdoZXRoZXIgbWFzdGVyIzIgTEVCIGlz
IHRvIGJlIGZ1bGwgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCAKPj4gd2hldGhlciB0byByZWNvdmVy
IG1hc3RlciBhcmVhIGluIHN1Y2ggY2FzZS4gSG93IGRvIHlvdSB0aGluayBhYm91dCBpdD8KPiAK
PiAKPiBBY3R1YWxseSwgVUJJRlMgY2FuIHN0aWxsIHdvcmsgZXZlbiBpZiBtYXN0ZXIjMiBpcyBy
ZWNvdmVyZWQgaW4gc3VjaCAKPiBjYXNlKG1hc3RlciMxIGlzIGNvcnJ1cHRlZCksIGJlY2F1c2Ug
dGhlIG1hc3RlciMyIGlzIHRoZSBuZXdlc3QgdmVyc2lvbi4KPiBUaGUgb2Zmc2V0IGNoZWNraW5n
IGZvciBtYXN0ZXIjMiBMRUIgYmVpbmcgZnVsbCBpcyBhIHdheSB0byBtYWtlIHN1cmUgCj4gdGhh
dCBVQklGUyBjYW4gZmluZCB0aGUgbmV3ZXN0IG1hc3RlciBub2RlLiBJZiB3ZSBzaW1wbHkgcmVt
b3ZlIHRoZSAKPiBjaGVja2luZywgVUJJRlMgY291bGQgZ28gd3JvbmcgaW4gc29tZSBzaXR1YXRp
b25zLCBmb3IgZXhhbXBsZToKPiAKPiBQb3dlcmN1dCBoYXBwZW5zIGJlZm9yZSB3cml0aW5nIG1z
dDJfdjIgb24gTEVCMiwgc28gdGhlIFVCSUZTIGltYWdlIAo+IGxvb2tzIGxpa2U6Cj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBMRUIxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTEVCMgo+IHxtc3QxX3YxIHwgbXN0MV92MiB8
MHhGRiAweEZGIC4uLiB8wqDCoMKgwqDCoCB8bXN0Ml92MSB8IDB4RkYgMHhGRiAuLi4gfAo+IAo+
IFRoZSBtYXN0MV92MiBpcyBleHBlY3RlZCB0byBiZSByZWNvdmVyZWQgYWZ0ZXIgZXhldWN0aW5n
IAo+IHViaWZzX3JlY292ZXJfbWFzdGVyX25vZGUoKS4gSWYgYm90aCBtc3QxX3YxIGFuZCBtc3Qx
X3YyIGFyZSBjb3JydXB0ZWQsIAo+IFVCSUZTIHdpbGwgZW50ZXIgaW50byB0aGlzIGJyYW5jaDoK
PiAKPiAgwqDCoCBpZiAobXN0MSkgLy8gZmFsc2UKPiAgwqDCoCBlbHNlIHsKPiAgwqDCoMKgwqAg
b2ZmczIgPSAodm9pZCAqKW1zdDIgLSBidWYyO8KgIC8vIG9mZnMyID0gMAo+ICDCoMKgwqDCoCBp
ZiAob2ZmczIgKyBzeiArIHN6IDw9IGMtPmxlYl9zaXplKSAvLyBvZmZzZXQgY2hlY2tpbmcKPiAg
wqDCoMKgwqDCoMKgIGdvdG8gb3V0X2Vycgo+ICDCoMKgwqDCoCBtc3QgPSBtc3QyOwo+ICDCoMKg
IH0KPiBJZiB0aGUgb2Zmc2V0IGNoZWNraW5nIGlzIHJlbW92ZWQsIG1zdF8yX3YxIGlzIHJlY292
ZXJlZCwgYXBwZXJhbnRseSwgCj4gVUJJRlMgcGlja3Mgd3JvbmcgbWFzdGVyIG5vZGUgYW5kIGl0
J3Mgbm90IHJpZ2h0Lgo+IAo+IFNvIGFjY29kcmluZyB0byB0aGUgcmVhbGl6YXRpb24gb2YgdWJp
ZnNfcmVjb3Zlcl9tYXN0ZXJfbm9kZSgpLCBVQkZJUyAKPiBjaG9vc2UgdGhlIG5ld2VzdCBtYXN0
ZXIgbm9kZSBieSB2YXJpb3VzIG9mZnNldCBjaGVja2luZywgaXQncyBqdXN0IGxpa2UgCj4gYSB3
aGl0ZWxpc3Qgb2Ygc2l0dWF0aW9ucyB0aGF0IFVCSUZTIGNhbiBmdWxseSB0cnVzdCBvbiwgb3Ro
ZXIgCj4gc2l0dWF0aW9ucyBhcmUgZmFpbHVyZSBwYXRoZXMsIGFsdGhvdWdoIHNvbWUgb2YgZmFp
bHVyZSBwYXRoZXMgY2FuIG1ha2UgCj4gVUJJRlMgc3RpbGwgZ2V0IGEgcmlnaHQgbWFzdGVyIG5v
ZGUgaW4gc29tZShub3QgYWxsKSBjYXNlcy4KPiAKCkJlc2lkZXMsIGlmIHRoZXJlIGFyZSBjb3Jy
dXB0aW9ucyBpbiBVQklGUyBpbWFnZSwgVUJJRlMgc2hvdWxkIHJlcG9ydCAKZXJyb3IsIHRoZXJl
IGlzIG5vdGhpbmcgdGhhdCBVQklGUyBjYW4gZG8gdG8gZml4IHRoZW0uCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
