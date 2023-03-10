Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB4DC74A4B
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Mar 2023 14:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gR/rrqGX3fIiex7PlCfb1kN3jwJ/zNlPycm+0S6VSoo=; b=tYSObxJ2rBWjG4
	mb6PbarhN7iwq3wxkMCCIpTazK7zhU/3qrVt8Z207UyeHDVmM8t+GtWGH6vHnUDvj+QHV98AuRjYx
	wheSLWWGcquNGxaEAQaHcqsaGOOy7GF/yx+TUl1PWgjIv6Bu2CPNxPv/dss3Z4mnKPFWGVDOedaI9
	pY3TVuXAFN/9eBZ0sJSWtat1A5dcuvqhRKUJlPQUWW8XV5SOOKSbukzQC+/BKz19NNf+GgAHw1aYh
	OGbH7RkaO+RXsdyLJ5yZ9ceu3tuEDjX1+3vM68WV7BA7R5D2GBg6MDhziEum51f8jtPrC+mB4V1Wl
	tPwMmzbychHmpG03uh6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paeCH-00Es4K-Qu; Fri, 10 Mar 2023 14:58:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paeA0-00Er13-OU
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2023 14:55:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C27B9B82315;
	Fri, 10 Mar 2023 14:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE97C433EF;
	Fri, 10 Mar 2023 14:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678460153;
	bh=YFc8z7PQrEiEAVk+eNCyyUkbwe5xhAM4AB5u7PX894E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NmODi+ZUV7ygP8CclaAu/JvmuFtnqy4ppZtZvHyO2pbWumGoWLAzS0DLfBj73OaBd
	 kkHfuKQggU+1uo4jdOcCcM14ZaV0PQbYnwjJUG6TX/4hIATz/1mCtTr1QaVJefnV8k
	 FFG1et/AKbZVioaDy3+dL6lRhiZkefvWcoGcRuLQr3In3AWiLiF2F57hutJG1fRAFp
	 gSPM7Z5Ju+cvWZjwQGEAXMOZJ8/Gf1F4EkHiToANd/VRGUM9P6nIIXQ+ooaU6RQSS6
	 rBwEpnNsYK8aNOA/xLotDtPerGuS2n97WnbNHc/BAW4XYX04PU/qN3/Vbr9KAgFwcd
	 nirmLwZyB8wNw==
Date: Fri, 10 Mar 2023 20:25:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: qcom: Use of_property_present() for testing
 DT property presence
Message-ID: <20230310145545.GE6838@thinkpad>
References: <20230310144715.1543926-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230310144715.1543926-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_065556_970550_D5CF1300 
X-CRM114-Status: GOOD (  19.26  )
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

T24gRnJpLCBNYXIgMTAsIDIwMjMgYXQgMDg6NDc6MTVBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gSXQgaXMgcHJlZmVycmVkIHRvIHVzZSB0eXBlZCBwcm9wZXJ0eSBhY2Nlc3MgZnVuY3Rp
b25zIChpLmUuCj4gb2ZfcHJvcGVydHlfcmVhZF88dHlwZT4gZnVuY3Rpb25zKSByYXRoZXIgdGhh
biBsb3ctbGV2ZWwKPiBvZl9nZXRfcHJvcGVydHkvb2ZfZmluZF9wcm9wZXJ0eSBmdW5jdGlvbnMg
Zm9yIHJlYWRpbmcgcHJvcGVydGllcy4gQXMKPiBwYXJ0IG9mIHRoaXMsIGNvbnZlcnQgb2ZfZ2V0
X3Byb3BlcnR5L29mX2ZpbmRfcHJvcGVydHkgY2FsbHMgdG8gdGhlCj4gcmVjZW50bHkgYWRkZWQg
b2ZfcHJvcGVydHlfcHJlc2VudCgpIGhlbHBlciB3aGVuIHdlIGp1c3Qgd2FudCB0byB0ZXN0Cj4g
Zm9yIHByZXNlbmNlIG9mIGEgcHJvcGVydHkgYW5kIG5vdGhpbmcgbW9yZS4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IE1hbml2
YW5uYW4gU2FkaGFzaXZhbSA8bWFuaUBrZXJuZWwub3JnPgoKVGhhbmtzLApNYW5pCgo+IC0tLQo+
ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgfCAyICstCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29t
X25hbmRjLmMKPiBpbmRleCAxOThhNDQ3OTRkMmQuLjZiNTJlZDhjNjE3OCAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPiArKysgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9xY29tX25hbmRjLmMKPiBAQCAtMzA1NCw3ICszMDU0LDcgQEAgc3RhdGljIGludCBx
Y29tX25hbmRfaG9zdF9wYXJzZV9ib290X3BhcnRpdGlvbnMoc3RydWN0IHFjb21fbmFuZF9jb250
cm9sbGVyICpuYW4KPiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9IG5hbmRjLT5kZXY7Cj4gIAlpbnQg
cGFydGl0aW9uc19jb3VudCwgaSwgaiwgcmV0Owo+ICAKPiAtCWlmICghb2ZfZmluZF9wcm9wZXJ0
eShkbiwgInFjb20sYm9vdC1wYXJ0aXRpb25zIiwgTlVMTCkpCj4gKwlpZiAoIW9mX3Byb3BlcnR5
X3ByZXNlbnQoZG4sICJxY29tLGJvb3QtcGFydGl0aW9ucyIpKQo+ICAJCXJldHVybiAwOwo+ICAK
PiAgCXBhcnRpdGlvbnNfY291bnQgPSBvZl9wcm9wZXJ0eV9jb3VudF91MzJfZWxlbXMoZG4sICJx
Y29tLGJvb3QtcGFydGl0aW9ucyIpOwo+IC0tIAo+IDIuMzkuMgo+IAoKLS0gCuCuruCuo+Cuv+Cu
teCuo+CvjeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
