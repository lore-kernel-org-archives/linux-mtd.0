Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05E6E75459
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Oct 2023 18:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dQ16hbf/zIqe8z6p+T6pScT0oWglSA34Gr6q3BUUTMg=; b=CT4jvAFZwYk+XOEDWJNDJfgpqW
	hzpMOuQ5BEu9ITqpe/m3s8g0E8Us/P1/Q5PwE0udM7UleVzAF+vkDXf/gLN6Xcp1+6TFCtDLPc1fn
	63XgcUb9TtUaQu4YpgqRuYhqXAvPJ20DBzHFJcALj7/DecWOojVYO+PEknD9C3QSt6SrcYsYan2f0
	O1cPjUpw7VpBghAT9To7B2d0NQdaJ1s5rIMph9W0YjIvDbQhk5v/wyMajPP0jFqq8EobVvguxU5gD
	/heTM2xPFSrMfigOEAec0503bNYHkmiFyRobHYjKgppPtz5fPX0OnxdMYiW6PHIeVrJC/xKSD0+zX
	JRZrRR1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnkPL-00F8yz-1T;
	Tue, 03 Oct 2023 18:46:11 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnkPF-00F8xo-23
	for linux-mtd@lists.infradead.org;
	Tue, 03 Oct 2023 18:46:10 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2158E6340E0E;
	Tue,  3 Oct 2023 20:46:04 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id YXf_5sB6IDQO; Tue,  3 Oct 2023 20:46:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4184D6340DF3;
	Tue,  3 Oct 2023 20:46:03 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id zQ-FJz0PTVGL; Tue,  3 Oct 2023 20:46:03 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 025336340DE8;
	Tue,  3 Oct 2023 20:46:02 +0200 (CEST)
