Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E06ECD6FA
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Feb 2026 13:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eX69CYubDhkfQCZ2ag5/S3OcyIGFczJe9R3fVt8ZS5I=; b=vcdXPT2BBMthEQ
	g8PM1IsdvLwWGC2hDj5IKCne00nXWBPybanAigRFTTLeGSNkHvp41ZYkzJoHeS010F8DfCVnbTXfV
	mUMem43sl342GHa6POC7l0qJLQiUzTvUA/VczRaoQo5PcVusDgWrEqQCEBJh40M6kcrGEJ9S5MrY+
	k3axqPUKq8bq4ePKQ//skerfHNPPioLSTrxFipMb00dFj9JYbF5eycJ2E8TQy1fc2MAmzqodqqoi+
	mwPdnS8DbyeKGwyD6o6CusQSf8+fmRsEQzn1Cc3b6EtkGrGKuqpsTnr9HowiaohxRZy84pFjSBFKd
	PviJrTddg1xo7VA00qmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqWM8-000000027GB-3Ueo;
	Thu, 12 Feb 2026 13:03:40 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqWM3-000000027Fh-1dFV
	for linux-mtd@lists.infradead.org;
	Thu, 12 Feb 2026 13:03:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EA73CC23DA6;
	Thu, 12 Feb 2026 12:55:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA1F7606CA;
	Thu, 12 Feb 2026 12:55:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A630119708B8;
	Thu, 12 Feb 2026 13:55:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770900928; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BMPMAwMYqQ+DI8Ds4Z6rKLFfzIVUJJ2dJif7/RBD8oM=;
	b=QbzF9AnVvDC59V1wOBN8pTDC7nakFCw23N+yQJD0Lqmjaw1ZBPUDK+zaT7F2viH4Wuwcoj
	nPGsE9TCLsMOjqB4iBzzzLkvWgxlqS8Zbwd/0X1iqmE+FcPCKMCJsuUEiuKwkdQ8DvlFB+
	1WbmMqWFSiILEqk6UTDf/VQQ8WaDeCUg2B37Wbe9yOyb6ywpI+caMOdSvAE/gV7hl64Yom
	R3ICAFwWKGVSBIL9fHqdDrbKJonFG3y4G8sQcN9XGV8Y9tKPsusVqvRtcP0vzEfiyAH3QR
	MeO2PwPzZjxQ+lbVIJKVWeSWqKQxdAAKbJ1Rl+EOOE/5Q5y+JdkXK9qfAywurg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Santhosh Kumar K" <s-k6@ti.com>,  <broonie@kernel.org>,
  <robh@kernel.org>,  <krzk+dt@kernel.org>,  <conor+dt@kernel.org>,
  <richard@nod.at>,  <vigneshr@ti.com>,  <tudor.ambarus@linaro.org>,
  <pratyush@kernel.org>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <p-mantena@ti.com>,  <a-dutta@ti.com>
Subject: Re: [RFC PATCH v2 09/12] spi: cadence-quadspi: add PHY tuning
 infrastructure
In-Reply-To: <DGCXTWSCAH6R.22SIL82AUVGYI@kernel.org> (Michael Walle's message
	of "Thu, 12 Feb 2026 12:14:05 +0100")
References: <20260113141617.1905039-1-s-k6@ti.com>
	<20260113141617.1905039-10-s-k6@ti.com>
	<DGAC4N62UZQQ.3R7TLX87PECU3@kernel.org> <87qzqqxml7.fsf@bootlin.com>
	<DGCXTWSCAH6R.22SIL82AUVGYI@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 12 Feb 2026 13:55:22 +0100
Message-ID: <87fr76xgsl.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_050335_591679_F6576870 
X-CRM114-Status: GOOD (  12.97  )
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

SGVsbG8sCgo+Pj4+ICsJZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZShwYXJ0aXRpb25fbnAsIHBhcnRf
bnApIHsKPj4+PiArCQlpZiAob2ZfcHJvcGVydHlfcmVhZF9zdHJpbmcocGFydF9ucCwgImxhYmVs
IiwgJmxhYmVsKSB8fAo+Pj4+ICsJCSAgICAhc3Ryc3RyKGxhYmVsLCAicGh5cGF0dGVybiIpKQo+
Pj4+ICsJCQljb250aW51ZTsKPj4+Cj4+PiBUaGVyZSB3YXMgYWxyZWFkeSBhIHJldmlldyBjb21t
ZW50IG9uIHRoZSBsYXN0IHZlcnNpb24uIE1vdmluZyB0aGlzCj4+PiBpbnRvIHRoZSBkcml2ZXIg
ZG9lc24ndCBtYWtlIGl0IGFueSBiZXR0ZXIuIEluIGZhY3QgdGhpcyBtaWdodAo+Pj4gY3JlYXRl
IGEgKGJhZCkgcHJlY2VkZW50IGZvciBmdXR1cmUgZHJpdmVycy4KPj4KPj4gSSByZW1lbWJlciBj
b21wbGFpbmluZyBhYm91dCBpdCBidXQgbm90IGlmIHRoZXJlIHdhcyBhIHNvbHV0aW9uCj4+IGZv
cmVzZWVuLiBJbiBTUEkgTkFORCB0aGUgc29sdXRpb24gaGFzIGJlZW4gZm91bmQ6IHRoZSBwYXR0
ZXJuIGlzIGluIHRoZQo+PiBkcml2ZXIgYW5kIHdlIGxvYWQgaXQgaW50byBjYWNoZSBiZWZvcmUg
UEhZIHR1bmluZy4gQnV0IGZvciBTUEkgTk9SIEkKPj4gdW5kZXJzdG9vZCB0aGlzIHdhc24ndCBw
b3NzaWJsZS4gV2hhdCB3b3VsZCBiZSBhbiBhbHRlcm5hdGl2ZT8KPgo+IEknbSBub3QgY29tcGxh
aW5pbmcgYWJvdXQgdXNpbmcgYSBwYXJ0aXRpb24gZm9yIHRoZSBwYXR0ZXJuIGJ1dAo+IGFib3V0
IHRoZSBoYXJkY29kZWQgbmFtZSBvZiBpdC4KPgo+IEl0IHdhcyBwcm9wb3NlZCB0byB1c2UgYXQg
bGVhc3QgYSBkZXZpY2UgdHJlZSBwaGFuZGxlIHRvIHBvaW50IHRvIGEKPiBwYXJ0aXRpb24gKG9y
IHNvKS4KCkFoLCB5ZXMgaW5kZWVkLCB0aGFua3MgZm9yIGNsYXJpZnlpbmcgdGhpcyB1cCAoYWdh
aW4pIGZvciBtZS4gSSBhbHNvCmFncmVlIHRoZSBoYXJkY29kZWQgbmFtZSBpcyBub3QgaWRlYWwu
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
