Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47143C04AAC
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 12:24:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B1D721019
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 12:24:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lz8PZNW2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="K23kWeKt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B1D721019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dzQHUImPWPUJFPkVXf7Qy0qJZblPlsUynTT8JJcOzWc=; b=lz8PZNW2Malvv1
	86p8sf3fxCDgQH9Dr7POu+ziMbD/YF7YYYNjn56dXHyrwMlPrcO6+mULELxQ0du/y8HW3lXfAABBa
	zVmOhP/u4u/p+dDme9lR7JjcsBX8ajpaTDTQtr9XeKtmjjfaAZC6tqwzubvOjjE8Cxf49QZAqd0XS
	hS9uQbaK8NuZwEayAiNh8wy9UIvx0sf2SRPz5i75iuqUbzibiH3gf53FLwIyy8N0F6dM1Fv+hN9Xx
	Y1nZ33N/ueiSeVtgRj2uQ/WIDx1CUcy2aC12MYD3RQz+wrBNJRO0XGSPmW3P8OtWv3gjSV3lBOjEg
	ilEr5kFUSNH81thz8GjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hShLC-0004JD-Fd; Mon, 20 May 2019 12:24:30 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hShLA-0004Il-KU
 for linux-mtd@bombadil.infradead.org; Mon, 20 May 2019 12:24:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VlsN6I1O1x0iaWm+pbjAOECOstp7rWjo2/meuHlkyqA=; b=K23kWeKtbjHa85NOApNa2SfVJs
 ZM2yJfsQ2XcGIJqEqL/IWrSY+yBZMBNimChxH08p67RzAMRTs//zH0ecolSRy7J138OJmW2j6A5Kq
 n+cvZbzH1JjwKV5qvbvp7dyYyptFQXDhWnXWo/zbh7OUb8oQSOWVuNtmB7aUvpidyn4tIlj/KUfKq
 iSZNxPeQo1v3dmwIOfLic5YMhVB+q1WoA5WKK9QgUAzZLALkBrGJF3ymc2Y6PHwI/dwyh9hnRpIuJ
 h9N6Ic0p3pgDEwKIArQJGm47CrMKljL1f6r5bUZQymlYbVci/M006/0TV1xJq/IHMIlrHsTo1eNhf
 kugzLqZQ==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hShL6-0006JK-Kp
 for linux-mtd@lists.infradead.org; Mon, 20 May 2019 12:24:26 +0000
X-Originating-IP: 90.88.22.185
Received: from xps13 (aaubervilliers-681-1-80-185.w90-88.abo.wanadoo.fr
 [90.88.22.185]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 36B8EFF810;
 Mon, 20 May 2019 12:23:34 +0000 (UTC)
Date: Mon, 20 May 2019 14:23:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v3 2/4] mtd: rawnand: Add Macronix MX25F0A NAND controller
Message-ID: <20190520142333.390091d5@xps13>
In-Reply-To: <OF074A1F06.5C1A58BE-ON482583FD.0031CD95-482583FD.003437AD@mxic.com.tw>
References: <1555320234-15802-1-git-send-email-masonccyang@mxic.com.tw>
 <1555320234-15802-3-git-send-email-masonccyang@mxic.com.tw>
 <20190512151820.4f2dd9da@xps13>
 <OF074A1F06.5C1A58BE-ON482583FD.0031CD95-482583FD.003437AD@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_082424_787974_9DBB3FCD 
X-CRM114-Status: GOOD (  12.48  )
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

