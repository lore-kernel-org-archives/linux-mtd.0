Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E63FB5EAC
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Mar 2026 04:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVwCcit3V7aBGtOeuDk3rH6pCH4KEgCAECBcFM2Lj24=; b=y8v5Wi+qc8qrb4UUvl+47IVk6d
	QZ+d0z2gwmuz8NX9odMlPJzYJfglDchTygB5cu7+d7R1vH6Gx2X2wFf5oE9q4OBhVy9otjPhZDpWB
	1fW04NNBbzAlvh+sl/T3PaTm8xkNl5nMXktylKVNYAOCXjyGUfmDHAotB4FS75ZOjRmNdpyilVBMH
	BBg0qlB2h0XNBCWuiLevZaxvUTvArI1KgBxi+EM0kb9foPw0swvlD7m0u6hib5sQqhkxeHvFZuzYP
	JOVb7O1qb9nYclsbmgqnQgHkzubf/0k/KoqHeXh59OAFzLTYYDy0mvyM4lEwbRNh9XaIH6LGJCFCM
	hcf+KCVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Lh5-00000005N3g-33GM;
	Tue, 17 Mar 2026 04:06:11 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Lh2-00000005N3K-3btc
	for linux-mtd@lists.infradead.org;
	Tue, 17 Mar 2026 04:06:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Ki3YG8bYlRFENAQ4EUe1mXA6kN9upbGqk5j28Sn1tEA=;
	b=l1VmAPDKdIa+fES1okQG9UmZfK3fsvBiOCivaQI7acc0PAxl7ddemi6nMbZH7x8BZN/MfIDRo
	DvQVVmKCanNeLDcc8Kk6nNRc8FUnM8NqOytimWnh20V9r/7oSwi4VvFkFSmWeRLCN9oy5aWoUge
	T2QZad30w3IIHmI367u+Kro=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fZdXR6nYdz12LCj;
	Tue, 17 Mar 2026 12:00:23 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 0F32040561;
	Tue, 17 Mar 2026 12:05:56 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 17 Mar 2026 12:05:55 +0800
Subject: Re: [PATCH] lib/list_sort: introduce list_sort_nonatomic() and remove
 dummy cmp() calls
To: Kuan-Wei Chiu <visitorckw@gmail.com>, <richard@nod.at>,
	<akpm@linux-foundation.org>
