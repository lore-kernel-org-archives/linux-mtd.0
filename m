Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0A4C9830E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 09:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fOoK4j9m08HHIJnGnwjUWOzLFAXnUYAnXj7g/tEm6v8=; b=Ujpib4ivgRNuu7
	+yCXPMwCYSK5K5WIFpmClubkZNf1Iwb4NgfvPaQxu38zZvC3xJOyPSIU38k1DeZ+WmyBhpeeUAW/T
	zold1IfI0zVSkZBiCOyqv50FMtrqwVzBXhRQ23stbfj0Un+JCAm0cJj40qCjvfTH0l+4Yg4lB0O6H
	dH6d08eBxgNpwpcB8FiT/7zzsLklNX5pYD1qclL6FVMMP4lT8QTCGAP468SC4IUKnmJWCTXYNPBln
	kVHZ3+8pznGMrVJtvF7rWqIAKzzhKvyqWwBlensZ/84Q6e9uLplFHQ69He5M1u32XF2g8ypbULudX
	kxDcCUZlTAzyQtsMOgPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA22j-0000000CzFQ-0hzR;
	Fri, 25 Sep 2026 09:16:33 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA22f-0000000CzEV-481M
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 09:16:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0B61EC1398D;
	Fri, 25 Sep 2026 09:17:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C2776073B;
	Fri, 25 Sep 2026 09:16:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0303210329543;
	Fri, 25 Sep 2026 11:16:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790327784; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VAM2zKaXbRHAZBolCeZEexW2NVFPQHgd0dEpNrhq6ZY=;
	b=B+zOett2EXQ8qVFecZDYSDrM3Nlgl4MSIH9mAT1mNb2Tvs3GEMTis4hEG2fe/CRxdqQxV2
	DfAGmXk0PXnNQfEQa4ofN0JFghfk0X6H4FXKrOIBwJr5CcgAu416BIMMka5pdvYRa1L0FD
	aGN0fSz6kGxropNIfT9MNdKby41lAq/3gEFAYneb9VesJn3Ii0qF6ka4X7DMMrTJXoRbk3
	FRrbUpImJwxRnT47W7wJ3hdxVtXnNkZG9NQkU9EI0RA4iDpGAy1ZDXt05vsMJF3EUK32qB
	WqsoeRl50KRdmK3FjN1tUU923tEwh2586A9e6T8DtlDjWXbhHHnBUYMjyLgfDw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: arasan: Add ZynqMP props
In-Reply-To: <20260922183138.290114-1-robh@kernel.org> (Rob Herring's message
	of "Tue, 22 Sep 2026 13:31:38 -0500")
References: <20260922183138.290114-1-robh@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 25 Sep 2026 11:16:21 +0200
Message-ID: <877bk9n122.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_021630_201497_0B3969D3 
X-CRM114-Status: GOOD (  10.27  )
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

SGkgUm9iLAoKPiArICBudW0tY3M6Cj4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9k
ZWZpbml0aW9ucy91aW50MzIKPiArICAgIG1pbmltdW06IDEKPiArICAgIG1heGltdW06IDIKCkkg
YW0gbm90IHN1cmUgSSBnZXQgd2hhdCBpcyB0aGUgcHVycG9zZSBvZiB0aGlzIHByb3BlcnR5LiBJ
dCBsb29rcyBsaWtlCmEgZG93bnN0cmVhbSBwcm9wZXJ0eSByZXN1cmZhY2luZy4gV2UgZXhwZWN0
IG9uZSBEVCBzdWJub2RlIHBlciBjaGlwLCBzbwpJIGRvbid0IHNlZSB0aGUgbmVlZCBmb3IgbnVt
LWNzLCB3ZSBqdXN0IG5lZWQgdG8gY291bnQgdGhlIGNoaWxkcmVuCm5vZGVzLiBGb3IgbWUsIHRo
ZSBjb3JyZWN0IGZpeCBpcyB0byBkcm9wIG51bS1jcyBmcm9tIHRoZSB1cHN0cmVhbSBEVC4KVGhl
IG9ubHkgcmVhbCB1c2UgZm9yIGl0IHdvdWxkIGJlIGlmIHRoZSBoYXJkd2FyZSBjb3VsZCBiZSBz
eW50aGVzaXplZApkaWZmZXJlbnRseSwgd2l0aCBhIHNpbmdsZSBDUyBpbnN0ZWFkIG9mIDIsIGJ1
dCBJIGRvbid0IHRoaW5rIGl0J3MgdGhlCmNhc2UgaGVyZS4KCj4gKwo+ICsgIHBvd2VyLWRvbWFp
bnM6Cj4gKyAgICBtYXhJdGVtczogMQoKVGhpcyBvbmUsIGV2ZW4gdGhvdWdoIHdlIGRvbid0IGFj
dGl2ZWx5IHVzZSBpdCBpbiBMaW51eCwgaXQgbWF5IHNlcnZlIGEKcmVhbCBwdXJwb3NlLgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
