Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1D7C369A0
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Apr 2025 08:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PdkM1zZT9kUg0tWG91NtMHbCHpjZQFU9f3yW+QgJxds=; b=L7/U7TsMyMuNst
	4ncC5sr1la3bh2snAAHrn016ToJk1u8uEye7su9AY6TXDywfaEKiY3tQ9wxQ8o09Pw32ZjhU35hVq
	f/eN1y99osJ9qdvXzkWtlteGmNFXSZgO9mdkyhmdB9n7TvUwFAF8F8zd2//wXSnDdymb+HFv+RkgO
	lvHjsFdL5y89urF48oGjG1QJ80zYkqdiqJeHYBrsbOD7LJed4YCqhbnFdpoH7juEKEC8aLgv+ui/i
	LoTpwqhwkzqZ1uRA/E55VK9z8yalqdmjpODgPjTeGK//DLwLCQY+rbFuD6CzwTYZHIABKQTN+8WpN
	YgeGS8b4ZwFp0rgbQ2fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GKl-00000008JEm-2Xio;
	Thu, 03 Apr 2025 08:53:59 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GKi-00000008JE5-2K1W
	for linux-mtd@lists.infradead.org;
	Thu, 03 Apr 2025 08:53:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81DB44420D;
	Thu,  3 Apr 2025 08:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743670432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EA9RHBwK/f1GdxBdtnI2Cjac/r8+/qisQMVWLtHUsuk=;
	b=ABIvI39VyrC0zNsI+cRa2wsu8Koh5x0Xkuv6CzhDw+SV6N7Hs2YvvMa6EPtitlGXktl5PQ
	Q3Wn9Md5bf5AAVPbSng9wo8t8J6iy3xqn6DJFaPk4BFwZPW6rUrwmkow8YS55m/i+cSa82
	Ijat24UrwbZQzS5PmeneCTaYvygCzjrcpfuyeqlu3SGWHQ5ZY0cMnpV7g/HGtmk7ryh4X/
	PPOGoxHWTWkdOj/9qyK9yWzVV1AYyPp6Rsxb0W7Z2M07QU3ciYkoexuMW+0/tf60pkcYxO
	ipH+f4M7bvUeuyE0hAcs0hK5ypm+O3J/G44hgwTrU6iyoIF5q7Vz5XD2HrpvMw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Santhosh Kumar K <s-k6@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin <stlin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/21] mtd: spinand: winbond: Rename DTR variants
