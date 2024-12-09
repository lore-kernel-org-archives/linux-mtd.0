Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D27E77173
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2024 05:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHT/Vsk8QnXWv0I+nD3Im5UEDZsz+PtOSJItNexYi5o=; b=YCSr4PVTx2WasDhuEBpddK5SFR
	RrU6to6V43xs4gceTn/DGHhne6u0C+40xHNE4HN0m0nLCy/gmR6XegkGP6h1uxewsL3wgtIJXmCIf
	/FjHlCHOgwXNstTlxXDnjAPno5Ym92EqHRpE46HXnpTW/9e5vFGNbNWdiQExq0a/LV+saZLkWzrIR
	dg07d+ic1XF9OxYYNjusg6j9uVINNKoeJaD7kdYj9Ihq0VvUdCuh43nW8F/9xg/R+Z23k8I2lNgHi
	FYBEy5stSb45MgB/3c6ELQGODN5DFLblPknlIhtOwC9MxBIFirdGQgMUo8sAn/QSs31qw775wY8ph
	ovBxFYZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKVvU-00000006TbM-23nl;
	Mon, 09 Dec 2024 05:03:20 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKVvR-00000006TYY-1u1P
	for linux-mtd@lists.infradead.org;
	Mon, 09 Dec 2024 05:03:19 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Y68nh0hb1z1kvfh;
	Mon,  9 Dec 2024 13:00:40 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id CF55C1A016C;
	Mon,  9 Dec 2024 13:03:02 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 9 Dec 2024 13:03:02 +0800
Subject: Re: [PATCH] MTD: fix slab-use-after-free due to dangling pointer in
 notifier chain
To: Dennis Lam <dennis.lamerice@gmail.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<syzbot+0988a383ae7c57b99dd9@syzkaller.appspotmail.com>,
	<syzkaller-bugs@googlegroups.com>
References: <20241208175211.9406-2-dennis.lamerice@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <638528e2-e265-e421-13b8-259851c50f43@huawei.com>
Date: Mon, 9 Dec 2024 13:03:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20241208175211.9406-2-dennis.lamerice@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_210317_845589_3F58DAE4 
X-CRM114-Status: GOOD (  18.18  )
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