Date: Tue, 3 Oct 2023 20:46:02 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1135175877.31585.1696358762881.JavaMail.zimbra@nod.at>
In-Reply-To: <1bb74a9feeeb64dcd94024fbfa3a8259fcdac53d.1691717480.git.daniel@makrotopia.org>
References: <cover.1691717480.git.daniel@makrotopia.org> <1bb74a9feeeb64dcd94024fbfa3a8259fcdac53d.1691717480.git.daniel@makrotopia.org>
Subject: Re: [PATCH v4 4/8] mtd: ubi: block: use notifier to create ubiblock
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: block: use notifier to create ubiblock
Thread-Index: pcyMIJkQgdcxJxlQRVjxanFXVjGyiQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_114605_994771_5B1B47B4 
X-CRM114-Status: GOOD (  17.15  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkRhbmllbCBHb2xsZSIgPGRh
bmllbEBtYWtyb3RvcGlhLm9yZz4KPiBBbjogIlJhbmR5IER1bmxhcCIgPHJkdW5sYXBAaW5mcmFk
ZWFkLm9yZz4sICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4sICJy
aWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+LAo+ICJWaWduZXNoIFJhZ2hhdmVuZHJhIiA8dmlnbmVz
aHJAdGkuY29tPiwgIlJvYiBIZXJyaW5nIiA8cm9iaCtkdEBrZXJuZWwub3JnPiwgIktyenlzenRv
ZiBLb3psb3dza2kiCj4gPGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz4sICJDb25v
ciBEb29sZXkiIDxjb25vcitkdEBrZXJuZWwub3JnPiwgIkRhbmllbCBHb2xsZSIgPGRhbmllbEBt
YWtyb3RvcGlhLm9yZz4sCj4gImxpbnV4LW10ZCIgPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQu
b3JnPiwgImRldmljZXRyZWUiIDxkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZz4sICJsaW51eC1r
ZXJuZWwiCj4gPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+Cj4gR2VzZW5kZXQ6IEZyZWl0
YWcsIDExLiBBdWd1c3QgMjAyMyAwMzozNzozMQo+IEJldHJlZmY6IFtQQVRDSCB2NCA0LzhdIG10
ZDogdWJpOiBibG9jazogdXNlIG5vdGlmaWVyIHRvIGNyZWF0ZSB1YmlibG9jawoKPiBVc2UgVUJJ
X1ZPTFVNRV9BRERFRCBub3RpZmljYXRpb24gdG8gY3JlYXRlIHViaWJsb2NrIGRldmljZSBzcGVj
aWZpZWQKPiBvbiBrZXJuZWwgY21kbGluZSBvciBtb2R1bGUgcGFyYW1ldGVyLgo+IFRoaXMgbWFr
ZXMgdGhpbmcgbW9yZSBzaW1wbGUgYW5kIGhhcyB0aGUgYWR2YW50YWdlIHRoYXQgdWJpYmxvY2sg
ZGV2aWNlcwoKKnRoaW5ncwoKPiBvbiB2b2x1bWVzIHdoaWNoIGFyZSBub3QgcHJlc2VudCBhdCB0
aGUgdGltZSB0aGUgdWJpIG1vZHVsZSBpcyBwcm9iZWQKPiB3aWxsIHN0aWxsIGJlIGNyZWF0ZWQu
Cj4gCj4gU3VnZ2VzdGVkLWJ5OiBaaGloYW8gQ2hlbmcgPGNoZW5nemhpaGFvMUBodWF3ZWkuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBHb2xsZSA8ZGFuaWVsQG1ha3JvdG9waWEub3JnPgo+
IC0tLQo+IGRyaXZlcnMvbXRkL3ViaS9ibG9jay5jIHwgMTUyICsrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLS0KPiAxIGZpbGUgY2hhbmdlZCwgODQgaW5zZXJ0aW9ucygrKSwg
NjggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5j
IGIvZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMKPiBpbmRleCA2OWZhNmZlY2I4NDk0Li5lMDYxOGJi
ZGUzNjEzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9ibG9jay5jCj4gKysrIGIvZHJp
dmVycy9tdGQvdWJpL2Jsb2NrLmMKPiBAQCAtMzMsNiArMzMsNyBAQAo+ICNpbmNsdWRlIDxsaW51
eC9rZXJuZWwuaD4KPiAjaW5jbHVkZSA8bGludXgvbGlzdC5oPgo+ICNpbmNsdWRlIDxsaW51eC9t
dXRleC5oPgo+ICsjaW5jbHVkZSA8bGludXgvbmFtZWkuaD4KPiAjaW5jbHVkZSA8bGludXgvc2xh
Yi5oPgo+ICNpbmNsdWRlIDxsaW51eC9tdGQvdWJpLmg+Cj4gI2luY2x1ZGUgPGxpbnV4L2Jsa2Rl
di5oPgo+IEBAIC02NSwxMCArNjYsMTAgQEAgc3RydWN0IHViaWJsb2NrX3BkdSB7Cj4gfTsKPiAK
PiAvKiBOdW1iZXJzIG9mIGVsZW1lbnRzIHNldCBpbiB0aGUgQHViaWJsb2NrX3BhcmFtIGFycmF5
ICovCj4gLXN0YXRpYyBpbnQgdWJpYmxvY2tfZGV2cyBfX2luaXRkYXRhOwo+ICtzdGF0aWMgaW50
IHViaWJsb2NrX2RldnM7Cj4gCj4gLyogTVREIGRldmljZXMgc3BlY2lmaWNhdGlvbiBwYXJhbWV0
ZXJzICovCj4gLXN0YXRpYyBzdHJ1Y3QgdWJpYmxvY2tfcGFyYW0gdWJpYmxvY2tfcGFyYW1bVUJJ
QkxPQ0tfTUFYX0RFVklDRVNdIF9faW5pdGRhdGE7Cj4gK3N0YXRpYyBzdHJ1Y3QgdWJpYmxvY2tf
cGFyYW0gdWJpYmxvY2tfcGFyYW1bVUJJQkxPQ0tfTUFYX0RFVklDRVNdOwo+IAo+IHN0cnVjdCB1
YmlibG9jayB7Cj4gCXN0cnVjdCB1Ymlfdm9sdW1lX2Rlc2MgKmRlc2M7Cj4gQEAgLTUzMiw2ICs1
MzMsODUgQEAgc3RhdGljIGludCB1YmlibG9ja19yZXNpemUoc3RydWN0IHViaV92b2x1bWVfaW5m
byAqdmkpCj4gCXJldHVybiAwOwo+IH0KPiAKPiArc3RhdGljIGJvb2wKPiArbWF0Y2hfdm9sdW1l
X2Rlc2Moc3RydWN0IHViaV92b2x1bWVfaW5mbyAqdmksIGNvbnN0IGNoYXIgKm5hbWUsIGludCB1
YmlfbnVtLAo+IGludCB2b2xfaWQpCj4gK3sKPiArCWludCBlcnIsIGxlbjsKPiArCXN0cnVjdCBw
YXRoIHBhdGg7Cj4gKwlzdHJ1Y3Qga3N0YXQgc3RhdDsKPiArCj4gKwlpZiAodWJpX251bSA9PSAt
MSkgewo+ICsJCS8qIE5vIHViaSBudW0sIG5hbWUgbXVzdCBiZSBhIHZvbCBkZXZpY2UgcGF0aCAq
Lwo+ICsJCWVyciA9IGtlcm5fcGF0aChuYW1lLCBMT09LVVBfRk9MTE9XLCAmcGF0aCk7Cj4gKwkJ
aWYgKGVycikKPiArCQkJcmV0dXJuIGZhbHNlOwo+ICsKPiArCQllcnIgPSB2ZnNfZ2V0YXR0cigm
cGF0aCwgJnN0YXQsIFNUQVRYX1RZUEUsIEFUX1NUQVRYX1NZTkNfQVNfU1RBVCk7Cj4gKwkJcGF0
aF9wdXQoJnBhdGgpOwo+ICsJCWlmIChlcnIpCj4gKwkJCXJldHVybiBmYWxzZTsKPiArCj4gKwkJ
aWYgKCFTX0lTQ0hSKHN0YXQubW9kZSkpCj4gKwkJCXJldHVybiBmYWxzZTsKPiArCj4gKwkJaWYg
KHZpLT51YmlfbnVtICE9IHViaV9tYWpvcjJudW0oTUFKT1Ioc3RhdC5yZGV2KSkpCj4gKwkJCXJl
dHVybiBmYWxzZTsKPiArCj4gKwkJaWYgKHZpLT52b2xfaWQgIT0gTUlOT1Ioc3RhdC5yZGV2KSAt
IDEpCj4gKwkJCXJldHVybiBmYWxzZTsKPiArCgpUaGlzIGlzIG1vcmUgb3IgbGVzcyBhbiBvcGVu
IGNvZGVkIHViaV9vcGVuX3ZvbHVtZV9wYXRoKCkuClBsZWFzZSBlaXRoZXIgc3BsaXQgb3IgYWRv
cHQgdWJpX29wZW5fdm9sdW1lX3BhdGgoKSB0byBmaXQgeW91ciB1c2UgY2FzZS4KCj4gKwkJcmV0
dXJuIHRydWU7Cj4gKwl9Cj4gKwo+ICsJaWYgKHZvbF9pZCA9PSAtMSkgewo+ICsJCWlmICh2aS0+
dWJpX251bSAhPSB1YmlfbnVtKQo+ICsJCQlyZXR1cm4gZmFsc2U7Cj4gKwo+ICsJCWxlbiA9IHN0
cm5sZW4obmFtZSwgVUJJX1ZPTF9OQU1FX01BWCArIDEpOwo+ICsJCWlmIChsZW4gPCAxIHx8IHZp
LT5uYW1lX2xlbiAhPSBsZW4pCj4gKwkJCXJldHVybiBmYWxzZTsKPiArCj4gKwkJaWYgKHN0cmNt
cChuYW1lLCB2aS0+bmFtZSkpCj4gKwkJCXJldHVybiBmYWxzZTsKPiArCj4gKwkJcmV0dXJuIHRy
dWU7Cj4gKwl9CgpTYW1lIGZvciB1Ymlfb3Blbl92b2x1bWVfbm0oKS4KClRoYW5rcywKLy9yaWNo
YXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
