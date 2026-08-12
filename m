Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675B4C5B56A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 10:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=em6+1yztNd/wLDJ+90DK3DLSd+qNaxh64yO7S+nYsR0=; b=kyXLopowXeEPqt
	S42cZrhUdTwEjBSTAXg30Hym9xO6JFyGmgv1GkAif8etJa3ti7z/TAKyzPhaR5xKztIRQvX5RHab1
	+qXJ85nbyqEl2yw69ZZorGezljbRaVr6KEEagCv++rutOhkEE+1tIpn4M0x1xCj+AaUyi785kwA8A
	R8tvXR2AE+8cm7LeOa5+Qly9mQKgAnq2jBu+FQf4utJNJ/5cMSvvcEx5C5dLNyKCBCZxq9lJ/8NH5
	AH9p8ALGc5Eeuw4ntZODshv3JTgvCgCQHKkKGl64A65KYadcDcBPWLfLHSUB8ZUDqsfbpvUtQ0Zmj
	GFoF/tjh4biAco1Vui+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5qI-0000000FqEP-30Gy;
	Wed, 12 Aug 2026 10:05:50 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5qE-0000000FqDo-05IG
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 10:05:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 32C194E411D1;
	Wed, 12 Aug 2026 10:05:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB0376045E;
	Wed, 12 Aug 2026 10:05:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E0CA011C4CBCC;
	Wed, 12 Aug 2026 12:05:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786529142; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dRZPxqI25TZjHZ/6T+U90CPEsTAToTykZqHxtC4cUEA=;
	b=c6peWfQLhcuGX9MbHL2ryhnJ03qbt8r7VtdTC7lv2jGxyp4/4FjitIiByE+9rrb8x61fKN
	k52O0qL9EGWvzOPTembinRYork0DXKOLsuIa9j8CC5cSEy2OxjxWfLARKb+KbK503jqYEz
	21/+FNgp29N6wf8yy7/2KA8MyyOPXGV0y9Rb7etcTtJr9lLreIdAuNdp5nLz6GLXnE2C8n
	DY8eZQSsuHWHidcymAC/fkb8xGsTA+hQckAOQTpSkn/qv2J3u+XDG+y68VkZrHtZ37thIa
	xFJMp41436aNf0QCjFeaLMOcxiAMlVJYXTjsN8/o+e7uCWA21nn20vlDgFDonQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Tudor Ambarus"
 <tudor.ambarus@linaro.org>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <stable@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Unprepare legacy controllers upon RWW
 wait interruption
In-Reply-To: <DKMVA2HIPB2Z.J0W6OM4H3ARL@kernel.org> (Michael Walle's message
	of "Wed, 12 Aug 2026 11:44:41 +0200")
References: <20260811-perso-rww-fixes-v1-1-5866a70e5d1c@bootlin.com>
	<DKMVA2HIPB2Z.J0W6OM4H3ARL@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 12 Aug 2026 12:05:39 +0200
Message-ID: <87ik5fmz64.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_030546_247580_8B6D8E01 
X-CRM114-Status: UNSURE (   5.03  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgo+IE9uIFR1ZSBBdWcgMTEsIDIwMjYgYXQgNTo1NiBQTSBDRVNULCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+PiBBbGwgdGhlIHBhcmFsbGVsIGxvY2tpbmcgaGVscGVycyAoc3BpX25vcl9w
cmVwX2FuZF9sb2NrKCksCj4+IHNwaV9ub3JfcHJlcF9hbmRfbG9ja19wZSgpIGFuZCBzcGlfbm9y
X3ByZXBfYW5kX2xvY2tfcmQoKSkgY2FsbAo+PiBzcGlfbm9yX3ByZXAoKSB0aGVuIHdhaXQgd2l0
aCBhIGtpbGxhYmxlIHNsZWVwLiBJZiB0aGUgc2xlZXAgZ2V0cwo+PiBraWxsZWQsIHdlIGxlYXZl
IHRoZSBjb250cm9sbGVyIGluIGl0cyBwcmVwYXJlZCBzdGF0ZS4KPj4KPgo+IFdoeSBkb2VzIHRo
aXMgb25seSBhZmZlY3QgbGVnYWN5IGNvbnRyb2xsZXJzPwoKQXJlbid0IC0+cHJlcGFyZSgpLy0+
dW5wcmVwYXJlKCkgY2FsbGJhY2tzIG9ubHkgaW1wbGVtZW50ZWQgYnkgbGVnYWN5CnNwaS1ub3Ig
Y29udHJvbGxlcnM/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
