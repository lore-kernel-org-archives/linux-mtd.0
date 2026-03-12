Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D8AFED2FE
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2026 10:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpJNpnoN+tIRbOjhLuwBn4ldKwiQzjWBVCf1KHt3P8Y=; b=GywwhBFYR5cFKd
	C4ZZz/mkdvOjTfUrmcZOeEvBRyW28w87M8ldExK8h6vA3b6uT34OflbXwSEN4DBCm9DhF9IG/oojh
	vNxmEZM83n0UGsJ9fUVFuXCeYhXya3BFkYeSQ20whX+HhbvVNwCGeoL+NW4ej3Fz9xnUjYT/orel2
	s2Bq5U5yo+1R5i0/8wONiYCs71l+XzvnKZHvekiryDI/PWpKVEXkyWrFtJvFJ30N7LumBQGboXhPh
	Zm/3NiP4q3O8v4j32XGP/CzEotC5E/GpMHVul9GAOU9RLjDRbzo3jiLtrTJPQ3GteHcL3fZfvtmey
	O4d/bC82mQtd2gGFkzYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dST-0000000DsjN-0wqi;
	Thu, 12 Mar 2026 10:40:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dSQ-0000000DsjB-0o6k
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Mar 2026 10:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ZLlL868sX2T7LiELOAOF8/VB5w2gI8YwwhfKb0vI5/E=; b=FhGhvJMNkJjJX1Pc0xFwmYgi2W
	HmwjMl9ZfM4+NMzUK8nmPLJJknUAiKcMb4vnSRAN7tyamxskwBRU9/82tdO60Dd0Hqu8KBaINy927
	bXYRny/BHJwEU/DTEwXWlRhtF5leXcc3j7McL/86CXvBW9thFpL3/UhLqsVXQFohoNn0JPxjfiQum
	BGgwIt2PPwhvX+dxS1SIuagU1+dzGShfwi+zBAgQ49S4CKicgHgFnrolCNvmA/uZAhL1U3dEeW0si
	IsTx8fZ7k/mOe3S8Vm9FaLJcSnDsFlhpjsv2PGvY2vRYJK/PNRX972wmZ7kcR7eZI92kSX2wqKOfo
	+8jO2TCQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0dSN-0000000BC1m-14C3
	for linux-mtd@lists.infradead.org;
	Thu, 12 Mar 2026 10:39:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ACDC61A2DF3;
	Thu, 12 Mar 2026 10:39:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 808525FDEB;
	Thu, 12 Mar 2026 10:39:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A0ED10369D8A;
	Thu, 12 Mar 2026 11:39:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773311987; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ZLlL868sX2T7LiELOAOF8/VB5w2gI8YwwhfKb0vI5/E=;
	b=UbtyNxEbiaH7gAFdQXLW+F+ORZ/7MJw1ZZXiNNyVGDange3pY2lfAPxgn1XkQqem2J2+9t
	SvU6ZNDWjNxHCywkmfqe3BaugenAcWZzijr7sfDIUBHiZ3WY0zAxw1WjGDkYk4EpO+2YXH
	rzuvCz1opCTPfoq4OYJAlCAzjJnSbz9oK4iXUo7K6Q151y5f6qKGjmbjLnB1rKUaE5Ccyr
	Tci5Iiefaqvvn3cMgN9xyuiZAvLyX80Ykr3y1NfvntXQTHzGXyWJaRcWvud1kRpFRen5OE
	mz180vFyYRUfhop2pYi7leqwbb0JF+6OcnlCuXYXSjn0kOfJKNbKI+zDiJzRLQ==
Message-ID: <21e24f72-aa91-463d-a7a4-d4c2f877e527@bootlin.com>
Date: Thu, 12 Mar 2026 11:39:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] mtd: rawnand: sunxi: do not count BBM bytes twice
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Wentao Liang <vulab@iscas.ac.cn>,
 Maxime Ripard <mripard@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260305100137.2558423-1-richard.genoud@bootlin.com>
 <20260305100137.2558423-4-richard.genoud@bootlin.com>
 <87a4whnhu9.fsf@bootlin.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <87a4whnhu9.fsf@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_103955_455449_119A2ACA 
X-CRM114-Status: UNSURE (   9.92  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TGUgMDkvMDMvMjAyNiDDoCAxNjoyNywgTWlxdWVsIFJheW5hbCBhIMOpY3JpdMKgOgo+IEhlbGxv
IFJpY2hhcmQsCj4gCj4gT24gMDUvMDMvMjAyNiBhdCAxMTowMTozNCArMDEsIFJpY2hhcmQgR2Vu
b3VkIDxyaWNoYXJkLmdlbm91ZEBib290bGluLmNvbT4gd3JvdGU6Cj4gCj4+IEJCTSBpcyBwYXJ0
IG9mIFVTRVJfREFUQSBzZWN0aW9uLCBzbyB3ZSBzaG91bGQgcmVtb3ZlIGl0IHR3aWNlCj4gCj4g
TWF5YmUgeW91IG1lYW4gImlzIGFscmVhZHkgcGFydCIgYW5kIGFzIHN1Y2ggdGhlIGVuZCBvZiB0
aGUgc2VudGVuY2UKPiBzaG91bGQgYmUgdGhhdCAid2Ugc2hvdWxkICpub3QqIHJlbW92ZSBpdCB0
d2ljZSI/CnllcyBpbmRlZWQuCgpUaGFua3MgIQoKPiAKPj4gVGhpcyB3YXMgd29ya2luZyBvayBi
ZWNhdXNlIHdlIGFyZSBvbiB0aGUgc2FmZSBzaXplLCBhZHZlcnRpc2luZyB0aGF0Cj4+IHRoZXJl
IHdhcyAyIGJ5dGVzIGxlc3MgYXZhaWxhYmxlIHRoYW4gaW4gcmVhbGl0eS4KPj4KPj4gQnV0IHdl
IGNhbid0IGNoYW5nZSBvbGQgcGxhdGZvcm1zLCBzaW5jZSBpdCBtYXkgbGVhZCB0byBhIGRpZmZl
cmVudCBFQ0MKPj4gc3RyZW5ndGgsIHNvLCBpbnRyb2R1Y2UgYSBsZWdhY3kgZmxhZyBmb3Igb2xk
IHBsYXRmb3JtcywgYW5kIHN3aXRjaCB0aGUKPj4gbmV3IHBsYXRmb3JtcyB0byB0aGUgY29ycmVj
dCBjb3VudC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBHZW5vdWQgPHJpY2hhcmQuZ2Vu
b3VkQGJvb3RsaW4uY29tPgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
