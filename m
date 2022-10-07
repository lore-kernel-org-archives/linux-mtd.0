Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BE3C433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Oct 2022 07:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xiSqBFHl2gembfOJreStg1pkWf6aZdwgKaZ5IyLpyA=; b=3/c8PrI2hvN3p4
	lbN8SIfvikcsGPpuUrEJSyFncFT2bsM26w+ToNZMHdiOV5iMd5eIDtfyi7YZ9ZC13VFW+Rdg1gg3q
	74otPQgc3ddUJ+cas/beQQxbfwAs1dITTMqARXFViKErqKuVZZj394UV/TCstEuHlkxGVI65gEry8
	RCTqSV0sTM0jgClG6Zh5s9GvDqLI4SnMaVO/VNONtKACseM6Kqz9JGeJ+xB882/E/ciAaeVGsF/Ih
	b90qKF09fDdobcTAqgd0UWa58tTpsxcXd0XlvURNUXBkAdzh41YqAxrhKPufHMyknYTEM/nYOwWT6
	qnARmQTjF3vIMFdbaAkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogiA5-0083GD-E1; Fri, 07 Oct 2022 07:52:49 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogiA1-0083F3-Kc
	for linux-mtd@lists.infradead.org; Fri, 07 Oct 2022 07:52:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9E70940014;
	Fri,  7 Oct 2022 07:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665129159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n4D06XYdYARjTiZ9opyHKO6UcPGIvGaFyKS4ti1VcvU=;
	b=joJDP4bAb69hrb+tvi3QAJ1neH3YYUCFMglGy3qZpl25XIJUShF1/H7bTU0GJC7v9h4XyE
	TcMWM0649mevdECWIvi+pyJm2IgmXqwNjsuQnppRE3bTzRPeR4Sj1eprJ3FsNjbQiwnHhe
	5y6hNszlqo8w9cGqPr0PgIX3+o/xpJAJXMZlMh9yxsMAaGIr5CEOMMgGnBqw6ppWUPJxHA
	qe2izwGjplEnWqHvMrXS69ic2/zkrhSOheJ3cRAtNURRBwFt2/+kzVCMMGlUMsqeHHC6ZH
	oMv79bMkkgmq/WKm39k8PV5HzmCKhtHhLFrRoHG+7ngq8va1tPMHSx55vPUbqA==
Date: Fri, 7 Oct 2022 09:52:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joe Perches <joe@perches.com>
Cc: Ray Zhang <sgzhang@google.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mtd: mtdoops: change printk() to counterpart pr_
 functions
Message-ID: <20221007095236.37113034@xps-13>
In-Reply-To: <070d253e718c1a6d72fb52c1d2f02ec461d825a1.camel@perches.com>
References: <20221007065042.700761-1-sgzhang@google.com>
	<20221007065042.700761-2-sgzhang@google.com>
	<070d253e718c1a6d72fb52c1d2f02ec461d825a1.camel@perches.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_005245_872887_58EEE1EB 
X-CRM114-Status: GOOD (  14.42  )
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

SGkgSm9lLCBSYXksCgpqb2VAcGVyY2hlcy5jb20gd3JvdGUgb24gRnJpLCAwNyBPY3QgMjAyMiAw
MDowOToyNiAtMDcwMDoKCj4gT24gRnJpLCAyMDIyLTEwLTA3IGF0IDA2OjUwICswMDAwLCBSYXkg
Wmhhbmcgd3JvdGU6Cj4gPiBUbyBjb21wbHkgd2l0aCBsYXRlc3Qga2VybmVsIGNvZGUgcmVxdWly
ZW1lbnQsIGNoYW5nZSBwcmludGsoKSB0bwo+ID4gY291bnRlcnBhcnQgcHJfIGZ1bmN0aW9ucyBp
biBtdGRvb3BzIGRyaXZlcjoKPiA+IC0gY2hhbmdlIHByaW50ayhJTkZPKSB0byBwcl9pbmZvKCkK
PiA+IC0gY2hhbmdlIHByaW50ayhERUJVRykgdG8gcHJfZGVidWcoKSAgCj4gCj4gVGhlcmUgaXMg
YSBkaWZmZXJlbnQgYmVoYXZpb3Igd2l0aCBwcmludGsoS0VSTl9ERUJVRyB0byBwcl9kZWJ1ZygK
PiBhcyBwcl9kZWJ1ZyBpcyBhIG5vLW9wIHVubGVzcyBkeW5hbWljIGRlYnVnZ2luZyBpcyBlbmFi
bGVkIG9yCj4gREVCVUcgaXMgZGVmaW5lZC4KCkkgZGlkbid0IGtub3cgYWJvdXQgdGhpcyBkaWZm
ZXJlbmNlLiBJIHdhcyBleHBlY3RpbmcgcHJpbnRrKEtFUk5fREVCVUcpCnRvIGJlaGF2ZSB0aGUg
c2FtZSBhcyBwcl9kZWJ1Zy9kZXZfZGJnLgoKPiBBbmQgZXZlbiB3aXRoIGR5bmFtaWNfZGVidWcs
IHRoZSBvdXRwdXQgaXMgZGVmYXVsdCBkaXNhYmxlZCB1bmxlc3MKPiBERUJVRyBpcyBkZWZpbmVk
Lgo+IAo+IEFzIGlzLCBwcmludGsoS0VSTl9ERUJVRyBpcyBlbWl0dGVkIHVubGVzcyB0aGUgY29u
c29sZSBsZXZlbCBpcyBsb3cuCj4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkb29w
cy5jIGIvZHJpdmVycy9tdGQvbXRkb29wcy5jICAKPiBbXQo+ID4gQEAgLTEyMCw4ICsxMjAsOCBA
QCBzdGF0aWMgdm9pZCBtdGRvb3BzX2luY19jb3VudGVyKHN0cnVjdCBtdGRvb3BzX2NvbnRleHQg
KmN4dCkKPiA+ICAJCXJldHVybjsKPiA+ICAJfQo+ID4gIAo+ID4gLQlwcmludGsoS0VSTl9ERUJV
RyAibXRkb29wczogcmVhZHkgJWQsICVkIChubyBlcmFzZSlcbiIsCj4gPiAtCSAgICAgICBjeHQt
Pm5leHRwYWdlLCBjeHQtPm5leHRjb3VudCk7Cj4gPiArCXByX2RlYnVnKCJtdGRvb3BzOiByZWFk
eSAlZCwgJWQgKG5vIGVyYXNlKVxuIiwKPiA+ICsJCSBjeHQtPm5leHRwYWdlLCBjeHQtPm5leHRj
b3VudCk7CgpCdXQgaG9uZXN0bHkgaW4gdGhpcyBkcml2ZXIgSSBmZWVsIGZpbmUgY2hhbmdpbmcg
dGhlIHByaW50ayhLRVJOX0RFQlVHKQppbnRvIHByX2RlYnVnKCkuCgpSYXksIG1heWJlIHlvdSBj
YW4gYWRhcHQgeW91ciBjb21taXQgbG9nIHRvIG1lbnRpb24gdGhlIGRpZmZlcmVuY2U/CgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
