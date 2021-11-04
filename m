Return-Path: <SRS0=xf6T=PX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F523C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Nov 2021 17:08:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA1EF60F56
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Nov 2021 17:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA1EF60F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cTK9jw1c2/7pAenMIojdVifLC0YYkjMZId8K8BTQJPA=; b=gxwdozF0bezmWu
	oI6o9ZwGJv20auWAsPUUkzbHum4r8r1IhCM6YMaNJ76YhiSIf5Xlwnrn3hub+QMsB1U/QJOgTEdPh
	0N+L08D6cW6aik57dHyf9aaCTDiEr0K8JqCpWVG3EhWG6SibXarChbQsvB/7Eeti4nRrF1s6zr4h8
	efnl/mvPSod0bpSyWRnVNzhchrweXvzTO6Q5UPZGz3bxbWSJibxdt9blgRZinmKnm7aWZKqglDb3t
	pEjVAWyGTZ3gCg0oWpW0zriTHhQM0y4Wyl6ifRH3AEkelRp4pVpfDTWHHl10YwjdiZtGn3lqJpclT
	LIEHgGzHJMbra2XcTepg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1migDN-009aeA-5M; Thu, 04 Nov 2021 17:07:49 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1migDJ-009ada-E1; Thu, 04 Nov 2021 17:07:45 +0000
Date: Thu, 4 Nov 2021 10:07:45 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Jens Axboe <axboe@kernel.dk>, martin.petersen@oracle.com
Cc: miquel.raynal@bootlin.com, hare@suse.de, jack@suse.cz, hch@lst.de,
 song@kernel.org, dave.jiang@intel.com, richard@nod.at,
 vishal.l.verma@intel.com, penguin-kernel@i-love.sakura.ne.jp,
 tj@kernel.org, ira.weiny@intel.com, vigneshr@ti.com,
 dan.j.williams@intel.com, ming.lei@redhat.com, efremov@linux.com,
 linux-raid@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-scsi@vger.kernel.org
Subject: Re: [PATCH v5 00/14] last set for add_disk() error handling
Message-ID: <YYQTYctDjaxU2tkQ@bombadil.infradead.org>
References: <20211103230437.1639990-1-mcgrof@kernel.org>
 <163602655191.22491.10844091970007142957.b4-ty@kernel.dk>
 <4764286a-99b4-39f7-ce5c-9e88cee1a538@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4764286a-99b4-39f7-ce5c-9e88cee1a538@kernel.dk>
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

