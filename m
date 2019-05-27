Return-Path: <SRS0=9XVy=T3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF6CC04AB3
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2019 12:43:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8EF42075E
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2019 12:43:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H1fo8zJz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8EF42075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gIcxUoMpgzZkrCHs84QBhgaeZFPw/ZkDoPKekH8Marw=; b=H1fo8zJzrlE6KF
	6BmqJZwsZcuxiaQs134c9FlCpdzFYpyGJ+g8Q02z3gzzytkYZhJ8KKsgJv1+9Nhta/CQb1BZUoCYx
	G6Ecf6WHaOpXj2gBkQqbs4ca8c9fqlneDhiHkS0LB3NND2IQbdqTr4wLfcGSKVbqNXYEDC2vUmsNl
	ozntjNj5FFo+ATTwi6iKD28eQZtHfqWtGTCGaCib7PdwoyRasVsV7FxuUl/KWi3dOeH3Ho2PU5ZKF
	QT8cLcRrxFO2ga+wF4m4Hq/9bC1TpAMT6BDZnFGimteX0/Rw0Qoh6IzugWrmzXj4Zo6KEY6sPbaGx
	iOkpRePHs8RUV4ReqGgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVEy3-0000iL-6j; Mon, 27 May 2019 12:43:07 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVExz-0000hX-CI
 for linux-mtd@lists.infradead.org; Mon, 27 May 2019 12:43:04 +0000
Received: from xps13 (aaubervilliers-681-1-27-134.w90-88.abo.wanadoo.fr
 [90.88.147.134]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 7C5A824000B;
 Mon, 27 May 2019 12:42:51 +0000 (UTC)
Date: Mon, 27 May 2019 14:42:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v3 2/4] mtd: rawnand: Add Macronix MX25F0A NAND controller
Message-ID: <20190527144250.71908bd9@xps13>
In-Reply-To: <OFADC47344.0F9941B2-ON48258403.002336E3-48258403.003141F0@mxic.com.tw>
References: <1555320234-15802-1-git-send-email-masonccyang@mxic.com.tw>
 <1555320234-15802-3-git-send-email-masonccyang@mxic.com.tw>
 <20190512151820.4f2dd9da@xps13>
 <OF074A1F06.5C1A58BE-ON482583FD.0031CD95-482583FD.003437AD@mxic.com.tw>
 <20190520142333.390091d5@xps13>
 <OFADC47344.0F9941B2-ON48258403.002336E3-48258403.003141F0@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_054303_573334_804913F5 