SGkgTWFzb24sCgptYXNvbmNjeWFuZ0BteGljLmNvbS50dyB3cm90ZSBvbiBGcmksIDE3IE1heSAy
MDE5IDE3OjMwOjIxICswODAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gPiA+ICsKPiA+ID4gK3N0YXRp
YyB2b2lkIG14aWNfbmFuZF9zZWxlY3RfY2hpcChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQg
Y2hpcG5yKSAgCj4gPiAKPiA+IF9zZWxlY3RfdGFyZ2V0KCkgaXMgcHJlZmVycmVkIG5vdyAgCj4g
Cj4gRG8geW91IG1lYW4gSSBpbXBsZW1lbnQgbXhpY19uYW5kX3NlbGVjdF90YXJnZXQoKSB0byBj
b250cm9sICNDUyA/Cj4gCj4gSWYgc28sIEkgbmVlZCB0byBjYWxsIG14aWNfbmFuZF9zZWxlY3Rf
dGFyZ2V0KCApIHRvIGNvbnRyb2wgI0NTIE9OCj4gYW5kIHRoZW4gI0NTIE9GRiBpbiBfZXhlY19v
cCgpIGR1ZSB0byBuYW5kX3NlbGVjdF90YXJnZXQoKTxpbiBuYW5kX2Jhc2UsYz4KPiBpcyBzdGls
bCBjYWxsaW5nIGNoaXAtPmxlZ2FjeS5zZWxlY3RfY2hpcCA/CgpZb3UgbXVzdCBmb3JnZXQgYWJv
dXQgdGhlIC0+c2VsZWN0X2NoaXAoKSBjYWxsYmFjay4gTm93IGl0IHNob3VsZCBiZQpoYW5kbGVk
IGRpcmVjdGx5IGZyb20gdGhlIGNvbnRyb2xsZXIgZHJpdmVyLiBQbGVhc2UgaGF2ZSBhIGxvb2sg
YXQgdGhlCmNvbW1pdCBwb2ludGVkIGFnYWluc3QgdGhlIG1hcnZlbGxfbmFuZC5jIGRyaXZlci4K
ClsuLi5dCgo+ID4gPiArICAgaWYgKCFteGljKQo+ID4gPiArICAgICAgcmV0dXJuIC1FTk9NRU07
Cj4gPiA+ICsKPiA+ID4gKyAgIG5hbmRfY2hpcCA9ICZteGljLT5uYW5kOwo+ID4gPiArICAgbXRk
ID0gbmFuZF90b19tdGQobmFuZF9jaGlwKTsKPiA+ID4gKyAgIG10ZC0+ZGV2LnBhcmVudCA9IHBk
ZXYtPmRldi5wYXJlbnQ7Cj4gPiA+ICsgICBuYW5kX2NoaXAtPmVjYy5wcml2ID0gTlVMTDsKPiA+
ID4gKyAgIG5hbmRfc2V0X2ZsYXNoX25vZGUobmFuZF9jaGlwLCBwZGV2LT5kZXYucGFyZW50LT5v
Zl9ub2RlKTsKPiA+ID4gKyAgIG5hbmRfY2hpcC0+cHJpdiA9IG14aWM7Cj4gPiA+ICsKPiA+ID4g
KyAgIG14aWMtPm1mZCA9IG1mZDsKPiA+ID4gKwo+ID4gPiArICAgbmFuZF9jaGlwLT5sZWdhY3ku
c2VsZWN0X2NoaXAgPSBteGljX25hbmRfc2VsZWN0X2NoaXA7ICAKPiA+IAo+ID4gUGxlYXNlIGRv
bid0IGltcGxlbWVudCBsZWdhY3kgaW50ZXJmYWNlcy4gWW91IGNhbiBjaGVjayBpbgo+ID4gbWFy
dmVsbF9uYW5kLmMgaG93IHRoaXMgaXMgaGFuZGxlZCBub3c6Cj4gPiAKPiA+IGIyNTI1MTQxNGY2
ZSBtdGQ6IHJhd25hbmQ6IG1hcnZlbGw6IFN0b3AgaW1wbGVtZW50aW5nIC0+c2VsZWN0X2NoaXAo
KQo+ID4gICAKPiAKPiBEb2VzIGl0IG1lYW4gY2hpcC0+bGVnYWN5LnNlbGVjdF9jaGlwKCkgd2ls
bCBwaGFzZS1vdXQgPwoKWWVzIGl0IHdpbGwuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