T24gVGh1LCBOb3YgMDQsIDIwMjEgYXQgMDY6NTM6MzRBTSAtMDYwMCwgSmVucyBBeGJvZSB3cm90
ZToKPiBPbiAxMS80LzIxIDU6NDkgQU0sIEplbnMgQXhib2Ugd3JvdGU6Cj4gPiBPbiBXZWQsIDMg
Tm92IDIwMjEgMTY6MDQ6MjMgLTA3MDAsIEx1aXMgQ2hhbWJlcmxhaW4gd3JvdGU6Cj4gPj4gSmVu
cywKPiA+Pgo+ID4+IGFzIHJlcXVlc3RlZCwgSSd2ZSBmb2xkZWQgYWxsIHBlbmRpbmcgY2hhbmdl
cyBpbnRvIHRoaXMgc2VyaWVzLiBUaGlzCj4gPj4gdjUgcGVncyBvbiBDaHJpc3RvcGgncyByZXZp
ZXdlZC1ieSB0YWdzIGFuZCBzaW5jZSBJIHdhcyByZXNwaW5uaW5nIEkKPiA+PiBtb2RpZmllZCB0
aGUgYXRhcHJvYmUgYW5kIGZsb3BweSBkcml2ZXIgY2hhbmdlcyBhcyBoZSBzdWdnZXN0ZWQuCj4g
Pj4KPiA+PiBJIHRoaW5rIHRoaXMgaXMgaXQuIFRoZSB3b3JsZCBvZiBmbG9wcHkgaGFzIGJlZW4g
ZXhjaXRpbmcgZm9yIHY1LjE2Lgo+ID4+Cj4gPj4gWy4uLl0KPiA+IAo+ID4gQXBwbGllZCwgdGhh
bmtzIQo+ID4gCj4gPiBbMDEvMTRdIG52ZGltbS9idHQ6IHVzZSBnb3RvIGVycm9yIGxhYmVscyBv
biBidHRfYmxrX2luaXQoKQo+ID4gICAgICAgICBjb21taXQ6IDI3NjJmZjA2YWE0OWUzYTEzZmI0
Yjc3OTEyMGY0ZjhjMTJjMzlmZDEKPiA+IFswMi8xNF0gbnZkaW1tL2J0dDogYWRkIGVycm9yIGhh
bmRsaW5nIHN1cHBvcnQgZm9yIGFkZF9kaXNrKCkKPiA+ICAgICAgICAgY29tbWl0OiAxNmJlNzk3
NGZmNWQwYTVjZDlmMzQ1NTcxYzNlYWMxYzNmNmJhNmRlCj4gPiBbMDMvMTRdIG52ZGltbS9ibGs6
IGF2b2lkIGNhbGxpbmcgZGVsX2dlbmRpc2soKSBvbiBlYXJseSBmYWlsdXJlcwo+ID4gICAgICAg
ICBjb21taXQ6IGI3NDIxYWZjZWMwYzc3YWI1ODYzMzU4N2RkYzI5ZDUzZTZlYjk1YWYKPiA+IFsw
NC8xNF0gbnZkaW1tL2JsazogYWRkIGVycm9yIGhhbmRsaW5nIHN1cHBvcnQgZm9yIGFkZF9kaXNr
KCkKPiA+ICAgICAgICAgY29tbWl0OiBkYzEwNGY0YmIyZDBhNjUyZGVlMDEwZTQ3YmM4OWMxYWQy
YWIzN2M5Cj4gPiBbMDUvMTRdIG52ZGltbS9wbWVtOiBjbGVhbnVwIHRoZSBkaXNrIGlmIHBtZW1f
cmVsZWFzZV9kaXNrKCkgaXMgeWV0IGFzc2lnbmVkCj4gPiAgICAgICAgIGNvbW1pdDogYWNjZjU4
YWZiNjg5ZjgxZGFhZGRlMjQwODBlYTExNjRhZDJkYjc1Zgo+ID4gWzA2LzE0XSBudmRpbW0vcG1l
bTogdXNlIGFkZF9kaXNrKCkgZXJyb3IgaGFuZGxpbmcKPiA+ICAgICAgICAgY29tbWl0OiA1YTE5
MmNjYzMyZTI5ODFmNzIxMzQzYzc1MGI4Y2ZiNGMzZjQxMDA3Cj4gPiBbMDcvMTRdIHoycmFtOiBh
ZGQgZXJyb3IgaGFuZGxpbmcgc3VwcG9ydCBmb3IgYWRkX2Rpc2soKQo+ID4gICAgICAgICBjb21t
aXQ6IDE1NzMzNzU0Y2NmMzVjNDlkMmYzNmE3YWM1MWFkYzhiOTc1YzFjNzgKPiA+IFswOC8xNF0g
YmxvY2svc3VudmRjOiBhZGQgZXJyb3IgaGFuZGxpbmcgc3VwcG9ydCBmb3IgYWRkX2Rpc2soKQo+
ID4gICAgICAgICBjb21taXQ6IGY1ODNlYWVmMGFmMzliNzkyZDc0ZTM5NzIxYjViYTRiNjk0OGEy
NzAKPiA+IFswOS8xNF0gbXRkL3ViaS9ibG9jazogYWRkIGVycm9yIGhhbmRsaW5nIHN1cHBvcnQg
Zm9yIGFkZF9kaXNrKCkKPiA+ICAgICAgICAgY29tbWl0OiBlZDczOTE5MTI0YjJlNDg0OTBhZGJi
ZTQ4ZmZlODg1YTJhNGM2ZmVlCj4gPiBbMTAvMTRdIGF0YWZsb3A6IHJlbW92ZSBhdGFmbG9wX3By
b2JlX2xvY2sgbXV0ZXgKPiA+ICAgICAgICAgY29tbWl0OiA0ZGRiODVkMzY2MTNjNDViZGUwMGQz
NjhiZjlmMzU3YmQwNzA4YTBjCj4gPiBbMTEvMTRdIGJsb2NrOiB1cGRhdGUgX19yZWdpc3Rlcl9i
bGtkZXYoKSBwcm9iZSBkb2N1bWVudGF0aW9uCj4gPiAgICAgICAgIGNvbW1pdDogMjZlMDZmNWIx
MzY3MWQxOTRkNjdhZThlMmI2NmY1MjRhYjE3NDE1Mwo+ID4gWzEyLzE0XSBhdGFmbG9wOiBhZGRy
ZXNzIGFkZF9kaXNrKCkgZXJyb3IgaGFuZGxpbmcgb24gcHJvYmUKPiA+ICAgICAgICAgY29tbWl0
OiA0NmE3ZGI0OTJlN2EyNzQwOGJjMTY0Y2JlNjQyNDY4M2U3OTUyOWIwCj4gPiBbMTMvMTRdIGZs
b3BweTogYWRkcmVzcyBhZGRfZGlzaygpIGVycm9yIGhhbmRsaW5nIG9uIHByb2JlCj4gPiAgICAg
ICAgIGNvbW1pdDogZWMyOGZjYzZjZmNkNDE4ZDIwMDM4YWQyYzQ5MmU4N2JmM2E5ZjAyNgo+ID4g
WzE0LzE0XSBibG9jazogYWRkIF9fbXVzdF9jaGVjayBmb3IgKmFkZF9kaXNrKigpIGNhbGxlcnMK
PiA+ICAgICAgICAgY29tbWl0OiAxNjk4NzEyZDg1ZWMyZjEyOGZjN2U3YzVkYzIwMThiNWVkMmI3
Y2Y2Cj4gCj4gcml2ZXJzL3Njc2kvc2QuYzogSW4gZnVuY3Rpb24g4oCYc2RfcHJvYmXigJk6Cj4g
ZHJpdmVycy9zY3NpL3NkLmM6MzU3Mzo5OiB3YXJuaW5nOiBpZ25vcmluZyByZXR1cm4gdmFsdWUg
b2Yg4oCYZGV2aWNlX2FkZF9kaXNr4oCZIGRlY2xhcmVkIHdpdGggYXR0cmlidXRlIOKAmHdhcm5f
dW51c2VkX3Jlc3VsdOKAmSBbLVd1bnVzZWQtcmVzdWx0XQo+ICAzNTczIHwgICAgICAgICBkZXZp
Y2VfYWRkX2Rpc2soZGV2LCBnZCwgTlVMTCk7Cj4gICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fgo+IGRyaXZlcnMvc2NzaS9zci5jOiBJbiBmdW5jdGlvbiDigJhz
cl9wcm9iZeKAmToKPiBkcml2ZXJzL3Njc2kvc3IuYzo3MzE6OTogd2FybmluZzogaWdub3Jpbmcg
cmV0dXJuIHZhbHVlIG9mIOKAmGRldmljZV9hZGRfZGlza+KAmSBkZWNsYXJlZCB3aXRoIGF0dHJp
YnV0ZSDigJh3YXJuX3VudXNlZF9yZXN1bHTigJkgWy1XdW51c2VkLXJlc3VsdF0KPiAgIDczMSB8
ICAgICAgICAgZGV2aWNlX2FkZF9kaXNrKCZzZGV2LT5zZGV2X2dlbmRldiwgZGlzaywgTlVMTCk7
Cj4gICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+Cj4gCj4gCj4gRHJvcHBpbmcgdGhlIGxhc3QgdHdvIHBhdGNoZXMuLi4KCk1hcnRp
biBLIFBldGVyc29uIGhhcyB0aGUgcmVzcGVjdGl2ZSBwYXRjaGVzIG5lZWRlZCBxdWV1ZWQgdXAg
b24gaGlzIHRyZWUKZm9yIHY1LjE2OgoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvbWtwL3Njc2kuZ2l0L2NvbW1pdC8/aD01LjE2L3Njc2ktc3RhZ2luZyZp
ZD1lOWQ2NThjMjE3NWI5NWE4ZjA5MWIxMmRkZWZiMjcxNjgzYWVhY2Q5Cmh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L21rcC9zY3NpLmdpdC9jb21taXQvP2g9
NS4xNi9zY3NpLXN0YWdpbmcmaWQ9MmE3YTg5MWY0YzQwNjgyMjgwMWVjZDY3NmIwNzZjNjRkZTA3
MmM5ZQoKV291bGQgdGhlIGxhc3QgcGF0Y2ggYmUgc2VudCBvbmNlIHRoYXQgZ2V0cyB0byBMaW51
cz8KCkFsc28gY3VyaW91cyB3aHkgZHJvcCB0aGUgbGFzdCB0d28gcGF0Y2hlcyBpbnN0ZWFkIGp1
c3QgdGhlIGxhc3Qgb25lIGZvcgpub3c/CgogIEx1aXMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
