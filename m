Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC39C54798
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Feb 2024 12:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jFTPRMb8P23azRLE6I+iRosfj+pAoLTKWLspgAMzsK8=; b=dhTJVaTN24EZgw
	22I/QgzSpiINYbJreiqoj5ivw2suT3kHxZNI+F8jm1Ky+V7a0Xu6hAG2vxoRoRYBkX6GQeyDZUwAE
	5kdMEAAOeMXgjcST24+4+CT0pAnOrVRgbCXbhaARTfKN1AW5OcqB+w3/9OsXTcJ3NZPSh6WHrV2M5
	yGlNUrnNiErP0+t//IcqDHvynlHkZj+ZENvqXtNVPmCQd+uBP3keRzGy8s59wAIlabWtFwNpioW84
	5T+6ETDaxlxrlqvmRNKOAoxwmphO7Ap4d2pzmxIFWF0XraR/hMiVENRa9fq/kBh0UkTeyinb8gajQ
	KE3yjvNW6aPUhwHxIb2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rex1e-00000005HIl-2afc;
	Tue, 27 Feb 2024 12:57:38 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rex1b-00000005HHs-1n7n
	for linux-mtd@lists.infradead.org;
	Tue, 27 Feb 2024 12:57:37 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rex1I-0004YG-2F;
	Tue, 27 Feb 2024 12:57:16 +0000
Date: Tue, 27 Feb 2024 12:57:07 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: ubi: fix NVMEM over UBI volumes on 32-bit systems
Message-ID: <Zd3cIw5NZOW2KtXe@makrotopia.org>
References: <186fa96ae25f7033ff8b6f0f7fcfb1e602f556fc.1708971705.git.daniel@makrotopia.org>
 <ab2b4573-58ce-d895-0aae-69e3647e0a68@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab2b4573-58ce-d895-0aae-69e3647e0a68@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_045735_493869_3F7856B1 
X-CRM114-Status: GOOD (  21.53  )
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

T24gVHVlLCBGZWIgMjcsIDIwMjQgYXQgMTA6MjM6MTdBTSArMDgwMCwgWmhpaGFvIENoZW5nIHdy
b3RlOgo+IOWcqCAyMDI0LzIvMjcgMjoyMywgRGFuaWVsIEdvbGxlIOWGmemBkzoKPiA+IEEgY29t
cGlsZXIgd2FybmluZyByZWxhdGVkIHRvIHNpemVvZihpbnQpICE9IDggd2hlbiBjYWxsaW5nIGRv
X2RpdigpCj4gPiBpcyB0cmlnZ2VyZWQgd2hlbiBidWlsZGluZyBvbiAzMi1iaXQgcGxhdGZvcm1z
Lgo+ID4gQWRkcmVzcyB0aGlzIGJ5IHVzaW5nIGludGVnZXIgdHlwZXMgaGF2aW5nIGEgd2VsbC1k
ZWZpbmVkIHNpemUgd2hlcmUKPiA+IGFwcHJvcHJpYXRlLgo+ID4gCj4gPiBGaXhlczogM2NlNDg1
ODAzZGExICgibXRkOiB1Ymk6IHByb3ZpZGUgTlZNRU0gbGF5ZXIgb3ZlciBVQkkgdm9sdW1lcyIp
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgR29sbGUgPGRhbmllbEBtYWtyb3RvcGlhLm9yZz4K
PiA+IC0tLQo+ID4gICBkcml2ZXJzL210ZC91YmkvbnZtZW0uYyB8IDUgKysrKy0KPiA+ICAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL252bWVtLmMgYi9kcml2ZXJzL210ZC91YmkvbnZtZW0u
Ywo+ID4gaW5kZXggYjdhOTNjNDk1ZDE3Mi4uNTgyMGExNzBkMjUxMiAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvbXRkL3ViaS9udm1lbS5jCj4gPiArKysgYi9kcml2ZXJzL210ZC91YmkvbnZtZW0u
Ywo+ID4gQEAgLTIzLDE0ICsyMywxNyBAQCBzdHJ1Y3QgdWJpX252bWVtIHsKPiA+ICAgc3RhdGlj
IGludCB1YmlfbnZtZW1fcmVnX3JlYWQodm9pZCAqcHJpdiwgdW5zaWduZWQgaW50IGZyb20sCj4g
PiAgIAkJCSAgICAgIHZvaWQgKnZhbCwgc2l6ZV90IGJ5dGVzKQo+ID4gICB7Cj4gPiAtCWludCBl
cnIgPSAwLCBsbnVtID0gZnJvbSwgb2ZmcywgYnl0ZXNfbGVmdCA9IGJ5dGVzLCB0b19yZWFkOwo+
ID4gKwl1aW50MzJfdCBieXRlc19sZWZ0LCBvZmZzLCB0b19yZWFkOwo+ID4gICAJc3RydWN0IHVi
aV9udm1lbSAqdW52ID0gcHJpdjsKPiA+ICAgCXN0cnVjdCB1Ymlfdm9sdW1lX2Rlc2MgKmRlc2M7
Cj4gPiArCXVpbnQ2NF90IGxudW0gPSBmcm9tOwo+ID4gKwlpbnQgZXJyID0gMDsKPiA+ICAgCWRl
c2MgPSB1Ymlfb3Blbl92b2x1bWUodW52LT51YmlfbnVtLCB1bnYtPnZvbF9pZCwgVUJJX1JFQURP
TkxZKTsKPiA+ICAgCWlmIChJU19FUlIoZGVzYykpCj4gPiAgIAkJcmV0dXJuIFBUUl9FUlIoZGVz
Yyk7Cj4gPiArCWJ5dGVzX2xlZnQgPSBieXRlczsKPiBUaGUgJ2J5dGVzJyBpcyBhIHNpemVfdCB0
eXBlLCB3aGljaCBoYXMgNjQgYml0cyBvbiA2NC1iaXQgcGxhdGZvcm1zLiBUaGlzCj4gYXNzaWdu
bWVudCB3aWxsIGxlYWQgYSB0eXBlIHRydW5jYXRpb24sIHNvIHNob3VsZCB3ZSBhZGQgYSBleHBs
aWNpdCB0eXBlCj4gY29udmVyc2lvbiBoZXJlIHRvIGF2b2lkIGNvbXBpbGVyIHdhcm5pbmc/CgpP
aCByaWdodC4gSSByZWNrb24gdGhlIGJlc3QgaXMgdG8gZGVjbGFyZSAnYnl0ZXMnIGFzICdzaXpl
X3QnIHR5cGUgYXMgd2VsbAp0aGVuLiBJIHdpbGwgc2VuZCB2MiB3aXRoIHRoYXQgY2hhbmdlIHNo
b3J0bHkuCgoKPiA+ICAgCW9mZnMgPSBkb19kaXYobG51bSwgdW52LT51c2FibGVfbGViX3NpemUp
Owo+ID4gICAJd2hpbGUgKGJ5dGVzX2xlZnQpIHsKPiA+ICAgCQl0b19yZWFkID0gdW52LT51c2Fi
bGVfbGViX3NpemUgLSBvZmZzOwo+ID4gCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
