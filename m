Return-Path: <SRS0=9tRn=TP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153C0C04E53
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 12:09:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DABF420657
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 12:09:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W+qgOb0U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nW8ddAPk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DABF420657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0iix0oG55TVmHz6Z9Em9IoIZyvsC+dz3bwtg1IEwzk=; b=W+qgOb0Ukg1Lhy
	O4spm+BWroI+HflWImjoEcSnob8O7mgtU5HzT8rDhKHAZaWfGfpV0NTr5mEH8PPQTax/IBSpTxbBH
	G/npPibNK4qnwxrU9aSvKjyO5dP07Cj8Yyo4ISiXhMQxccnBr0UHnEcCPdUeALM30NNV9E4kFjyAm
	lDEc2G4n+cbtNiWzlAWsIrgAcFGntYEaA6SxWXXQfHUoR1TH670JlSakd7pvonxjQSh7nrWAiOM0W
	ogYp0JNHD+uwClZ163lJcCNJLud7fqrkQXCRvzXKjQtDfK69qk79fArUlUTPUFZ/XgdfRgWhEH0RO
	USNrcjbQXvwlbs7P8BrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQsjG-0007pB-Nn; Wed, 15 May 2019 12:09:50 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQsjF-0007oW-7J
 for linux-mtd@bombadil.infradead.org; Wed, 15 May 2019 12:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M1JM83xtUBUWqZtPBi7zKZwRN4W8dhDepTz0hhN4krU=; b=nW8ddAPkBPzqb4+JlstHNG1Bzs
 rCiD3kPItChnQxi5J+aKc0UJOKEb6y52f4Rtnw3hICSMzS46GNaGE+CitkLiwDf+dv1dL3w/y1FAO
 GzCRprlI6UCQTIyaa3YggEVz/m6vkRyugvptvPz2ViZCl+o3m8+aox/KtCIAhV6lF3nBbisFP76Em
 0QK68O8uPyiwi741sUD+8pr4GlCErn5kyFxM53J2VDbyN21d6LSxFdT64pTKuTo1+JExnJ9OgKhNG
 BC2P7CWOfNbkwJs9qb33AjYMSCrFU/MkQkp4hO1OWmKcRmv8STv58t9ubd3bpPEZh9d/Da4MSRYE8
 gVwyR0Bg==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQsjB-0008Ta-52
 for linux-mtd@lists.infradead.org; Wed, 15 May 2019 12:09:47 +0000
X-Originating-IP: 77.136.197.83
Received: from xps13 (83.197.136.77.rev.sfr.net [77.136.197.83])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 981291C0013;
 Wed, 15 May 2019 12:08:59 +0000 (UTC)
Date: Wed, 15 May 2019 14:08:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v3 2/4] mtd: rawnand: Add Macronix MX25F0A NAND controller
Message-ID: <20190515140858.77213af9@xps13>
In-Reply-To: <OF8A566F14.A2F0F576-ON482583FB.002E7E32-482583FB.003068BA@mxic.com.tw>
References: <1555320234-15802-1-git-send-email-masonccyang@mxic.com.tw>
 <1555320234-15802-3-git-send-email-masonccyang@mxic.com.tw>
 <20190512151820.4f2dd9da@xps13>
 <OF8A566F14.A2F0F576-ON482583FB.002E7E32-482583FB.003068BA@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_080945_294953_5205DA72 
X-CRM114-Status: GOOD (  13.43  )
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

