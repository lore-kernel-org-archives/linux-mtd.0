Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C436C4167B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Dec 2023 11:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYStcKkjEAfcUYeuM99fTQRAHRYoTw7jD/jeWq2pTyM=; b=OvZrYdmW07x3vX
	C8wt+rsVXQpSVuxe7ysCENhvc00UBxeV+6wunC+8Q23VVqrmwsJHBxyB3p1x0zrFHIOBmmO4hC4zs
	RkyWnp78Hp67Ci0t6fGfl/0g+k32eJUaJuCia2XD7j4yBAaAJ+L/FvBPmGlYW4Vq+Z0SYRJLVAxkw
	Wy5Uyq+OBJ+eGmklIgaI3oVMJDQqM/ZKln6r+1W43K3FkDs0ieJiBHN3dDDYT+I4f1SN5fJ6r6V99
	h7snlOWOICvAcKHqtZlYsCzpSkw2+8e+i2dBX8smIHvGCde+N9bv9ydvzG5edTXNY0Nw4pLeP2JK8
	laoNci3kJLA9BUZ2LFrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBZ7H-00FW4L-0c;
	Fri, 08 Dec 2023 11:33:59 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBZ77-00FVzi-1p
	for linux-mtd@lists.infradead.org;
	Fri, 08 Dec 2023 11:33:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9533FC0009;
	Fri,  8 Dec 2023 11:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702035224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q7mhzothrEhd15CNNG5xWOdsPWcFPpUWUvzvae2RXHo=;
	b=DD66eG0RceDT1wVmrEB6tmb408s5YHB+uJffUXZ1AwNUynvv+nUSQSa2HUUlonthRtDGQW
	wUWU47XnZQc2bzbpuevIu3PagzpR2u+rK9QJy8G3ZXz6i/9MsbQ26vanqF03DDiKm6wYv4
	ZlFAlgGxVBWNNDKySXFcrs57n3EibPZxTlm8/5tu4dyx36lJREiXHnouogKxQl+8xYh8yv
	vT5yBr6NRhhdXzws+gq/1g677HV3gA6KZM4LOA7esKXTly3OR9X3Mmqj3aTURe8cBDC9Bx
	xuaHs8JdiSxTx5Zj4IWL4NSdwgg3QZ4wYR7HiU+QZoWDoxKsxbzOOvrBqajd5w==
Date: Fri, 8 Dec 2023 12:33:38 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann
 <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Jean
 Delvare <jdelvare@suse.de>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Chris Packham
 <chris.packham@alliedtelesis.co.nz>, Johan Jonker <jbx6244@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Alexander
 Sverdlin <alexander.sverdlin@gmail.com>
Subject: Re: [PATCH v5 19/39] mtd: rawnand: add support for ts72xx
Message-ID: <20231208123338.37f1a141@xps-13>
In-Reply-To: <6bc0cf7ea58fae2e6a3765f673a777788d465984.camel@maquefel.me>
References: <20231122-ep93xx-v5-0-d59a76d5df29@maquefel.me>
	<20231122-ep93xx-v5-19-d59a76d5df29@maquefel.me>
	<ZV3y-IJ7JSD3fJeI@smile.fi.intel.com>
	<6bc0cf7ea58fae2e6a3765f673a777788d465984.camel@maquefel.me>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_033349_774896_AC9B65D7 
X-CRM114-Status: GOOD (  13.18  )
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

SGkgTmlraXRhLAoKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZvciAoaSA9
IDA7IGkgPCBpbnN0ci0+Y3R4LmFkZHIubmFkZHJzOyBpKyspCj4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW93cml0ZTgoaW5zdHItPmN0eC5hZGRy
LmFkZHJzW2ldLCBkYXRhLSAgCj4gPiA+ID5iYXNlKTsgIAo+ID4gCj4gPiBpb3dyaXRlOF9yZXAo
KSA/Cj4gPiAgIAo+ID4gPiArwqDCoMKgwqDCoMKgwqBjYXNlIE5BTkRfT1BfREFUQV9JTl9JTlNU
UjoKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlvcmVhZDhfcmVwKGRhdGEt
PmJhc2UsIGluc3RyLT5jdHguZGF0YS5idWYuaW4sCj4gPiA+IGluc3RyLT5jdHguZGF0YS5sZW4p
OyAgCj4gPiAKPiA+IEhlaGUsIHlvdSBhcmUgZXZlbiB1c2luZyBpdC4uLgo+ID4gCj4gPiAuLi4K
PiA+ICAgCj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChpbnN0ci0+ZGVsYXlfbnMpICAKPiA+IAo+
ID4gV2hhdCB3aWxsIGhhcHBlbiBpZiB5b3UgZHJvcCB0aGlzIGNoZWNrPwo+ID4gICAKPiA+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG5kZWxheShpbnN0ci0+ZGVsYXlfbnMpOyAg
Cj4gCj4gTm8gaWRlYSEgSSB3YXMgYXNrZWQgdG8ga2VlcCBpdCBieSBNaXF1ZWw6CgpZb3VyIGNv
bnRyb2xsZXIgaXMgdmVyeSBzaW1wbGUgYW5kIGp1c3QgcXVldWVzIHdoYXRldmVyIGNvbW1hbmQg
eW91CmFzaywgcHJlY2lzZWx5IHdoZW4geW91IGFzayBpdCB0byBkbyBzby4gQnV0IHRoZSBOQU5E
IGJ1cyBpcyBhIGJpdCBtb3JlCmNvbXBsZXggYW5kIHRoZXJlIGFyZSBtaW5pbXVtIGRlbGF5cyBi
ZXR3ZWVuIGNlcnRhaW4gaW5zdHJ1Y3Rpb25zLiBUaGlzCmRlbGF5IGlzIG1lYW50IHRvIHJlc3Bl
Y3QgdGhhdC4gU29tZXRpbWVzIGl0IHdpbGwgYmUgMCwgYW5kIHNvbWV0aW1lcwpub3QuIEl0IGRl
cGVuZHMgd2hhdCBOQU5EIG9wIHlvdSBkby4gWW91IGNhbiBjaGVjayB0aGUgdmFsdWUgb2YgdGhl
c2UKZGVsYXlzIGluIHRoZSBjb3JlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
