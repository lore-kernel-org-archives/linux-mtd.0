Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8589BC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Feb 2022 13:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNAmyXQr2CI3IxkTZBJR95ifdscIBnO+8JdfSMd97jQ=; b=H7lPMh48XRVj19
	6iWglP4Q1M1AYXN9YBtnhTWpQ4dzrU4er1FlnhV/aK4tZs0bQwTru13B3CFsDhXITsMSKcp7O+ZmW
	mDxRgFtIdvFUp2sRc0YbSPESYsVp6zD3O3xWMKWnWuWzHiAGlfiAbr4UUvU6jV+qtaaJMxP4FSNGP
	/lvkZdzobxy9ND1RCKJ49WZUCLp6XVlDeUaTnYSe1Tp3xJzDYCHr0MUaGemSR1KBsgVON5LitEux7
	mLVfLnrFBF/XwUF+y+gqF89ta1sBXkcUTv3iVWwabJp3vRH5E+cgJ4WHesOtdul1lvW44AxeYalTz
	cEmTucgbIzg11NIPiW2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHQK6-00E1Uv-1A; Tue, 08 Feb 2022 13:14:22 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHQC0-00DyIg-Lc
 for linux-mtd@lists.infradead.org; Tue, 08 Feb 2022 13:06:02 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id F3BEE20000A;
 Tue,  8 Feb 2022 13:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1644325557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=II38vjLqRQLg/txnWaGaYMH5G+TMjmxUgp39Q+KTFOI=;
 b=cg78R25fOkgb5ywOTBX32Ds9RDk2APYA7e1uYvGLZfPi06/mTEq8+GkVPwGTaR1fLB1WVs
 MeA+3P/QBgqREUS/55SrecEY7vmpaW579tgSxLcqqHTqoO1BDIommGnumCSg+8i2aZNL5O
 m4E4t5GhKA6ICt0hiBOdfqaVhVhFCKj00Np/wM7cfEJjZrh22izqYdMuF3he0kmw7z5Cwm
 zcMMF++SjVytXqfTbvC3aprnLqBdYO/RWujfqLSLVQHiozdu7DAc0JckuC2AlQrnRykiE9
 ejCHAzAkhskQWJP59w3q/fys6innvYxgNfqEB/0ajLCHg8OQcMlC9/WzFn3lkw==
Date: Tue, 8 Feb 2022 14:05:51 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
Cc: <vigneshr@ti.com>, <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <git@xilinx.com>
Subject: Re: [PATCH] mtd: rawnand: pl353: Set the nand chip node as the
 flash node
Message-ID: <20220208140551.6271f976@xps13>
In-Reply-To: <20220208125738.32162-1-amit.kumar-mahapatra@xilinx.com>
References: <20220208125738.32162-1-amit.kumar-mahapatra@xilinx.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_050600_953451_0124CE7A 
X-CRM114-Status: GOOD (  14.00  )
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

SGkgQW1pdCwKCmFtaXQua3VtYXItbWFoYXBhdHJhQHhpbGlueC5jb20gd3JvdGUgb24gVHVlLCA4
IEZlYiAyMDIyIDE4OjI3OjM4ICswNTMwOgoKPiBJbiBkZXZpY2V0cmVlIHRoZSBmbGFzaCBpbmZv
cm1hdGlvbiBpcyBlbWJlZGRlZCB3aXRoaW4gbmFuZCBjaGlwIG5vZGUsCj4gc28gZHVyaW5nIG5h
bmQgY2hpcCBpbml0aWFsaXphdGlvbiB0aGUgbmFuZCBjaGlwIG5vZGUgc2hvdWxkIGJlIHBhc3Nl
ZAo+IHRvIG5hbmRfc2V0X2ZsYXNoX25vZGUoKSBhcGksIGluc3RlYWQgb2YgbmFuZCBjb250cm9s
bGVyIG5vZGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW1pdCBLdW1hciBNYWhhcGF0cmEgPGFtaXQu
a3VtYXItbWFoYXBhdHJhQHhpbGlueC5jb20+CgpDYW4geW91IHBsZWFzZSBhZGQgRml4ZXMgdGFn
PwoKPiAtLS0KPiBCUkFOQ0g6IG5hbmQvbmV4dAo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9wbDM1eC1uYW5kLWNvbnRyb2xsZXIuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L3BsMzV4LW5hbmQtY29udHJvbGxlci5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcGwz
NXgtbmFuZC1jb250cm9sbGVyLmMKPiBpbmRleCA4YTkxZTA2OWVlMmUuLjNjNmY2YWZmNjQ5ZiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9wbDM1eC1uYW5kLWNvbnRyb2xsZXIu
Ywo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3BsMzV4LW5hbmQtY29udHJvbGxlci5jCj4g
QEAgLTEwNjIsNyArMTA2Miw3IEBAIHN0YXRpYyBpbnQgcGwzNXhfbmFuZF9jaGlwX2luaXQoc3Ry
dWN0IHBsMzV4X25hbmRjICpuZmMsCj4gIAljaGlwLT5jb250cm9sbGVyID0gJm5mYy0+Y29udHJv
bGxlcjsKPiAgCW10ZCA9IG5hbmRfdG9fbXRkKGNoaXApOwo+ICAJbXRkLT5kZXYucGFyZW50ID0g
bmZjLT5kZXY7Cj4gLQluYW5kX3NldF9mbGFzaF9ub2RlKGNoaXAsIG5mYy0+ZGV2LT5vZl9ub2Rl
KTsKPiArCW5hbmRfc2V0X2ZsYXNoX25vZGUoY2hpcCwgbnApOwo+ICAJaWYgKCFtdGQtPm5hbWUp
IHsKPiAgCQltdGQtPm5hbWUgPSBkZXZtX2thc3ByaW50ZihuZmMtPmRldiwgR0ZQX0tFUk5FTCwK
PiAgCQkJCQkgICAiJXMiLCBQTDM1WF9OQU5EQ19EUklWRVJfTkFNRSk7Cgp5dXAsIHRoYXQgd2Fz
IHdyb25nLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
