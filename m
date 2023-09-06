Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD46EB8FAF
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 12:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhL8gg24eOh7NV38VKL8Mj5stGE4aMgGqEFLDSGfo+s=; b=OaQOq0/oLXJnVnnvxURM7PDda+
	p4vX3ylhyNV1ds3Dr7iUzl7yW3joLN9jGZpr9OhbtTbiA2uWN5jJjH9TPJSP4d3ZvM8mHC/bmkB89
	YkDWrOJ1FUjtAWYoX3BRR6OXdTJtgJg4ZrR46I2YDyzObJgQVJ+kJ2MvPZOi0szjN+fQVBJIPVgVV
	+7phr6oATDqZjW9vuxS7h7knK49T9nLbXgxfsDzdsiRe1lzz7Xjdo3RRORMvfVQ10e020/sGSOcbc
	npyx8JKmGAH6LmWd1Xf2dMowhZ6PU7LCS3h8/rjs8lWotM8TrAfKBT1WZMDH4XbSb6ONEiokSfKRG
	zvc8YPmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdrDQ-00975N-2j;
	Wed, 06 Sep 2023 12:01:00 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdoIO-007oYq-1e
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 08:53:59 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Rgbhv3mTtzrSZJ
	for <linux-mtd@lists.infradead.org>; Wed,  6 Sep 2023 16:51:59 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 6 Sep 2023 16:53:19 +0800
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
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <5dded3ae-20ab-2f3f-d43e-10e91d4eda21@huawei.com>
Date: Wed, 6 Sep 2023 16:53:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAM===sRtnHxuWG__FW_KZZG0iF0ZpYs4N+wtM9XuGKTUX2scHg@mail.gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_015356_897394_F6BDEB00 
X-CRM114-Status: GOOD (  20.08  )
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