X-CRM114-Status: GOOD (  16.65  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, christophe.kerello@st.com,
 bbrezillon@kernel.org, juliensu@mxic.com.tw, lee.jones@linaro.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-spi@vger.kernel.org,
 marcel.ziswiler@toradex.com, paul.burton@mips.com, broonie@kernel.org,
 geert@linux-m68k.org, stefan@agner.ch, linux-mtd@lists.infradead.org,
 richard@nod.at, liang.yang@amlogic.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, marek.vasut@gmail.com, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgptYXNvbmNjeWFuZ0BteGljLmNvbS50dyB3cm90ZSBvbiBUaHUsIDIzIE1heSAy
MDE5IDE2OjU4OjAyICswODAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gPiA+ICAgCj4gPiA+ID4gPiAr
Cj4gPiA+ID4gPiArc3RhdGljIHZvaWQgbXhpY19uYW5kX3NlbGVjdF9jaGlwKHN0cnVjdCBuYW5k
X2NoaXAgKmNoaXAsIGludCAgIAo+IGNoaXBucikgCj4gPiA+ID4gCj4gPiA+ID4gX3NlbGVjdF90
YXJnZXQoKSBpcyBwcmVmZXJyZWQgbm93ICAgCj4gPiA+IAo+ID4gPiBEbyB5b3UgbWVhbiBJIGlt
cGxlbWVudCBteGljX25hbmRfc2VsZWN0X3RhcmdldCgpIHRvIGNvbnRyb2wgI0NTID8KPiA+ID4g
Cj4gPiA+IElmIHNvLCBJIG5lZWQgdG8gY2FsbCBteGljX25hbmRfc2VsZWN0X3RhcmdldCggKSB0
byBjb250cm9sICNDUyBPTgo+ID4gPiBhbmQgdGhlbiAjQ1MgT0ZGIGluIF9leGVjX29wKCkgZHVl
IHRvIG5hbmRfc2VsZWN0X3RhcmdldCgpPGluICAgCj4gbmFuZF9iYXNlLGM+ICAKPiA+ID4gaXMg
c3RpbGwgY2FsbGluZyBjaGlwLT5sZWdhY3kuc2VsZWN0X2NoaXAgPyAgCj4gPiAKPiA+IFlvdSBt
dXN0IGZvcmdldCBhYm91dCB0aGUgLT5zZWxlY3RfY2hpcCgpIGNhbGxiYWNrLiBOb3cgaXQgc2hv
dWxkIGJlCj4gPiBoYW5kbGVkIGRpcmVjdGx5IGZyb20gdGhlIGNvbnRyb2xsZXIgZHJpdmVyLiBQ
bGVhc2UgaGF2ZSBhIGxvb2sgYXQgdGhlCj4gPiBjb21taXQgcG9pbnRlZCBhZ2FpbnN0IHRoZSBt
YXJ2ZWxsX25hbmQuYyBkcml2ZXIuICAKPiAKPiBJIGhhdmUgbm8gTWFydmVsbCBORkMgZGF0YXNo
ZWV0IGFuZCBoYXZlIG9uZSBxdWVzdGlvbi4KPiAKPiBJbiBtYXJ2ZWxsX25hbmQuYywgdGhlcmUg
aXMgbm8geHh4X2Rlc2VsZWN0X3RhcmdldCgpIG9yIAo+IHNvbWV0aGluZyBsaWtlIHRoYXQgZG9p
bmcgI0NTIE9GRi4KPiBtYXJ2ZWxsX25mY19zZWxlY3RfdGFyZ2V0KCkgc2VlbXMgYWx3YXlzIHRv
IG1ha2Ugb25lIG9mIGNoaXAgb3IgZGllCj4gI0NTIGtlZXAgbG93Lgo+IAo+IElzIGl0IHJpZ2h0
ID8KClllcywgQUZBSVIgdGhlcmUgaXMgbm8gImRlLWFzc2VydCIgbWVjaGFuaXNtIGluIHRoaXMg
Y29udHJvbGxlci4KCj4gCj4gSG93IHRvIG1ha2UgYWxsICNDUyBrZWVwIGhpZ2ggZm9yIE5BTkQg
dG8gZW50ZXIgCj4gbG93LXBvd2VyIHN0YW5kYnkgbW9kZSBpZiBkcml2ZXIgZG9uJ3QgdXNlICJs
ZWdhY3kuc2VsZWN0X2NoaXAoKSIgPwoKU2VlIGNvbW1pdCAwMmI0YTUyNjA0YTQgKCJtdGQ6IHJh
d25hbmQ6IE1ha2UgLT5zZWxlY3RfY2hpcCgpIG9wdGlvbmFsCndoZW4gLT5leGVjX29wKCkgaXMg
aW1wbGVtZW50ZWQiKSB3aGljaCBzdGF0ZXM6CgogICAgICAgICJXaGVuIFstPnNlbGVjdF9jaGlw
KCkgaXNdIG5vdCBpbXBsZW1lbnRlZCwgdGhlIGNvcmUgaXMgYXNzdW1pbmcKCXRoZSBDUyBsaW5l
IGlzIGF1dG9tYXRpY2FsbHkgYXNzZXJ0ZWQvZGVhc3NlcnRlZCBieSB0aGUgZHJpdmVyCgktPmV4
ZWNfb3AoKSBpbXBsZW1lbnRhdGlvbi4iCgpPZiBjb3Vyc2UsIHRoZSBhYm92ZSBpcyByaWdodCBv
bmx5IHdoZW4gdGhlIGNvbnRyb2xsZXIgZHJpdmVyIHN1cHBvcnRzCnRoZSAtPmV4ZWNfb3AoKSBp
bnRlcmZhY2UuIAoKU28gaWYgeW91IHRoaW5rIGl0IGlzIG5vdCB0b28gdGltZSBjb25zdW1pbmcg
YW5kIHdvcnRoIHRoZSB0cm91YmxlIHRvCmFzc2VydC9kZWFzc2VydCB0aGUgQ1MgYXQgZWFjaCBv
cGVyYXRpb24sIHlvdSBtYXkgZG8gaXQgaW4geW91ciBkcml2ZXIuCgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