1NogMjAyNC8xMi85IDE6NTIsIERlbm5pcyBMYW0g0LS1wDoKPiBXaGVuIGF0dGFjaGluZyBNVERz
LCBhIHJlYm9vdCBub3RpZmllciBpcyBhZGRlZCB0byB0aGUgYmxvY2tpbmcKPiBub3RpZmljYXRp
b24gY2hhaW4uIEhvd2V2ZXIsIHdoZW4gZGV0YWNoaW5nIGEgTVREIGFuZCBmcmVlaW5nIGl0cwo+
IHJlbGF0ZWQgb2JqZWN0cywgdGhlIG5vdGlmaWVyIGlzIG5ldmVyIHVucmVnaXN0ZXJlZCBmcm9t
IHRoZQo+IG5vdGlmaWNhdGlvbiBjaGFpbiBhbmQgaXMgZnJlZWQgZHVyaW5nIHRoZSBkZXRhY2hp
bmcgcHJvY2Vzcy4gVGhpcwo+IHJlc3VsdHMgaW4gdGhlIHNsYWItdXNlLWFmdGVyLWZyZWUuCj4g
Cj4gVG8gZml4IHRoaXMsIEkgYWRkZWQgYW4gdW5yZWdpc3RlciBub3RpZmllciBmdW5jdGlvbiBp
biB0aGUgdWJpX3dsX2Nsb3NlCj4gZnVuY3Rpb24gdG8gZW5zdXJlIHRoYXQgdGhlIG5vdGlmaWVy
IGlzIHJlbW92ZWQgZnJvbSB0aGUgY2hhaW4gYWZ0ZXIgdGhlCj4gZGV2aWNlIGhhcyBiZWVuIGRl
dGFjaGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERlbm5pcyBMYW0gPGRlbm5pcy5sYW1lcmljZUBn
bWFpbC5jb20+Cj4gUmVwb3J0ZWQtYnk6IHN5emJvdCswOTg4YTM4M2FlN2M1N2I5OWRkOUBzeXpr
YWxsZXIuYXBwc3BvdG1haWwuY29tCj4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvNjc0MDkwOTEuMDUwYTAyMjAuMzYzYTFiLjAxM2QuR0FFQGdvb2dsZS5jb20vVC8KPiAtLS0K
PiAgIGRyaXZlcnMvbXRkL3ViaS93bC5jIHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCkhpIERlbm5pcywgdGhhbmtzIGZvciByZXBvcnRpbmcgaXQhIEl0IGlzIGFuIGFj
dHVhbCBidWcgYW5kIEkgY2FuIApyZXByb2R1Y2UgaXQgZWFzaWx5OgpbICAyMzIuODExNjA4XSAK
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09ClsgIDIzMi44MTIzOTJdIEJVRzogS0FTQU46IHNsYWItdXNlLWFmdGVyLWZyZWUg
aW4gCm5vdGlmaWVyX2NhbGxfY2hhaW4rMHgyYjAvMHgzMDAKWyAgMjMyLjgxMzE5NV0gUmVhZCBv
ZiBzaXplIDggYXQgYWRkciBmZmZmODg4MTA5ZmQ5MmUwIGJ5IHRhc2sgCnN5c3RlbWQtc2h1dGRv
dy8xClsgIDIzMi44MTM5NzldClsgIDIzMi44MTQxNjJdIENQVTogMSBVSUQ6IDAgUElEOiAxIENv
bW06IHN5c3RlbWQtc2h1dGRvdyBOb3QgdGFpbnRlZCAKNi4xMy4wLXJjMi0wMDAxOS1nNTgwNjQ0
ZWM1YWRmLWRpcnR5ICM1NApbICAyMzIuODE1MjI0XSBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5k
YXJkIFBDIChpNDQwRlggKyBQSUlYLCAxOTk2KSwgCkJJT1MgMS4xNi4zLTIuZmM0MCAwNC8wMS8y
MDE0ClsgIDIzMi44MTYxODRdIENhbGwgVHJhY2U6ClsgIDIzMi44MTY0NjZdICA8VEFTSz4KWyAg
MjMyLjgxNjcxM10gIGR1bXBfc3RhY2tfbHZsKzB4OWYvMHhmMApbICAyMzIuODE3MTIyXSAgcHJp
bnRfcmVwb3J0KzB4MjFlLzB4NzZmClsgIDIzMi44MTk5NTJdICBfX2FzYW5fcmVwb3J0X2xvYWQ4
X25vYWJvcnQrMHgyNC8weDQwClsgIDIzMi44MjA0ODddICBub3RpZmllcl9jYWxsX2NoYWluKzB4
MmIwLzB4MzAwClsgIDIzMi44MjA5ODJdICBibG9ja2luZ19ub3RpZmllcl9jYWxsX2NoYWluKzB4
NmEvMHhjMApbICAyMzIuODIxNTMxXSAga2VybmVsX3Jlc3RhcnRfcHJlcGFyZSsweDI1LzB4YTAK
WyAgMjMyLjgyMjAyMl0gIGtlcm5lbF9yZXN0YXJ0KzB4MWEvMHg2MApbICAyMzIuODIyNDM1XSAg
X19kb19zeXNfcmVib290KzB4MjFiLzB4M2MwClsgIDIzMi44MjU2MzJdICBfX3g2NF9zeXNfcmVi
b290KzB4OWUvMHgxMTAKWyAgMjMyLjgyNjYxNl0gIHg2NF9zeXNfY2FsbCsweDEzMTUvMHg0MTUw
ClsgIDIzMi44MjcwNDddICBkb19zeXNjYWxsXzY0KzB4YTcvMHgyMTAKWyAgMjMyLjgyNzQ2Ml0g
IGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc2LzB4N2UKCkFuZCBJIHRoaW5rIHRo
aXMgcGF0Y2ggY291bGQgZml4IHRoZSBzaW5nbGUgcHJvYmxlbS4gQmVmb3JlIHRoYXQsIEkgZmlu
ZCAKdGhlIGNvbW1pdCA1NTgwY2RhZTA1YWVmYTk2ZGVlYmQ3ZjVhZGU5ZDcwYzkyYWRhYmQ3KCJ1
Ymk6IHdsOiBDbG9zZSBkb3duIAp3ZWFyLWxldmVsaW5nIGJlZm9yZSBuYW5kIGlzIHN1c3BlbmRl
ZCIpIGlzIGFwcGxpZWQgYnkgYSBtaXN0YWtlLiBIaSwgClJpY2hhcmQsIHRoZSBwYXRjaCBoYXMg
YmVlbiBkaXNjdXNzZWQgaW4gCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC85YmY3NmY1ZC0x
MmE0LTQ2ZmYtOTBkNC00YTdmMGY0N2MzODFAYXhpcy5jb20vLCAKYW5kIHRoZSBwYXRjaCBpcyBu
b3QgbmVlZGVkIG5vdywgb3RoZXJ3aXNlLCB0aGVyZSB3aWxsIGJlIG90aGVyIFVBRiAKcHJvYmxl
bXMoaW4gZm0gd29ya2VyKS4gSWYgeW91IGFncmVlLCBJIHdpbGwgc2VuZCBhIHBhdGNoIHRvIHJl
dmVydCBpdC4KPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL3dsLmMgYi9kcml2ZXJz
L210ZC91Ymkvd2wuYwo+IGluZGV4IDRmNmYzMzlkOGZiOC4uMzFhMWU1NTE1ZDk4IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS93bC5jCj4gKysrIGIvZHJpdmVycy9tdGQvdWJpL3dsLmMK
PiBAQCAtMTk5NSw2ICsxOTk1LDcgQEAgc3RhdGljIHZvaWQgcHJvdGVjdGlvbl9xdWV1ZV9kZXN0
cm95KHN0cnVjdCB1YmlfZGV2aWNlICp1YmkpCj4gICB2b2lkIHViaV93bF9jbG9zZShzdHJ1Y3Qg
dWJpX2RldmljZSAqdWJpKQo+ICAgewo+ICAgCWRiZ193bCgiY2xvc2UgdGhlIFdMIHN1Yi1zeXN0
ZW0iKTsKPiArCXVucmVnaXN0ZXJfcmVib290X25vdGlmaWVyKCZ1YmktPndsX3JlYm9vdF9ub3Rp
Zmllcik7Cj4gICAJdWJpX2Zhc3RtYXBfY2xvc2UodWJpKTsKPiAgIAlzaHV0ZG93bl93b3JrKHVi
aSk7Cj4gICAJcHJvdGVjdGlvbl9xdWV1ZV9kZXN0cm95KHViaSk7Cj4gCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
