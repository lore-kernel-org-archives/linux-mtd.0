Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2BACCF9F8
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Nov 2025 09:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/iN1JBMbGU6a0D0RXVTmmVwq4KB4dIOMq6GZnNe4Oc=; b=HJ8JqdpnPEmIoE
	9xPInjriWckbJtoiwDi10py1zwfUvsnLaCOWuOtLo3wVcaYz7A0YSvKdmnZCzDltG6KcTQgDSN5ho
	5E2DnnKmN0dpKQLE7XIM9Ks7EmDItgaXalDnGrUJZ5pofDvayVrshPEyyfwXtmdb5Qddut7emC5mz
	RNpKGBgDKT9+IIavLQ900Q5eyj4oTJOCxwfG5PFQ0qNYCq3/Xi9PSWlbXmnT4lQy+H4ZvF2VSaq6m
	tPcnL5sYmdmQ2HLv305cwG/zIqHe69I478o/rRqi6t+xCsCgFJFazIB1hQRf1q4lBpzxjR/6Ftttj
	ESIPn5en3HE3c9lG2Lyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7EP-00000008TJo-0rlo;
	Wed, 12 Nov 2025 09:33:37 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7EL-00000008TJ5-3il0
	for linux-mtd@lists.infradead.org;
	Wed, 12 Nov 2025 09:33:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 143674E41660;
	Wed, 12 Nov 2025 09:33:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D86756070B;
	Wed, 12 Nov 2025 09:33:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E0121037191E;
	Wed, 12 Nov 2025 10:33:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762940008; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V7VJas4OcRnxXubUexQa+LfGKvk8QPDPWv3vK3C+96g=;
	b=A78suv9J6JZ2r7gjwmylN4gjA0BmFOfU+51v5jfOn3/pHKb6bGvgozBKvXYxJwyBMvhesw
	iqqUSC0xYLcaSeq8QmCG9u7wSdEPPU35SsjWFABMa8oNC6XAoqv243/UfHySk4B5jMQY0g
	RlIQd77VF4riaFsjY3a25QOJnReog+RJLqwJQcKJqRkN31IJOqWDswDcbgaPfPn54M3KpA
	8skPYy+FU1FWRbUGM9gHY7uaiUWqQPBVpvszzEvSOk2FUKfSy2yJh6hELtksRRbNzIWAva
	97HqEj3bJhuo74Iq7KSUhEQo6T8KD8Jy49+ehUARosCu7N+cAfeW9xRNhHXq4w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: mtdpart: ignore error -ENOENT from parsers on
 subpartitions
In-Reply-To: <20251109115247.15448-1-ansuelsmth@gmail.com> (Christian
	Marangi's message of "Sun, 9 Nov 2025 12:52:44 +0100")
References: <20251109115247.15448-1-ansuelsmth@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 12 Nov 2025 10:33:25 +0100
Message-ID: <87y0ob7fyy.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_013334_054823_BF61D593 
X-CRM114-Status: GOOD (  12.33  )
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

SGkgQ2hyaXN0aWFuLAoKT24gMDkvMTEvMjAyNSBhdCAxMjo1Mjo0NCArMDEsIENocmlzdGlhbiBN
YXJhbmdpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IENvbW1pdCA1YzJmNzcyN2Q0
MzcgKCJtdGQ6IG10ZHBhcnQ6IGNoZWNrIGZvciBzdWJwYXJ0aXRpb25zIHBhcnNpbmcKPiByZXN1
bHQiKSBpbnRyb2R1Y2VkIHNvbWUga2luZCBvZiByZWdyZXNzaW9uIHdpdGggcGFyc2VyIG9uIHN1
YnBhcnRpdGlvbnMKPiB3aGVyZSBpZiBhIHBhcnNlciBlbWl0cyBhbiBlcnJvciB0aGVuIHRoZSBl
bnRpcmUgcGFyc2luZyBwcm9jZXNzIGZyb20gdGhlCj4gdXBwZXIgcGFyc2VyIGZhaWxzIGFuZCBw
YXJ0aXRpb25zIGFyZSBkZWxldGVkLgo+Cj4gTm90IGNoZWNraW5nIGZvciBlcnJvciBpbiBzdWJw
YXJ0aXRpb25zIHdhcyBvcmlnaW5hbGx5IGludGVuZGVkIGFzCj4gc3BlY2lhbCBwYXJzZXIgY2Fu
IGVtaXQgZXJyb3IgYWxzbyBpbiB0aGUgY2FzZSBvZiB0aGUgcGFydGl0aW9uIG5vdAo+IGNvcnJl
Y3RseSBpbml0IChmb3IgZXhhbXBsZSBhIHdpcGVkIHBhcnRpdGlvbikgb3Igc3BlY2lhbCBjYXNl
IHdoZXJlIHRoZQo+IHBhcnRpdGlvbiBzaG91bGQgYmUgc2tpcHBlZCBkdWUgdG8gc29tZSBFTlYg
dmFyaWFibGVzIGV4dGVybmFsbHkKPiBwcm92aWRlZCAoZnJvbSBib290bG9hZGVyIGZvciBleGFt
cGxlKQo+Cj4gT25lIGV4YW1wbGUgY2FzZSBpcyB0aGUgVFJYIHBhcnRpdGlvbiB3aGVyZSwgaW4g
dGhlIGNvbnRleHQgb2YgYSB3aXBlZAo+IHBhcnRpdGlvbiwgcmV0dXJucyBhIC1FTk9FTlQgYXMg
dGhlIHRyeF9tYWdpYyBpcyBub3QgZm91bmQgaW4gdGhlCj4gZXhwZWN0ZWQgVFJYIGhlYWRlciAo
YXMgdGhlIHBhcnRpdGlvbiBpcyB3aXBlZCkKCkkgZGlkbid0IGhhZCBpbiBtaW5kIHRoaXMgd2Fz
IGEgdmFsaWQgY2FzZS4gSSBhbSBhIGJpdCBwdXp6bGVkIGJlY2F1c2UKaXQgb3BlbnMgdGhlIGJy
ZWFjaCB0byBvdGhlciBzcGVjaWFsIGNhc2VzLCBidXQgYXQgdGhlIHNhbWUgdGltZSBJIGhhdmUK
bm8gc3Ryb25nIGFyZ3VtZW50cyB0byByZWZ1c2UgdGhpcyBzaXR1YXRpb24gc28gbGV0J3MgZ28g
Zm9yIGl0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
