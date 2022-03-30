Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E022DC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Mar 2022 08:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zc/AkxWJa/P4es5S64OuG7ptTnG1CBFvdyM50LfXgVE=; b=tn/LkohyO7doBS
	Bp8G4bdJd3blk278H8D9B7P1NTdYZMGQxsrYCBG2T41bMSMdnV10xvOzmDSf9E8yEwYqybV4br6ed
	+epTh7cJFvesdCs+SQlD3MeBHiYVE3ByrNaqt1+KaRX46hEL7NB1EXPYXovNi3OhsylUNDvZUvWj7
	FFFcFrAV7t9bpOprQFe+6Y8NksI0DmZXugY2R0ufoskZCSuLlqLZRNe74q5DYYdvbRNVrNSIIa+cu
	w1pUhzYoOAh/SepNafDECdk5177vkl9fSSSvTWUZDMq2RYGUtr7TPEi57sl+QelZXY1a3OyISxdzE
	1yuEd8fARbBtOabHXrxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZTP5-00EhpZ-VC; Wed, 30 Mar 2022 08:10:08 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZTP2-00Ehnr-3r
 for linux-mtd@lists.infradead.org; Wed, 30 Mar 2022 08:10:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7067B1BF209;
 Wed, 30 Mar 2022 08:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1648627801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QrXANGeblYePSDSjBqnjlhxDn2ylDzea37fL7T4lxpU=;
 b=ROOjh6SGya4ePmk//V50fvCANd7x32XNyJWrG5ha4iYMCrDxOwfrXEaalbEFBbSe4i4kEN
 /1QCIk73V6LQWTiZYbycmp5/NuenzcMK0x4UsIhaTIMzzXIl48ghlkkPMb8Dz1CUgSKKxJ
 qm7+XpSM28re9125Q0NBD2dsRYJNipx9NK7FT6TL36oj6JQ4Q1exz21odxuwe4JmiWnuMz
 mxcwn4kZ0Yvx2K8vPd1VaVmJC4dQbkV0OPcwv+lNIv7YZQ+RNLSvVOxoM47Yjq/Z9ZUx3O
 A561NtdCHUg8BfCb1H3lOhiifECYKcOmmcHDnNbhchxC4n39AzySvKUeWjk+Qw==
Date: Wed, 30 Mar 2022 10:09:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Zhilkin <csharper2005@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, NOGUCHI Hiroshi
 <drvlabo@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Karim
 <Karimdplay@gmail.com>, M <x1@disroot.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: add support for Sercomm partitions
Message-ID: <20220330100958.57dc4d61@xps13>
In-Reply-To: <20220329122016.4122899-1-csharper2005@gmail.com>
References: <20220329122016.4122899-1-csharper2005@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_011004_519454_54069492 
X-CRM114-Status: GOOD (  12.91  )
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

SGkgTWlraGFpbCwKCmNzaGFycGVyMjAwNUBnbWFpbC5jb20gd3JvdGUgb24gVHVlLCAyOSBNYXIg
MjAyMiAxMjoyMDoxNiArMDAwMDoKCj4gVGhpcyBhZGRzIGFuIE1URCBwYXJ0aXRpb24gcGFyc2Vy
IGZvciB0aGUgU2VyY29tbSBwYXJ0aXRpb24gdGFibGUgdGhhdAo+IGlzIHVzZWQgaW4gc29tZSBC
ZWVsaW5lLCBOZXRnZWFyIGFuZCBTZXJjb21tIHJvdXRlcnMuCj4gCj4gVGhlIFNlcmNvbW0gcGFy
dGl0aW9uIG1hcCB0YWJsZSBjb250YWlucyByZWFsIHBhcnRpdGlvbiBvZmZzZXRzLCB3aGljaAo+
IG1heSBkaWZmZXIgZnJvbSBkZXZpY2UgdG8gZGV2aWNlIGRlcGVuZGluZyBvbiB0aGUgbnVtYmVy
IGFuZCBsb2NhdGlvbiBvZgo+IGJhZCBibG9ja3Mgb24gTkFORC4KPiAKPiBEZXZpY2UgdHJlZSBl
eGFtcGxlOgo+IHBhcnRpdGlvbnMgewo+IAljb21wYXRpYmxlID0gInNlcmNvbW0sc2MtcGFydGl0
aW9ucyIsICJmaXhlZC1wYXJ0aXRpb25zIjsKPiAJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gCSNz
aXplLWNlbGxzID0gPDE+Owo+IAo+IAlwYXJ0aXRpb25AMCB7Cj4gCQlsYWJlbCA9ICJ1LWJvb3Qi
Owo+IAkJcmVnID0gPDB4MCAweDEwMDAwMD47Cj4gCQlzY3BhcnQtaWQgPSA8MD47Cj4gCQlyZWFk
LW9ubHk7Cj4gCX07Cj4gfTsKCllvdSdsbCBuZWVkIGEgRFQgYmluZGluZyBwYXRjaCBhbmQgUm9i
J3MgYWNrIQoKPiAKPiBUaGlzIGlzIGVzc2VudGlhbGx5IHRoZSBzYW1lIGNvZGUgYXMgcHJvcG9z
ZWQgYnkgTk9HVUNISSBIaXJvc2hpCj4gPGRydmxhYm9AZ21haWwuY29tPiBoZXJlOgoKSSB3b3Vs
ZCBjcmVkaXQgSGlyb3NoaSB3aXRoIGEgU3VnZ2VzdGVkLWJ5IGF0IGxlYXN0Cgo+IGh0dHBzOi8v
Z2l0aHViLmNvbS9vcGVud3J0L29wZW53cnQvcHVsbC8xMzE4I2lzc3VlY29tbWVudC00MjA2MDcz
OTQKCkFuZCB1c2UgYSBMaW5rOiB0YWcgZm9yIHRoaXMuCgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1p
a2hhaWwgWmhpbGtpbiA8Y3NoYXJwZXIyMDA1QGdtYWlsLmNvbT4KPiAtLS0KCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
