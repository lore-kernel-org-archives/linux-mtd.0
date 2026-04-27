Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1FEFF885E
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2026 13:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDFP8TrTFt1bvII9fJqAHkO/NowLOBlWrQi9JjOaPwk=; b=sw5rvkNsRf145a
	5Y0a1OlBsXSxAcoFYiY25oAIttoP/rWUnEihd7I2wLV7293/F7MvzGVBXFIyK7dHAXU764oxknXvm
	ynr38pmRwnLKAQyqqxigNggzaVgXWy9DTcq+6Q+A2YA2LTKxmUZXWuc+OqHyG6njwtkCxV1SIa8dF
	4Cirr4NaiRvkyJwzkfmQF538nVSUZ/LvaZl23VL35M2FqTkU5TYy0aR8kuX+VnekGiaPfhQWz/IlH
	XffmWTwEUkMmJgHVxC6hmhfdRUWg8M5VcjZZ92tTG2rdGK6NCIWAROsCSBhMQHBLDOjQ8CkBjZYTb
	NkQKnVH+B3AiZ4E1E3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHM0V-0000000H0A6-1xlk;
	Mon, 27 Apr 2026 13:28:15 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHM0R-0000000H08w-38Lt
	for linux-mtd@lists.infradead.org;
	Mon, 27 Apr 2026 13:28:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BF5A14E42B2F;
	Mon, 27 Apr 2026 13:28:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C652600D1;
	Mon, 27 Apr 2026 13:28:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F2DD107281F7;
	Mon, 27 Apr 2026 15:28:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777296486; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=t+YbMxhDEFBqxdOaao9a2i/12aQWgAwFHh50CUJtreU=;
	b=cxvs/DzrYqeR3GWDvFgxxpZ0c8S5K+wK2Y0ri8esgmJX9ZqI26je63Jg1k1kIMtPdm3iLT
	uVAlgQPevpm5G4USDptHNU8Q8VcfPlzloz4SMfWcDyi2VBOOq1zMuovIPhoCISSygVcGlF
	IisvkT/0Eo7GoQdOH4EsqOmmnfpmUG6eY5BChtSMoYdnwbwvp4Nt1Uz/436Hhn0El2qdyl
	Fb40mq3m2QoWGI6wXGnubAgAjeDVcPEG8Fdcsbx0OmPx+ILLaG+8MDdSbvemn0d5WHwrG0
	WMh2RZ310ibY9RN8qMt9OAwx96O3ouiDdsxAmyrhIFmh7ESTv8ZTQQ4mZDAxAw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  Michael Walle <mwalle@kernel.org>,
  Takahiro Kuwano <takahiro.kuwano@infineon.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Steam Lin <STLin2@winbond.com>,  Santhosh Kumar K
 <s-k6@ti.com>
Subject: Re: [PATCH 0/4] spi: spi-mem/mtd: spinand: Prevent SPI NAND
 continuous reads on am65/am62
In-Reply-To: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-0-0d626e1dfb2b@bootlin.com>
	(Miquel Raynal's message of "Thu, 26 Mar 2026 17:47:14 +0100")
References: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-0-0d626e1dfb2b@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 27 Apr 2026 15:28:06 +0200
Message-ID: <87mryoh6s9.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_062811_952279_E30274A5 
X-CRM114-Status: UNSURE (   7.90  )
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

SGkgTWFyaywKCj4gTWFyaywgYXMgYWdyZWVkIGZvciB0aGUgY29udGludW91cyByZWFkIHNlcmll
cywgSSB3aWxsIG9mZmVyIHRvIHlvdSBhbgo+IGltbXV0YWJsZSB0YWcgd2l0aCB0aGUgc3BpLW1l
bSBwYXRjaGVzLCBpZiB5b3UgYWdyZWUgSSBjYW4gaW5jbHVkZSB0aGUKPiBzcGktbWVtIHBhdGNo
IGZyb20gdGhpcyBzZXJpZXMgYXMgd2VsbCAob25jZSB0aGUgZGlzY3Vzc2lvbiBvbiB0aGUKPiBh
cHByb2FjaC9uYW1pbmcgc2V0dGxlZCkuCgpBcyBkaXNjdXNzZWQsIEkgYW0gcHJlcGFyaW5nIGFu
IGltbXV0YWJsZSBicmFuY2ggd2l0aCB0aGUgc3BpLW1lbQpwYXRjaGVzIG9mIHRoZSAiV2luYm9u
ZCBTUEkgTkFORCBjb250aW51b3VzIHJlYWQiIHNlcmllcy4KClRoaXMgc2VyaWVzIGlzIHJlbGF0
ZWQgYnV0IEkgd2FudGVkIHRvIGRvdWJsZSBjaGVjayB3aXRoIHlvdTogY2FuIEkgdGFrZQp0aGUg
c3BpLW1lbSBwYXRjaCBhbmQgaW5jbHVkZSBpdCBpbiB0aGF0IGltbXV0YWJsZSBicmFuY2ggd2hp
Y2ggSSB3aWxsCnNoYXJlIHdpdGggeW91IGZvciBpbmNsdXNpb24gaW4gdGhlIHNwaSB0cmVlPwoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