SGkgbWFzb25jY3lhbmdAbXhpYy5jb20udHcsCgptYXNvbmNjeWFuZ0BteGljLmNvbS50dyB3cm90
ZSBvbiBXZWQsIDE1IE1heSAyMDE5IDE2OjQ4OjQ2ICswODAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4g
PiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ID4gPiArLy8KPiA+ID4g
Ky8vIENvcHlyaWdodCAoQykgMjAxOSBNYWNyb25peCBJbnRlcm5hdGlvbmFsIENvLiwgTHRkLgo+
ID4gPiArLy8KPiA+ID4gKy8vIEF1dGhvcnM6Cj4gPiA+ICsvLyAgIE1hc29uIFlhbmcgPG1hc29u
Y2N5YW5nQG14aWMuY29tLnR3Pgo+ID4gPiArLy8gICB6aGVuZ3h1bmxpIDx6aGVuZ3h1bmxpQG14
aWMuY29tLnR3PiAgCj4gPiAKPiA+IFRoaXMgaXMgbm90IGEgdmFsaWQgbmFtZS4KPiA+IAo+ID4g
QWxzbyBpZiBoZSBhcHBlYXJzIGhlcmUgSSBzdXBwb3NlIGhlIHNob3VsZCBiZSBjcmVkaXRlZCBp
biB0aGUKPiA+IG1vZHVsZV9hdXRob3JzKCkgbWFjcm8gdG9vLiAgCj4gCj4gSSB0aGluayBMaSBz
aG91bGQgbWFpbnRhaW4gdGhpcyBOQU5EIGRyaXZlciBsYXRlciwgCgpUaGlzIGVudHJ5IGlzIGZv
ciB0aGUgYXV0aG9ycyBvZiB0aGUgZHJpdmVyLgoKSWYgaGUgd2lsbCBtYWludGFpbiB0aGUgZHJp
dmVyLCB0aGVuIGFkZCBhIG5ldyBlbnRyeSBpbiBNQUlOVEFJTkVSUy4KCj4gPiA+ICt9Cj4gPiA+
ICsKPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbmFuZF9jb250cm9sbGVyX29wcyBteGljX25h
bmRfY29udHJvbGxlcl9vcHMgPSB7Cj4gPiA+ICsgICAuZXhlY19vcCA9IG14aWNfbmFuZF9leGVj
X29wLAo+ID4gPiArfTsKPiA+ID4gKwo+ID4gPiArc3RhdGljIGludCBteDI1ZjBhX25hbmRfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ID4gK3sKPiA+ID4gKyAgIHN0cnVj
dCBtdGRfaW5mbyAqbXRkOwo+ID4gPiArICAgc3RydWN0IG14MjVmMGFfbWZkICptZmQgPSBkZXZf
Z2V0X2RydmRhdGEocGRldi0+ZGV2LnBhcmVudCk7Cj4gPiA+ICsgICBzdHJ1Y3QgbXhpY19uYW5k
X2N0bHIgKm14aWM7Cj4gPiA+ICsgICBzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kX2NoaXA7Cj4gPiA+
ICsgICBpbnQgZXJyOwo+ID4gPiArCj4gPiA+ICsgICBteGljID0gZGV2bV9remFsbG9jKCZwZGV2
LT5kZXYsIHNpemVvZihzdHJ1Y3QgbXhpY19uYW5kX2N0bHIpLAo+ID4gPiArICAgICAgICAgICAg
IEdGUF9LRVJORUwpOyAgCj4gPiAKPiA+IG14aWMgZm9yIGEgTkFORCBjb250cm9sbGVyIHN0cnVj
dHVyZSBpcyBwcm9iYWJseSBub3QgYSBuYW1lIG1lYW5pbmdmdWwKPiA+IGVub3VnaC4gIAo+IAo+
IEhvdyBhYm91dCAqZm1jIG9yICpteGljX2ZtYyA/CgpmbWMgaXMgZmluZSwgZXZlbiBpZiBJIHBl
cnNvbmFsbHkgcHJlZmVyIG5mYyBmb3IgTkFORCBmbGFzaCBjb250cm9sbGVyLgpIZXJlIHRoZSAn
bScgaW4gZm1jIHN0YW5kcyBmb3IgJ21lbW9yeScgYnV0IEkgYW0gbm90IHN1cmUgaWYgdGhlCmNv
bnRyb2xsZXIgY2FuIG1hbmFnZSBzb21ldGhpbmcgZWxzZSB0aGFuIE5BTkQgZmxhc2ggYW55d2F5
PwoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
