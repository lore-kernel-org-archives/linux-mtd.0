Return-Path: <SRS0=xf6T=PX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 852EFC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Nov 2021 18:17:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50EAC61215
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Nov 2021 18:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50EAC61215
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcOpzt3cnza/tHm2h6pXev0QMen8jyHiLuhG7sfWBdc=; b=Zw9oiGxz3SBE3L
	jETctUMR1G5HK5yBhWrY5T2l0ieGenNEYhAhOWZqyhKbNVzReP3AwUxy2VRUbgWd8xlBDAXhSOLtB
	3O0mPoxFjfB5A8NExaAfJuSIp90GNFd+zDsnLlqLlag9K8aO1MG3u5+cPNErDcblk08tPyezj5tt9
	2FFNLQ/DpuR53Lqiz9a4sYkZy6fTwtPYW1at1lY6mgRhpkb49ev6WZlQrbqClQbeir3yw+nThbLhi
	TWdclH4fL9Yt354LhykEV56XaMXJetO+aT+zBXNPWT9h7LGHUkV/HHujmRaijc1wR3z+B6xNEIhNy
	CDgxTNv9bTkP0UEVSiSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mihHZ-009llA-Gu; Thu, 04 Nov 2021 18:16:13 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mihHW-009lko-Ax; Thu, 04 Nov 2021 18:16:10 +0000
Date: Thu, 4 Nov 2021 11:16:10 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: martin.petersen@oracle.com, miquel.raynal@bootlin.com, hare@suse.de,
 jack@suse.cz, hch@lst.de, song@kernel.org, dave.jiang@intel.com,
 richard@nod.at, vishal.l.verma@intel.com,
 penguin-kernel@i-love.sakura.ne.jp, tj@kernel.org,
 ira.weiny@intel.com, vigneshr@ti.com, dan.j.williams@intel.com,
 ming.lei@redhat.com, efremov@linux.com, linux-raid@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH v5 00/14] last set for add_disk() error handling
Message-ID: <YYQjamPUtrq402Cr@bombadil.infradead.org>
References: <20211103230437.1639990-1-mcgrof@kernel.org>
 <163602655191.22491.10844091970007142957.b4-ty@kernel.dk>
 <4764286a-99b4-39f7-ce5c-9e88cee1a538@kernel.dk>
 <YYQTYctDjaxU2tkQ@bombadil.infradead.org>
 <377b472e-b788-df12-f9cd-7fc7b0887dc0@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <377b472e-b788-df12-f9cd-7fc7b0887dc0@kernel.dk>
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