In-Reply-To: <5463acad-ee29-45de-9d22-16eb7947002c@linaro.org> (Tudor
	Ambarus's message of "Thu, 3 Apr 2025 07:19:15 +0100")
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
	<20250307-winbond-6-14-rc1-octal-v1-15-45c1e074ad74@bootlin.com>
	<3ebd53ef-c7fd-4c8c-96f3-32e97b355b6b@linaro.org>
	<871puaqz6m.fsf@bootlin.com>
	<5463acad-ee29-45de-9d22-16eb7947002c@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 03 Apr 2025 10:53:49 +0200
Message-ID: <87cydty6aq.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrdduuddtrdduleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrdduuddtrdduleelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepshdqkheisehtihdrtghomhdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtp
 dhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepshhtlhhinhdvseifihhnsghonhgurdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_015356_725446_14A0D5EB 
X-CRM114-Status: GOOD (  15.89  )
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

SGVsbG8gVHVkb3IsCgpPbiAwMy8wNC8yMDI1IGF0IDA3OjE5OjE1ICswMSwgVHVkb3IgQW1iYXJ1
cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90ZToKCj4gT24gNC8yLzI1IDU6NTcgUE0s
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IEhlbGxvIFR1ZG9yLAo+PiAKPj4gRmlyc3QsIHRoYW5r
cyBhIGxvdCBmb3IgdGhlIHRpbWUgc3BlbnQgcmV2aWV3aW5nLCBtdWNoIGFwcHJlY2lhdGVkLgo+
PiAKPj4gT24gMDIvMDQvMjAyNSBhdCAxNjoxOTowMCArMDEsIFR1ZG9yIEFtYmFydXMgPHR1ZG9y
LmFtYmFydXNAbGluYXJvLm9yZz4gd3JvdGU6Cj4+IAo+Pj4gSGksIE1pcXVlbCwKPj4+Cj4+PiBP
biAzLzcvMjUgMzowOCBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+PiAtc3RhdGljIFNQSU5B
TkRfT1BfVkFSSUFOVFMocmVhZF9jYWNoZV9kdHJfdmFyaWFudHMsCj4+Pj4gK3N0YXRpYyBTUElO
QU5EX09QX1ZBUklBTlRTKHJlYWRfY2FjaGVfZHVhbF9xdWFkX2R0cl92YXJpYW50cywKPj4+Cj4+
PiB3aHkgbm90IHJlYWRfY2FjaGVfc2luZ2xlX2R1YWxfcXVhZF9kdHJfdmFyaWFudHM/IEkgc2Vl
IHNpbmdsZSBkdHIgdG9vCj4+PiBpbiB0aGUgc3VwcG9ydGVkIG9wcy4KPj4gCj4+IFRoYXQncyB0
cnVlLCBidXQgc2luZ2xlIG1vZGVzIGFyZSBsaXRlcmFsbHkgYWx3YXlzIHN1cHBvcnRlZCwgc28g
aXQgaXMKPgo+IGxpdGVyYWxseSwgbWVhbmluZyBmcm9tIGV4cGVyaWVuY2UgSSBndWVzcywgb3Ig
aXMgaXQgbWFuZGF0b3J5IHRoYXQKPiBkdWFsLCBxdWFkIG9yIG9jdGFsIGR0ciB0byBpbXBseSBz
aW5nbGUgZHRyIGFzIHdlbGw/IFRoYXQncyBmaW5lIGVpdGhlcgo+IHdheSwganVzdCBjdXJpb3Vz
LgoKWWVzLCBJIGRvIG5vdCBrbm93IGFueSBjaGlwIG5vdCBzdXBwb3J0aW5nIHNpbmdsZSBTRFIg
bW9kZSwganVzdCBiZWNhdXNlCndlIG5lZWQgYSBjb21tb24gZ3JvdW5kIHRvIHBlcmZvcm0gdGhl
IGRpc2NvdmVyeT8gVGhlIGNvcmUgd291bGQgYW55d2F5Cm5vdCBiZSByZWFkeSBmb3Igc3VjaCBj
aGlwcyBpZiB0aGV5IHdlcmUgYWJvdXQgdG8gY29tZS4KCj4gRG9lcyBxdWFkIGR0ciBpbXBseSBk
dWFsIGR0cj8gQW5kIG9jdGFsIGR0ciBpbXBseSBxdWFkIGR0ciBhbmQgZHVhbCBkdHI/Cj4gSWYg
c28sIHRoZW4gbWF5YmUgbmFtZSBpdCBieSB0aGUgbWF4aW11bSBJTyBkdHIgc3VwcG9ydGVkLgoK
VW5mb3J0dW5hdGVseSBub3QuIENoaXBzIHN1cHBvcnRpbmcgcXVhZCBtYXkgYWxzbyBzdXBwb3J0
IGR1YWwsIGJ1dCBub3QKYWx3YXlzLiBUaGVzZSBjaGlwcyBmbGFnZ2VkICdkdWFsX3F1YWQnIGlu
ZGVlZCBzdXBwb3J0IGJvdGguIEhvd2V2ZXIgaW4KdGhpcyBwYXJ0aWN1bGFyIGNhc2UsIG9jdGFs
IGNoaXBzIGRvIG5vdCBzdXBwb3J0IGR1YWwgb3IgcXVhZApvcGNvZGVzLiBIZW5jZSBteSBpZGVh
IHRvIG5hbWUgdGhlIHZhcmlhbnRzIGFib3V0IHdoYXQgaXMgc3VwcG9ydGVkLApiZWhpbmQgMVMg
b3Bjb2Rlcy4KCj4gYnR3LCBub3Qgc3RyaWN0bHkgcmVsYXRlZCB0byB0aGlzIHBhdGNoLCBidXQg
Zm9yIHRoZSBvdmVyYWxsCj4gYXJjaGl0ZWN0dXJlIHBpY3R1cmUsIHdoeSBkbyB0aGUgU1BJIE5B
TkQgZmxhc2hlcyBuZWVkIHRvIGRlZmluZSB0aGVpcgo+IHN1cHBvcnRlZCBvcHM/IFNQSSBOT1Jz
IGZvciBleGFtcGxlIGFyZSBjYXBhYmxlIG9mIGRpc2NvdmVyaW5nIHRoZWlyCj4gc3VwcG9ydGVk
IG9wcyBieSBwYXJzaW5nIGF0IHJ1bnRpbWUgc29tZSBTRkRQIHRhYmxlcyB0aGF0IGRlc2NyaWJl
IG1vc3QKPiBvZiB0aGUgZmxhc2ggcGFyYW1ldGVycyBhbmQgc2V0dGluZy4gSSBzZWUgU0ZEUCBz
dGFuZGFyZCAoamVzZDIxNmcpCj4gbWVudGlvbnMgU1BJIE5BTkQgZGV2aWNlcyBhcyB3ZWxsLiBI
YXZlIHlvdSBvciBhbnlib2R5IGVsc2UgcGxheWVkIHdpdGgKPiBTUEkgTkFORHMgU0ZEUD8KCk5v
dCBhdCBhbGwhIFNQSSBOQU5EcyBjb21tb25seSBhZHZlcnRpc2UgYSBwYXJhbWV0ZXIgcGFnZSB3
aGljaCBpcyB3YXkKbW9yZSBzdWNjaW5jdCwgYnV0IG5vIFNGRFAgdGFibGUuCgo+PiBub3QgdmVy
eSBkaXNjcmltaW5hbnQsIGFuZCBoZXJlIG15IGdvYWwgaXMgdG8gZGlmZmVyZW50aWF0ZSB0aGUg
dmFyaWFudHMKPj4gc3VwcG9ydGVkIGJ5IHRoZSBkdWFsL3F1YWQgY2hpcHMgdnMuIHRoZSB2YXJp
YW50cyBzdXBwb3J0ZWQgYnkgdGhlIG9jdGFsCj4+IGNoaXBzICh3aGljaCBhcmUgbm90IGNhcGFi
bGUgb2YgZHVhbC9xdWFkIHRyYW5zZmVycykuIFdoYXQgZG8geW91IHRoaW5rPwo+Cj4gSSBmaW5k
IGl0IGZpbmUgdG8gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIHRoZSB2YXJpYW50cy4KCk9rLCB0aGFu
a3MuCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
