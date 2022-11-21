Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93EBC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Nov 2022 09:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+UPq8H1v1D9MYPT2pQKWmVXBeXWQE/m11w4Fdp+pdGU=; b=kvHqLMrsdGtznB
	90zWSBXYK//YyXlDsIl16u7PujVAQJaJXzmL5QfXUPLtYj+e7yHY7gICndm+3XHz86+jfLt3OWmf1
	FjMezx9l7dhKlSoL5CLcUWFuhGkwiv9jOZnwByf4ib+1y/rSOVS2tUR7q4FUHyd9umFbewvA48Alj
	SdZpt+fMt6WO1iyNPyPgK9HpSPww9dy+VuLj5cY1kqq+Ae0cByKVyrG5TMIoI0Uk4VG/fE9/zBDsY
	yLIT9I0XTAR99tMgtVRBhxMH0cW/alUEBw3LZqIFnfjs2zC0lprN4t78SgNF7Qeckv1CL5gsS0UX5
	IWn4+Ti6liv6ZAZqvIuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3Oa-00BxtT-JZ; Mon, 21 Nov 2022 09:47:20 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3OX-00Bxnl-1j
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2022 09:47:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 16C001BF20E;
	Mon, 21 Nov 2022 09:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669024032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W8DoPzmFNi6Q1gu1uxAQbBzA+IfnTrm3y/iKC1jNhDE=;
	b=lBGWidgNGsKHTcPxx+7Op36N4NPBLw4whOkIIkGxFM9wA584t6/zwQZ3SXIu3oTwVzqfJg
	kix8Zwxw15DZYPCAj4fPqnqHZd6dCqARzbuOT27PW9YC9qWMptqTZXeEM0hiMzr+f1IPOw
	ZusM3fn2Q0F+SgyWQF9VrSjAP1DfET9ZUN3BJ97R03zGwuH2YOnKnaVG4DVEjNCT+wVKX8
	1O0h9u12Im4seIBfWSKmg/CgR/w1wWSgK1lfPvYXsAgTBkw1JfOdFT9r1TznTvNEyAjrKl
	mau36CvffN+nqSrAD4CK+xhRlK/IkCX0Ert4NeqBrWgTPyGNA1dHFlAemXilQQ==
Date: Mon, 21 Nov 2022 10:47:10 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 0/2] Measure read while write latency
Message-ID: <20221121104710.1fba2a1f@xps-13>
In-Reply-To: <20221121094020.4ezpibat7az3ya6g@yadavpratyush.com>
References: <20221110155938.820334-1-miquel.raynal@bootlin.com>
	<c3a9add5-673a-2d86-f46b-7720c56c41fc@sigma-star.at>
	<20221121094020.4ezpibat7az3ya6g@yadavpratyush.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_014717_267006_A8CB4BDC 
X-CRM114-Status: GOOD (  13.61  )
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

SGkgUHJhdHl1c2gsIERhdmlkCgpwcmF0eXVzaEBrZXJuZWwub3JnIHdyb3RlIG9uIE1vbiwgMjEg
Tm92IDIwMjIgMTA6NDA6MjAgKzAxMDA6Cgo+IE9uIDIxLzExLzIyIDA4OjM3QU0sIERhdmlkIE9i
ZXJob2xsZW56ZXIgd3JvdGU6Cj4gPiBBcHBsaWVkIHRvIG10ZC11dGlscy5naXQgbWFzdGVyLiAg
Cj4gCj4gQnV0IFNQSSBOT1IgZG9lcyBub3QgeWV0IHN1cHBvcnQgcmVhZC13aGlsZS13cml0ZS4g
VGhlIHBhdGNoZXMgYXJlIHN0aWxsIAo+IHVuZGVyIHJldmlldyBbMF0uIFNvIGRvZXMgdGhpcyBl
dmVuIHdvcms/IFNob3VsZCBtdGQtdXRpbHMgdGVzdCBhIAo+IGZlYXR1cmUgdGhhdCBoYXMgbm90
IGJlZW4gbWVyZ2VkIGludG8gdGhlIGRyaXZlciB5ZXQ/IEkgdGhpbmsgaXQgc2hvdWxkIAo+IG5v
dC4KCkkgZG9uJ3QgbWluZCBpZiB0aGUgdG9vbCBnZXRzIGluIGZpcnN0LCBpdCB3b24ndCBodXJ0
IGFueXdheSBhczoKLSBubyBjaGFuZ2VzIGFyZSBleHBlY3RlZCBpZiBwZW9wbGUgZG8gbm90IHVz
ZSB0aGUgbmV3IC1rIG9wdGlvbgotIGlmIHRoZXkgZG8sIHRoZSBnYWluZWQgbGF0ZW5jeSB3aWxs
IGp1c3QgYmUgMCAod2hpY2ggaXMgYSB1c2UgY2FzZSBvZgogIHRoZSB0b29sOiBtZWFzdXJpbmcg
d2hldGhlciBvciBub3QgUldXIHdvcmtzL2lzIHN1cHBvcnRlZCkuCgo+IFswXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyMjExMTAxNTU1MTMuODE5Nzk4LTEtbWlxdWVsLnJh
eW5hbEBib290bGluLmNvbS9ULyNtZjRmZGYzMmU3N2IxYjIxYmQzMGNhMDFlZWQ5OTlmMGVmYzNk
YjZlZQoKVGhlIG9ubHkgdGhpbmcgaXM6IGlmIHRoZSBzZXJpZXMgZG9lcyBub3QgZ2V0IGluIGZv
ciBhbnkgcmVhc29uLCB3ZSdsbApoYXZlIHRvIHJldmVydCBpdC4KCkVpdGhlciB3YXlzLCBJJ20g
ZmluZSB3aXRoIGl0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
