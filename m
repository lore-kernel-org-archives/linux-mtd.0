Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39DCC43458
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2026 13:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kDkUPTDSdX/M80aPszwc+hA4hJ6B2I9RN+ADc+f54Wc=; b=Oh8xd88FJ5MVQw
	FtWFfuLhfGzP1DPdlRN1MRuoxUyYf70wWsTC7+xCM3nZDZ/617P0qqwgjOSVybrRjBzr7QcxvdadW
	SEBy9pWtmUGIyU7ctUFmknCqoW/UIq1VRzNZZqnf6vff3xJnpFNo3FrTe1P2AAa0K6stOGUwqTOzH
	Y7alGmwIrTFfiuigZZl3QmjlGIGtwP3kC5F61B/se2Dcw4d9ZNIGfqyW+QXnXEzC3RS6kHw4aV7jQ
	6WRS92+xHOd3JsnywKvW9M9LtztbAdFb7iZFcW/iRqBxIRb0jfjDh6Ufu2NnykhDQTxcJ+C6OLhzJ
	f4jxWtEGACfNHa/wnJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHfe-00000004Y6L-0gFg;
	Thu, 02 Jul 2026 13:41:38 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHfa-00000004Y5K-1xOw
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jul 2026 13:41:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7044BC4FEDD;
	Thu,  2 Jul 2026 13:41:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11DAB5FF03;
	Thu,  2 Jul 2026 13:41:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 932EC104C9577;
	Thu,  2 Jul 2026 15:41:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782999691; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3kbHnC3x3hEpbNdF+qEJ6jzcXt/7SmkG5FNSavJE8Ds=;
	b=tbkQTnk/xbfoAM1MziLjXUidjKag65lxh3C+w2AFcWUZt8jrhqRqMPrg+jKMq44qEJjJ/3
	S58xyi4QHP3dVJpYcHhRSTg5RB7KbihIDrQ5kmQtOldRZ1FoU2LtPDRUs+ga2ePuqILrpu
	HXGE46szPIgoxkCSgPain7ryJrFwd0w0MVqwbdI6hw0VKdIw8gxKybMWbny+XRNdvKVnJq
	wqSw7Fcd41VTUVWDrj2UsLksij0fbna6g8CZOSGP7/kam31vZTd3uKs2SYaI6mBZON3mON
	C0/YkQEIrUlgE1+SjUoeisGO3DLktE99SA+6cmrFuolFSxK9mR/L/2k89ng8ZQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v4 13/16] mtd: spinand: extract variant ranking logic
 into spinand_op_find_best()
In-Reply-To: <20260618073725.84733-14-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Thu, 18 Jun 2026 13:07:22 +0530")
References: <20260618073725.84733-1-s-k6@ti.com>
	<20260618073725.84733-14-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 02 Jul 2026 15:41:27 +0200
Message-ID: <87v7axpkzc.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_064134_671291_A1B9F778 
X-CRM114-Status: GOOD (  17.23  )
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

