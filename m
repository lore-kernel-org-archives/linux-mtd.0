Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80BBC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 08:53:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AED8161073
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 08:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AED8161073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dlX8frUfVBvHppUCqzSS4aBGiN7qGXCGzN/MU4tQhe8=; b=Sh2Ofv5TVjiB7E
	jLxXcUQFz0WbKsjQA9ZYtOJsXRcwsYGri0rx7EqwLw6Qt65xlYwy8KUeQLj8iQQFlR9K/lnPp5XlP
	CZzwyCR9h+Y0KK8gkMzMJXnjVi1whUcsFmpcfljwqLxI74/FHu8bP81rKxWnLRm3EoU7Zi1HtF9vx
	VWYkInOjNDAbg6e3PJrzGz5/kTRR7UMlANbl3fXJmW7tPSG8LAkIJfCmstWLEIXzVuJctrP+yFuJj
	p/DTBlS0h35kjKrWaA87FvLxgjTcq91RKQj0ABNl8s00K4t6tsTpg0feqOQoqpsBRjtQFEKNsk03F
	Sm3raj2ygnNKPM/25QUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbIxU-0066R6-9K; Fri, 15 Oct 2021 08:52:56 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbIac-005zkc-PB
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 08:29:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id B9D6924000F;
 Fri, 15 Oct 2021 08:29:13 +0000 (UTC)
Date: Fri, 15 Oct 2021 10:29:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: jaimeliao@mxic.com.tw
Cc: "Boris Brezillon" <bbrezillon@kernel.org>, "Mark Brown"
 <broonie@kernel.org>, devicetree@vger.kernel.org, juliensu@mxic.com.tw,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, "Richard Weinberger" <richard@nod.at>, "Rob
 Herring"<robh+dt@kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Tudor Ambarus"
 <Tudor.Ambarus@microchip.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Xiangsheng Hou" <Xiangsheng.Hou@mediatek.com>
Subject: Re: =?UTF-8?B?5Zue5L+hOg==?= [RFC PATCH 09/10] spi: mxic: Add
 support for direct mapping
Message-ID: <20211015102911.25732215@xps13>
In-Reply-To: <OF032BE161.2014BA23-ON4825876C.0027CC4D-4825876C.0027D1E7@mxic.com.tw>
References: <20211008162228.1753083-1-miquel.raynal@bootlin.com>
 <20211008162228.1753083-10-miquel.raynal@bootlin.com>
 <OF032BE161.2014BA23-ON4825876C.0027CC4D-4825876C.0027D1E7@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_012918_994419_FC3E8F0D 
X-CRM114-Status: UNSURE (   7.39  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8gSmFpbWUsCgpqYWltZWxpYW9AbXhpYy5jb20udHcgd3JvdGUgb24gVHVlLCAxMiBPY3Qg
MjAyMSAxNToxNDo1NiArMDgwMDoKCj4gSGkgTWlxdWVsCj4gCj4gWmhlbmd4dW5MaSBoYXZlIHBh
dGNoIG5ldyBteGljIHNwaSBob3N0IGNvbnRyb2xsZXIgYmVmb3JlLgo+IFRoZSBwYXRjaCBuYW1l
IGFzIGJlbG93Cj4gc3BpOiBteGljOiBwYXRjaCBmb3Igb2N0YWwgRFRSIG1vZGUgc3VwcG9ydAo+
IFBsZWFzZSBwYXRjaCBteGljIEVDQyBlbmdpbmUgYmFzZSBvbiBsYXRlc3QgdmVyc2lvbi4KClll
cyB5b3UgYXJlIHJpZ2h0LiBJIGRpZG4ndCByZWJhc2UgbXkgc2VyaWVzIGJlZm9yZSBzZW5kaW5n
IGl0LCBhcwptZW50aW9uZWQgaW4gdGhlIGNvdmVyIGxldHRlciB0aGlzIHdhcyBqdXN0IGEgd2F5
IHRvIHByb3ZpZGUgdGhpcyBjb2RlCnB1YmxpY2x5IGFzIHNvbWVvbmUgZnJvbSBNZWRpYXRlayBu
ZWVkZWQgaXQgKGhlbmNlLCB0aGUgUkZDKS4gSSB3aWxsCnNvb24gc2VuZCBhIHJlYWwgdjEgd2l0
aCB0aGUgYmluZGluZ3MgZml4ZWQgYXMgd2VsbC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
