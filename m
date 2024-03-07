Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91363C54E49
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2024 11:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FhKClRGbIEWuA9GFEdVcslUYnmASmah1RCFTQ255H1s=; b=E477DtDBmERBm5
	+IIrJmwANmzD8Kh7gD/1jSBhbvAehi8CSAce389wlWcSkIzM5WW9ecurmOp5Baj7lFxKD2Oi673BV
	wg9SL2q6j6qWFt6BgF8be/gpxIUFVppAjNmNYVYI1bM5seq5f4M2XH9yrA/HfM6fZ4GMkeryaJneT
	/lLeRlP5v2gmzXzmOkRLWLiohXyHPb1mEk06zWJqYA7mpuMVMkNNL6A/SzmVZmyG2QYbuY/JBnjRL
	g0rDtzxD+YR+S3yxrAKWTjM7eslIyj9zZvA1+IT/h6fBwXYYTBoDpiHOvHa9uROiBGTbqimXKRg/g
	ThhZbul4I5q5sC/x+A7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riCIG-00000004R8j-3s4G;
	Thu, 07 Mar 2024 11:52:12 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riCID-00000004R5z-46lt
	for linux-mtd@lists.infradead.org;
	Thu, 07 Mar 2024 11:52:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A1831C0003;
	Thu,  7 Mar 2024 11:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709812324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8qjzIPvPaHnI7CkxFs3SDACYEgBDUcaPOqsPQVtT6bk=;
	b=Wonxoi2pEuf7HrDiYqxl22kTQ9Swr1eeV5GV20NEPfv+7s3ql7IP/ZrGCjX5QDZnCca5YG
	9mlg7lNeMa/UIn8/kZo83FqzdduC5bp+WL8PbPTRhCBE64EZY0F8Xt+s9/uvdiFjGIR0q/
	V840ZUWUNrAnPqkXK7sCLWhLFTnnSUve7iS3joQz4Ckb795JG1hdB0HDBEyglTHpmseX/K
	3t+v5HDj7iM/RwbNJQV6KA2k8hxs2Wdy6lMYaIG1axnWENah232Q6oThECRRIWRC5ybLTw
	ArRXTvsIppKOaFTTTPxuUBF9eI+gtG4P/EjCEXDg39JtPY0PFdM6a+xfRNpRgg==
Date: Thu, 7 Mar 2024 12:52:00 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>, Jaime Liao <jaimeliao.tw@gmail.com>, Alvin
 Zhou <alvinzhou@mxic.com.tw>, <eagle.alexander923@gmail.com>,
 <mans@mansr.com>, <martin@geanix.com>, Sean =?UTF-8?B?Tnlla2rDpnI=?=
 <sean@geanix.com>
Subject: Re: [PATCH 0/3] mtd: rawnand: More continuous read fixes
Message-ID: <20240307125200.0c7fb137@xps-13>
In-Reply-To: <93098d4e-c3b6-4c61-9ab7-764e18b7cb7d@foss.st.com>
References: <20240223115545.354541-1-miquel.raynal@bootlin.com>
	<d950908e-5c2b-41f7-9708-2eae1e6d9c76@foss.st.com>
	<20240229114627.647f4af2@xps-13>
	<93098d4e-c3b6-4c61-9ab7-764e18b7cb7d@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_035210_171383_ED82725E 
X-CRM114-Status: GOOD (  17.83  )
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

SGkgQ2hyaXN0b3BoZSwKCj4gPiBJIHdhcyBleHBlY3RpbmcgdGhlIG9uZ29pbmcgYm9vbGVhbiB0
byBhbHdheXMgYmUgcmVzZXQgYXQgdGhlIGVuZCBvZgo+ID4gbmFuZF9kb19yZWFkX29wcygpLCBJ
IHByb2JhYmx5IG1pc3NlZCBhIHNjZW5hcmlvLiBJbiBhbnkgY2FzZSB3aGF0IGlzCj4gPiBwcm9i
YWJseSBuZWVkZWQgZm9yIHRoZSBzZXF1ZW5jZXIgdG8gd29yayBpczoKPiA+IAo+ID4gKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiA+IEBAIC0zNzI2LDYgKzM3MjYsNyBA
QCBzdGF0aWMgaW50IG5hbmRfZG9fcmVhZF9vcHMoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgbG9m
Zl90IGZyb20sCj4gPiAgICAgICAgICAgICAgICAgIH0KPiA+ICAgICAgICAgIH0KPiA+ICAgICAg
ICAgIG5hbmRfZGVzZWxlY3RfdGFyZ2V0KGNoaXApOwo+ID4gKyAgICAgICBjaGlwLT5jb250X3Jl
YWQub25nb2luZyA9IGZhbHNlOyAgCj4gCj4gV2l0aCB0aGlzIHBhdGNoLCBpdCBpcyBPSywgdGhl
IGNvbnRpbnVvdXMgcmVhZCBmZWF0dXJlIHdpbGwgYmUgZGlzYWJsZWQKPiBhcyBleHBlY3RlZCBp
biBhbGwgY2FzZXMuCgpUaGFua3MgdG8geW91ciBmZWVkYmFjaywgSSd2ZSB0aG91Z2h0IGFnYWlu
IGFib3V0IHRoaXMgY2FzZS4gVGhlIGZpeApwcmVzZW50ZWQgaGVyZSB3aWxsIG1vc3QgbGlrZWx5
IHdvcmsgYnV0IGRvZXMgbm90IHNvdW5kIGlkZWFsIGFzIHdlCnN0aWxsIGVuYWJsZSB0aGUgY29u
dGludW91cyByZWFkIGludGVybmFsIGZsYWcgd2l0aG91dCB1c2luZyBpdC4gU28gSQphbSBkcmFm
dGluZyBzb21ldGhpbmcgZWxzZSB0aGF0IHNob3VsZCBlbnN1cmUgd2UgYXJlIGFsd2F5cyBlbmFi
bGluZwpjb250aW51b3VzIHJlYWQgb25seSB3aGVuIHdlIGNhbiB1c2UgaXQuCgpBcyBhIHNlY29u
ZCBzdGVwLCBJIHdpbGwgcmVzZXQgdGhlIGZsYWcgbGlrZSBhYm92ZSwgYnV0IHdpdGggYQpXQVJO
X09OX09OQ0UoKS4gVGhpcyB3YXk6Ci0gSWYgaXQgaGFwcGVucyB0aGF0IHdlIG1pc3NlZCBhbm90
aGVyIHBhdGggd2hlcmUgdGhpcyBpcyBub3QgZGlzYWJsZWQsCiAgdGhlcmUgd2lsbCBiZSBubyBi
ZWhhdmlvcmFsIGJ1ZyAoaG9wZWZ1bGx5KS4KLSBXZSB3aWxsIHN0aWxsIGJlIG5vdGlmaWVkIGJ5
IHRoZSB3YXJuaW5nLgoKVGhhbmtzIGZvciBhbGwgeW91ciB2YWx1YWJsZSBmZWVkYmFjayBhbmQg
dGVzdGluZy4gTGV0IG1lIGtub3cgd2hhdAp5b3UgdGhpbmsgb2YgdGhpcyBuZXcgc2VyaWVzLgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
