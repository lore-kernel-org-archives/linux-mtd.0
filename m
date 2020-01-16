Return-Path: <SRS0=QXPY=3F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3A2C33CB1
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 09:00:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2679D207E0
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 09:00:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="arcafION"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2679D207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uMhYQ3FDmRTwVWGGMIVR6J2Pw026wM7SOqxP7iH6Qvs=; b=arcafIONRYsXvp
	fmSaLRmzjcDToKznOiBdZHPPXcyP3DYH+zBsY0YnPI4U/7wPk24w5wclas8ecKr/cKChkFNFRj6bL
	udP6Elil1R5pGvF3XY6hJeX2Bp0DhRtYJvKyu0Du7UBTmjGhSgoJpFGtPaNHCMeGWP2lHaONDYyA8
	CskdZ353Mcn0e7mYR58kGUBYyPIlWd2CJKtAZUFBAL6ulc+qGredMWTYyz917IDCI+4c5BXfHG4Cz
	WwPfYSETl1eog7JD2ZOWlELZBStvMkrEB7b1o4wLYX/K3yMIAG2xF//mkI3kVGdjbTt5oULX0LL9E
	PKrQObOE68xwod6uDC2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is10l-0003kz-Rv; Thu, 16 Jan 2020 09:00:19 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is10Y-0002oj-JZ; Thu, 16 Jan 2020 09:00:11 +0000
X-Originating-IP: 90.76.211.102
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 5F9551BF20C;
 Thu, 16 Jan 2020 08:59:54 +0000 (UTC)
Date: Thu, 16 Jan 2020 09:59:53 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 13/40] mtd: nand: Add more parameters to the
 nand_ecc_props structure
Message-ID: <20200116095953.07377543@xps13>
In-Reply-To: <20191012113745.19b85fd6@dhcp-172-31-174-146.wireless.concordia.ca>
References: <20190919193141.7865-1-miquel.raynal@bootlin.com>
 <20190919193141.7865-14-miquel.raynal@bootlin.com>
 <20191012113745.19b85fd6@dhcp-172-31-174-146.wireless.concordia.ca>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_010006_785272_CCAF6B86 
X-CRM114-Status: GOOD (  15.62  )
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
Cc: Mason Yang <masonccyang@mxic.com.tw>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBTYXQsIDEyIE9jdAoyMDE5IDExOjM3OjQ1ICswMjAwOgoKPiBPbiBUaHUsIDE5
IFNlcCAyMDE5IDIxOjMxOjEzICswMjAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiBQcmVwYXJlIHRoZSBtaWdyYXRpb24gdG8gdGhlIGdl
bmVyaWMgRUNDIGZyYW1ld29yayBieSBhZGRpbmcgbW9yZQo+ID4gZmllbGRzIHRvIHRoZSBuYW5k
X2VjY19wcm9wcyBzdHJ1Y3R1cmUgd2hpY2ggd2lsbCBiZSB1c2VkIHdpZGVseSB0bwo+ID4gZGVz
Y3JpYmUgZGlmZmVyZW50IGtpbmQgb2YgRUNDIHByb3BlcnRpZXMuCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiAtLS0K
PiA+ICBpbmNsdWRlL2xpbnV4L210ZC9uYW5kLmggfCA4ICsrKysrKysrCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9tdGQvbmFuZC5oIGIvaW5jbHVkZS9saW51eC9tdGQvbmFuZC5oCj4gPiBpbmRleCA3MDcyZjE0
MjM5ZTUuLjExY2Q3Y2M4MWE3YSAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvbXRkL25h
bmQuaAo+ID4gKysrIGIvaW5jbHVkZS9saW51eC9tdGQvbmFuZC5oCj4gPiBAQCAtMTI5LDEyICsx
MjksMjAgQEAgc3RydWN0IG5hbmRfcGFnZV9pb19yZXEgewo+ID4gIAo+ID4gIC8qKgo+ID4gICAq
IHN0cnVjdCBuYW5kX2VjY19wcm9wcyAtIE5BTkQgRUNDIHByb3BlcnRpZXMKPiA+ICsgKiBAcHJv
dmlkZXI6IEVDQyBlbmdpbmUgcHJvdmlkZXIgdHlwZQo+ID4gKyAqIEBwbGFjZW1lbnQ6IE9PQiBw
bGFjZW1lbnQgKGlmIHJlbGV2YW50KQo+ID4gKyAqIEBhbGdvOiBFQ0MgYWxnb3JpdGhtIChpZiBy
ZWxldmFudCkKPiA+ICAgKiBAc3RyZW5ndGg6IEVDQyBzdHJlbmd0aAo+ID4gICAqIEBzdGVwX3Np
emU6IE51bWJlciBvZiBieXRlcyBwZXIgc3RlcAo+ID4gKyAqIEBmbGFnczogTWlzYyBwcm9wZXJ0
aWVzCj4gPiAgICovCj4gPiAgc3RydWN0IG5hbmRfZWNjX3Byb3BzIHsKPiA+ICsJdW5zaWduZWQg
aW50IHByb3ZpZGVyOwo+ID4gKwl1bnNpZ25lZCBpbnQgcGxhY2VtZW50Owo+ID4gKwl1bnNpZ25l
ZCBpbnQgYWxnbzsgIAo+IAo+IEhtLCB3ZSBzaG91bGQgaGF2ZSBlbnVtcyBoZXJlLCBhbmQgaXQn
cyBiZXR0ZXIgdG8gaW50cm9kdWNlIHRoZQo+IHByb3ZpZGVyL3BsYWNlbWVudC9hbGdvIGRlZmlu
aXRpb25zIGFsb25nIHdpdGggdGhlIGZpZWxkcy4KCkFic29sdXRlbHkhIEdvb2QgY2F0Y2gsIHRo
aXMgaXMgZml4ZWQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
