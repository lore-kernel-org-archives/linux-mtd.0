Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317A8C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 08:50:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A69C8611EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 08:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A69C8611EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F0igIcJINJxKJpH4gPMFgzTBzP4xfPJNKWLCWrdepgI=; b=edMxb5oRhzt5fp
	MSlU8zE+H2eRER3IvhmsKuDRQT2yE6VHclF/AM8j08wZVj27my3Q+k93hT0yLSrBwlRm9SFb4qq60
	F+lFccppFJN1olpSc835/t0rwZWpWxS7AEqisJC/2nSxLp6gL3l0AUhUAmOn85ItgtUua2/48Z+Xi
	LUJHGAOY7mjKns/02YZcvHJYvVpUclnCW03rpHEX7tnIuyO65TutQTD9J5MJhrQZxiBVid937eZ5u
	UyQEPUaoiYR4pmuAzUn3amYgmaGiH4L17UfiYTeC5rO8LYLIEaFghVml/hJ836k+xcd5Dd8CPvcGG
	R7MbvJVuKy2eIvCwdtDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV8nr-006KyC-B9; Tue, 28 Sep 2021 08:49:31 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV8nf-006Ktz-Qx
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 08:49:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id DD91540007;
 Tue, 28 Sep 2021 08:49:15 +0000 (UTC)
Date: Tue, 28 Sep 2021 10:49:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jan Hoffmann <jan@3e8.eu>
Cc: Daniel Kestrel <kestrelseventyfour@gmail.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: xway: No hardcoded ECC engine, use
 device tree setting
Message-ID: <20210928104914.44a90b63@xps13>
In-Reply-To: <f800c48f-8e4a-ecdc-3198-c52be0425823@3e8.eu>
References: <20210808072643.GA5084@ubuntu>
 <51f2ebf4-6df1-eba5-99f1-1ec88e475d20@3e8.eu>
 <20210917190154.76203a9a@xps13>
 <e9dd0653-139f-749b-c088-e756ee2d2132@3e8.eu>
 <20210917213246.319e60cb@xps13>
 <14eb0cb7-b0af-87bf-b9a5-3e35eeb43f54@3e8.eu>
 <20210927183150.4be87140@xps13>
 <f800c48f-8e4a-ecdc-3198-c52be0425823@3e8.eu>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_014920_040325_8CFCA90B 
X-CRM114-Status: GOOD (  15.58  )
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

SGkgSmFuLAoKamFuQDNlOC5ldSB3cm90ZSBvbiBNb24sIDI3IFNlcCAyMDIxIDIyOjMyOjEzICsw
MjAwOgoKPiBIaSBNaXF1w6hsLAo+IAo+ID4gU28gd2hhdCBJIHByb3Bvc2UgaXM6Cj4gPiAtIGlu
IHRoZSBkcml2ZXIgcHJvYmU6IHNldCB0aGUgZGVmYXVsdCB0byBzb2Z0d2FyZSBFQ0MKPiA+IC0g
aW4gdGhlIGF0dGFjaCgpIGhvb2s6IGRyb3AgdGhlIGxpbmUgc2V0dGluZyB0aGUgZW5naW5lX3R5
cGUgdG8gU09GVC4KPiA+IAo+ID4gUGxlYXNlIGNoZWNrIHRoZSBiZWxvdyBkaWZmIGFuZCB0ZWxs
IG1lIGlmIGl0IHdvcmtzIGZvciB5b3UuIEknbGwgdGhlbgo+ID4gcHJvcG9zZSBhIHdpZGVyIHNl
cmllcyBmaXhpbmcgdGhlIG90aGVyIGRyaXZlcnMgYXMgd2VsbC4gIAo+IAo+IEkgY2FuIGNvbmZp
cm0gdGhhdCB5b3VyIHBhdGNoIGZpeGVzIHRoZSBpc3N1ZS4KPiAKPiBJIHRlc3RlZCB1c2luZyBr
ZXJuZWwgNS4xMCBvbiBhIEZyaXR6Ym94IDczNjIgU0wgKHdpdGggb24tZGllIEVDQwo+IGNvbmZp
Z3VyZWQgdmlhIGRldmljZSB0cmVlIHdoaWNoIHdhcyBicm9rZW4gYmVmb3JlKS4gSSBhbHNvIGNo
ZWNrZWQgb24KPiBhIEZyaXR6Ym94IDc0MTIgKHRoaXMgZGV2aWNlIHVzZXMgc29mdHdhcmUgRUND
KS4gQm90aCBhcmUgd29ya2luZyB3aXRoCj4gdGhpcyBwYXRjaC4KCkdyZWF0LCB0aGFua3MgZm9y
IHRoZSBxdWljayBmZWVkYmFjay4KCkNoZWVycywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
