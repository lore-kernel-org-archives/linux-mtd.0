Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E594BD35159
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Apr 2026 08:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4/JmRXrkvNhaU04Zm/1WZ//6YPY3HytVog2Tf6rwjM=; b=pTPKl8S+wscROn
	7aTTlmQkStKdTwvardpNb2pJLXJQjXGwO4VuMb/PCEsL77cBGPEtn1FPvoB/2DHbbUAqMXUqeNvZe
	oGyFEImBvmLgvW98/6Y6AyFDx+DxZzWKdyhDzQWlp7rY2MSjYMWshEKWi4LeRACKn/8ClZAkiVuej
	TiXiS0VkJxM4Ce2ZHO7MPbhXO5e4hLZ3+gnDqsNi/bwxFIYbdMOPDUqkIO0KwjwoW3yLwuZ6r4Vh0
	e5dmw+8255oKau8fwrwPKTiLpA86R1KkKHq7fw9f6jDxH/I69g7vWtr4lIwPQbOt7ZU8n3AN7x6DT
	ajW4mUyYrZCDwDz7zZPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qzx-0000000EKAV-0oWL;
	Wed, 01 Apr 2026 08:32:25 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qzs-0000000EK9t-3606
	for linux-mtd@lists.infradead.org;
	Wed, 01 Apr 2026 08:32:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 437AF4E42894;
	Wed,  1 Apr 2026 08:32:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFBFE602BF;
	Wed,  1 Apr 2026 08:32:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB770104509A9;
	Wed,  1 Apr 2026 10:32:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775032335; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Fs+CGKEUt1ElyhYrbunyFdQOzG2qbZr8EbkvS0lQATM=;
	b=fto/JPni0c1YOWLjhCWBPwqKHiMHbfSQuQEZso7ZVx5iqbGyZTPkZ5CKJEX1lZJ4RF8Ykf
	lFZrD8Qr4iUeDG6X0XA2zSiyg0eHQvz2m0+9RUsBINHftygBnlNTTAbENLTJ51vPCnKbih
	+Fr/r7xOpcxaCBMBMtdy2txzIuN7mJjtxjWkU7+VqVrbqBnh5dKB3UUKoMOaKHzDrIiko5
	0ZAsfmCt9JCUykyIye1ju+n8N+OXfDqNBsWqNiHwbpJEAqFhY9iWlf93fP831/Ucq/65FZ
	6DjOSq5kGFuzkUyt3zZc/hGhfU7OKl4dsHFOdZzTF0nDUFyMDS56DOKv3c12IQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Frieder Schrempf <frieder@fris.de>,  Mark Brown <broonie@kernel.org>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Han Xu <han.xu@nxp.com>,  Eberhard Stoll
 <eberhard.stoll@kontron.de>,  Tudor Ambarus <tudor.ambarus@linaro.org>,
  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  imx@lists.linux.dev,  Santhosh Kumar K
 <s-k6@ti.com>
Subject: Re: [PATCH RFC 6/7] spi: spi-mem: Call spi_set_rx_sampling_point()
 for each op
