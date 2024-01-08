Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997D0C3DA6E
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jan 2024 13:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kZ+fR1NT59IG9muaDufX1HUQ8VpyaKBehYLa8DcVyX0=; b=VzJ34wWoqNhtlJ
	/2q0nE2MU7RQ2Of+YSD3BMoCrs+7YUHihNckopxio4l5xnA++kMr5Wco/g4yf5jy+zwAyhFvXtlRi
	GgtahWxMF03rU0ITLrOFgzWCkY8i/PAE703q/GQhQK3lb1sW2NEF69uS6MlAOWxM+c1n7F6dpPbjM
	WlqfT+N0zwWMewl8Od/qnFJptNtDCSNP/nXtLd9eOSln94OS9GcULRIhR1xURR1T/TSEg5+o4Wpdi
	HiljUlQWrxUzTUmWIym+r2mUl7veLenSCIFD7B2GlzrnDu73rePk1/pJXmCTL0NII4qt6CHLMEjdZ
	NVFWDMapMfQDU0wpnWyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMpyU-005Fc4-1H;
	Mon, 08 Jan 2024 13:47:30 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMpyR-005FbB-1x
	for linux-mtd@lists.infradead.org;
	Mon, 08 Jan 2024 13:47:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 768D4FF816;
	Mon,  8 Jan 2024 13:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704721643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KK74zJV3+vbSkhhTpnLL3WdmgDIKgCnjWr7zHHHvD9w=;
	b=iduO7rOr1wQU/+MBZiodDtX3EVSTYpDNW23qQCJ1evAB2cH9lBfdFi7E//nRjpBJQo62XF
	JF5Xgq5MvL6cGQU7cOmneTSQbhs6WSyflavIpKBBPLQwzxWJFoJTZBBWXuskiH2wh7pkkX
	5DLhoTWqwtn4zSXjJbY0ismIWpWmHfPPgvCB5EI6ev6Dbjv7OJeHBJRDBsH6XK8Y/umDj9
	QKcB7ontXY91lP2uTPRv1V8iE0Pp0y4PaOGwEDQT4+MO0M2aBLO8wJfhYhrYz/VjY0WYN3
	rfXw4gA04QXiFPvYnQtdx5b1YZdwFRQlRoXwvBVXgW19MpAfnmQ6EL6FX/Tn+A==
Date: Mon, 8 Jan 2024 14:47:19 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mohamed Sardi <moh.sardi@skyhighmemory.com>
Cc: "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "p.yadav@ti.com" <p.yadav@ti.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "richard@nod.at" <richard@nod.at>,
 "Kyeongrho.Kim" <kr.kim@skyhighmemory.com>, Mohammad Nada
 <Mohammad.nada@skyhighmemory.com>, "Changsub.Shim"
 <changsub.shim@skyhighmemory.com>
Subject: Re: [SkyHigh Memory SPI NAND Driver]
Message-ID: <20240108144719.3198373e@xps-13>
In-Reply-To: <7C13C29F-DBE0-494F-8BA6-99BB68FD08AF@skyhighmemory.com>
References: <7C13C29F-DBE0-494F-8BA6-99BB68FD08AF@skyhighmemory.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_054727_787782_8CB5B825 
X-CRM114-Status: GOOD (  14.11  )
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

SGkgTW9oYW1lZCwKCm1vaC5zYXJkaUBza3loaWdobWVtb3J5LmNvbSB3cm90ZSBvbiBUaHUsIDQg
SmFuIDIwMjQgMTg6MjE6NTIgKzAwMDA6Cgo+IEhlbGxvIFNQSSBOT1IgLyBOQU5EIEZsYXNoIFN1
YnN5dGVtIHRlYW0sCj4gCj4gUGxlYXNlIGZpbmQgYXR0YWNoZWQgdGhlIGRyaXZlciBkZXZlbG9w
ZWQgb24gTGludXggNS40IGFuZCB0ZXN0ZWQuLiBmb3Igb3VyIDFHYi8yR2IvNEdiIFNQSSBOQU5E
4oCmCj4gCj4gV2Ugd291bGQgbGlrZSB0byBrbm93Cj4gCj4gCj4gICAxLiAgV2hvIGlzIGluIGNo
YXJnZSBvZiBzdXBwb3J0aW5nIFNQSSBOQU5EIGRyaXZlciB1cGRhdGUgYW5kIHVuZGVyc3RhbmQg
dGhlIHByb2Nlc3M/CgpJJ2QgbGlrZSB0byBzYXkgInRoZSBjb21tdW5pdHkiLCBhbmQgdGhhdCBt
ZWFucyBhbnlib2R5IHdobyB3YW50cyB0bwppbnRlcmFjdCBvbiB0aGlzIHRvcGljLiBJIHdpbGwg
cHJvYmFibHkgYmUgdGhlIGd1eSB3aG8gZXZlbnR1YWxseQphcHBsaWVzIHRoZSBwYXRjaChlcyku
Cgo+ICAgMi4gIEhvdyBtYW55IHZlcnNpb24gb2YgdGhpcyBkcml2ZXIgd2UgbmVlZCB0byBkZXZl
bG9wIHRvIHN1cHBvcnQgYWxsIHZlcnNpb24gb2YgTGludXggKG5vdyBiZWluZyA2Lnh4eCk/CgpX
ZSBvbmx5IGJyaW5nIHN1cHBvcnQgdG8gdGhlIGxhdGVzdCBtYWlubGluZSBrZXJuZWwsIHdoYXRl
dmVyIHZlcnNpb24KaXQgY291bGQgYmUuIFNvIGlmIHlvdSBzZW5kIGEgcGF0Y2ggKHBsZWFzZSBm
b2xsb3cgdGhlIGNvbnRyaWJ1dGluZwpndWlkZWxpbmVzIGluIERvY3VtZW50YXRpb24vKSBpdCBz
aG91bGQgYmUgYSBkaWZmIGFnYWluc3QgdGhlIG5leHQgLXJjMQooc28gaXQgd2lsbCBiZSB2Ni44
LXJjMSBpbiB0d28gd2Vla3MpLiBZb3UgY2FuIHNoYXJlIGRpZmZzIGZvciBvdGhlcgp2ZXJzaW9u
cyBhcyB3ZWxsIG9uIHlvdXIgb3duIHdlYnNpdGUgYnV0IHRoZXJlIGlzIHVzdWFsbHkgbm8gYmFj
a3BvcnQKb2YgJ25ldyBmZWF0dXJlcycuCgo+IEZvciBpbnN0YW5jZSBpZiB0aGUgZHJpdmVyIChh
dHRhY2hlZCBpcyA1LjQpLCBjYW4gaXQgYmUgdXNlZCB1cCB0byA1LjE44oCmICBvciBzaG91bGQg
d2UgbW9kaWZ5IGl0IHN0YXJ0aW5nIGZyb20gdmVyc2lvbiA1LjR4LgoKSWYgaXQgY29tcGlsZXMs
IGl0IHdpbGwgcHJvYmFibHkgd29yayBhcyB3ZWxsIGFzIHRoZSBjb3JlIGhhcyBub3QKY2hhbmdl
ZCBtdWNoIHNpbmNlIGl0J3MgYmVlbiBjcmVhdGVkLCBidXQgdGhlcmUgaXMgb2YgY291cnNlIG5v
Cmd1YXJhbnRlZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
