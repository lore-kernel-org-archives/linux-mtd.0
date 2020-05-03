Return-Path: <SRS0=EGP2=6R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6C3C28CBC
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 17:02:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D608B206B9
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 17:02:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MOt3gSRI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D608B206B9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixPaYyRWVdmIo7m1cTFZYefxe/yin3ZzdFxdJ8z+fKs=; b=MOt3gSRIDHrysY
	lAsBqdtCO81+QFNFx8dYhbzoVtEsNm0oWFZuGbKKHnvOuNWtJkP2oR9UnZqG+5NVAq8EcR6lY3DaG
	pKVNMnbUDkQoesdia7I8XuV2pdw8zZmgAE7uxJvzswl16cx3kEOP+Nf/6RGD5WfZHW7vQyH368CUF
	+q9OaYuoAERiowSxAVP9+HqqNTgN4QAM5EWSn3ph8ZfD7Etxw6CbhgkMndPRREsySLGg+yRA3XAjM
	IBBsgKHU3GOGiF6tAKoW91oymyhMZsfm9MhHMgGWTeYZwk0L03FZLCUVTGRQLLdFFNt3GDPMyq/i1
	0kNHGfg+Z/EwKS63ynvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVI0u-0008MX-5o; Sun, 03 May 2020 17:02:48 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVI0r-0008L3-4t
 for linux-mtd@lists.infradead.org; Sun, 03 May 2020 17:02:46 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D426D200002;
 Sun,  3 May 2020 17:02:36 +0000 (UTC)
Date: Sun, 3 May 2020 19:02:34 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 2/3] mtd: rawnand: Add the nand_chip->write_oob hook
Message-ID: <20200503190234.21f7f0a8@xps13>
In-Reply-To: <20200503170924.52f9d9d6@collabora.com>
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
 <20200503114029.30257-3-miquel.raynal@bootlin.com>
 <20200503170924.52f9d9d6@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200503_100245_325125_D32A306C 
X-CRM114-Status: GOOD (  12.98  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Zoltan Szubbocsev <zszubbocsev@micron.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, tglx@linutronix.de,
 Piotr Wojtaszczyk <WojtaszczykP@cumminsallison.com>,
 Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgo+ID4gIC8qIFNhbml0aXplIE9ORkkgc3RyaW5ncyBzbyB3ZSBjYW4gc2FmZWx5
IHByaW50IHRoZW0gKi8KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L210ZC9yYXduYW5k
LmggYi9pbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmgKPiA+IGluZGV4IDUwNWMxM2Y3YTJiYS4u
N2ZiYmQ1ZDcwODhmIDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5o
Cj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L210ZC9yYXduYW5kLmgKPiA+IEBAIC0xMDIxLDYgKzEw
MjEsNyBAQCBzdHJ1Y3QgbmFuZF9sZWdhY3kgewo+ID4gICAqIEBzZXR1cF9yZWFkX3JldHJ5Oglb
RkxBU0hTUEVDSUZJQ10gZmxhc2ggKHZlbmRvcikgc3BlY2lmaWMgZnVuY3Rpb24gZm9yCj4gPiAg
ICoJCQlzZXR0aW5nIHRoZSByZWFkLXJldHJ5IG1vZGUuIE1vc3RseSBuZWVkZWQgZm9yIE1MQyBO
QU5ELgo+ID4gICAqIEBlcmFzZToJCVJhdyBOQU5EIGVyYXNlIG9wZXJhdGlvbi4KPiA+ICsgKiBA
d3JpdGVfb29iOgkJUmF3IE5BTkQgd3JpdGUgb3BlcmF0aW9uLgo+ID4gICAqIEBlY2M6CQlbQk9B
UkRTUEVDSUZJQ10gRUNDIGNvbnRyb2wgc3RydWN0dXJlCj4gPiAgICogQGJ1Zl9hbGlnbjoJCW1p
bmltdW0gYnVmZmVyIGFsaWdubWVudCByZXF1aXJlZCBieSBhIHBsYXRmb3JtCj4gPiAgICogQG9v
Yl9wb2k6CQkicG9pc29uIHZhbHVlIGJ1ZmZlciwiIHVzZWQgZm9yIGxheWluZyBvdXQgT09CIGRh
dGEKPiA+IEBAIC0xMDkyLDYgKzEwOTMsOCBAQCBzdHJ1Y3QgbmFuZF9jaGlwIHsKPiA+ICAJaW50
ICgqc2V0dXBfcmVhZF9yZXRyeSkoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgaW50IHJldHJ5X21v
ZGUpOwo+ID4gIAlpbnQgKCplcmFzZSkoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgc3RydWN0IGVy
YXNlX2luZm8gKmluc3RyLAo+ID4gIAkJICAgICBpbnQgYWxsb3diYnQpOwo+ID4gKwlpbnQgKCp3
cml0ZV9vb2IpKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGxvZmZfdCB0bywKPiA+ICsJCQkgc3Ry
dWN0IG10ZF9vb2Jfb3BzICpvcHMpOwo+ID4gICAgCj4gCj4gT2theSwgc28gSSdtIG5vdCBzdXJl
IGR1cGxpY2F0aW5nIHRoZSBuYW5kX3dyaXRlX29vYigpIGxvZ2ljIGlzIHRoZQo+IGJlc3Qgb3B0
aW9uIGhlcmUuIEknZCByYXRoZXIgZ28gZm9yIGEgcG9zdCB3cml0ZV9wYWdlKCkgaG9vay4KPiAK
PiBOb3RlIHRoYXQgd2UgcHJvYmFibHkgd2FudCBhIHBvc3QgcmVhZF9wYWdlKCkgaG9vayBzbyB3
ZSBjYW4gZmxhZwo+IHBhZ2VzIGFzIHdyaXR0ZW4gYnkgYW5hbHl6aW5nIHdoYXQncyByZXR1cm5l
ZCB0byB0aGUgY2FsbGVyLiBUaGF0IHdvdWxkCj4gc2F2ZXMgdXMgdW5uZWVkZWQgd3JpdGVzIHdo
ZW4gdGhlIHBhZ2UgaGFzIGJlZW4gcmVhZC4KCk9rLCB0aGlzIGlzIGRvbmUgdGhlIHdheSB5b3Ug
cHJvcG9zZS4KCkkgd2lsbCB3YWl0IG1vcmUgZmVlZGJhY2sgYmVmb3JlIHJlc2VuZGluZyB0aGlz
IHNlcmllcy4gRXNwZWNpYWxseSBvbgp0aGUgbGFzdCBwYXRjaCB3aGljaCBpcyBjcnVjaWFsLgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
