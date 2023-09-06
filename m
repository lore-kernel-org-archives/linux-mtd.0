Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CB8EB8FA5
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 11:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgNsM6z8mPb6UiSzqtxBSmsAZaBEkU9gTuwgn5cNZTo=; b=Jmy7d35Er61/rAQKoIQTGWcMVz
	q7cOuFllE1gAS0LUwDZ/azcPAIVXgfwwj85LO5qJIOeid6DwRu6UgPfrHHVg0SC0JkeDVfC3+PPUx
	WAH2jZmDkll6wFXJSNaiFvREz9RznsmdBDLJtczB3KGfVPWYNPscfo+cyWXgfr5siA8selh74JOOQ
	eEANlLeDJpyO3UYVTwZn3vU24832mft8LpIW1nExNLHRi6pZBLxHQx4gbb1yNVXazSeoNVnppD1Qh
	zYOpQWZHKIdE+92UtW2OmNa2eP1JA8rsYMI/LsCVLFKEiYN0i00aBg0fCrcLpOKD/3tgRB1gUJdJk
	ls+BclDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqkh-008mLD-2z;
	Wed, 06 Sep 2023 11:31:19 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqkW-008m5r-10
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 11:31:17 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.54])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RggBH3nxTz1M99X
	for <linux-mtd@lists.infradead.org>; Wed,  6 Sep 2023 19:29:11 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 6 Sep 2023 19:30:58 +0800
Subject: Re: Can't find correct configuration
To: Leon Pollak <leon.pollak@gmail.com>
CC: <linux-mtd@lists.infradead.org>
References: <CAM===sRg0v6_1xDjv7BxRFLMQTsj3z8-C_uO5Jh3ZDdWk_mEsA@mail.gmail.com>
 <dd4b7c09-64cf-4041-4dad-cd3d43340f98@huawei.com>
 <52ba4755-ade0-4b4a-f4a2-13160bb6129b@huawei.com>
 <CAM===sQ+-2A=R_Rn4iiLyaVsBh0Y1Dp8QDeT2fevEiWCfLtmnw@mail.gmail.com>
 <212e499d-324a-d553-2a2c-35bec47195db@huawei.com>
 <CAM===sSTKnmRdRx-LwJ50G4P4Er8+gfQ0vznEYOsqi63_UFaQQ@mail.gmail.com>
 <c9dea479-91d3-659c-28ba-39299b27b174@huawei.com>
 <CAM===sRtnHxuWG__FW_KZZG0iF0ZpYs4N+wtM9XuGKTUX2scHg@mail.gmail.com>
 <5dded3ae-20ab-2f3f-d43e-10e91d4eda21@huawei.com>
 <CAM===sSha8i7E_YSuQCuA7TRwo6wdjA7Xf8NYkeenP=SPfP4RQ@mail.gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <715b2e59-a331-d95f-afda-54bf6dcf1a5b@huawei.com>
Date: Wed, 6 Sep 2023 19:30:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAM===sSha8i7E_YSuQCuA7TRwo6wdjA7Xf8NYkeenP=SPfP4RQ@mail.gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_043108_718104_D8F4E55B 
X-CRM114-Status: GOOD (  22.62  )
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