5ZyoIDIwMjMvOS82IDE2OjM4LCBMZW9uIFBvbGxhayDlhpnpgZM6Cj4gWWVzLCB5b3UgYXJlIHJp
Z2h0IGFib3V0IHRoZSBzaXR1YXRpb24uCj4gTXkgcGFydGl0aW9uIGZvciBVQkkgaXMgMjQ4TWlC
Lgo+IFNvLCB0aGUgcXVlc3Rpb24gcmVtYWlucyAtIGNhbiB0aGlzIDhNQiBiZSB1dGlsaXplZD8K
ClllcywgaXQgY2FuLgoKPiBPciBhcmUgdGhleSBhbHJlYWR5IGluIHVzZSBieSBVQkkgd2hpY2gg
c2VlcyBwYXJ0aXRpb24gc2l6ZT8KPiAKPiAKPiBPbiBXZWQsIDYgU2VwdCAyMDIzIGF0IDEwOjM0
LCBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29tPiB3cm90ZToKPj4KPj4g5Zyo
IDIwMjMvOS82IDE1OjI3LCBMZW9uIFBvbGxhayDlhpnpgZM6Cj4+PiBJIHdvcmsgb24gZW1iZWRk
ZWQgZGV2aWNlLiBUaGUgcmVzdCBvZiB0aGUgTkFORCBpcyB1c2VkIGZvciBTUEwsCj4+PiBVLUJv
b3QsIFUtQm9vdCBlbnZpcm9ubWVudCBhbmQga2VybmVsLgo+Pj4gV2hhdCBpcyBsZWZ0IGlzIDI0
OE1pQi4KPj4+IEkgYW0gbm90IHN1cmUgSSBjYW4gdXNlIHRoZSB3aG9sZSBzcGFjZSBmb3IgVUJJ
IC0gaG93IHdpbGwgdGhlIFNQTC9VLUJvb3Qgd29yaz8KPj4KPj4gRG8geW91IG1lYW4gVUJJIGFu
ZCB1Ym9vdCBhcmUgcHV0IGludG8gc2FtZSBmbGFzaCgyNTZNKT8gSWYgc28sIHlvdXIKPj4gcGFy
dGl0aW9uaW5nIG1ldGhvZCBpcyByaWdodC4KPj4KPj4gOE0obXRkMCkgLSB1Ym9vdAo+PiAyNDhN
KG10ZDEpIC0gVUJJCj4+Cj4+IFVCSSB3b24ndCBhY2Nlc3MgbXRkMC4KPj4KPj4KPj4+Cj4+PiBP
biBXZWQsIDYgU2VwdCAyMDIzIGF0IDEwOjIxLCBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBo
dWF3ZWkuY29tPiB3cm90ZToKPj4+Pgo+Pj4+IOWcqCAyMDIzLzkvNiAxNDo1NywgTGVvbiBQb2xs
YWsg5YaZ6YGTOgo+Pj4+PiBUaG91c2FuZHMgb2YgdGhhbmtzLCBaaGloYW8gQ2hlbmchISEKPj4+
Pj4gSXQgd29ya2VkIGV4YWN0bHkgYXMgeW91IHdyb3RlLgo+Pj4+PiBUaGUgb25seSBxdWVzdGlv
biByZW1haW5lZCBpczoKPj4+Pj4gTXkgcGFydGl0aW9uIHNpemUgaXMgMjQ4TWlCLgo+Pj4+PiBJ
IHRob3VnaHQgdGhhdCBsZWF2aW5nIDhNaUIgInNwYXJlJyB3aWxsIGJlIHVzZWQganVzdCBmb3Ig
dGhlc2UKPj4+Pj4gcmVzZXJ2ZWQgUEVCcywgYnV0IG5vdyBJIHVuZGVyc3RhbmQgdGhpcyB3YXMg
aW5jb3JyZWN0Lgo+Pj4+PiBTbywgbWF5IEkgdXRpbGl6ZSB0aGVzZSA4TWlCIGJhY2sgb3Igd2ls
bCB0aGV5IHN0aWxsIGJlIHVzZWQgYnkgVUJJCj4+Pj4+IGZvciBzb21ldGhpbmc/Cj4+Pj4+Cj4+
Pj4KPj4+PiBJIGJlbGlldmUgeW91IGhhdmUgdHdvIG10ZCBkZXZpY2VzLCAyNDhNKG10ZDAgZm9y
IHViaSkgYW5kIDhNKHJlc2VydmVkLAo+Pj4+IHdvbid0IGJlIGFjY2Vzc2VkIGJ5IFVCSSkgbm93
LiBQbGVhc2UgZG9uJ3Qgc3BsaXQgdGhlIDI1Nk0gaW50byB0d28gbXRkCj4+Pj4gZGV2aWNlcyBp
ZiB5b3Ugb25seSBuZWVkIDEgVUJJIGRldmljZSwganVzdCBmb3JtYXQgdGhlIHdob2xlIGZsYXNo
KDI1Nk0pCj4+Pj4gaW50byBVQkksIGFuZCBVQkkgaXRzZWxmIHdpbGwgaGFuZGxlIGl0cyByZXNl
cnZhdGlvbiB3aXRob3V0IHVzZXIKPj4+PiBpbnRlcnZlbmluZy4KPj4+Pgo+Pj4+PiBPbiBXZWQs
IDYgU2VwdCAyMDIzIGF0IDA1OjUwLCBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWku
Y29tPiB3cm90ZToKPj4+Pj4+Cj4+Pj4+PiDlnKggMjAyMy85LzYgMTA6NDIsIFpoaWhhbyBDaGVu
ZyDlhpnpgZM6Cj4+Pj4+Pj4g5ZyoIDIwMjMvOS81IDIyOjQ1LCBMZW9uIFBvbGxhayDlhpnpgZM6
Cj4+Pj4+Pj4gSGkKPj4+Pj4+Pj4gSGVsbG8sIGFsbC4KPj4+Pj4+Pj4gSSB3aWxsIGJlIHZlcnkg
dmVyeSB0aGFua2Z1bCBmb3IgdGhlIGhlbHAgdG8gZmluZCB0aGUgY29ycmVjdAo+Pj4+Pj4+PiBj
b25maWd1cmF0aW9uIGZvciBteSBOQU5ELgo+Pj4+Pj4+PiBJIHBhc3NlZCB0aHJvdWdoIGEgbG90
IG9mIG1haWxzIGluIHRoZSBsaXN0cyBhbmQgZ29vZ2xlIGFuZCBDaGF0R1BUIC0KPj4+Pj4+Pj4g
bm8gc3VjY2Vzcy4KPj4+Pj4+Pj4gSSBoYXZlIDI1Nk1CIE5BTkQgYW5kIDI0OE1CIHBhcnRpdGlv
biBmb3IgVUJJRlMuIEkgcnVuOgo+Pj4+Pj4+PiBta2ZzLnViaWZzIC12IC1yIHJvb3RmcyAtRiAt
bSAyMDQ4IC1lIDEyNjk3NiAtYyAxOTgxIC1vIC4vdWJpZnMuaW1nCj4+Pj4+Pj4+IHViaW5pemUg
LXYgLW8gcm9vdGZzLmltZyAtbSAyMDQ4IC1wIDEyOEtpQiAtcyA1MTIgLU8gMjA0OCB1YmluaXpl
LmNmZwo+Pj4+Pj4+PiAtLS0tLQo+Pj4+Pj4+PiBhbmQgdWJpbml6ZS5jZmcgbG9va3MgbGlrZToK
Pj4+Pj4+Pj4gW3ViaWZzXQo+Pj4+Pj4+PiBtb2RlPXViaQo+Pj4+Pj4+PiBpbWFnZT0uL3ViaWZz
LmltZwo+Pj4+Pj4+PiB2b2xfaWQ9MAo+Pj4+Pj4+PiB2b2xfc2l6ZT0yNDBNaUIKPj4+Pj4+Pj4g
dm9sX3R5cGU9ZHluYW1pYwo+Pj4+Pj4+PiB2b2xfbmFtZT11Ymlfcm9vdGZzCj4+Pj4+Pj4+IHZv
bF9hbGlnbm1lbnQ9MQo+Pj4+Pj4+PiB2b2xfZmxhZ3M9YXV0b3Jlc2l6ZQo+Pj4+Pj4+PiAtLS0t
LS0KPj4+Pj4+Pj4gS2VybmVsIGNvbmZpZ3VyYXRpb24gIHdhcyB3aXRoIENPTkZJR19NVERfVUJJ
X0JFQl9MSU1JVD0yMC4KPj4+Pj4+Pj4gYW5kIGhlcmUgaXMgdGhlIGtlcm5lbCBsb2c6Cj4+Pj4+
Pj4+IFsgICAgMi42OTU2NTldIHViaTA6IGF0dGFjaGluZyBtdGQ0Cj4+Pj4+Pj4+IFsgICAgMy4z
NzIzNDNdIHViaTA6IHNjYW5uaW5nIGlzIGZpbmlzaGVkCj4+Pj4+Pj4+IFsgICAgMy4zODMwNjZd
IHViaTAgd2FybmluZzogdWJpX2ViYV9pbml0OiBjYW5ub3QgcmVzZXJ2ZSBlbm91Z2ggUEVCcwo+
Pj4+Pj4+PiBmb3IgYmFkIFBFQiBoYW5kbGluZywgcmVzZXJ2ZWQgNCwgbmVlZCA0MAo+Pj4+Pj4+
PiBbICAgIDMuNDA0MzIwXSB1YmkwOiB2b2x1bWUgMCAoInViaV9yb290ZnMiKSByZS1zaXplZCBm
cm9tIDE5ODIgdG8KPj4+Pj4+Pj4gMTk4MiBMRUJzCj4+Pj4+Pj4+IFsgICAgMy40MTE2NjddIHVi
aTA6IGF0dGFjaGVkIG10ZDQgKG5hbWUgIkZTIiwgc2l6ZSAyNDggTWlCKQo+Pj4+Pj4+PiBbICAg
IDMuNDE3MDk1XSB1YmkwOiBQRUIgc2l6ZTogMTMxMDcyIGJ5dGVzICgxMjggS2lCKSwgTEVCIHNp
emU6Cj4+Pj4+Pj4+IDEyNjk3NiBieXRlcwo+Pj4+Pj4+PiBbICAgIDMuNDI0MDA2XSB1YmkwOiBt
aW4uL21heC4gSS9PIHVuaXQgc2l6ZXM6IDIwNDgvMjA0OCwgc3ViLXBhZ2UKPj4+Pj4+Pj4gc2l6
ZSA1MTIKPj4+Pj4+Pj4gWyAgICAzLjQzMDc0MF0gdWJpMDogVklEIGhlYWRlciBvZmZzZXQ6IDIw
NDggKGFsaWduZWQgMjA0OCksIGRhdGEKPj4+Pj4+Pj4gb2Zmc2V0OiA0MDk2Cj4+Pj4+Pj4+IFsg
ICAgMy40Mzc3MzRdIHViaTA6IGdvb2QgUEVCczogMTk5MCwgYmFkIFBFQnM6IDAsIGNvcnJ1cHRl
ZCBQRUJzOiAwCj4+Pj4+Pj4+IFsgICAgMy40NDM4NjBdIHViaTA6IHVzZXIgdm9sdW1lOiAxLCBp
bnRlcm5hbCB2b2x1bWVzOiAxLCBtYXguIHZvbHVtZXMKPj4+Pj4+Pj4gY291bnQ6IDEyOAo+Pj4+
Pj4+PiBbICAgIDMuNDUxMTE3XSB1YmkwOiBtYXgvbWVhbiBlcmFzZSBjb3VudGVyOiAxLzAsIFdM
IHRocmVzaG9sZDogNDA5NiwKPj4+Pj4+Pj4gaW1hZ2Ugc2VxdWVuY2UgbnVtYmVyOiAxNTkwNTcw
MDczCj4+Pj4+Pj4+IFsgICAgMy40NjAyOTVdIHViaTA6IGF2YWlsYWJsZSBQRUJzOiAwLCB0b3Rh
bCByZXNlcnZlZCBQRUJzOiAxOTkwLAo+Pj4+Pj4+PiBQRUJzIHJlc2VydmVkIGZvciBiYWQgUEVC
IGhhbmRsaW5nOiA0Cj4+Pj4+Pj4+IFsgICAgMy40Njk1NzVdIHViaTA6IGJhY2tncm91bmQgdGhy
ZWFkICJ1YmlfYmd0MGQiIHN0YXJ0ZWQsIFBJRCAxMzEKPj4+Pj4+Pj4gWyAgICA0LjY0ODcxOF0g
VUJJRlMgKHViaTA6MCk6IGJhY2tncm91bmQgdGhyZWFkICJ1Ymlmc19iZ3QwXzAiCj4+Pj4+Pj4+
IHN0YXJ0ZWQsIFBJRCAxMzYKPj4+Pj4+Pj4gWyAgICA0LjY3NjY0MF0gVUJJRlMgKHViaTA6MCk6
IHN0YXJ0IGZpeGluZyB1cCBmcmVlIHNwYWNlCj4+Pj4+Pj4+IFsgICAxMC4yNTAwOTldIFVCSUZT
ICh1YmkwOjApOiBmcmVlIHNwYWNlIGZpeHVwIGNvbXBsZXRlCj4+Pj4+Pj4+IFsgICAxMC4yNjkw
NDZdIFVCSUZTICh1YmkwOjApOiBVQklGUzogbW91bnRlZCBVQkkgZGV2aWNlIDAsIHZvbHVtZSAw
LAo+Pj4+Pj4+PiBuYW1lICJ1Ymlfcm9vdGZzIgo+Pj4+Pj4+PiBbICAgMTAuMjc2ODMwXSBVQklG
UyAodWJpMDowKTogTEVCIHNpemU6IDEyNjk3NiBieXRlcyAoMTI0IEtpQiksCj4+Pj4+Pj4+IG1p
bi4vbWF4LiBJL08gdW5pdCBzaXplczogMjA0OCBieXRlcy8yMDQ4IGJ5dGVzCj4+Pj4+Pj4+IFsg
ICAxMC4yODY3OTRdIFVCSUZTICh1YmkwOjApOiBGUyBzaXplOiAyNTAxNDI3MjAgYnl0ZXMgKDIz
OCBNaUIsIDE5NzAKPj4+Pj4+Pj4gTEVCcyksIGpvdXJuYWwgc2l6ZSA5MDIzNDg4IGJ5dGVzICg4
IE1pQiwgNzIgTEVCcykKPj4+Pj4+Pj4gWyAgIDEwLjI5NzU0MF0gVUJJRlMgKHViaTA6MCk6IHJl
c2VydmVkIGZvciByb290OiAwIGJ5dGVzICgwIEtpQikKPj4+Pj4+Pj4gWyAgIDEwLjMwMzQwNl0g
VUJJRlMgKHViaTA6MCk6IG1lZGlhIGZvcm1hdDogdzQvcjAgKGxhdGVzdCBpcyB3NS9yMCksCj4+
Pj4+Pj4+IFVVSUQgQTE0RDU4NkEtMzJFMi00NUQ3LUEwN0UtQkRDNDcyRkRGMzFELCBzbWFsbCBM
UFQgbW9kZWwKPj4+Pj4+Pj4KPj4+Pj4+Pj4gTXkgcXVlc3Rpb24gaXM6IHdoeSBkb2VzIHRoaXMg
d2FybmluZyBhYm91dCByZXNlcnZlZCA0LCBuZWVkZWQgNDAKPj4+Pj4+Pj4gYXBwZWFyPyBIb3cg
Y2FuIEkgc29sdmUgdGhpcz8KPj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IFNvbHV0aW9uOiBNb2Rp
ZnkgdWJpbml6ZS5jZmcsICB2b2xfc2l6ZT0yNDBNaUIgLT4gdm9sX3NpemU9MjM1TWlCCj4+Pj4+
Pj4KPj4+Pj4+PiBXaHkgZG9lcyB0aGlzIHdhcm5pbmcgYWJvdXQgcmVzZXJ2ZWQgNCwgbmVlZGVk
IDQwIGFwcGVhcj8KPj4+Pj4+PiBUaGUgY291bnQgb2YgYmFkIFBFQnMgcmVzZXJ2ZWQgYnkgVUJJ
IGlzOiB0b3RhbF9wZWJzKG5hbmQgY2hpcCkgKgo+Pj4+Pj4+IENPTkZJR19NVERfVUJJX0JFQl9M
SU1JVC8xMDI0ID0gMjA0OCAqICAyMCAvIDEwMjQgPSA0MAo+Pj4+Pj4+IFdoZW4gZmFzdG1hcCBp
cyBub3QgZW5hYmxlZCwgdGhlIGNvdW50IG9mIGludGVybmFsIFBFQnMgcmVzZXJ2ZWQgYnkgVUJJ
Cj4+Pj4+Pj4gaXM6IFVCSV9MQVlPVVRfVk9MVU1FX0VCU1syXSArIFdMX1JFU0VSVkVEX1BFQlNb
MV0gKwo+Pj4+Pj4+IEVCQV9SRVNFUlZFRF9QRUJTWzFdID0gNAo+Pj4+Pj4+Cj4+Pj4+Pj4gVG90
YWwgUEVCcyBmb3IgVUJJIGlzIDE5OTAoZ29vZCBQRUJzOiAxOTkwKSwgdGhlIG1heCBjb3VudCBv
ZiB1c2VyCj4+Pj4+Pj4gdm9sdW1lIFBFQnMgaXMgMTk5MCAtIDQwIC0gNCA9IDE5NDYKPj4+Pj4+
Pgo+Pj4+Pj4+IEluIHViaW5pemUuY2ZnLCB2b2xfc2l6ZT0yNDBNaUIsIHRoZSBjb3VudCBvZiB1
c2VyIHZvbHVtZSBQRUJzIGlzKHNlZQo+Pj4+Pj4+IHViaW5pemUuYyBpbiBtdGR1aXRscyk6IHZp
X3NpemUgKyAobGViX3NpemUgLSAxKSAvIGxlYl9zaXplCj4+Pj4+Pj4gdmlfc2l6ZSA9IDI0ME0g
PSAyNDAgKiAxMDI0ICogMTAyNAo+Pj4+Pj4+IGxlYl9zaXplID0gMTI4SyAtIDJLKGVjKSAtIDJL
KHZpZCkgPSAxMjQgKiAxMDI0Cj4+Pj4+Pj4gcmVzdWx0ID0gMTk4Mgo+Pj4+Pj4+Cj4+Pj4+Pj4g
U28gdGhlcmUgYXJlIDE5OTAgLSAxOTgyIC0gNCA9IDQgUEVCcyByZXNlcnZlZCBmb3IgYmFkIFBF
QiBoYW5kbGluZywKPj4+Pj4+PiB3aGljaCBpcyBsZXNzIHRoYW4gNDAuCj4+Pj4+Pj4KPj4+Pj4+
PiBXaGVuIHdlIHNldCAgdm9sX3NpemU9MjM1TWlCLCB0aGUgY291bnQgb2YgdXNlciB2b2x1bWUg
UEVCcyBpczogKDIzNSAqCj4+Pj4+Pj4gMTAyNCAqIDEwMjQgKyAxMjQgKiAxMDI0IC0gMSkgLyAo
MTI0ICogMTAyNCkgPSAxOTQxCj4+Pj4+Pj4gMTk5MCAtIDQgLSA0MCA9IDE5NDYsIGZpbmFsbHkg
bWF5YmUgdGhlcmUgaXMgbWVzc2FnZSBmcm9tIGtlcm5lbCBsaWtlCj4+Pj4+Pj4gIigidWJpX3Jv
b3RmcyIpIHJlLXNpemVkIGZyb20gMTk0MSB0byAxOTQ2IExFQnMiLgo+Pj4+Pj4KPj4+Pj4+IEFj
dXRhbGx5LCB0aGUgJ3ZvbF9zaXplJyBpbiB1YmluaXplLmNmZyBtZWFucyB0aGUgc2l6ZSBvZiBk
YXRhIG9uCj4+Pj4+PiB2b2x1bWUoZXhjbHVkZSB2aWQvZWMpLCBub3QgdGhlIHNpemUgb2Ygdm9s
dW1lKGluY2x1ZGUgdmlkL2VjKS4KPj4+Pj4+Cj4+Pj4+Cj4+Pj4+IC4KPj4+Pj4KPj4+Pgo+Pj4K
Pj4+IC4KPj4+Cj4+Cj4gCj4gLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
