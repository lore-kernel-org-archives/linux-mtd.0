Return-Path: <SRS0=iCcf=U2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C067C48BD7
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 18:18:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47C1920B7C
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 18:18:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NoRTWtMZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47C1920B7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f868uXwcK4pJoyJqTf4t4HhPnM8XnQ/i/8bKojPqjVM=; b=NoRTWtMZ2RWkzO
	IKk8fKWzY1UsL4VIwbILwPqf/QdtWpQKH7rI0CSM8rT2TFqxMp+EgCJ4YBUoo7s45pdfZ8oygqDC5
	TWA3rS+RV1TD+1nVmjEiGAJ71Z2TecK4LD2KLdXnRfgHJMi8lJzw7/3O9ozgcvKyphhO6ybRzJreS
	nLRmgVzQdratJL9wVW5gntrWkjwPSHLvkQhMfqQP/uytuStoGZK7+j1ixNbpZ/J2JlUm5OAH7C8zw
	VCz8do1EHflZUHqM8NFxzv41uJuL9BZpvDawmS6vqtO8029aJZ6xfN9/ZfcRP7p2mMrK7WNDOn93p
	QPP0CycjLeS7sAbh6jYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgYyF-000476-5C; Thu, 27 Jun 2019 18:18:07 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgYyB-00046a-K0
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2019 18:18:05 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E710424000D;
 Thu, 27 Jun 2019 18:17:46 +0000 (UTC)
Date: Thu, 27 Jun 2019 20:17:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [RESEND PATCH v2] mtd: spinand: read return badly if the last
 page has bitflips
Message-ID: <20190627201742.34059cdf@xps13>
In-Reply-To: <20190627190644.25aaaf31@xps13>
References: <1561424549-784-1-git-send-email-liaoweixiong@allwinnertech.com>
 <20190625030807.GA11074@kroah.com>
 <97adf58f-4771-90f1-bdaf-5a9d00eef768@kontron.de>
 <20190627190644.25aaaf31@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_111803_816355_48860B3F 
X-CRM114-Status: GOOD (  19.26  )
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
 Boris Brezillon <bbrezillon@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 liaoweixiong <liaoweixiong@allwinnertech.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3Jv
dGUgb24gVGh1LCAyNyBKdW4gMjAxOQoxOTowNjo0NCArMDIwMDoKCj4gSGVsbG8sCj4gCj4gU2No
cmVtcGYgRnJpZWRlciA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPiB3cm90ZSBvbiBUdWUs
IDI1IEp1bgo+IDIwMTkgMDc6MDQ6MDYgKzAwMDA6Cj4gCj4gPiBIaSBsaWFvd2VpeGlvbmcsCj4g
PiAKPiA+IE9uIDI1LjA2LjE5IDA1OjA4LCBHcmVnIEtIIHdyb3RlOiAgCj4gPiA+IE9uIFR1ZSwg
SnVuIDI1LCAyMDE5IGF0IDA5OjAyOjI5QU0gKzA4MDAsIGxpYW93ZWl4aW9uZyB3cm90ZTogICAg
Cj4gPiA+PiBJbiBjYXNlIG9mIHRoZSBsYXN0IHBhZ2UgY29udGFpbmluZyBiaXRmbGlwcyAocmV0
ID4gMCksCj4gPiA+PiBzcGluYW5kX210ZF9yZWFkKCkgd2lsbCByZXR1cm4gdGhhdCBudW1iZXIg
b2YgYml0ZmxpcHMgZm9yIHRoZSBsYXN0Cj4gPiA+PiBwYWdlLiBCdXQgdG8gbWUgaXQgbG9va3Mg
bGlrZSBpdCBzaG91bGQgaW5zdGVhZCByZXR1cm4gbWF4X2JpdGZsaXBzIGxpa2UKPiA+ID4+IGl0
IGRvZXMgd2hlbiB0aGUgbGFzdCBwYWdlIHJlYWQgcmV0dXJucyB3aXRoIDAuCj4gPiA+Pgo+ID4g
Pj4gU2lnbmVkLW9mZi1ieTogbGlhb3dlaXhpb25nIDxsaWFvd2VpeGlvbmdAYWxsd2lubmVydGVj
aC5jb20+ICAKPiAKPiBQbGVhc2Ugd3JpdGUgeW91ciBlbnRpcmUgb2ZmaWNpYWwgZmlyc3QvbGFz
dCBuYW1lKHMpCj4gCj4gPiA+PiBSZXZpZXdlZC1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5i
cmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiA+ID4+IFJldmlld2VkLWJ5OiBGcmllZGVyIFNjaHJl
bXBmIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+ICAKPiAKPiBJIGFtIHdhaXRpbmcgeW91
ciBuZXh0IHZlcnNpb24gd2l0aCBBY2tlZC1ieSBpbnN0ZWFkIG9mIFJld2lldmVkLWJ5Cj4gdGFn
cyBhbmQgR3JlZydzIGNvbW1lbnQgYWRkcmVzc2VkLgoKU29ycnkgZm9yIHRoZSBtaXN0YWtlLCBS
LWIgdGFncyBhcmUgZmluZSBoZXJlLCBkb24ndCB0b3VjaCB0aGF0LgpUaGUgcmVzdCBuZWVkcyB0
byBiZSBmaXhlZCB0aG91Z2guCgo+ID4gPj4gRml4ZXM6IDc1MjlkZjQ2NTI0OCAoIm10ZDogbmFu
ZDogQWRkIGNvcmUgaW5mcmFzdHJ1Y3R1cmUgdG8gc3VwcG9ydCBTUEkgTkFORHMiKSAgCj4gCj4g
RmluYWxseSwgd2hlbiB3ZSBhc2sgeW91IHRvIHJlc2VuZCBhIHBhdGNoLCBpdCBtZWFucyBzZW5k
aW5nIGEgbmV3Cj4gdmVyc2lvbiBvZiB0aGUgcGF0Y2guIFNvIGluIHRoZSBzdWJqZWN0LCB5b3Ug
c2hvdWxkIG5vdCB1c2UgdGhlCj4gW1JFU0VORF0ga2V5d29yZCAod2hpY2ggbWVhbnMgeW91IGFy
ZSBzZW5kaW5nIHNvbWV0aGluZyBhZ2FpbiBleGFjdGx5Cj4gYXMgaXQgd2FzIGJlZm9yZSwgeW91
IGp1c3QgZ290IGlnbm9yZWQsIGZvciBleGFtcGxlKSBidXQgaW5zdGVhZCB5b3UKPiBzaG91bGQg
aW5jcmVtZW50IHRoZSB2ZXJzaW9uIG51bWJlciAodjMpIGFuZCBhbHNvIHdyaXRlIGEgbmljZQo+
IGNoYW5nZWxvZyBhZnRlciB0aGUgdGhyZWUgZGFzaGVzICctLS0nICh3aWxsIGJlIGlnbm9yZWQg
YnkgR2l0IHdoZW4KPiBhcHBseWluZykuCj4gCj4gSSB3b3VsZCBsaWtlIHRvIHF1ZXVlIHRoaXMg
Zm9yIHRoZSBuZXh0IHJlbGVhc2Ugc28gaWYgeW91IGNhbiBkbyBpdAo+IEFTQVAsIHRoYXQgd291
bGQgYmUgZ3JlYXQuCj4gCj4gVGhhbmsgeW91LAo+IE1pcXXDqGwKCgoKClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
