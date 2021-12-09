Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA2BC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Dec 2021 14:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ozE62aQOOx7RUvQLExCIpWn1vseVc9sdnKUWoc502k=; b=OlMW+GcVQIYeSe
	7xg8ciSyQIxNWsoN5HR+rSi7QUOZUqXyTC8yA0xefRAQqdUquGpH+RfMmInL6q+XzXPX/oOE8fHSk
	SrhSo5zEXtzbhrUNK3lqfIZCeDI4M497Ntq7DqDcX+usYegw0I+3qK34J6EbFw0Bi3qMeijbiuIkD
	OagWrOwN82kfJn1tS5esUeqcmqF8fGlrxUNd+UWkCH2S39U+QoSp/KGwAPUpsvhnXXOCdldWtodZT
	FRfBtRspHE0YyoWQaWhv2yFL/+TL+3kQKIzknF7L9fH5G8cqUW4symEIUXaYu95NJOiZnBldvrLmV
	X2tvLZQb11a6tBcy5o7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvKPF-00GJuG-IV; Thu, 09 Dec 2021 14:28:21 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvKPB-00GJqu-Go
 for linux-mtd@lists.infradead.org; Thu, 09 Dec 2021 14:28:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 73DEDE0015;
 Thu,  9 Dec 2021 14:28:13 +0000 (UTC)
Date: Thu, 9 Dec 2021 15:28:11 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v5 3/4] mtd: core: protect access to MTD devices while
 in suspend
Message-ID: <20211209152811.318bdf17@xps13>
In-Reply-To: <20211209140721.6ki7gznvxwyn3cze@skn-laptop.hinnerup>
References: <20211123125012.ibzqu44ixmykbhkt@skn-laptop>
 <20211123140715.280b2f70@collabora.com>
 <20211129101908.6f1aa715@xps13>
 <20211129094129.xn364czofrgtvfb4@skn-laptop>
 <63be9121-18c3-1ef2-c448-f99fb861490f@samsung.com>
 <20211130124131.6pgu7enjgk6y536m@skn-laptop>
 <20211130141551.400331c8@collabora.com>
 <20211130132912.v6v45boce2zbnoy3@skn-laptop>
 <20211130143705.5d0404aa@collabora.com>
 <20211203143958.40645506@xps13>
 <20211209140721.6ki7gznvxwyn3cze@skn-laptop.hinnerup>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_062817_741655_4B5479DA 
X-CRM114-Status: UNSURE (   9.66  )
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

SGkgU2VhbiwKCnNlYW5AZ2Vhbml4LmNvbSB3cm90ZSBvbiBUaHUsIDkgRGVjIDIwMjEgMTU6MDc6
MjEgKzAxMDA6Cgo+IE9uIEZyaSwgRGVjIDAzLCAyMDIxIGF0IDAyOjM5OjU4UE0gKzAxMDAsIE1p
cXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIZWxsbywKPiA+ICAgCj4gPiA+ID4gRmluZSBieSBtZSwg
bGV0cyBkcm9wIHRoaXMgc2VyaWVzLiAgCj4gPiAKPiA+IEZZSSBJJ3ZlIGRyb3BwZWQgdGhlIGVu
dGlyZSBzZXJpZXMgZnJvbSBtdGQvbmV4dC4gSSdtIHdhaXRpbmcgZm9yIHRoZQo+ID4gZml4IGRp
c2N1c3NlZCBiZWxvdyAod2l0aG91dCBhYnVzaW5nIHRoZSBjaGlwIG11dGV4IDstKSApLiAgCj4g
Cj4gQ29vbCwgbG9va2luZyBmb3J3YXJkIHRvIHRlc3QgYSBwYXRjaCBzZXJpZXMgOikKClRlc3Q/
IFlvdSBtZWFuICJ3cml0ZSI/IDopCgpDaGVlcnMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
