Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC51C4BA06
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 08:53:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E90724672
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 08:53:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X8mfB8/T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="goOHwIhZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E90724672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/WfXKfZs2kCAfdQDD0W4ovYfIPIEL68rDqgBcE6NQ0=; b=X8mfB8/Tt/b+gg
	rKB5zoCu1OsYtoTB4ECdcQBcUqL0m3PZIjlMUDH54LIvRFCfwGqaOa3NmwB4BW0BzRjjFVmck7oaR
	MzZwX/RU8HVah/dSKT9gbPoFaNCZFD5gTlXIDrFr5Hg75L3Vrq0hI++EibXv5gmCUHE0dDK87ur0L
	qnyUzv2O3EkMK5dI7S4qtOcGsju07n8hfZqpkpBvsLd8JfXnLQ2RHD/r7tcN8JUK2J1EVa1v6varM
	gzs1pswf8q7A8MxTnwJJJ2y//dIZSjlttawi18OIH0qYP5XyDmHQwcdsLQc3aN4XWM2gagA7GEJfN
	Y66bU+ohJtnuzQGZbXJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7Euh-00015T-Vt; Thu, 27 Feb 2020 08:52:59 +0000
Received: from merlin.infradead.org ([205.233.59.134])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7Euf-00015B-1o
 for linux-mtd@bombadil.infradead.org; Thu, 27 Feb 2020 08:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=3xffc7Hf9OJZbZSU1epx7azLPScKQz3sI8/joR/ZVZs=; b=goOHwIhZ6sZAzFYCv2cUjq/im/
 GhzreRtKX3gvHbAX8AyHq8kjGRLluNN2dr8VdBcL6rOYACztULY5k+qMKzYc4oDGRtG2sJAe+HJfF
 pnFZrBQbmo307UUsEstvRKLWTebDXAszK9klBfZc1CTGD1s2UoEke9KNX0ANDohEsNCe6U7sMcmzz
 mKmc0UCQ0w5W+HKDFwkyPdl2xco/+1v6Ej5XhIZIAi1iqOGOZwroVCnVbi9JhX79XGWJE+TSlopyY
 72ZhF+YD6w4i5qzt42axb6ta8DxEXARo49bws2fpmrsUxPsUKwoku4oCWaLP/6CXImPT8AscCsiw2
 PNnVkrmw==;
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7Eud-0001ja-8P
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 08:52:56 +0000
Received: from xps13 (lfbn-tou-1-1473-158.w90-89.abo.wanadoo.fr [90.89.41.158])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id E377C100016;
 Thu, 27 Feb 2020 08:51:54 +0000 (UTC)
Date: Thu, 27 Feb 2020 09:51:53 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jef Driesen <jef.driesen@niko.eu>
Subject: Re: ubifs: mounting fails due to error in orphan file handling
Message-ID: <20200227095153.363c02bd@xps13>
In-Reply-To: <fd364e81-b816-1b77-317c-cd030b7833d0@niko.eu>
References: <0d3a2ed9-8ff0-7030-a8c6-c5a204eb6b5b@niko.eu>
 <20200205092202.5f0929c3@xps13>
 <21a266b9-ff3f-7a94-4562-11d6f59d4327@niko.eu>
 <CALLGbRKotskAgZpxNFHF+RdrA0HB7U2qw6bzvZ9WDJEAiWYwgQ@mail.gmail.com>
 <d86c95cc-3393-0f6e-73ab-56a5bbbbedd8@niko.eu>
 <CAFLxGvwKfcw=Com5U7uGsA-iJ9SuQyqHdEeaWPUmnoxqwma0Gw@mail.gmail.com>
 <9ff6f4ae-8dda-608b-4e60-6d391cb4efb9@niko.eu>
 <CAFLxGvyaBu8Uu9xMgk2fDK_erv0eOb4B3_JgjLM9m0iu66Gr8g@mail.gmail.com>
 <fd364e81-b816-1b77-317c-cd030b7833d0@niko.eu>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 Steve deRosier <derosier@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSmVmLAoKSmVmIERyaWVzZW4gPGplZi5kcmllc2VuQG5pa28uZXU+IHdyb3RlIG9uIFRodSwg
MjcgRmViIDIwMjAgMDk6NDI6MTAKKzAxMDA6Cgo+IE9uIDI3LzAyLzIwMjAgMDg6NTUsIFJpY2hh
cmQgV2VpbmJlcmdlciB3cm90ZToKPiA+IE9uIFR1ZSwgRmViIDExLCAyMDIwIGF0IDI6NDcgUE0g
SmVmIERyaWVzZW4gPGplZi5kcmllc2VuQG5pa28uZXU+IHdyb3RlOiAgCj4gPj4+IEkgc2VuZCBh
IGZpeCBmb3IgdGhpcyBiZWZvcmUgSSBzdGFydGVkIHRyYXZlbGluZzoKPiA+Pj4gW1BBVENIXSB1
YmlmczogRml4IHViaWZzX3RuY19sb29rdXAoKSB1c2FnZSBpbiBkb19raWxsX29ycGhhbnMoKQo+
ID4+Pgo+ID4+PiBEaWdnaW5nIGN1cnJlbnRseSB0aG91Z2h0IGFsbCBteSBtYWlscy4uLi4gIAo+
ID4+Cj4gPj4gSSBmb3VuZCB5b3VyIHBhdGNoOgo+ID4+Cj4gPj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8yMDIwLUphbnVhcnkvMDkzMzkwLmh0bWwKPiA+
Pgo+ID4+IEkgZGlkIHNvbWUgdGVzdHMgd2l0aCBpdCwgYW5kIGl0IGFwcGVhcnMgdG8gZml4IHRo
ZSBwcm9ibGVtIGZvciBtZSEgIAo+ID4gCj4gPiBUaGFuayB5b3UgZm9yIGxldHRpbmcgbWUga25v
dyEKPiA+IENhbiBJIGhhdmUgYSBUZXN0ZWQtYnk/ICAKPiAKPiBPZiBjb3Vyc2UuCj4gCj4gSmVm
CgpBY3R1YWxseSBtYWludGFpbmVycyB1c2UgdG9vbHMgdG8gYXV0b21hdGljYWxseSBjb2xsZWN0
IHRhZ3MgZnJvbSB0aGUKbWFpbGluZyBsaXN0IChvbmx5IGluIHRoZSBsYXN0IHZlcnNpb24gb2Yg
dGhlIHBhdGNoL3NlcmllcykgcHJvdmlkaW5nCnRoYXQgdGhleSBoYXZlIHRoZSBjb3JyZWN0IGZv
cm0uIFNvIHdoZW4gUmljaGFyZCBhc2tzIGZvciB5b3VyClRlc3RlZC1ieSB0YWcgYW5kIHlvdSBh
Z3JlZSwgeW91IHNob3VsZCBhZGQgdGhlIGZvbGxvd2luZyBsaW5lIHRvIHlvdXIKYW5zd2VyOgoK
VGVzdGVkLWJ5OiBKZWYgRHJpZXNlbiA8amVmLmRyaWVzZW5Abmlrby5ldT4KCjopCgpDaGVlcnMs
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