5ZyoIDIwMjMvOS82IDE3OjIxLCBMZW9uIFBvbGxhayDlhpnpgZM6Cj4gWmhpaGFvIENoZW5nLCBw
bGVhc2UsIGV4Y3VzZSBteSBzdHVwaWRpdHkuLi46LSkKPiBUbyB1dGlsaXplIHRoZXNlIDhNaUIg
SSBzZXQgIi1jIDIwNDciLgo+IEkgdGhvdWdodCB0aGF0IDI0OE1pQi8xMjY5NzY9MjA0OCBhbmQg
LTEgdG8gYmUgb24gdGhlIHNhZmUgc2lkZS4KPiBCdXQgSSBkbyBub3Qgc2VlIGFueSBjaGFuZ2Ug
aW4gdGhlIGtlcm5lbCBsb2cuCj4gU2hvdWxkIEkgYWxzbyBjaGFuZ2UgdGhlIHViaWZzLmNmZyBm
aWxlIGFuZCBpbmNyZWFzZSB0aGUgdm9sX3NpemU/Cj4gCgpUaGUgOE0gcGFydGl0aW9uIGlzIHVz
ZWQgZm9yIHVib290LCBhbmQgdGhlIDI0OE0gcGFydGl0aW9uIGlzIHVzZWQgZm9yIApVQkksIGlz
bid0IGl0PyBUaGUgOE0gcGFydGl0aW9uIHdvbid0IGJlIHVzZWQgZm9yIFVCSS4KCkN1cnJlbnQg
Jy1jIDE5ODEnIGNhbiBtYWtlIHN1cmUgdGhhdCBVQklGUyB0YWtlIG1heCBzcGFjZSBvZiB1Ymlf
cm9vdGZzIAp2b2x1bWUuCgo+IE9uIFdlZCwgNiBTZXB0IDIwMjMgYXQgMTE6NTMsIFpoaWhhbyBD
aGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+IHdyb3RlOgo+Pgo+PiDlnKggMjAyMy85LzYg
MTY6MzgsIExlb24gUG9sbGFrIOWGmemBkzoKPj4+IFllcywgeW91IGFyZSByaWdodCBhYm91dCB0
aGUgc2l0dWF0aW9uLgo+Pj4gTXkgcGFydGl0aW9uIGZvciBVQkkgaXMgMjQ4TWlCLgo+Pj4gU28s
IHRoZSBxdWVzdGlvbiByZW1haW5zIC0gY2FuIHRoaXMgOE1CIGJlIHV0aWxpemVkPwo+Pgo+PiBZ
ZXMsIGl0IGNhbi4KPj4KPj4+IE9yIGFyZSB0aGV5IGFscmVhZHkgaW4gdXNlIGJ5IFVCSSB3aGlj
aCBzZWVzIHBhcnRpdGlvbiBzaXplPwo+Pj4KPj4+Cj4+PiBPbiBXZWQsIDYgU2VwdCAyMDIzIGF0
IDEwOjM0LCBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPiB3cm90ZToKPj4+
Pgo+Pj4+IOWcqCAyMDIzLzkvNiAxNToyNywgTGVvbiBQb2xsYWsg5YaZ6YGTOgo+Pj4+PiBJIHdv
cmsgb24gZW1iZWRkZWQgZGV2aWNlLiBUaGUgcmVzdCBvZiB0aGUgTkFORCBpcyB1c2VkIGZvciBT
UEwsCj4+Pj4+IFUtQm9vdCwgVS1Cb290IGVudmlyb25tZW50IGFuZCBrZXJuZWwuCj4+Pj4+IFdo
YXQgaXMgbGVmdCBpcyAyNDhNaUIuCj4+Pj4+IEkgYW0gbm90IHN1cmUgSSBjYW4gdXNlIHRoZSB3
aG9sZSBzcGFjZSBmb3IgVUJJIC0gaG93IHdpbGwgdGhlIFNQTC9VLUJvb3Qgd29yaz8KPj4+Pgo+
Pj4+IERvIHlvdSBtZWFuIFVCSSBhbmQgdWJvb3QgYXJlIHB1dCBpbnRvIHNhbWUgZmxhc2goMjU2
TSk/IElmIHNvLCB5b3VyCj4+Pj4gcGFydGl0aW9uaW5nIG1ldGhvZCBpcyByaWdodC4KPj4+Pgo+
Pj4+IDhNKG10ZDApIC0gdWJvb3QKPj4+PiAyNDhNKG10ZDEpIC0gVUJJCj4+Pj4KPj4+PiBVQkkg
d29uJ3QgYWNjZXNzIG10ZDAuCj4+Pj4KPj4+Pgo+Pj4+Pgo+Pj4+PiBPbiBXZWQsIDYgU2VwdCAy
MDIzIGF0IDEwOjIxLCBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPiB3cm90
ZToKPj4+Pj4+Cj4+Pj4+PiDlnKggMjAyMy85LzYgMTQ6NTcsIExlb24gUG9sbGFrIOWGmemBkzoK
Pj4+Pj4+PiBUaG91c2FuZHMgb2YgdGhhbmtzLCBaaGloYW8gQ2hlbmchISEKPj4+Pj4+PiBJdCB3
b3JrZWQgZXhhY3RseSBhcyB5b3Ugd3JvdGUuCj4+Pj4+Pj4gVGhlIG9ubHkgcXVlc3Rpb24gcmVt
YWluZWQgaXM6Cj4+Pj4+Pj4gTXkgcGFydGl0aW9uIHNpemUgaXMgMjQ4TWlCLgo+Pj4+Pj4+IEkg
dGhvdWdodCB0aGF0IGxlYXZpbmcgOE1pQiAic3BhcmUnIHdpbGwgYmUgdXNlZCBqdXN0IGZvciB0
aGVzZQo+Pj4+Pj4+IHJlc2VydmVkIFBFQnMsIGJ1dCBub3cgSSB1bmRlcnN0YW5kIHRoaXMgd2Fz
IGluY29ycmVjdC4KPj4+Pj4+PiBTbywgbWF5IEkgdXRpbGl6ZSB0aGVzZSA4TWlCIGJhY2sgb3Ig
d2lsbCB0aGV5IHN0aWxsIGJlIHVzZWQgYnkgVUJJCj4+Pj4+Pj4gZm9yIHNvbWV0aGluZz8KPj4+
Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IEkgYmVsaWV2ZSB5b3UgaGF2ZSB0d28gbXRkIGRldmljZXMsIDI0
OE0obXRkMCBmb3IgdWJpKSBhbmQgOE0ocmVzZXJ2ZWQsCj4+Pj4+PiB3b24ndCBiZSBhY2Nlc3Nl
ZCBieSBVQkkpIG5vdy4gUGxlYXNlIGRvbid0IHNwbGl0IHRoZSAyNTZNIGludG8gdHdvIG10ZAo+
Pj4+Pj4gZGV2aWNlcyBpZiB5b3Ugb25seSBuZWVkIDEgVUJJIGRldmljZSwganVzdCBmb3JtYXQg
dGhlIHdob2xlIGZsYXNoKDI1Nk0pCj4+Pj4+PiBpbnRvIFVCSSwgYW5kIFVCSSBpdHNlbGYgd2ls
bCBoYW5kbGUgaXRzIHJlc2VydmF0aW9uIHdpdGhvdXQgdXNlcgo+Pj4+Pj4gaW50ZXJ2ZW5pbmcu
Cj4+Pj4+Pgo+Pj4+Pj4+IE9uIFdlZCwgNiBTZXB0IDIwMjMgYXQgMDU6NTAsIFpoaWhhbyBDaGVu
ZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+IHdyb3RlOgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiDlnKgg
MjAyMy85LzYgMTA6NDIsIFpoaWhhbyBDaGVuZyDlhpnpgZM6Cj4+Pj4+Pj4+PiDlnKggMjAyMy85
LzUgMjI6NDUsIExlb24gUG9sbGFrIOWGmemBkzoKPj4+Pj4+Pj4+IEhpCj4+Pj4+Pj4+Pj4gSGVs
bG8sIGFsbC4KPj4+Pj4+Pj4+PiBJIHdpbGwgYmUgdmVyeSB2ZXJ5IHRoYW5rZnVsIGZvciB0aGUg
aGVscCB0byBmaW5kIHRoZSBjb3JyZWN0Cj4+Pj4+Pj4+Pj4gY29uZmlndXJhdGlvbiBmb3IgbXkg
TkFORC4KPj4+Pj4+Pj4+PiBJIHBhc3NlZCB0aHJvdWdoIGEgbG90IG9mIG1haWxzIGluIHRoZSBs
aXN0cyBhbmQgZ29vZ2xlIGFuZCBDaGF0R1BUIC0KPj4+Pj4+Pj4+PiBubyBzdWNjZXNzLgo+Pj4+
Pj4+Pj4+IEkgaGF2ZSAyNTZNQiBOQU5EIGFuZCAyNDhNQiBwYXJ0aXRpb24gZm9yIFVCSUZTLiBJ
IHJ1bjoKPj4+Pj4+Pj4+PiBta2ZzLnViaWZzIC12IC1yIHJvb3RmcyAtRiAtbSAyMDQ4IC1lIDEy
Njk3NiAtYyAxOTgxIC1vIC4vdWJpZnMuaW1nCj4+Pj4+Pj4+Pj4gdWJpbml6ZSAtdiAtbyByb290
ZnMuaW1nIC1tIDIwNDggLXAgMTI4S2lCIC1zIDUxMiAtTyAyMDQ4IHViaW5pemUuY2ZnCj4+Pj4+
Pj4+Pj4gLS0tLS0KPj4+Pj4+Pj4+PiBhbmQgdWJpbml6ZS5jZmcgbG9va3MgbGlrZToKPj4+Pj4+
Pj4+PiBbdWJpZnNdCj4+Pj4+Pj4+Pj4gbW9kZT11YmkKPj4+Pj4+Pj4+PiBpbWFnZT0uL3ViaWZz
LmltZwo+Pj4+Pj4+Pj4+IHZvbF9pZD0wCj4+Pj4+Pj4+Pj4gdm9sX3NpemU9MjQwTWlCCj4+Pj4+
Pj4+Pj4gdm9sX3R5cGU9ZHluYW1pYwo+Pj4+Pj4+Pj4+IHZvbF9uYW1lPXViaV9yb290ZnMKPj4+
Pj4+Pj4+PiB2b2xfYWxpZ25tZW50PTEKPj4+Pj4+Pj4+PiB2b2xfZmxhZ3M9YXV0b3Jlc2l6ZQo+
Pj4+Pj4+Pj4+IC0tLS0tLQo+Pj4+Pj4+Pj4+IEtlcm5lbCBjb25maWd1cmF0aW9uICB3YXMgd2l0
aCBDT05GSUdfTVREX1VCSV9CRUJfTElNSVQ9MjAuCj4+Pj4+Pj4+Pj4gYW5kIGhlcmUgaXMgdGhl
IGtlcm5lbCBsb2c6Cj4+Pj4+Pj4+Pj4gWyAgICAyLjY5NTY1OV0gdWJpMDogYXR0YWNoaW5nIG10
ZDQKPj4+Pj4+Pj4+PiBbICAgIDMuMzcyMzQzXSB1YmkwOiBzY2FubmluZyBpcyBmaW5pc2hlZAo+
Pj4+Pj4+Pj4+IFsgICAgMy4zODMwNjZdIHViaTAgd2FybmluZzogdWJpX2ViYV9pbml0OiBjYW5u
b3QgcmVzZXJ2ZSBlbm91Z2ggUEVCcwo+Pj4+Pj4+Pj4+IGZvciBiYWQgUEVCIGhhbmRsaW5nLCBy
ZXNlcnZlZCA0LCBuZWVkIDQwCj4+Pj4+Pj4+Pj4gWyAgICAzLjQwNDMyMF0gdWJpMDogdm9sdW1l
IDAgKCJ1Ymlfcm9vdGZzIikgcmUtc2l6ZWQgZnJvbSAxOTgyIHRvCj4+Pj4+Pj4+Pj4gMTk4MiBM
RUJzCj4+Pj4+Pj4+Pj4gWyAgICAzLjQxMTY2N10gdWJpMDogYXR0YWNoZWQgbXRkNCAobmFtZSAi
RlMiLCBzaXplIDI0OCBNaUIpCj4+Pj4+Pj4+Pj4gWyAgICAzLjQxNzA5NV0gdWJpMDogUEVCIHNp
emU6IDEzMTA3MiBieXRlcyAoMTI4IEtpQiksIExFQiBzaXplOgo+Pj4+Pj4+Pj4+IDEyNjk3NiBi
eXRlcwo+Pj4+Pj4+Pj4+IFsgICAgMy40MjQwMDZdIHViaTA6IG1pbi4vbWF4LiBJL08gdW5pdCBz
aXplczogMjA0OC8yMDQ4LCBzdWItcGFnZQo+Pj4+Pj4+Pj4+IHNpemUgNTEyCj4+Pj4+Pj4+Pj4g
WyAgICAzLjQzMDc0MF0gdWJpMDogVklEIGhlYWRlciBvZmZzZXQ6IDIwNDggKGFsaWduZWQgMjA0
OCksIGRhdGEKPj4+Pj4+Pj4+PiBvZmZzZXQ6IDQwOTYKPj4+Pj4+Pj4+PiBbICAgIDMuNDM3NzM0
XSB1YmkwOiBnb29kIFBFQnM6IDE5OTAsIGJhZCBQRUJzOiAwLCBjb3JydXB0ZWQgUEVCczogMAo+
Pj4+Pj4+Pj4+IFsgICAgMy40NDM4NjBdIHViaTA6IHVzZXIgdm9sdW1lOiAxLCBpbnRlcm5hbCB2
b2x1bWVzOiAxLCBtYXguIHZvbHVtZXMKPj4+Pj4+Pj4+PiBjb3VudDogMTI4Cj4+Pj4+Pj4+Pj4g
WyAgICAzLjQ1MTExN10gdWJpMDogbWF4L21lYW4gZXJhc2UgY291bnRlcjogMS8wLCBXTCB0aHJl
c2hvbGQ6IDQwOTYsCj4+Pj4+Pj4+Pj4gaW1hZ2Ugc2VxdWVuY2UgbnVtYmVyOiAxNTkwNTcwMDcz
Cj4+Pj4+Pj4+Pj4gWyAgICAzLjQ2MDI5NV0gdWJpMDogYXZhaWxhYmxlIFBFQnM6IDAsIHRvdGFs
IHJlc2VydmVkIFBFQnM6IDE5OTAsCj4+Pj4+Pj4+Pj4gUEVCcyByZXNlcnZlZCBmb3IgYmFkIFBF
QiBoYW5kbGluZzogNAo+Pj4+Pj4+Pj4+IFsgICAgMy40Njk1NzVdIHViaTA6IGJhY2tncm91bmQg
dGhyZWFkICJ1YmlfYmd0MGQiIHN0YXJ0ZWQsIFBJRCAxMzEKPj4+Pj4+Pj4+PiBbICAgIDQuNjQ4
NzE4XSBVQklGUyAodWJpMDowKTogYmFja2dyb3VuZCB0aHJlYWQgInViaWZzX2JndDBfMCIKPj4+
Pj4+Pj4+PiBzdGFydGVkLCBQSUQgMTM2Cj4+Pj4+Pj4+Pj4gWyAgICA0LjY3NjY0MF0gVUJJRlMg
KHViaTA6MCk6IHN0YXJ0IGZpeGluZyB1cCBmcmVlIHNwYWNlCj4+Pj4+Pj4+Pj4gWyAgIDEwLjI1
MDA5OV0gVUJJRlMgKHViaTA6MCk6IGZyZWUgc3BhY2UgZml4dXAgY29tcGxldGUKPj4+Pj4+Pj4+
PiBbICAgMTAuMjY5MDQ2XSBVQklGUyAodWJpMDowKTogVUJJRlM6IG1vdW50ZWQgVUJJIGRldmlj
ZSAwLCB2b2x1bWUgMCwKPj4+Pj4+Pj4+PiBuYW1lICJ1Ymlfcm9vdGZzIgo+Pj4+Pj4+Pj4+IFsg
ICAxMC4yNzY4MzBdIFVCSUZTICh1YmkwOjApOiBMRUIgc2l6ZTogMTI2OTc2IGJ5dGVzICgxMjQg
S2lCKSwKPj4+Pj4+Pj4+PiBtaW4uL21heC4gSS9PIHVuaXQgc2l6ZXM6IDIwNDggYnl0ZXMvMjA0
OCBieXRlcwo+Pj4+Pj4+Pj4+IFsgICAxMC4yODY3OTRdIFVCSUZTICh1YmkwOjApOiBGUyBzaXpl
OiAyNTAxNDI3MjAgYnl0ZXMgKDIzOCBNaUIsIDE5NzAKPj4+Pj4+Pj4+PiBMRUJzKSwgam91cm5h
bCBzaXplIDkwMjM0ODggYnl0ZXMgKDggTWlCLCA3MiBMRUJzKQo+Pj4+Pj4+Pj4+IFsgICAxMC4y
OTc1NDBdIFVCSUZTICh1YmkwOjApOiByZXNlcnZlZCBmb3Igcm9vdDogMCBieXRlcyAoMCBLaUIp
Cj4+Pj4+Pj4+Pj4gWyAgIDEwLjMwMzQwNl0gVUJJRlMgKHViaTA6MCk6IG1lZGlhIGZvcm1hdDog
dzQvcjAgKGxhdGVzdCBpcyB3NS9yMCksCj4+Pj4+Pj4+Pj4gVVVJRCBBMTRENTg2QS0zMkUyLTQ1
RDctQTA3RS1CREM0NzJGREYzMUQsIHNtYWxsIExQVCBtb2RlbAo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+
Pj4gTXkgcXVlc3Rpb24gaXM6IHdoeSBkb2VzIHRoaXMgd2FybmluZyBhYm91dCByZXNlcnZlZCA0
LCBuZWVkZWQgNDAKPj4+Pj4+Pj4+PiBhcHBlYXI/IEhvdyBjYW4gSSBzb2x2ZSB0aGlzPwo+Pj4+
Pj4+Pj4+Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gU29sdXRpb246IE1vZGlmeSB1YmluaXplLmNmZywg
IHZvbF9zaXplPTI0ME1pQiAtPiB2b2xfc2l6ZT0yMzVNaUIKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBX
aHkgZG9lcyB0aGlzIHdhcm5pbmcgYWJvdXQgcmVzZXJ2ZWQgNCwgbmVlZGVkIDQwIGFwcGVhcj8K
Pj4+Pj4+Pj4+IFRoZSBjb3VudCBvZiBiYWQgUEVCcyByZXNlcnZlZCBieSBVQkkgaXM6IHRvdGFs
X3BlYnMobmFuZCBjaGlwKSAqCj4+Pj4+Pj4+PiBDT05GSUdfTVREX1VCSV9CRUJfTElNSVQvMTAy
NCA9IDIwNDggKiAgMjAgLyAxMDI0ID0gNDAKPj4+Pj4+Pj4+IFdoZW4gZmFzdG1hcCBpcyBub3Qg
ZW5hYmxlZCwgdGhlIGNvdW50IG9mIGludGVybmFsIFBFQnMgcmVzZXJ2ZWQgYnkgVUJJCj4+Pj4+
Pj4+PiBpczogVUJJX0xBWU9VVF9WT0xVTUVfRUJTWzJdICsgV0xfUkVTRVJWRURfUEVCU1sxXSAr
Cj4+Pj4+Pj4+PiBFQkFfUkVTRVJWRURfUEVCU1sxXSA9IDQKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBU
b3RhbCBQRUJzIGZvciBVQkkgaXMgMTk5MChnb29kIFBFQnM6IDE5OTApLCB0aGUgbWF4IGNvdW50
IG9mIHVzZXIKPj4+Pj4+Pj4+IHZvbHVtZSBQRUJzIGlzIDE5OTAgLSA0MCAtIDQgPSAxOTQ2Cj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gSW4gdWJpbml6ZS5jZmcsIHZvbF9zaXplPTI0ME1pQiwgdGhlIGNv
dW50IG9mIHVzZXIgdm9sdW1lIFBFQnMgaXMoc2VlCj4+Pj4+Pj4+PiB1YmluaXplLmMgaW4gbXRk
dWl0bHMpOiB2aV9zaXplICsgKGxlYl9zaXplIC0gMSkgLyBsZWJfc2l6ZQo+Pj4+Pj4+Pj4gdmlf
c2l6ZSA9IDI0ME0gPSAyNDAgKiAxMDI0ICogMTAyNAo+Pj4+Pj4+Pj4gbGViX3NpemUgPSAxMjhL
IC0gMksoZWMpIC0gMksodmlkKSA9IDEyNCAqIDEwMjQKPj4+Pj4+Pj4+IHJlc3VsdCA9IDE5ODIK
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBTbyB0aGVyZSBhcmUgMTk5MCAtIDE5ODIgLSA0ID0gNCBQRUJz
IHJlc2VydmVkIGZvciBiYWQgUEVCIGhhbmRsaW5nLAo+Pj4+Pj4+Pj4gd2hpY2ggaXMgbGVzcyB0
aGFuIDQwLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFdoZW4gd2Ugc2V0ICB2b2xfc2l6ZT0yMzVNaUIs
IHRoZSBjb3VudCBvZiB1c2VyIHZvbHVtZSBQRUJzIGlzOiAoMjM1ICoKPj4+Pj4+Pj4+IDEwMjQg
KiAxMDI0ICsgMTI0ICogMTAyNCAtIDEpIC8gKDEyNCAqIDEwMjQpID0gMTk0MQo+Pj4+Pj4+Pj4g
MTk5MCAtIDQgLSA0MCA9IDE5NDYsIGZpbmFsbHkgbWF5YmUgdGhlcmUgaXMgbWVzc2FnZSBmcm9t
IGtlcm5lbCBsaWtlCj4+Pj4+Pj4+PiAiKCJ1Ymlfcm9vdGZzIikgcmUtc2l6ZWQgZnJvbSAxOTQx
IHRvIDE5NDYgTEVCcyIuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEFjdXRhbGx5LCB0aGUgJ3ZvbF9zaXpl
JyBpbiB1YmluaXplLmNmZyBtZWFucyB0aGUgc2l6ZSBvZiBkYXRhIG9uCj4+Pj4+Pj4+IHZvbHVt
ZShleGNsdWRlIHZpZC9lYyksIG5vdCB0aGUgc2l6ZSBvZiB2b2x1bWUoaW5jbHVkZSB2aWQvZWMp
Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gLgo+Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiAu
Cj4+Pj4+Cj4+Pj4KPj4+Cj4+PiAuCj4+Pgo+Pgo+IAo+IC4KPiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