T24gMTgvMDYvMjAyNiBhdCAxMzowNzoyMiArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+IHdyb3RlOgoKPiBzcGluYW5kX3NlbGVjdF9vcF92YXJpYW50KCkgb3Blbi1jb2RlcyBh
IGxvb3AgdGhhdCBmaW5kcyB0aGUgZmFzdGVzdAo+IGVsaWdpYmxlIG9wIHZhcmlhbnQgYnkgdHJh
bnNmZXIgZHVyYXRpb24uIEV4dHJhY3QgdGhpcyBpbnRvIGEgc2hhcmVkCj4gaGVscGVyIHNwaW5h
bmRfb3BfZmluZF9iZXN0KCkgdGhhdCBhY2NlcHRzIGEgc2tpcF9tYXNrIGJpdG1hc2sgb2YKPiBh
bHJlYWR5LXRyaWVkIHZhcmlhbnQgaW5kaWNlcywgZW5hYmxpbmcgY2FsbGVycyB0byBpdGVyYXRl
IHZhcmlhbnRzIGluCj4gcmFua2VkIG9yZGVyIHdoaWxlIHNraXBwaW5nIHByZXZpb3VzbHkgYXR0
ZW1wdGVkIG9uZXMuCj4KPiBzcGluYW5kX3NlbGVjdF9vcF92YXJpYW50KCkgYmVjb21lcyBhIG9u
ZS1saW5lci4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW50aG9z
aCBLdW1hciBLIDxzLWs2QHRpLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvY29y
ZS5jIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDI3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4g
aW5kZXggZjg2Nzg2MzQ0ZDUyLi5iNjc4ZDA1MzQyOTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9zcGkvY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jCj4g
QEAgLTE1NDEsOSArMTU0MSwyMiBAQCBzdGF0aWMgaW50IHNwaW5hbmRfaW5pdF9vZHRyX2luc3Ry
dWN0aW9uX3NldChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQpCj4gIAlyZXR1cm4gMDsK
PiAgfQo+ICAKPiArLyoKPiArICogc3BpbmFuZF9vcF9maW5kX2Jlc3QoKSAtIEZpbmQgdGhlIGZh
c3Rlc3QgZWxpZ2libGUgb3AgdmFyaWFudC4KClNob3VsZCBkZWZpbml0ZWx5IGJlIG5hbWVkIHNw
aW5hbmRfb3BfZmluZF9iZXN0X3ZhcmlhbnQoKS4gZmluZF9iZXN0IGlzCndheSB0b28gd2lkZS4K
Cj4gKyAqIEBzcGluYW5kOiAgICBTUEkgTkFORCBkZXZpY2UKPiArICogQHZhcmlhbnRzOiAgIGZ1
bGwgdmFyaWFudCBsaXN0IHRvIHNlYXJjaAo+ICsgKiBAb2R0cjogICAgICAgdHJ1ZSB0byBjb25z
aWRlciBPRFRSIG9wcywgZmFsc2UgZm9yIFNTRFIgb3BzCj4gKyAqIEBza2lwX21hc2s6ICBiaXRt
YXNrIG9mIHZhcmlhbnQgaW5kaWNlcyB0byBza2lwIChhbHJlYWR5IHRyaWVkKQoKVGhlIGZsYWcg
c2VlbXMgdG8gYmUgcXVpdGUgb3ZlcmxhcHBpbmcgd2l0aCB0aGUgb2R0ciBmbGFnLiBTaG91bGRu
J3Qgd2UKaGF2ZSBhIHNpbmdsZSB3YXkgdG8gZmlsdGVyIG9wZXJhdGlvbnM/CgpBbHNvLCB3aHkg
YXJlIHlvdSBzd2l0Y2hpbmcgZnJvbSBhbiBpbnRlcmZhY2UgZW51bWVyYXRpb24gdG8gYSBib29s
ZWFuPwpTb21lIGRheSB3ZSBtaWdodCBuZWVkIHRvIHN1cHBvcnQgdGhpbmdzIGxpa2UgNEQtNEQt
NEQuIFRoYXQgaXMgd2hlcmUgYW4KZW51bWVyYXRpb24gaXMgYmV0dGVyIHRoYW4gYSBib29sZWFu
LiBJZiB5b3Ugd2FudCB0byBkcm9wIHRoZQplbnVtZXJhdGlvbiwgaXQgc2hhbGwgYmUgZG9uZSBl
dmVyeXdoZXJlIGVsc2UsIGJ1dCBJIGRvbid0IHRoaW5rIGl0IGlzIGEKZ29vZCBhcHByb2FjaC4K
Cj4gKyAqIEl0ZXJhdGVzIEB2YXJpYW50cywgZXZhbHVhdGVzIHRyYW5zZmVyIGR1cmF0aW9uIGZv
ciBlYWNoIGVsaWdpYmxlIG9wLCBhbmQKPiArICogcmV0dXJucyBhIHBvaW50ZXIgdG8gdGhlIGZh
c3Rlc3Qgb25lIG5vdCBpbiBAc2tpcF9tYXNrLiAgUmV0dXJucyBOVUxMIHdoZW4KPiArICogbm8g
ZWxpZ2libGUgdmFyaWFudCByZW1haW5zLiAgVXNlZCBieSBib3RoIHZhcmlhbnQgc2VsZWN0aW9u
IGF0IGluaXQgdGltZQo+ICsgKiAoc2tpcF9tYXNrID09IDApIGFuZCByYW5rZWQgUEhZIHR1bmlu
ZyBpdGVyYXRpb24uCj4gKyAqLwoKSSBoYXZlbid0IHNlZW4gd2hhdCBpcyB0aGUgdXNlIGNhc2Ug
b2YgdGhpcyBtYXNrIHlldCwgbGV0J3Mgc2VlIGluIHRoZQpmb2xsb3dpbmcgcGF0Y2hlcy4KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
