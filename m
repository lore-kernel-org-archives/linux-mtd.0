Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C743BCD98C7
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Oct 2023 04:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wWeQ7DHfE14GPXs285x+Uh5LD/ZCeg5BTFoAvw0IcLA=; b=QveRgRO/k3yUSI
	U49va3joyKxnPua0JbkpU9yljpI+kPYkne4YhDVTvN2jMbE68L7UlsvhwlOaoUg+YKMrq+dFKi6Lh
	5O+hHzYRo8gwzQT0u886eKD/qMUEtKWJ7UcsMgS4PG1Do7DKwYSjF0wDORwYoixkN6MERKLwIPQtM
	H5YwObevkx8noEwM1KeH8N/2fhkI/QExeyiqgWABS1MCp9dd7CKbdcrm7k1nLDnhJKHamnvqze8Fw
	Bg5wJsm9PdHBXdmmC0q05NxgIWiKtiPc6qfRfpmsT6Wh5flZej+LJYiCczFnCphVnYi5qUw4bqOfl
	gjZfXKzVZMUn2j1Bbt0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqQSn-00EiNe-2f;
	Wed, 11 Oct 2023 04:04:49 +0000
Received: from mout.gmx.com ([74.208.4.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqQSk-00EiM7-0e
	for linux-mtd@lists.infradead.org;
	Wed, 11 Oct 2023 04:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com; s=s1089575;
 t=1696997057; x=1697601857; i=dregan@mail.com;
 bh=jOza9tr/xFT5KSyo6bTYZke14tEvbNRhBUs6HaI3ac4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=lgQIRCK/6Z46cIwX9tG167S+ZHJxEZMR3glwtSTWklqFtmtlQZ0hv38ukXyVAdJ0zFIzkrd3gvr
 G5lmrWc6E3giZhe1NZtWn0nWi0QHRgGi+m0DxFDJqN+gv0A5IQqPKkpOO/c1+2tRjBs2b5fC/b7zK
 BL632J25qMg7R3ax2B6n+TAvXBrXQg0uDQMG2Tm7emqWU/YwiOF9006bS3Jsz1eIXZHFH0VobhgyO
 frAyCH6+iKVHAqS7BvOmKM5XGHaXX3mxaMsT60QejNtFVKySC/idVGp4aeo3Z99DFiqT6up3JSBAS
 xKPGZf9f+b8nOYUkfdlVDq2GESXXMH24Y7tw==
X-UI-Sender-Class: f2cb72be-343f-493d-8ec3-b1efb8d6185a
Received: from [184.189.122.102] ([184.189.122.102]) by web-mail.mail.com
 (3c-app-mailcom-lxa11.server.lan [10.76.45.12]) (via HTTP); Wed, 11 Oct
 2023 06:04:17 +0200
MIME-Version: 1.0
Message-ID: <trinity-a7959b7c-e31f-4ba7-b950-c9cfecccafb6-1696997057007@3c-app-mailcom-lxa11>
From: dregan@mail.com
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: bcm-kernel-feedback-list@broadcom.com, linux-mtd@lists.infradead.org,
 f.fainelli@gmail.com, rafal@milecki.pl, joel.peshkin@broadcom.com,
 computersforpeace@gmail.com, dan.beygelman@broadcom.com,
 william.zhang@broadcom.com, frieder.schrempf@kontron.de,
 linux-kernel@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 bbrezillon@kernel.org, kdasu.kdev@gmail.com, JaimeLiao
 <jaimeliao.tw@gmail.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Adam
 Borowski <kilobyte@angband.pl>
Subject: Re: [PATCH 3/3] mtd: rawnand: brcmnand: exec_op implementation
Date: Wed, 11 Oct 2023 06:04:17 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20231010102530.1b7594c6@xps-13>
References: <trinity-322ed654-dad0-4557-a347-4e9f1f33a66d-1696906181839@3c-app-mailcom-lxa01>
 <20231010102530.1b7594c6@xps-13>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:XosRVrPqALXA+dVJ/ifvariLx6/s5IKMzG6DyF3UCPYaV4jRGHh+mXZXJxSLqyIDTxRmR
 D7XMigk74UtcFA+k2dX4w78fadvC2sqyxV+DqQZFNMA+tftmqddSt9zsaz+RVyZh4vBDYIaAYn5m
 uT1qWeqziIaVq0vjIoH53Y5mNOzlB1fDZGkPmfL7bcGB77CSK/OzuGVaGeqV8o64QPxkHUVoSQvV
 kP+CSIC40xGSY8fu042i4tkr0FnsGMbd8lbqlPhOBv8SRSYYjJtuB9k1jxu68XyjGwWRvNtPtJ2G
 68=
UI-OutboundReport: notjunk:1;M01:P0:97MhzYkCZCc=;dSm+EAEQHiEDjbpAPsg3DDVL8A2
 avmDoU4H6/hDuUm2HgMRuvr4TWI2qXZwQNsbDNANcnMg7MevZnOyMqSjBsMMogbqkQzNnD5QH
 8x2nJ5FAUbphgMyZN5O+hlgZRkOAj30BtBbAdeNnaHwHrYGOVVtlncMik+j67x9wbqlWbLshG
 pUCEsl46N3YNxnn/sOX+YYYXpBGt9M0wI/Ykz+XIl8MLNWjo/Fi/oMaQMbKpePPZlUCXfhfcO
 4RT8MkYs6HnIxi3Q80EAq6lPRvs75f5gP1egUkUwMXZ6YhjqA0BK5Q2V1XIXFuvsa3ObhNkOF
 vCWT43UCoYfUmc81hBydHbkjiqoJ/53DGJ92VKfwj+ZIqZG7zgcS89oEx9VbamJ+mnkUBScuA
 xHxtLLReq/M8q2b3V2hmYGyIJ8G6KAOhTItnFy4Pq3o52zdko3KZzde6Xv3Zt0KIC+jAxRQlw
 kZhDejrZbhLMgDehYOuYmgfMwMu/F98oGpHwYGTVuI0abYGk8wrJcs/oGIpmruuODqY4WcyVD
 hZgA4okGhWiDT+u8PKfEH0HpXZOmOp2+wwDZuXnQI+tmB1p/e98z3zPWKDPWTenV052hIM4kg
 kLxxx4Ozl/POTkkpo3xnxcQ5HYYCX4psSVYhSYRqrp9hmJv3pA3l5jHvuTxl/Urhlzy10XLZh
 hmgcWL32BfAxEa0dFijJXrL/ldG/n0YTPlr0ceJ7/kB5gsU9Fz8s+De7IZKDItBdhZO9Xy04n
 50GlriMe3spZQ2c5hQ771BBVVtkng23TN0O3jkuFkgE6h56AbXf+G9Y0XuYy21zWvMEBEUL/n
 5lm//1nNS5MauvMHT5Ngywmg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_210446_610283_E9F16CEB 
X-CRM114-Status: GOOD (  18.80  )
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

SGkgTWlxdWVsLAo+Cj4gSGVsbG8sCj4gCj4gZHJlZ2FuQG1haWwuY29tIHdyb3RlIG9uIFR1ZSwg
MTAgT2N0IDIwMjMgMDQ6NDk6NDEgKzAyMDA6Cj4gCj4gPiBleGVjX29wIGltcGxlbWVudGF0aW9u
IGZvciBCcm9hZGNvbSBTVEIsIEJyb2FkYmFuZCBhbmQgaVByb2MgU29DCj4gPiBUaGlzIGFkZHMg
ZXhlY19vcCBhbmQgcmVtb3ZlcyB0aGUgbGVnYWN5IGludGVyZmFjZS4gQmFzZWQgb24gY2hhbmdl
cwo+ID4gcHJvcG9zZWQgYnkgQm9yaXMgQnJlemlsbG9uLgo+ID4gCj4gPiBodHRwczovL2dpdGh1
Yi5jb20vYmJyZXppbGxvbi9saW51eC9jb21taXQvNGVjNmY4ZDhkODNmNWFhY2E1ZDE4NzdmMDJk
NDhkYTk2ZDQxZmNiYQo+ID4gaHR0cHM6Ly9naXRodWIuY29tL2JicmV6aWxsb24vbGludXgvY29t
bWl0LzExYjRhY2ZmZDc2MWM0OTI4NjUyZDcwMjhkMTlmY2Q2ZjQ1ZTQ2OTYKPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogRGF2aWQgUmVnYW4gPGRyZWdhbkBtYWlsLmNvbT4KPiA+IAoKLi4uCgo+ID4g
LQkJcmV0ID0gYmNtbmFuZF9jdHJsX3BvbGxfc3RhdHVzKGN0cmwsCj4gPiArCQlyZXQgPSBiY21u
YW5kX2N0cmxfcG9sbF9zdGF0dXMoaG9zdCwKPiAKPiBQbGVhc2UgbWFrZSB0aGlzIGNoYW5nZSBp
biBhIHNlcGFyYXRlIHByZXBhcmF0aW9uIHBhdGNoLgoKSSB3aWxsIGFkZCBhIDMvNCBwYXRjaCB0
byB0aGUgc2VyaWVzIHdoaWNoIHNlcGFyYXRlcyBvdXQgdGhpcyBjaGFuZ2UuCgouLi4KCj4gPiAr
Cj4gPiArCWlmIChjaGVja19vbmx5KQo+ID4gKwkJcmV0dXJuIDA7Cj4gCj4gWW91IGluaXRpYWxs
eSByZXBvcnRlZCAoaW4geW91ciBmaXJzdCBzdWJtaXNzaW9uIEkgZ3Vlc3MpIGEgbnVtYmVyIG9m
Cj4gbGltaXRhdGlvbnMgcmVnYXJkaW5nIHRoZSBudW1iZXIgb2Ygc3VjY2Vzc2l2ZSBhZGRyZXNz
IGFuZCBkYXRhIGN5Y2xlcy4KPiBJZiB0aGVzZSBsaW1pdGF0aW9ucyBhcmUgcmVhbCwgdGhleSBt
dXN0IGNoZWNrZWQuIElmIHlvdSBuZWVkIHRvIGRvCj4gdGhhdCwgcGxlYXNlIGdldCBpbnNwaXJh
dGlvbiBmcm9tOgo+IAo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9z
b3VyY2UvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jI0w5MDQK
CkkgYmVsaWV2ZSB0aGF0IHdhcyBhIG1pc3VuZGVyc3RhbmRpbmcgb24gbXkgcGFydCBhYm91dCBo
b3cgdGhlIGNvbW1hbmQKcGFyc2VyIHdhcyBtYXRjaGluZyBhIGNvbW1hbmQuIFRoZXJlIHNob3Vs
ZCBiZSBubyBzdWNoIGxpbWl0YXRpb24gbm93CmFzIHdlIGNhbiBoYW5kbGUgYWxsIGNvbW1hbmRz
LgoKPiAKPiA+ICsKPiA+ICsJaWYgKG9wLT5kZWFzc2VydF93cCkKPiA+ICsJCWJyY21uYW5kX3dw
KG10ZCwgMCk7Cj4gPiArCj4gPiArCWZvciAoaSA9IDA7IGkgPCBvcC0+bmluc3RyczsgaSsrKSB7
Cj4gPiArCQlpbnN0ciA9ICZvcC0+aW5zdHJzW2ldOwo+ID4gKwo+ID4gKwkJaWYgKChvcC0+aW5z
dHJzWzBdLnR5cGUgPT0gTkFORF9PUF9DTURfSU5TVFIpICYmCj4gPiArCQkJKG9wLT5pbnN0cnNb
MF0uY3R4LmNtZC5vcGNvZGUgPT0gTkFORF9DTURfU1RBVFVTKSkgewo+ID4gKwkJCWlmIChpbnN0
ci0+dHlwZSA9PSBOQU5EX09QX0RBVEFfSU5fSU5TVFIpIHsKPiAKPiBJIHdvdWxkIGNyZWF0ZSB0
d28gaGVscGVyczogb25lIHRvIGNoZWNrIHdldGhlciBpdCBpcyBhIGZ1bGwgc3RhdHVzCj4gb3Ig
cmVzZXQgb3BlcmF0aW9uIGFuZCBkbyB0aGVzZSBjaGVja3Mgb3V0c2lkZSBvZiB0aGlzIGZvciBs
b29wLgo+IEFuZCBoZXJlIGhhbmRsZSBhbG1vc3QgYWxsIHRoZSBjYXNlcy4KCkkgd2lsbCBtb3Zl
IHRoZSBzdGF0dXMgYW5kIHJlc2V0IGNoZWNrcyBvdXQgb2YgdGhlIGxvb3AuCgouLi4KCj4gPiAK
PiA+ICAJY2hpcC0+Y29udHJvbGxlciA9ICZjdHJsLT5jb250cm9sbGVyOwo+ID4gCj4gVGhpcyBz
cGFjZSBjYW4gZ28gYXdheS4KCldpbGwgZG8uCgo+IAo+ID4gKwljdHJsLT5jb250cm9sbGVyLmNv
bnRyb2xsZXJfd3AgPSAxOwo+ID4gKwo+ID4gIAkvKgo+ID4gIAkgKiBUaGUgYm9vdGxvYWRlciBt
aWdodCBoYXZlIGNvbmZpZ3VyZWQgMTZiaXQgbW9kZSBidXQKPiA+ICAJICogTkFORCBSRUFESUQg
Y29tbWFuZCBvbmx5IHdvcmtzIGluIDhiaXQgbW9kZS4gV2UgZm9yY2UKPiA+IC0tCj4gPiAyLjM3
LjMKPiA+IAo+ID4gCj4gCj4gT3RoZXJ3aXNlIGxvb2tzIHByZXR0eSBnb29kLgo+IAo+IFRoYW5r
cywKPiBNaXF1w6hsCj4gCgpUaGFua3MhCgotRGF2ZQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
