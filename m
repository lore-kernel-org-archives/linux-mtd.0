Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B6AC001DF
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Aug 2023 13:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TbnzxAVaAg4TlYgt2hTXyZsY/cXR19Flp5QvaHbibaw=; b=nP0FaRlKDYY8vx
	YPsGQnkYhlQB2V+I5u8u2ZZZxEDO/voqtVR5020ikEe3VJ7bDzpCULxAsaOv9+QxrlymH4by/CEv7
	wxnLbvU+5DCSPSxJeiZYpsdnAhIHY9ryhgVjwkrmH0SRkwvA5T3pAar53qqwgftj543Ga43VIgatl
	XpPIXmI+WcFJimPOkdtKejctLjiN6BWWqcJdicFGxpcTvCLwE/W3+/XLCSbPVymP1PHppC9j6IzZi
	xo1tPHdbMJ0ueXlUQuyskoRz+k8OntuWyE7WCgUEsae2/gu5BVKg8+cV1CP2KzRJD2WfCQWmGVMYW
	hZ6pDZLyKpyoUs6sB2KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRv6Z-00CWyI-34;
	Fri, 04 Aug 2023 13:44:35 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRv6W-00CWxo-2s
	for linux-mtd@lists.infradead.org;
	Fri, 04 Aug 2023 13:44:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 788371BF205;
	Fri,  4 Aug 2023 13:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691156667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=schW3G7WzRE99BxIbUAARpptGi8QswX9BJlAvGeeIcM=;
	b=cXwA5P1Ght5PHTa/93CxbXjge2aVwklm3mxKyZxzjvLbEGby2fTyiEum05/cnKEPP5x73t
	CIztLQTuilSleZVPLAd2n+M3PtPRIeCguFoYuA0ArmZds+d97h9rUFexSAY1AX8YDrdSaC
	LQqLL5AQhjiPlPaqco0nRk2plIcFFDB9Fsvj7nNZzet/C3z2PiEbyxsc4Ubnbx5WJNei4R
	Q/ZG1hYGwR3ecThJq1qPFSuM3XloS1VWAHYzXAmxi7oW5ntwJWWskR5SWxbuGhoon8Sphb
	6WLNiFwhaTQqcVgh3kXOZ2KoiOQXrK3BN4594mMNCl0mJ2fxm0Arruznf5hn4Q==
Date: Fri, 4 Aug 2023 15:44:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ruan Jinjie <ruanjinjie@huawei.com>
Cc: <linux-mtd@lists.infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Kamal Dasu <kamal.dasu@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH -next] mtd: rawnand: brcmnand: Remove unnecessary
 ternary operators
Message-ID: <20230804154425.4ee7f918@xps-13>
In-Reply-To: <20230804075717.3336709-1-ruanjinjie@huawei.com>
References: <20230804075717.3336709-1-ruanjinjie@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_064433_232367_C964C054 
X-CRM114-Status: GOOD (  14.73  )
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

SGkgUnVhbiwKCnJ1YW5qaW5qaWVAaHVhd2VpLmNvbSB3cm90ZSBvbiBGcmksIDQgQXVnIDIwMjMg
MTU6NTc6MTcgKzA4MDA6Cgo+IFRoZXIgYXJlIGEgbGl0dGxlIHRlcm5hcnkgb3BlcmF0b3JzLCB0
aGUgdHJ1ZSBvciBmYWxzZSBqdWRnZW1lbnQKPiBvZiB3aGljaCBpcyB1bm5lY2Vzc2FyeSBpbiBD
IGxhbmd1YWdlIHNlbWFudGljcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSdWFuIEppbmppZSA8cnVh
bmppbmppZUBodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFu
ZC9icmNtbmFuZC5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Jy
Y21uYW5kL2JyY21uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFu
ZC5jCj4gaW5kZXggMDM3NjRiNTg5ZWM1Li5kYzY2NTkwZWI0Y2YgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiBAQCAtMTY2NiwxMyArMTY2NiwxMyBAQCBz
dGF0aWMgYm9vbCBicmNtc3RiX25hbmRfd2FpdF9mb3JfY29tcGxldGlvbihzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwKQo+ICAJCWRpc2FibGVfY3RybF9pcnFzKGN0cmwpOwo+ICAJCXN0cyA9IGJjbW5h
bmRfY3RybF9wb2xsX3N0YXR1cyhjdHJsLCBOQU5EX0NUUkxfUkRZLAo+ICAJCQkJCSAgICAgICBO
QU5EX0NUUkxfUkRZLCAwKTsKPiAtCQllcnIgPSAoc3RzIDwgMCkgPyB0cnVlIDogZmFsc2U7Cj4g
KwkJZXJyID0gc3RzIDwgMDsKClRoaXMgZnVuY3Rpb24gcmV0dXJucyBhIG5lZ2F0aXZlIGVycm5v
LCBwbGVhc2UgcHJvcGFnYXRlIHRoZSBlcnJvcgppbnN0ZWFkIHVwb24gZXJyb3IuCgo+ICAJfSBl
bHNlIHsKPiAgCQl1bnNpZ25lZCBsb25nIHRpbWVvID0gbXNlY3NfdG9famlmZmllcygKPiAgCQkJ
CQkJTkFORF9QT0xMX1NUQVRVU19USU1FT1VUX01TKTsKPiAgCQkvKiB3YWl0IGZvciBjb21wbGV0
aW9uIGludGVycnVwdCAqLwo+ICAJCXN0cyA9IHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgm
Y3RybC0+ZG9uZSwgdGltZW8pOwo+IC0JCWVyciA9IChzdHMgPD0gMCkgPyB0cnVlIDogZmFsc2U7
Cj4gKwkJZXJyID0gc3RzIDw9IDA7CgpUaGUgPCAwIGNhc2UgZG9lcyBub3QgZXhpc3Qgc28gaW5z
dGVhZCB5b3UgY2FuIHJldHVybiAtRVRJTUVET1VUIGlmCighc3RzKSBhbmQgemVybyBvdGhlcndp
c2UuCgo+ICAJfQo+ICAKPiAgCXJldHVybiBlcnI7CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
