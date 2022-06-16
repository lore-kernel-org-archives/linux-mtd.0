Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404E8C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jun 2022 21:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLxOvzr8dmabm4LNOQqUfGaBsUBPgljdWnbuYXmlcHY=; b=RvBD2+Dqcib40L
	NKwsVxeSQCvXJmSYNp0jYwFh8RD9MtT9UgxVNyhcfAHuimyEX52I45nm+47vm30XK7UdDsLXopU47
	cTX5B27WA0GSmJ1P9drBcRrkr4q+kCOjUJUNZ7ZU0zwsDoaEWuSc6y1UC+dH3AcuYH6W1CgHueYv+
	X6g3RHMKJQtfVrU7c+l2cKOk1hHHs5TVgNXf9epnlwCF4KEgtKXHp+pL++3EeRc/wvVn3SrrU4ZxW
	Ia624a9prlJDSou0w1H6XCQtTIRL7bs9RShY9hFZZCq6ut6Y81R8UAXFlLgkz2XiRT87WMcuwEdwA
	3cp1uGwaTUhI1ppnB6ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1x1V-004QvT-FT; Thu, 16 Jun 2022 21:27:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1x1T-004Quf-1R
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2022 21:27:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 1164DCE2764;
	Thu, 16 Jun 2022 21:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A43C34114;
	Thu, 16 Jun 2022 21:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655414843;
	bh=MDQjp5WMGZSOfSbLFcG9B/11ruGs/FqwL7Riz8wGMLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VPmYysL9DniOlN+7Uj5VaibWCEj0i76aLzyEp5MgHggzEsUCU+atcN+zJVKM1LnPm
	 tIJ7qw/N34h0YC5JPZH/Gn1riRbLPp3wfih8vcsu1/SOwb+i0ExVtdoa0xOdsNnwb1
	 xAac20M1UEpD+IYRgKzLmLx9g9eSteRc3826EBLFJVnl1+TpMQBkQy6SZQy/yl4cOs
	 +VW17ModtPkpTVgT9tDJLKs7Z02D2/yEW9fVlISHgx89ryAL3Vd+kMRqfQvWd6xAXj
	 gzNFvBPYWCK0B3NeQH8lthae2s5G8yjQRhGzwyFr4L1vHI3RzAiLYigbDZ4rmT0Dfw
	 K3ZQJ5aGAFXpg==
Date: Fri, 17 Jun 2022 02:57:22 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Ansuel Smith <ansuelsmth@gmail.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] mtd: nand: raw: qcom_nandc: reorder
 qcom_nand_host struct
Message-ID: <20220616212722.GI2889@thinkpad>
References: <20220615000612.3119-1-ansuelsmth@gmail.com>
 <20220615000612.3119-2-ansuelsmth@gmail.com>
 <20220615171132.GA3606@thinkpad>
 <62aa76ad.1c69fb81.7e2d3.0c8e@mx.google.com>
 <20220616163751.2b5962df@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220616163751.2b5962df@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_142727_302071_39CB28DB 
X-CRM114-Status: GOOD (  17.11  )
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

T24gVGh1LCBKdW4gMTYsIDIwMjIgYXQgMDQ6Mzc6NTFQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBIaSBBbnN1ZWwvQ2hyaXN0aWFuLAo+IAo+IGFuc3VlbHNtdGhAZ21haWwuY29tIHdy
b3RlIG9uIFRodSwgMTYgSnVuIDIwMjIgMDI6MTg6MDggKzAyMDA6Cj4gCj4gPiBPbiBXZWQsIEp1
biAxNSwgMjAyMiBhdCAxMDo0MTozMlBNICswNTMwLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gd3Jv
dGU6Cj4gPiA+IE9uIFdlZCwgSnVuIDE1LCAyMDIyIGF0IDAyOjA2OjEwQU0gKzAyMDAsIEFuc3Vl
bCBTbWl0aCB3cm90ZTogIAo+ID4gPiA+IFJlb3JkZXIgc3RydWN0cyBpbiBuYW5kYyBkcml2ZXIg
dG8gc2F2ZSBob2xlcy4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBbnN1ZWwgU21p
dGggPGFuc3VlbHNtdGhAZ21haWwuY29tPiAgCj4gPiA+IAo+ID4gPiBSZXZpZXdlZC1ieTogTWFu
aXZhbm5hbiBTYWRoYXNpdmFtIDxtYW5pQGtlcm5lbC5vcmc+Cj4gPiA+IAo+ID4gPiBUaGFua3Ms
Cj4gPiA+IE1hbmkKPiA+ID4gIAo+ID4gCj4gPiBJJ20gc2VuZGluZyB2OCB3aXRoIGEgZGlmZmVy
ZW50IFNvYiBzbyBJJ20gbm90IGFkZGluZyB0aGUgcmV2aWV3IHRhZyAoaW4KPiA+IHY4KS4KPiA+
IEluIHNob3J0IHRoZSBuZXcgU29iIGlzIHdoYXQgSSB3aWxsIHVzZSBvbndhcmRzLCB3YW50ZWQg
dG8ga2VlcCB0aGUKPiA+IEFuc3VlbCByZWZlcmVuY2UgYnV0IGl0IHdhcyBzdWdnZXN0ZWQgdG8g
dXNlIENocmlzdGlhbiBNYXJhbmdpIGFuZAo+ID4gbm90aGluZyBtb3JlLiBJdCdzIGp1c3QgYSBu
YW1lIGNoYW5nZSBhbmQgd2UgYXJlIHRoZSBzYW1lIHBlcnNvbiBhbmQKPiA+IG5vYm9keSBpcyBz
dGVhbGluZyBvd25lcnNoaXAgb2YgdGhlIHBhdGNoLgo+ID4gU29ycnkgZm9yIHRoZSBtZXNzLgo+
IAo+IE1tbWggc3RyYW5nZSwgYnV0IG9rYXkuIFlvdSBhcmUgc3VwcG9zZWQgdG8gY29udHJpYnV0
ZSB3aXRoIHlvdXIgcmVhbAo+IGlkZW50aXR5LCBub3QgdW5kZXIgcHNldWRvbnltIGFueXdheS4K
PiAKPiBBbHNvLCB5b3UgY291bGQgaGF2ZSBrZXB0IE1hbmkncyBSLWJ5IGluIHY4IGJ1dCBhbnl3
YXkuIE1hbmksIGNhbgo+IHlvdSByZXNlbmQgdGhlbT8KPiAKCkRvbmUhCgpUaGFua3MsCk1hbmkK
Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCi0tIArgrq7grqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a
4K6k4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