T24gVGh1LCBOb3YgMDQsIDIwMjEgYXQgMTE6MTA6NDhBTSAtMDYwMCwgSmVucyBBeGJvZSB3cm90
ZToKPiBPbiAxMS80LzIxIDExOjA3IEFNLCBMdWlzIENoYW1iZXJsYWluIHdyb3RlOgo+ID4gT24g
VGh1LCBOb3YgMDQsIDIwMjEgYXQgMDY6NTM6MzRBTSAtMDYwMCwgSmVucyBBeGJvZSB3cm90ZToK
PiA+PiBPbiAxMS80LzIxIDU6NDkgQU0sIEplbnMgQXhib2Ugd3JvdGU6Cj4gPj4+IE9uIFdlZCwg
MyBOb3YgMjAyMSAxNjowNDoyMyAtMDcwMCwgTHVpcyBDaGFtYmVybGFpbiB3cm90ZToKPiA+Pj4+
IEplbnMsCj4gPj4+Pgo+ID4+Pj4gYXMgcmVxdWVzdGVkLCBJJ3ZlIGZvbGRlZCBhbGwgcGVuZGlu
ZyBjaGFuZ2VzIGludG8gdGhpcyBzZXJpZXMuIFRoaXMKPiA+Pj4+IHY1IHBlZ3Mgb24gQ2hyaXN0
b3BoJ3MgcmV2aWV3ZWQtYnkgdGFncyBhbmQgc2luY2UgSSB3YXMgcmVzcGlubmluZyBJCj4gPj4+
PiBtb2RpZmllZCB0aGUgYXRhcHJvYmUgYW5kIGZsb3BweSBkcml2ZXIgY2hhbmdlcyBhcyBoZSBz
dWdnZXN0ZWQuCj4gPj4+Pgo+ID4+Pj4gSSB0aGluayB0aGlzIGlzIGl0LiBUaGUgd29ybGQgb2Yg
ZmxvcHB5IGhhcyBiZWVuIGV4Y2l0aW5nIGZvciB2NS4xNi4KPiA+Pj4+Cj4gPj4+PiBbLi4uXQo+
ID4+Pgo+ID4+PiBBcHBsaWVkLCB0aGFua3MhCj4gPj4+Cj4gPj4+IFswMS8xNF0gbnZkaW1tL2J0
dDogdXNlIGdvdG8gZXJyb3IgbGFiZWxzIG9uIGJ0dF9ibGtfaW5pdCgpCj4gPj4+ICAgICAgICAg
Y29tbWl0OiAyNzYyZmYwNmFhNDllM2ExM2ZiNGI3NzkxMjBmNGY4YzEyYzM5ZmQxCj4gPj4+IFsw
Mi8xNF0gbnZkaW1tL2J0dDogYWRkIGVycm9yIGhhbmRsaW5nIHN1cHBvcnQgZm9yIGFkZF9kaXNr
KCkKPiA+Pj4gICAgICAgICBjb21taXQ6IDE2YmU3OTc0ZmY1ZDBhNWNkOWYzNDU1NzFjM2VhYzFj
M2Y2YmE2ZGUKPiA+Pj4gWzAzLzE0XSBudmRpbW0vYmxrOiBhdm9pZCBjYWxsaW5nIGRlbF9nZW5k
aXNrKCkgb24gZWFybHkgZmFpbHVyZXMKPiA+Pj4gICAgICAgICBjb21taXQ6IGI3NDIxYWZjZWMw
Yzc3YWI1ODYzMzU4N2RkYzI5ZDUzZTZlYjk1YWYKPiA+Pj4gWzA0LzE0XSBudmRpbW0vYmxrOiBh
ZGQgZXJyb3IgaGFuZGxpbmcgc3VwcG9ydCBmb3IgYWRkX2Rpc2soKQo+ID4+PiAgICAgICAgIGNv
bW1pdDogZGMxMDRmNGJiMmQwYTY1MmRlZTAxMGU0N2JjODljMWFkMmFiMzdjOQo+ID4+PiBbMDUv
MTRdIG52ZGltbS9wbWVtOiBjbGVhbnVwIHRoZSBkaXNrIGlmIHBtZW1fcmVsZWFzZV9kaXNrKCkg
aXMgeWV0IGFzc2lnbmVkCj4gPj4+ICAgICAgICAgY29tbWl0OiBhY2NmNThhZmI2ODlmODFkYWFk
ZGUyNDA4MGVhMTE2NGFkMmRiNzVmCj4gPj4+IFswNi8xNF0gbnZkaW1tL3BtZW06IHVzZSBhZGRf
ZGlzaygpIGVycm9yIGhhbmRsaW5nCj4gPj4+ICAgICAgICAgY29tbWl0OiA1YTE5MmNjYzMyZTI5
ODFmNzIxMzQzYzc1MGI4Y2ZiNGMzZjQxMDA3Cj4gPj4+IFswNy8xNF0gejJyYW06IGFkZCBlcnJv
ciBoYW5kbGluZyBzdXBwb3J0IGZvciBhZGRfZGlzaygpCj4gPj4+ICAgICAgICAgY29tbWl0OiAx
NTczMzc1NGNjZjM1YzQ5ZDJmMzZhN2FjNTFhZGM4Yjk3NWMxYzc4Cj4gPj4+IFswOC8xNF0gYmxv
Y2svc3VudmRjOiBhZGQgZXJyb3IgaGFuZGxpbmcgc3VwcG9ydCBmb3IgYWRkX2Rpc2soKQo+ID4+
PiAgICAgICAgIGNvbW1pdDogZjU4M2VhZWYwYWYzOWI3OTJkNzRlMzk3MjFiNWJhNGI2OTQ4YTI3
MAo+ID4+PiBbMDkvMTRdIG10ZC91YmkvYmxvY2s6IGFkZCBlcnJvciBoYW5kbGluZyBzdXBwb3J0
IGZvciBhZGRfZGlzaygpCj4gPj4+ICAgICAgICAgY29tbWl0OiBlZDczOTE5MTI0YjJlNDg0OTBh
ZGJiZTQ4ZmZlODg1YTJhNGM2ZmVlCj4gPj4+IFsxMC8xNF0gYXRhZmxvcDogcmVtb3ZlIGF0YWZs
b3BfcHJvYmVfbG9jayBtdXRleAo+ID4+PiAgICAgICAgIGNvbW1pdDogNGRkYjg1ZDM2NjEzYzQ1
YmRlMDBkMzY4YmY5ZjM1N2JkMDcwOGEwYwo+ID4+PiBbMTEvMTRdIGJsb2NrOiB1cGRhdGUgX19y
ZWdpc3Rlcl9ibGtkZXYoKSBwcm9iZSBkb2N1bWVudGF0aW9uCj4gPj4+ICAgICAgICAgY29tbWl0
OiAyNmUwNmY1YjEzNjcxZDE5NGQ2N2FlOGUyYjY2ZjUyNGFiMTc0MTUzCj4gPj4+IFsxMi8xNF0g
YXRhZmxvcDogYWRkcmVzcyBhZGRfZGlzaygpIGVycm9yIGhhbmRsaW5nIG9uIHByb2JlCj4gPj4+
ICAgICAgICAgY29tbWl0OiA0NmE3ZGI0OTJlN2EyNzQwOGJjMTY0Y2JlNjQyNDY4M2U3OTUyOWIw
Cj4gPj4+IFsxMy8xNF0gZmxvcHB5OiBhZGRyZXNzIGFkZF9kaXNrKCkgZXJyb3IgaGFuZGxpbmcg
b24gcHJvYmUKPiA+Pj4gICAgICAgICBjb21taXQ6IGVjMjhmY2M2Y2ZjZDQxOGQyMDAzOGFkMmM0
OTJlODdiZjNhOWYwMjYKPiA+Pj4gWzE0LzE0XSBibG9jazogYWRkIF9fbXVzdF9jaGVjayBmb3Ig
KmFkZF9kaXNrKigpIGNhbGxlcnMKPiA+Pj4gICAgICAgICBjb21taXQ6IDE2OTg3MTJkODVlYzJm
MTI4ZmM3ZTdjNWRjMjAxOGI1ZWQyYjdjZjYKPiA+Pgo+ID4+IHJpdmVycy9zY3NpL3NkLmM6IElu
IGZ1bmN0aW9uIOKAmHNkX3Byb2Jl4oCZOgo+ID4+IGRyaXZlcnMvc2NzaS9zZC5jOjM1NzM6OTog
d2FybmluZzogaWdub3JpbmcgcmV0dXJuIHZhbHVlIG9mIOKAmGRldmljZV9hZGRfZGlza+KAmSBk
ZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZSDigJh3YXJuX3VudXNlZF9yZXN1bHTigJkgWy1XdW51c2Vk
LXJlc3VsdF0KPiA+PiAgMzU3MyB8ICAgICAgICAgZGV2aWNlX2FkZF9kaXNrKGRldiwgZ2QsIE5V
TEwpOwo+ID4+ICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4K
PiA+PiBkcml2ZXJzL3Njc2kvc3IuYzogSW4gZnVuY3Rpb24g4oCYc3JfcHJvYmXigJk6Cj4gPj4g
ZHJpdmVycy9zY3NpL3NyLmM6NzMxOjk6IHdhcm5pbmc6IGlnbm9yaW5nIHJldHVybiB2YWx1ZSBv
ZiDigJhkZXZpY2VfYWRkX2Rpc2vigJkgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUg4oCYd2Fybl91
bnVzZWRfcmVzdWx04oCZIFstV3VudXNlZC1yZXN1bHRdCj4gPj4gICA3MzEgfCAgICAgICAgIGRl
dmljZV9hZGRfZGlzaygmc2Rldi0+c2Rldl9nZW5kZXYsIGRpc2ssIE5VTEwpOwo+ID4+ICAgICAg
IHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fgo+ID4+Cj4gPj4KPiA+PiBEcm9wcGluZyB0aGUgbGFzdCB0d28gcGF0Y2hlcy4uLgo+ID4gCj4g
PiBNYXJ0aW4gSyBQZXRlcnNvbiBoYXMgdGhlIHJlc3BlY3RpdmUgcGF0Y2hlcyBuZWVkZWQgcXVl
dWVkIHVwIG9uIGhpcyB0cmVlCj4gPiBmb3IgdjUuMTY6Cj4gPiAKPiA+IGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L21rcC9zY3NpLmdpdC9jb21taXQvP2g9
NS4xNi9zY3NpLXN0YWdpbmcmaWQ9ZTlkNjU4YzIxNzViOTVhOGYwOTFiMTJkZGVmYjI3MTY4M2Fl
YWNkOQo+ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
bWtwL3Njc2kuZ2l0L2NvbW1pdC8/aD01LjE2L3Njc2ktc3RhZ2luZyZpZD0yYTdhODkxZjRjNDA2
ODIyODAxZWNkNjc2YjA3NmM2NGRlMDcyYzllCj4gPiAKPiA+IFdvdWxkIHRoZSBsYXN0IHBhdGNo
IGJlIHNlbnQgb25jZSB0aGF0IGdldHMgdG8gTGludXM/Cj4gCj4gQnV0IHRoYXQgZGVwZW5kZW5j
eSB3YXNuJ3QgY2xlYXIgaW4gdGhlIHBhdGNoZXMgcG9zdGVkLAoKU29ycnkgbXkgbWlzdGFrZS4K
Cj4gYW5kIGl0IGxlYXZlcyBtZQo+IHdvbmRlcmluZyBpZiB0aGVyZSBhcmUgb3RoZXJzPwoKVGhl
cmUgc2hvdWxkIG5vdCBiZSwgYmVjYXVhc2UgYXQgbGVhc3QgbXkgcGF0Y2hlcyBvbiB0b3Agb2Yg
bGludXgtbmV4dApjb21waWxlcyBmaW5lIGFzIHBlciAwLWRheSBidWlsZHMgb24gdG9ucyBvZiBj
b25maWdzLgoKPiBJIG9idmlvdXNseSBjYW4ndCBxdWV1ZSB1cCBhIHBhdGNoIHRoYXQKPiBhZGRz
IGEgbXVzdF9jaGVjayB0byBhIGZ1bmN0aW9uLCB3aGVuIHdlIHN0aWxsIGhhdmUgY2FsbGVycyB0
aGF0IGRvbid0Cj4gcHJvcGVybHkgY2hlY2sgaXQuCgpBYnNvbHV0ZWx5LgoKPiBUaGF0IHNob3Vs
ZCBoYXZlIGJlZW4gbWFkZSBjbGVhciwgYW5kIHRoYXQgbGFzdCBwYXRjaCBuZXZlciBzaG91bGQn
dmUKPiBiZWVuIHBhcnQgb2YgdGhlIHNlcmllcy4gUGxlYXNlIHNlbmQgaXQgb25jZSBMaW51cydz
IHRyZWUgaGFzIGFsbAo+IGNhbGxlcnMgY2hlY2tpbmcgdGhlIHJlc3VsdC4KCkluZGVlZC4gV2ls
bCB0cmFjayBhbmQgd2lsbCBkby4KCj4gPiBBbHNvIGN1cmlvdXMgd2h5IGRyb3AgdGhlIGxhc3Qg
dHdvIHBhdGNoZXMgaW5zdGVhZCBqdXN0IHRoZSBsYXN0IG9uZSBmb3IKPiA+IG5vdz8KPiAKPiBT
b3JyeSwgbWVhbnQganVzdCB0aGUgbGFzdCBvbmUuCgpBaCBvayEKCiAgTHVpcwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
