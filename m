Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8E5C7619A
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Mar 2023 10:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJsolk/d/6uEC22Ek7ln8B6HhfP6HaVl7RzJn+Lgpmk=; b=pKzBCseN6ujxJm
	N4eaIWNeY8Ia9f9JuzRt5IWSZi4/ncjAL/cOKodPquDtIyYiOnomndMcpLHdn5J4YvB71HDBhv8/a
	hJrxk0m+yyXdg7ZYuY4OOz6p4Jbsr/QlfPZE7t7rUHveDWS1mFK9pABPXTS5vlkzZ3pR8Q6uXJU0Y
	dvrZ2O6RrtYTDysHKh4bb4A9HHIURFfUiKIt7k5QP6yn6/ifNNWk0PZWRiSBFRupuv6hutQdv645a
	8XLEMFZXeDp7/2CW00mwLuLUIm2yKcxXQGMg7/9g0pLTJEwFaNpmXSweO6nsjcihtip8HeDacTDb9
	MSbo4Vx65YkU/jXcHFSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgkHC-00AfCX-07;
	Mon, 27 Mar 2023 10:40:34 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgkH8-00AfAt-2N
	for linux-mtd@lists.infradead.org;
	Mon, 27 Mar 2023 10:40:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1D7EA240007;
	Mon, 27 Mar 2023 10:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679913625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZpY9DCD1mIaNAsPVXMMa+YinIpx3N0fqEpjuBj6oEgU=;
	b=haaZrui7oihw9UxnD9hWxKhhodZldU8nVgUk/o79O2xruhBzUpYSFboH3DBRS0CyahwMy/
	WAi/T/WcjNKw2MGa5Su6mZ4ODfaVfdIeaqJXbSy+CrpVGHbv0hz6pvN9MEvknGROezkFNn
	DF98wpGGvAI+10e5HBF8FDv7GiZYUAWzb1VOdfNmDI3eL7VVSAAzj7PrK2IYiMRR1NTClY
	TPDlzydssppIUJRlOZkDMPtUrtKfMBQ1fx27DF3DQtTr4oYIHomad1psshvFqiHii4cmpi
	q/3DPPOxo632nbi8TIIFZgzHBHvmPq+x7DjIEf+ibJNxVif6AiokjI9YKRPirQ==
Date: Mon, 27 Mar 2023 12:40:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Christophe Kerello <christophe.kerello@foss.st.com>, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/2] mtd: rawnand: stm32_fmc2: do not support EDO
 mode
Message-ID: <20230327124022.4bb32839@xps-13>
In-Reply-To: <a17cd888-ef4d-ced0-adba-c6a6abdba51a@linaro.org>
References: <20230327094742.38856-1-christophe.kerello@foss.st.com>
	<20230327094742.38856-2-christophe.kerello@foss.st.com>
	<a17cd888-ef4d-ced0-adba-c6a6abdba51a@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_034030_911990_07097C4D 
X-CRM114-Status: GOOD (  21.60  )
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
MjAyMyAxMToyOTo1NiArMDEwMDoKCj4gSGksCj4gCj4gT24gMy8yNy8yMyAxMDo0NywgQ2hyaXN0
b3BoZSBLZXJlbGxvIHdyb3RlOgo+ID4gRk1DMiBjb250cm9sbGVyIGRvZXMgbm90IHN1cHBvcnQg
RURPIG1vZGUgKHRpbWluZ3MgbW9kZSA0IGFuZCA1KS4KPiA+ICAgCj4gCj4gY29tbWl0IHN1Ympl
Y3QgYW5kIG1lc3NhZ2Ugc2hvdWxkIGJlIGluIGltcGVyYXRpdmUgbW9vZCwgc28gSSB3b3VsZAo+
IGNoYW5nZSB0aGUgY29tbWl0IHN1YmplY3QgdG8gIm10ZDogcmF3bmFuZDogc3RtMzJfZm1jMjog
UmVtb3ZlCj4gdW5zdXBwb3J0ZWQgRURPIG1vZGUiIGFuZCB0aGUgbWVzc2FnZSB0byBzb21ldGhp
bmcgbGlrZSAiUmVtb3ZlIHRoZSBFRE8KPiBtb2RlIHN1cHBvcnQgZnJvbSBhcyB0aGUgRk1DMiBj
b250cm9sbGVyIGRvZXMgbm90IHN1cHBvcnQgdGhlIGZlYXR1cmUuIgo+IEV4dHJhIHBvaW50cyBp
ZiB5b3UgZGVzY3JpYmUgd2hhdCBoYXBwZW5lZCB3aGVuIHlvdSB1c2VkIHRpbWluZ3MgbW9kZSA0
Cj4gYW5kIDUgd2l0aCB0aGUgY3VycmVudCB2ZXJzaW9uIG9mIHRoZSBkcml2ZXIuCj4gCj4gTWlx
dWVsLCBjb3VsZCB5b3UgYWRkIENjIHRvIHN0YWJsZSB3aGVuIGFwcGx5aW5nPwo+IENjOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnCgpZZXMsIGFic29sdXRlbHkuCgo+IAo+ID4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9AZm9zcy5zdC5jb20+Cj4g
PiBGaXhlczogMmNkNDU3ZjMyOGMxICgibXRkOiByYXduYW5kOiBzdG0zMl9mbWMyOiBhZGQgU1RN
MzIgRk1DMiBOQU5EIGZsYXNoIGNvbnRyb2xsZXIgZHJpdmVyIikgIAo+IAo+IFJldmlld2VkLWJ5
OiBUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+Cj4gCj4gPiAtLS0KPiA+
ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyB8IDMgKysrCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9z
dG0zMl9mbWMyX25hbmQuYwo+ID4gaW5kZXggNWQ2MjcwNDhjNDIwLi4zYWJiNjNkMDBhMGIgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+ID4g
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMKPiA+IEBAIC0xNTMx
LDYgKzE1MzEsOSBAQCBzdGF0aWMgaW50IHN0bTMyX2ZtYzJfbmZjX3NldHVwX2ludGVyZmFjZShz
dHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY2hpcG5yLAo+ID4gIAlpZiAoSVNfRVJSKHNkcnQp
KQo+ID4gIAkJcmV0dXJuIFBUUl9FUlIoc2RydCk7Cj4gPiAgCj4gPiArCWlmIChzZHJ0LT50UkNf
bWluIDwgMzAwMDApCj4gPiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPiArCj4gPiAgCWlmIChj
aGlwbnIgPT0gTkFORF9EQVRBX0lGQUNFX0NIRUNLX09OTFkpCj4gPiAgCQlyZXR1cm4gMDsKPiA+
ICAgIAoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