In-Reply-To: <fed5fba7-0536-4f92-8372-f4b47c89b1c2@kontron.de> (Frieder
	Schrempf's message of "Tue, 31 Mar 2026 19:57:21 +0200")
References: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
	<20260303-fsl-qspi-rx-sampling-delay-v1-6-9326bbc492d6@kontron.de>
	<87wlzlnioh.fsf@bootlin.com>
	<a1a711c4-d9df-4bba-8831-2ec787f84cc4@kontron.de>
	<87ecl09wtv.fsf@bootlin.com>
	<633fee13-a397-410f-a595-db95e04b8110@kontron.de>
	<87ldf881gr.fsf@bootlin.com>
	<fed5fba7-0536-4f92-8372-f4b47c89b1c2@kontron.de>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 01 Apr 2026 10:32:11 +0200
Message-ID: <874ilv84j8.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_013221_044835_4F0E592B 
X-CRM114-Status: GOOD (  34.63  )
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

SGkgRnJpZWRlciwKCj4gVGhlIFJYIGRlbGF5IGludHJvZHVjZWQgYnkgdGhlIGNoaXAgaXMgbm90
IGRlc2lnbi1kZXBlbmRlbnQsIG9ubHkKPiBjaGlwLWRlcGVuZGVudC4gVGhlcmUgbWlnaHQgYmUg
YWRkaXRpb25hbCBkZWxheXMgaW50cm9kdWNlZCBieSB0aGUgYm9hcmQKPiBsYXlvdXQsIGJ1dCB0
aGF0J3Mgb3V0IG9mIHNjb3BlIGN1cnJlbnRseSBhbmQgSSBkb24ndCBrbm93IGlmIHdlIGV2ZW4K
PiBuZWVkIHRoaXMuCgpXZSBkbywgZm9yIHZlcnkgaGlnaCBzcGVlZHMsIGFuZCB0aGlzIGlzIHRo
ZSBwdXJwb3NlIG9mIHRoZSBQSFkgdHVuaW5nCnNlcmllcyBmcm9tIFNhbnRob3NoLgoKWy4uLl0K
Cj4+PiAzLiBCeSBkZWZhdWx0IGxpbWl0IHRoZSBjbG9jayBmcmVxdWVuY3kgZm9yIHRoZSBSRUFE
X0lEIG9wIHRvIGEgc2FmZQo+Pj4gdmFsdWUgdGhhdCB3b3JrcyBmb3IgYWxsIGNoaXBzIGFuZCBj
b250cm9sbGVycywgZXZlbiBpZiBSWCBzYW1wbGluZwo+Pj4gZGVsYXkgY29tcGVuc2F0aW9ucyBp
cyBub3QgYXZhaWxhYmxlLgo+PiAKPj4gSSBhbSBzb3JyeSB0aGlzIGlzIG5vdCBnb2luZyB0byB3
b3JrIG91dC4gVGhlcmUgaXMgbm8gc3VjaCBoYXJtb25pemVkCj4+IHNwZWVkLCBkaWZmZXJlbmNl
cyBjYW4gYmUgYW4gb3JkZXIgKG9yIHR3bykgb2YgbWFnbml0dWRlIGRpZmZlcmVudCwgd2UKPj4g
ZG8gbm90IHdhbnQgdG8gcGF5IHRoZSBwZW5hbHR5IG9mIGEgdmVyeSBzbG93IGlkZW50aWZpY2F0
aW9uIG9uIGFsbAo+PiBkZXNpZ25zLiBXZSBjdXJyZW50bHkgZG8gdGhlIHJlYWQgc2V2ZXJhbCB0
aW1lcyB3aXRoIGRpZmZlcmVudAo+PiBwYXJhbWV0ZXJzLiBXaGF0IGlmIHdlIHdlcmUgdHJ5aW5n
IG9uZSBtb3JlIHRpbWUgYnkgY3V0dGluZyB0aGUgc3BlZWQgYnkKPj4gMiAoY29tcGxldGVseSBy
YW5kb20gcHJvcG9zYWwpPwo+Cj4gSWYgd2UgdHJ5IHdpdGggcmVkdWNlZCBjbG9jayBhcyBhIGZh
bGxiYWNrIGFmdGVyIHRoZSBvdGhlciBhdHRlbXB0cywKPiB0aGVyZSB3b3VsZCBiZSBhIHNsaWdo
dCBjaGFuY2Ugb2Ygb25lIG9mIHRoZSBlYXJsaWVyIGF0dGVtcHRzIHdpdGgKPiBub3JtYWwgY2xv
Y2sgcmF0ZSByZXR1cm5pbmcgc29tZSBpbnZhbGlkIGRhdGEgdGhhdCBtYXRjaGVzIGFuIGV4aXN0
aW5nCj4gY2hpcCBJRCwgbm8/IElzbid0IHRoaXMgYSBiaXQgZmxha3k/CgpZZWFoLCBJIHVuZGVy
c3RhbmQgeW91ciAoYW5kIE1hcmsncykgY29uY2Vybi4KCj4gTGV0J3Mgc2F5IGZvciBhIHdvcnN0
IGNhc2Ugc2NlbmFyaW8gYSBjaGlwIGhhcyBhbiBSWCBkZWxheSBvZiAyMG5zICh0aGUKPiBoaWdo
ZXN0IEkndmUgc2VlbiBpbiBkYXRhc2hlZXRzIHNvIGZhciBpcyA4bnMpLiBJbiB0aGF0IGNhc2Ug
dGhlIG1heGltdW0KPiBjbG9jayB3ZSBjb3VsZCBzYWZlbHkgdXNlIGZvciByZWFkaW5nIHRoZSBJ
RCB3b3VsZCBiZSAxLygyKjIwZS05KSA9Cj4gMjVNSHouIERvIHlvdSB0aGluayBpdCByZWFsbHkg
bWFrZXMgbXVjaCBvZiBhIGRpZmZlcmVuY2UgaWYgd2UgcmVhZCB0aGUKPiBJRCAob25seSBhIGhh
bmRmdWwgb2YgYnl0ZXMpIGF0IDI1TUh6IG9yIGZ1bGwgc3BlZWQgKGUuIGcuIDEwNCBNSHopPyBJ
Cj4gbWVhbiB0aGlzIHNob3VsZCBiZSBmYXN0IGVub3VnaCBlaXRoZXIgd2F5LCBubz8gQnV0IG1h
eWJlIEknbSBtaXNqdWRnaW5nCj4gdGhpcy4KCkkgYW0gaG9uZXN0bHkgbm90IGEgYmlnIGZhbiBv
ZiB0aGUgZ2xvYmFsIHBlbmFsdHksIGJ1dCBJIGFtIG5vdCB0b3RhbGx5Cm9wcG9zZWQgZWl0aGVy
LCBlc3BlY2lhbGx5IHNpbmNlIHlvdSBqdXN0IHNhaWQgeW91IG9ubHkgb2JzZXJ2ZWQgOG5zCmRl
bGF5cyBhdCBtb3N0LiBUaGlzIGlzIDYyLjVNSHosIHdoaWNoIGlzIGFscmVhZHkgYWJvdmUgd2hh
dCBtb3N0CmRlc2lnbnMgdXNlLCBzbyB0aGUgcGVuYWx0eSB3b3VsZCBiZSBtaW5pbWFsLiBXaGF0
IGFib3V0IHRha2luZyB0aGlzCmFwcHJvYWNoIGFuZCBzZWUgaWYgdGhhdCBmaXhlcyBtb3N0IG9m
IG91ciB1c2UgY2FzZXM/Cgo+Pj4gNC4gSW4gUEhZIG1vZGUsIGNoZWNrIGFnYWluc3QgdGhlIERU
IG1heCBmcmVxdWVuY3kgKGJvYXJkIGxpbWl0YXRpb25zKQo+Pj4gYW5kIGNoaXAgbWF4IGZyZXF1
ZW5jeSBiZWZvcmUgc3dpdGNoaW5nIHRvIHRoaXMgbW9kZS4KPj4gCj4+IFRoZXJlIGlzIG5vdCBz
dWNoIHRoaW5nIDotKSB0aGUgbWF4IGZyZXF1ZW5jeSBpbiBEVCBjdXJyZW50bHkgd291bGQgYmUK
Pj4gc2V0IHRvIHRoZSBwbGF0Zm9ybSBsaW1pdGF0aW9uLiBXZSBuZWVkIHNvbWVob3cgYW5vdGhl
ciBwYXJhbWV0ZXIKPj4gaW5kaWNhdGluZyB3aGF0IGlzIHRoZSBtYXhpbXVtIHNwZWVkIGlmIHdl
IGNhbiBmaW5lIHR1bmUgdGhlIHRpbWluZ3MuCj4KPiBTbyB3ZSBjYW4gZXhjZWVkIHRoZSBwbGF0
Zm9ybSBsaW1pdGF0aW9ucyB1c2luZyBmaW5lLXR1bmVkIHRpbWluZ3M/IEkKPiBndWVzcyBJIG5l
ZWQgdG8gcmVhZCBhbmQgdW5kZXJzdGFuZCB0aGF0IHR1bmluZyBSRkMgc2VyaWVzLgoKV2VsbCwg
dGhpcyBpcyBzdGlsbCB1bmRlciBkaXNjdXNzaW9uLiBBcyBvZiB0b2RheSwgdGhlIG1heCBzcGVl
ZCBpbiBEVAppcyB0aGUgbWF4aW11bSBzcGVlZC4gQnV0IGl0IGlzIGluIG1vc3QgY2FzZXMgdGhl
IG1heGltdW0gc3BlZWQKKndpdGhvdXQqIHR1bmluZywgd2hpY2ggbWVhbnMgaWYgd2UgdHVuZSB0
aGUgUEhZIGRlbGF5cyB3ZSBjYW4gaW5jcmVhc2UKdGhlIHNwZWVkIGZ1cnRoZXIuIEkgYWxyZWFk
eSBwcm9wb3NlZCB0byB0dXJuIHRoaXMgRFQgcHJvcGVydHkgaW50byBhbgphcnJheSwgaW4gb3Jk
ZXIgdG8gaW5kaWNhdGUgd2hhdCBhcmUgdGhlIG1heGltdW0gc3BlZWQqcyosIHdpdGhvdXQgYW5k
CndpdGggdHVuaW5nLCBpZiBldmVyIHBvc3NpYmxlLgoKPj4+IEkgaG9wZSB0aGlzIG1ha2VzIGF0
IGxlYXN0IGEgYml0IG9mIHNlbnNlLiBJJ20gcmVhbGx5IG5vdCB5ZXQgZmFtaWxpYXIKPj4+IHdp
dGggYWxsIHRoZSBkaWZmZXJlbnQgdXNlLWNhc2VzIGFuZCBsaW1pdGF0aW9ucy4KPj4gCj4+IElm
IEkgZ2V0IGJhY2sgdG8geW91ciBvd24gaXNzdWUuIElzIHRoZXJlIGFueSBjaGFuY2Ugd2UgY291
bGQgYXZvaWQKPj4gdHdlYWtpbmcgdGhlIERUIGZvciBoYW5kbGluZyBpdD8gV291bGQgdGhlcmUg
YmUgYSBjb25maWd1cmF0aW9uIG9mIHlvdXIKPj4gY29udHJvbGxlciB0aGF0IHdvdWxkIGFsbG93
IHJlYWRpbmcgdGhlIElEIG9mIGFsbCB0aGUgY2hpcHMgd2l0aCBlbm91Z2gKPj4gZGVsYXlzPyBD
dXJyZW50bHksIHRoZSBzcGkgY29yZSBkb2Vzbid0IGNhcmUgbXVjaCBhYm91dCBvdGhlciBwYXJh
bWV0ZXJzCj4+IHRoYW4gdGhlIGZyZXF1ZW5jeSwgYnV0IHRoZXJlIGlzIHBlcmhhcHMgcm9vbSBm
b3IgaW1wcm92ZW1lbnQuCj4KPiBXZSBjb3VsZCB1c2UgUlggZGVsYXkgY29tcGVuc2F0aW9uIChv
bmUgaGFsZiBjbG9jayBjeWNsZSkgaW4gdGhlCj4gY29udHJvbGxlciBieSBkZWZhdWx0IChhcyBj
dXJyZW50bHkgZG9uZSBieSB0aGUgU1RNMzIgZHJpdmVyKS4gQnV0IHRoYXQKPiB3b3VsZCBicmVh
ayBpZiB3ZSB1c2UgYSB2ZXJ5IGxvdyBjbG9jayAoZm9yIHdoYXRldmVyIHJlYXNvbikgYmVjYXVz
ZQo+IHRoZW4gdGhlIFJYIHNhbXBsaW5nIGRlbGF5IGdldHMgbmVnbGVjdGFibGUgY29tcGFyZWQg
dG8gdGhlIGNsb2NrIHBlcmlvZAo+IGFuZCBzYW1wbGluZyBpcyB0cmlnZ2VyZWQgYXQgdGhlIHZl
cnkgZW5kIG9mIHRoZSBjbG9jayBjeWNsZSB3aGVuIHRoZQo+IGRhdGEgbWlnaHQgYWxyZWFkeSBi
ZSBpbnZhbGlkLiBBdCBsZWFzdCB0aGF0J3Mgd2hhdCBJIHN1c3BlY3QgYmFzZWQgb24KPiBteSB0
ZXN0IHJlc3VsdHMuCj4gQW5kIGl0IHdvdWxkIGFsc28gYnJlYWsgaWYgdGhlIGNoaXAgYWN0dWFs
bHkgcmVxdWlyZXMgbW9yZSB0aGFuIG9uZSBoYWxmCj4gY2xvY2sgY3ljbGUgb2YgUlggc2FtcGxp
bmcgZGVsYXkuCj4KPiBUaGUgUlggc2FtcGxpbmcgZGVsYXkgc2V0dGluZyBtdXN0IG1hdGNoIHRo
ZSB1c2VkIGNsb2NrIGZyZXF1ZW5jeS4gSW4KPiBtb3N0IGNhc2VzIHRoZXJlIGlzIGEgbG90IG9m
IHJvb20gZm9yIHRvbGVyYW5jZSBiZWZvcmUgdGhpbmdzIHN0YXJ0IHRvCj4gZmFpbCwgYnV0IGl0
J3Mgbm90IGVuZGxlc3MgYW5kIGVzcGVjaWFsbHkgYXQgdmVyeSBoaWdoIGNsb2NrIHJhdGVzIHdl
Cj4gbmVlZCB0byB0YWtlIGl0IGludG8gYWNjb3VudC4KPgo+IFNvIGlmIHdlIGRvbid0IGNhcCB0
aGUgc3BlZWQgZm9yIHJlYWRpbmcgdGhlIElEIGJ5IGRlZmF1bHQsIHdlIHNvbWVob3cKPiBuZWVk
IHRvIGtub3cgd2hhdCB2YWx1ZSB0byB1c2UgZm9yIHRoZSBSWCBzYW1wbGluZyBkZWxheSBvciB3
ZSBuZWVkIHRvCj4gdHJ5IGRpZmZlcmVudCB2YWx1ZXMuIEFuZCBpZiB0aGUgY29udHJvbGxlciBk
b2VzIG5vdCBzdXBwb3J0IG9yCj4gaW1wbGVtZW50IHRoZSBSWCBzYW1wbGluZyBkZWxheSBjb21w
ZW5zYXRpb24sIHdlIG5lZWQgdG8gY2FwIHRoZSBzcGVlZAo+IGFueXdheS4KCldoYXQgYWJvdXQ6
CgoqU1BJIGNvbnRyb2xsZXIgZHJpdmVycyoKLSBFbmFibGUgUlggZGVsYXkgY29tcGVuc2F0aW9u
IGluIHRoZSBjb250cm9sbGVyIGJ5IGRlZmF1bHQsIGRpc2FibGUgaXQKaWYgdGhlIHNwZWVkIGlz
IHZlcnkgbG93LCBpZS4gY29tcGVuc2F0aW9uIGlzIGRhbmdlcm91cwoqQ29yZSoKLSBSRUFESUQg
YXQgbWF4IDY1TUh6ICh3aXRoIHRoZSBkZWZhdWx0IFJYIGRlbGF5IGNvbXBlbnNhdGlvbikKKlZl
bmRvciBkcml2ZXIqCi0gSW5kaWNhdGUgdGhlIGludGVybmFsIFJYIGRlbGF5IHBlciBjaGlwICht
YXliZSB3ZSBuZWVkIHNvbWUgaGV1cmlzdGljcwpkZXBlbmRpbmcgb24gdGhlIHNwZWVkIGFzIHdl
bGw/KQoqU1BJIGNvbnRyb2xsZXIgZHJpdmVycyoKLSBIb29rIHRvIHR1bmUgUlggYmFzZWQgb24g
dGhlIGZhc3Rlc3QgcmVhY2hhYmxlIHNwZWVkLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
