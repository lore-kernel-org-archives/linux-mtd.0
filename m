Return-Path: <SRS0=/mLJ=U3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F10C5B57A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 08:45:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2DCD2083B
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 08:45:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bdDlbtdO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2DCD2083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HqmUHiM+X7/Ygn3BRSZu7oVetXVp4/sdJatuNIpBSnU=; b=bdDlbtdOQD2RX2
	JpyRq5Wl7Ge5LOmvFbKV56fwB3dNVTcwWdh0FRmmQahsGzabwIpjtRHG/qZt5THpEbZTRZwz3Q4Ca
	D+Bfo9SgiS8r+07CnmFsV4n0Uor9q45JLcuXwHhnL02cPWscjPPFibWTlH6tfn3uwQ1VDbNVq2xaO
	IqcU6UcMlcf7V79WuRiQCj3TeaSMUfkxZ6APwVVoodX4ug3vFt/9hv0JI/mSnu9/qpgJTiQmOVeVE
	J0JS8ifX3i38LTKHRekEqUz9A++wrmLq+qJiOKBOFaVvrHiuN5vbo2EqZZh6KzRtpTg3+gHuDtqXf
	fwa8L7ftJxkrvlgd+TAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgmV3-00052k-97; Fri, 28 Jun 2019 08:44:53 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgmUz-0004yh-Ce
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2019 08:44:51 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D638BFF813;
 Fri, 28 Jun 2019 08:44:23 +0000 (UTC)
Date: Fri, 28 Jun 2019 10:44:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v4 1/2] mtd: rawnand: Add Macronix Raw NAND controller
Message-ID: <20190628104423.5eb3058a@xps13>
In-Reply-To: <OF2EDB7089.FAD92F61-ON48258427.002D122A-48258427.002ECEF3@mxic.com.tw>
References: <1561443056-13766-1-git-send-email-masonccyang@mxic.com.tw>
 <1561443056-13766-2-git-send-email-masonccyang@mxic.com.tw>
 <20190627193635.29abff43@xps13>
 <OFDDC43C05.7B4092B5-ON48258427.001EE57E-48258427.002122D1@mxic.com.tw>
 <20190628091836.3148d450@xps13>
 <OF2EDB7089.FAD92F61-ON48258427.002D122A-48258427.002ECEF3@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190628_014449_590713_F918A6E3 
X-CRM114-Status: GOOD (  11.89  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, christophe.kerello@st.com, vigneshr@ti.com,
 jianxin.pan@amlogic.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 lee.jones@linaro.org, linux-kernel@vger.kernel.org, stefan@agner.ch,
 paul@crapouillou.net, marek.vasut@gmail.com, paul.burton@mips.com,
 broonie@kernel.org, linux-mtd@lists.infradead.org, richard@nod.at,
 anders.roxell@linaro.org, liang.yang@amlogic.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgptYXNvbmNjeWFuZ0BteGljLmNvbS50dyB3cm90ZSBvbiBGcmksIDI4IEp1biAy
MDE5IDE2OjMxOjE2ICswODAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gPiA+ICAgCj4gPiA+ID4gPiBB
ZGQgYSBkcml2ZXIgZm9yIE1hY3Jvbml4IHJhdyBOQU5EIGNvbnRyb2xsZXIuICAgCj4gPiA+ID4g
Cj4gPiA+ID4gQ291bGQgeW91IHBhc3MgdXNlcnNwYWNlIG1ham9yIE1URCB0ZXN0cyBhbmQgY2Fu
IHlvdSAgIAo+IGF0dGFjaC9tb3VudC9lZGl0Cj4gPiA+ID4gYSBVQkkvVUJJRlMgc3RvcmFnZT8g
ICAKPiA+ID4gCj4gPiA+IG10ZF9kZWJ1ZyBwYXNzZWQgYW5kIHVzaW5nIGRkIHV0aWxpdHkgdG8g
cmVhZCBhbmQgd3JpdGUgCj4gPiA+IHdpdGggbWQ1c3VtIGNoZWNraW5nIHBhc3NlZC4gIAo+ID4g
Cj4gPiBQbGVhc2UgZG9uJ3QgdXNlIGRkLCB1c2UgbmFuZGR1bXAvbmFuZHdyaXRlL2ZsYXNoZXJh
c2UvbmFuZGJpdGVycnMgYW5kCj4gPiBydW4gdGhlIG90aGVyIHRlc3RzIGZyb20gdGhlIG10ZC11
dGlscyB0ZXN0IHN1aXRlIChhdmFpbGFibGUgaW4KPiA+IEJ1aWxkcm9vdCBmb3IgaW5zdGFuY2Up
Lgo+ID4gICAKPiAKPiBHb3QgaXQuCj4gCj4gQnV0IG1heSBJIGtub3cgd2h5ICdkZCcgdXRpbGl0
eSBpcyBub3QgcHJlZmVyZW5jZXMgPwo+IEkgZ2VuZXJhdGUgYSByYW5kb20gZGF0YSBmaWxlIGFu
ZCB3cml0ZSB0byBGbGFzaCBieQo+IHVzaW5nIGRkIHdpdGggYnM9cGFnZSBzaXplIGFuZCByZWFk
IGRhdGEgYmFjayBmcm9tIEZsYXNoLgo+IENoZWNraW5nIGRhdGEgYnkgbWQ1c3VtLgoKQmVjYXVz
ZSBkZCB3b3JrcyBvbiBibG9jayBkZXZpY2VzLiBNVEQgZGV2aWNlcyBhcmUgd2F5IGRpZmZlcmVu
dC4gWW91CmNhbm5vdCB3cml0ZSB0byBPT0Igd2l0aCBkZC4gWW91IGNhbm5vdCBlcmFzZSBiZWZv
cmUgd3JpdGUgd2l0aCBkZC4gQW5kCmRkIGRvZXMgbm90IGtub3cgYWJvdXQgYmFkIGJsb2Nrcy4g
UGxlYXNlIHNpbXBseSBhdm9pZCB1c2luZyBkZC4KCj4gVGhlIHdyaXRlIGFuZCByZWFkIHRlc3Rp
bmcgZGF0YSBzaXplIGlzIGVhc2lseSBhZGp1c3RhYmxlLgoKU28gYXJlIHRoZSBNVEQgdXRpbHMu
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