CC: <jserv@ccns.ncku.edu.tw>, <eleanor15x@gmail.com>, <marscheng@google.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260315193900.218737-1-visitorckw@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <7bb23ce1-a0f3-b576-ad79-c9fa746f11ed@huawei.com>
Date: Tue, 17 Mar 2026 12:05:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260315193900.218737-1-visitorckw@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_210609_387678_62FF0909 
X-CRM114-Status: GOOD (  24.51  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNi8zLzE2IDM6MzksIEt1YW4tV2VpIENoaXUg0LS1wDoKPiBIaXN0b3JpY2FsbHksIGxp
c3Rfc29ydCgpIGltcGxlbWVudGVkIGEgaGFjayBpbiBtZXJnZV9maW5hbCgpOgo+ICAgICAgaWYg
KHVubGlrZWx5KCErK2NvdW50KSkKPiAgICAgICAgICBjbXAocHJpdiwgYiwgYik7Cj4gCj4gVGhp
cyB3YXMgZGVzaWduZWQgc3BlY2lmaWNhbGx5IHNvIHRoYXQgY2FsbGVycyBjb3VsZCBwZXJpb2Rp
Y2FsbHkKPiBpbnZva2UgY29uZF9yZXNjaGVkKCkgd2l0aGluIHRoZWlyIGNvbXBhcmlzb24gZnVu
Y3Rpb25zIHdoZW4gbWVyZ2luZwo+IGhpZ2hseSB1bmJhbGFuY2VkIGxpc3RzLgo+IAo+IEhvd2V2
ZXIsIGFuIGF1ZGl0IG9mIHRoZSBrZXJuZWwgdHJlZSByZXZlYWxzIHRoYXQgb25seSBmcy91Ymlm
cy8gcmVsaWVzCj4gb24gdGhpcyBtZWNoYW5pc20uIEZvciB0aGUgdmFzdCBtYWpvcml0eSBvZiBs
aXN0X3NvcnQoKSB1c2VycyAoc3VjaCBhcwo+IGJsb2NrIGxheWVyIElPIHNjaGVkdWxlcnMgYW5k
IGZpbGUgc3lzdGVtcyksIHRoaXMgcmVzdWx0cyBpbiBjb21wbGV0ZWx5Cj4gd2FzdGVkIGZ1bmN0
aW9uIGNhbGxzLiBJbiB0aGUgd29yc3QtY2FzZSBzY2VuYXJpbyAobWVyZ2luZyBhbiBhbHJlYWR5
Cj4gc29ydGVkIGxpc3Qgd2hlcmUgJ2EnIGlzIGV4aGF1c3RlZCBxdWlja2x5KSwgdGhpcyByZXN1
bHRzIGluCj4gYXBwcm94aW1hdGVseSAoTi8yKS8yNTYgdW5uZWNlc3NhcnkgY21wKCkgY2FsbHMu
Cj4gCj4gVG8gY2xlYW4gdXAgdGhpcyBBUEkgd2hpbGUgZW5zdXJpbmcgYmVoYXZpb3IgY29tcGF0
aWJpbGl0eToKPiAxLiBJbnRyb2R1Y2UgbGlzdF9zb3J0X25vbmF0b21pYygpLCB3aGljaCBleHBs
aWNpdGx5IGNhbGxzCj4gICAgIGNvbmRfcmVzY2hlZCgpIGludGVybmFsbHkgd2hlbiBjb3VudCBv
dmVyZmxvd3MuCj4gMi4gUmVtb3ZlIHRoZSBkdW1teSBjbXAocHJpdiwgYiwgYikgZmFsbGJhY2sg
Zm9yIHN0YW5kYXJkIGxpc3Rfc29ydCgpLAo+ICAgICBzYXZpbmcgdW5uZWNlc3NhcnkgZnVuY3Rp
b24gY2FsbHMgYW5kIGltcHJvdmluZyBkZXRlcm1pbmlzbS4KPiAzLiBDb252ZXJ0IHRoZSBzb2xl
IHVzZXIgKGZzL3ViaWZzLykgdG8gdGhlIG5ldyBBUEkuCj4gCj4gTm90ZSB0aGF0IHViaWZzIHN0
aWxsIG1haW50YWlucyBjb25kX3Jlc2NoZWQoKSBpbnNpZGUgaXRzIG93bgo+IGNvbXBhcmlzb24g
ZnVuY3Rpb25zLiBUaGlzIHBhdGNoIGRvZXMgbm90IGFsdGVyIHRoZSBmcmVxdWVuY3kgb3IgdGlt
aW5nCj4gb2YgdGhvc2Ugc2NoZWR1bGluZyBwb2ludHMsIGd1YXJhbnRlZWluZyBubyByZWdyZXNz
aW9ucyBmb3IgdWJpZnMsCj4gd2hpbGUgYmVuZWZpdGluZyBhbGwgb3RoZXIga2VybmVsIHVzZXJz
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEt1YW4tV2VpIENoaXUgPHZpc2l0b3Jja3dAZ21haWwuY29t
Pgo+IC0tLQo+ICAgZnMvdWJpZnMvZ2MuYyAgICAgICAgICAgICB8ICAgNCArLQo+ICAgZnMvdWJp
ZnMvcmVwbGF5LmMgICAgICAgICB8ICAgMiArLQo+ICAgaW5jbHVkZS9saW51eC9saXN0X3NvcnQu
aCB8ICAgMyArCj4gICBsaWIvbGlzdF9zb3J0LmMgICAgICAgICAgIHwgMTY2ICsrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4gICA0IGZpbGVzIGNoYW5nZWQsIDEwMCBpbnNl
cnRpb25zKCspLCA3NSBkZWxldGlvbnMoLSkKCmxndG0gZm9yIFVCSUZTLgoKUmV2aWV3ZWQtYnk6
IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+CgpvbmUgc21hbGwgbml0IGJl
bG93LgoKPiAKWy4uLl0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9saXN0X3NvcnQuaCBi
L2luY2x1ZGUvbGludXgvbGlzdF9zb3J0LmgKPiBpbmRleCA0NTMxMDVmNzRlMDUuLmY3YWYyOTA3
M2Q0OCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2xpc3Rfc29ydC5oCj4gKysrIGIvaW5j
bHVkZS9saW51eC9saXN0X3NvcnQuaAo+IEBAIC0xMSw0ICsxMSw3IEBAIHR5cGVkZWYgaW50IF9f
YXR0cmlidXRlX18oKG5vbm51bGwoMiwzKSkpICgqbGlzdF9jbXBfZnVuY190KSh2b2lkICosCj4g
ICAKPiAgIF9fYXR0cmlidXRlX18oKG5vbm51bGwoMiwzKSkpCj4gICB2b2lkIGxpc3Rfc29ydCh2
b2lkICpwcml2LCBzdHJ1Y3QgbGlzdF9oZWFkICpoZWFkLCBsaXN0X2NtcF9mdW5jX3QgY21wKTsK
PiArCj4gK19fYXR0cmlidXRlX18oKG5vbm51bGwoMiwgMykpKQo+ICt2b2lkIGxpc3Rfc29ydF9u
b25hdG9taWModm9pZCAqcHJpdiwgc3RydWN0IGxpc3RfaGVhZCAqaGVhZCwgbGlzdF9jbXBfZnVu
Y190IGNtcCk7Cj4gICAjZW5kaWYKPiBkaWZmIC0tZ2l0IGEvbGliL2xpc3Rfc29ydC5jIGIvbGli
L2xpc3Rfc29ydC5jCj4gaW5kZXggYTMxMGVjYjdjY2MwLi43ODhiZmMyNmNmN2IgMTAwNjQ0Cj4g
LS0tIGEvbGliL2xpc3Rfc29ydC5jCj4gKysrIGIvbGliL2xpc3Rfc29ydC5jCj4gQEAgLTMsNiAr
Myw3IEBACj4gICAjaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+Cj4gICAjaW5jbHVkZSA8bGludXgv
bGlzdF9zb3J0Lmg+Cj4gICAjaW5jbHVkZSA8bGludXgvbGlzdC5oPgo+ICsjaW5jbHVkZSA8bGlu
dXgvc2NoZWQuaD4KPiAgIAo+ICAgLyoKPiAgICAqIFJldHVybnMgYSBsaXN0IG9yZ2FuaXplZCBp
biBhbiBpbnRlcm1lZGlhdGUgZm9ybWF0IHN1aXRlZAo+IEBAIC00Nyw3ICs0OCw3IEBAIHN0YXRp
YyBzdHJ1Y3QgbGlzdF9oZWFkICptZXJnZSh2b2lkICpwcml2LCBsaXN0X2NtcF9mdW5jX3QgY21w
LAo+ICAgICovCj4gICBfX2F0dHJpYnV0ZV9fKChub25udWxsKDIsMyw0LDUpKSkKPiAgIHN0YXRp
YyB2b2lkIG1lcmdlX2ZpbmFsKHZvaWQgKnByaXYsIGxpc3RfY21wX2Z1bmNfdCBjbXAsIHN0cnVj
dCBsaXN0X2hlYWQgKmhlYWQsCj4gLQkJCXN0cnVjdCBsaXN0X2hlYWQgKmEsIHN0cnVjdCBsaXN0
X2hlYWQgKmIpCj4gKwkJCXN0cnVjdCBsaXN0X2hlYWQgKmEsIHN0cnVjdCBsaXN0X2hlYWQgKmIs
IGJvb2wgbWF5X3NjaGVkdWxlKQo+ICAgewo+ICAgCXN0cnVjdCBsaXN0X2hlYWQgKnRhaWwgPSBo
ZWFkOwo+ICAgCXU4IGNvdW50ID0gMDsKPiBAQCAtNzksMTIgKzgwLDExIEBAIHN0YXRpYyB2b2lk
IG1lcmdlX2ZpbmFsKHZvaWQgKnByaXYsIGxpc3RfY21wX2Z1bmNfdCBjbXAsIHN0cnVjdCBsaXN0
X2hlYWQgKmhlYWQsCj4gICAJCS8qCj4gICAJCSAqIElmIHRoZSBtZXJnZSBpcyBoaWdobHkgdW5i
YWxhbmNlZCAoZS5nLiB0aGUgaW5wdXQgaXMKPiAgIAkJICogYWxyZWFkeSBzb3J0ZWQpLCB0aGlz
IGxvb3AgbWF5IHJ1biBtYW55IGl0ZXJhdGlvbnMuCj4gLQkJICogQ29udGludWUgY2FsbGJhY2tz
IHRvIHRoZSBjbGllbnQgZXZlbiB0aG91Z2ggbm8KPiAtCQkgKiBlbGVtZW50IGNvbXBhcmlzb24g
aXMgbmVlZGVkLCBzbyB0aGUgY2xpZW50J3MgY21wKCkKPiAtCQkgKiByb3V0aW5lIGNhbiBpbnZv
a2UgY29uZF9yZXNjaGVkKCkgcGVyaW9kaWNhbGx5Lgo+ICsJCSAqIElmIG1heV9zY2hlZHVsZSBp
cyB0cnVlLCBwZXJpb2RpY2FsbHkgaW52b2tlIGNvbmRfcmVzY2hlZCgpCj4gKwkJICogdG8gYXZv
aWQgc29mdCBsb2NrdXBzLgo+ICAgCQkgKi8KPiAtCQlpZiAodW5saWtlbHkoISsrY291bnQpKQo+
IC0JCQljbXAocHJpdiwgYiwgYik7Cj4gKwkJaWYgKG1heV9zY2hlZHVsZSAmJiB1bmxpa2VseSgh
Kytjb3VudCkpCj4gKwkJCWNvbmRfcmVzY2hlZCgpOwpUaGUgY29uZF9yZXNjaGVkKCkgYWxyZWFk
eSBoYXMgYSBqdWRnbWVudCBvbiB3aGV0aGVyIHRvIHNjaGVkdWxlIG91dCwgc28gCnRoZSAnY291
bnQnIGNvdWxkIGJlIHJlbW92ZWQ/Cj4gICAJCWItPnByZXYgPSB0YWlsOwo+ICAgCQl0YWlsID0g
YjsKPiAgIAkJYiA9IGItPm5leHQ7CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
