Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F952CD6E4A
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2026 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBrMT89BnCSsVxRURgPlBNigKq4u12s9IKZAVclXaJU=; b=j+i/Q89v8w3xGM
	2boJo4KxMJAVrWp1rYvj7SzdFwAK5Qqqrq/9yfwb3BrWxpGz0gz6TSE6f+eV3udmzdqBNfMiyMbtY
	I9/5wA544JTqhf+F4M2jVfUF1cBG9Sw352U0JCrxWWD+YFuyAMG10Ggj0LvboPh2ntH3KfcEPxFwL
	MVm7RZ27XSZ7Vy9e8R4KoDoqOBrbwvlpk4KYu7Lv8vYIeKuWYKOZMLYwLAuOvMsUCfGot9jd46s6+
	GttXmxc+7HwYkifAtOjiB0WY/XtrNfkyyKcrK2McY66KF6uQfelTj4rCMcWjRoMDt7Q1zF/V0ZBot
	dXV/xUS/G/8uDOqHQosQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULyW-0000000CjPm-1xkN;
	Tue, 02 Jun 2026 10:03:56 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULyT-0000000CjP6-1Za8
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jun 2026 10:03:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8AC324E42DC0;
	Tue,  2 Jun 2026 10:03:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 58A8C603BC;
	Tue,  2 Jun 2026 10:03:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06EB61088817C;
	Tue,  2 Jun 2026 12:03:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780394630; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZoR84Qjh6EbTtv6XWIZVPPpSqElpMH384oZP1Tjbp9s=;
	b=iCvsowvJnDXrj+AZCyPaHmi/wToKqKOpNNMyELAOIuYN8zB4+bz4Y9RO3JO+dsOIgLos7I
	Ghk1bzlCOnTx1m2WPtRm34ljV0sR0QCpOeiIHOL23Pu+ErlG2syMChROrmux4RrIxq6Q+7
	IngT6WjpBwiskLBWKnmjYDw7iCJ9jaUEkCeiqftAPVy4eTpMpAQarDJc9YiAXmABWKesSr
	juE8412k8N4tk56b7RmpFd96+Or2WDqC5vJfgQmNz1WTGoVSI0iI59UMVrd9rkUjn28KOC
	SbTcx4QQvzc4u0nQI3t9z/62xcx+K0L6hCdh/tJqE4I4lr8pZzL5rnc9DiuWiw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] mtd: spi-nor: Rework flash parameter
 initialization
In-Reply-To: <20260601125438.3481722-1-mwalle@kernel.org> (Michael Walle's
	message of "Mon, 1 Jun 2026 14:52:42 +0200")
References: <20260601125438.3481722-1-mwalle@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 02 Jun 2026 12:03:47 +0200
Message-ID: <87tsrlmf7g.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_030353_544396_B07F4790 
X-CRM114-Status: GOOD (  15.82  )
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

SGkgTWljaGFlbCwKCk9uIDAxLzA2LzIwMjYgYXQgMTQ6NTI6NDIgKzAyLCBNaWNoYWVsIFdhbGxl
IDxtd2FsbGVAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IFRyeSB0byBzaW1wbGlmeSB0aGUgZmxhc2gg
aW5pdGlhbGl6YXRpb24gYW5kIGdldCByaWQgb2YgdGhlIGxlZ2FjeQo+IGhhbmRsaW5nLiBBcyBk
ZWZhdWx0LCBhbGwgdGhlIGZsYWdzIG9mIHRoZSBpbi1rZXJuZWwgZGF0YWJhc2UgYXJlCj4gdGFr
ZW4gYW5kIGFtZW5kZWQgd2l0aCB0aGUgU0ZEUCBkYXRhLgo+Cj4gVGhpcyBtaWdodCBoYXZlIHRo
ZSBjb25zZXF1ZW5jZSB0aGF0IGFsbCB0aGUgZmxhc2hlcyBub3cgZ2V0IGEKPiBSRFNGUEQgb3Bj
b2RlIHdoaWNoIG1pZ2h0IGJlIGFuIHVua25vd24gb3Bjb2RlLiBCdXQgdGhhdCB3YXMgYWxyZWFk
eQo+IHRoZSBjYXNlIGZvciBhbnkgZmxhc2hlcyB3aGljaCB3ZXJlIHVua25vd24gdG8gdGhlIGxp
bnV4IGtlcm5lbC4gU28KPiBmYXIsIHRoZXJlIHdhcyBub3QgYSBzaW5nbGUgY29tcGxhaW50Lgo+
Cj4gU2VlIHBhdGNoIDMgZm9yIG1vcmUgaW5mb3JtYXRpb24uIElmIGZlZWRiYWNrIGlzIHBvc2l0
aXZlLCB0aGlzIGlzCj4gaW50ZW5kZWQgdG8gYmUgYXBwbGllZCB0byB0aGUgc3BpLW5vciB0cmVl
IGFmdGVyIHRoZSBuZXh0IG1lcmdlCj4gd2luZG93LCBzbyBpdCB3aWxsIHNpdCBhcm91bmQgaW4g
LW5leHQgZm9yIHF1aXRlIHNvbWUgdGltZSBhbmQgZ2V0Cj4gc29tZSB0ZXN0aW5nLgo+Cj4gVGhh
dCBiZWluZyBzYWlkLCBJJ3ZlIGp1c3QgZGlkIGEgcXVpY2sgdGVzdCBvbiBteSBib2FyZHMuIFBs
ZWFzZQo+IGdpdmUgaXQgYSB0ZXN0IG9uIHlvdXIgYm9hcmRzLgoKSW50ZXJlc3RpbmcgY2xlYW51
cCwgdGhhbmtzIGZvciBwdXNoaW5nIGl0LiBJJ2xsIHJ1biBzb21lIHRlc3RzIHdpdGgKc29tZSBv
bGQgYW5kIG5ld2VyIFNGRFAgYmFzZWQgZmxhc2hlcy4gSSBkbyBub3QgaGF2ZSBjaGlwcyB3aXRo
b3V0IFNGRFAKdGhvdWdoLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
