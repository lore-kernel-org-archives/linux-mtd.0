Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83822C7619A
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Mar 2023 10:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y1A9fQKkvMzQSy0Ivf9+7F/oriNVQ5ydOBtTv6waIAg=; b=UK0Nvvzs8iNhhA
	G325iSvxfaIqlHlanmoZB+6x3tKZf+F6Md/WGK+d1Tk6bdyNs86e+SmnNLwl4yxmCwl5B703zciV2
	nFjwMm9S9jrkISctIWqFNBQE3CFrWw6xYWPUBbLVenvgt6Z7MA64gAyB1Z1wXzXVsVm3n4RSP2Gu5
	0kaVIbuAF+Oc3jFpLYmNMK8j/nf1f8h0ccNVp+L2vQoMXH6pnSiEmgRNgN3ngEyYf4Fiv9slft0W+
	OAgiPSPSQbBfJBYu05hAzaWWB8gLu3l/aCCCp/Di0LQJSYxwbYGO9Vsgas4jwsMJ7obIn2+r4ZU67
	ZBwk3G7MXmUBjSp3mwWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgkJw-00AfaE-1u;
	Mon, 27 Mar 2023 10:43:24 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgkJs-00AfZE-30
	for linux-mtd@lists.infradead.org;
	Mon, 27 Mar 2023 10:43:22 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E91B5E0009;
	Mon, 27 Mar 2023 10:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679913795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mq3au7tx9bpvb0kny92KW5V+FEUINAGvXJjvAKrCa6I=;
	b=pTSYk9flkxtggRnAAMuEA+CmCNzdRs8EdTgeg4n2cRjlHnYujmuFf0cMFpysnMlfKNL/5P
	CJTVUYuxQyDbwPy/FZoZy1cHHy2vGBtlnQ4ziqRpfiNIoXFBsQLtKLSMPozE9xyd93sI9e
	KV1UXAlY8RBj4pM4+emy03nOjnikD30pWAegnE87XXhROq1SxdBHVyQ2hf1ov9wixB7Wuf
	pi/7hcEBFGDY7f9yDlLLTAKOwTRouaPoE8wUY51e3fKAqSS+Kev97yy5gTVlxrKeUfWoT3
	2N2N5wjc3tLFMO2lbt7pW1Eq4Yhh+i/Rjurr7WLZ2tjw1h73hKJfK+hSYEUUwA==
Date: Mon, 27 Mar 2023 12:43:13 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Christophe Kerello <christophe.kerello@foss.st.com>, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 2/2] mtd: rawnand: stm32_fmc2: use timings.mode
 instead of checking tRC_min
Message-ID: <20230327124313.1ccd3d66@xps-13>
In-Reply-To: <75dcd205-5432-7103-370c-d65d792631ea@linaro.org>
References: <20230327094742.38856-1-christophe.kerello@foss.st.com>
	<20230327094742.38856-3-christophe.kerello@foss.st.com>
	<75dcd205-5432-7103-370c-d65d792631ea@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_034321_129560_EB701723 
X-CRM114-Status: GOOD (  18.11  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gTW9uLCAyNyBNYXIg
MjAyMyAxMTozMDo1MSArMDEwMDoKCj4gT24gMy8yNy8yMyAxMDo0NywgQ2hyaXN0b3BoZSBLZXJl
bGxvIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBpcyB1c2luZyB0aW1pbmdzLm1vZGUgdmFsdWUgaW5z
dGVhZCBvZiBjaGVja2luZyB0UkNfbWluIHRpbWluZwo+ID4gZm9yIEVETyBtb2RlIHN1cHBvcnQu
Cj4gPiAgIAo+IAo+IEZpeGVzIGFuZCBDYyB0byBzdGFibGUgaGVyZSB0b28sIGFzIHlvdSdkIGxp
a2UgdG8gaGF2ZSB0aGlzIGJhY2twb3J0ZWQKPiBhcyB3ZWxsLCBkb24ndCB5b3U/CgpBY3R1YWxs
eSB0aGUgcmVhc29uIHdoeSBDaHJpc3RvcGhlIHNwbGl0IHRoaXMgaW50byB0d28gcGF0Y2hlcyBp
cwpiZWNhdXNlIHRpbWluZ3MubW9kZSB3YXMgaW50cm9kdWNlZCByYXRoZXIgbGF0ZWx5LCBoZSB3
YW50ZWQgdGhlIHNhbWUKcGF0Y2ggdG8gYXBwbHkgb24gYWxsIHN0YWJsZSBrZXJuZWxzLCBoZSBh
Y3R1YWxseSBhc2tlZCBmb3IgdGhhdCBzcGxpdAphbmQgSSBhZ3JlZWQgKGFub3RoZXIgc29sdXRp
b24gd291bGQgaGF2ZSBiZWVuIHRvIHNlbmQgdGhpcyBjdXJyZW50CnBhdGNoIHRvIExpbnVzIGFu
ZCBoYXZlIHRoZSBvdGhlciB2ZXJzaW9uIHNlbnQgdG8gc3RhYmxlLCBidXQgaXQKcmVxdWlyZXMg
YSBiaXQgb2Ygc2NoZWR1bGluZyBvbiBib3RoIGVuZHMpLgoKTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtbXRkLzIwMjMwMzI3MTAxMTU2LjBlYzI4MTZhQHhwcy0xMy9ULyN0Cgo+
IAo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVs
bG9AZm9zcy5zdC5jb20+ICAKPiAKPiBSZXZpZXdlZC1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3Iu
YW1iYXJ1c0BsaW5hcm8ub3JnPgo+IAo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcv
c3RtMzJfZm1jMl9uYW5kLmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9zdG0zMl9mbWMyX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJf
bmFuZC5jCj4gPiBpbmRleCAzYWJiNjNkMDBhMGIuLjllNzRiY2Q5MGFhYSAxMDA2NDQKPiA+IC0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gPiArKysgYi9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+ID4gQEAgLTE1MzEsNyArMTUzMSw3
IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1jMl9uZmNfc2V0dXBfaW50ZXJmYWNlKHN0cnVjdCBuYW5k
X2NoaXAgKmNoaXAsIGludCBjaGlwbnIsCj4gPiAgCWlmIChJU19FUlIoc2RydCkpCj4gPiAgCQly
ZXR1cm4gUFRSX0VSUihzZHJ0KTsKPiA+ICAKPiA+IC0JaWYgKHNkcnQtPnRSQ19taW4gPCAzMDAw
MCkKPiA+ICsJaWYgKGNvbmYtPnRpbWluZ3MubW9kZSA+IDMpCj4gPiAgCQlyZXR1cm4gLUVPUE5P
VFNVUFA7Cj4gPiAgCj4gPiAgCWlmIChjaGlwbnIgPT0gTkFORF9EQVRBX0lGQUNFX0NIRUNLX09O
TFkpICAKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
