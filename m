Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19140CAC5B0
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Sep 2025 16:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/rb03TXqeXIxONe2R0L8tCUG7xtleYI/zMmog65s8eg=; b=pMpmj87gtzSfbE
	otKLtd6FxwPYV9eIx/TIGoV/2h+yg4aVNRRnL+Hg1apEkvCwOGUgnFLNifSKUrsIYa7MomScJLnzb
	f/yruVHguzP4FxbElr0VGTY10+VjqGqrmpQzKvQ2TbSRxvKAjpRs7or+JQ7d0FQiL7Anfxp7OF3L0
	Kb5IMsYET/oxYXOCAaYuT+pEtRdAWTLNLpWE+xO1LwYvPfrEgA9Q1AadSH6A09dZS/y6Yjt76o8fL
	NhCxpeLTLv6WJ1JcpuiT4v1pPzntA/QqMvFr7JfNZxnnx+FTTxUuDLnx7u3E1R1TkN9dXsA4XSiTP
	S/BH+nRKXmw6s+g9lK8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GLQ-00000002tBQ-28rO;
	Mon, 29 Sep 2025 16:03:20 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GLO-00000002t8o-1KwI
	for linux-mtd@lists.infradead.org;
	Mon, 29 Sep 2025 16:03:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EB0A71A0F7A;
	Mon, 29 Sep 2025 16:03:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0A5E606AE;
	Mon, 29 Sep 2025 16:03:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10995102F1892;
	Mon, 29 Sep 2025 18:03:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759161796; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=96HEK4UvGCOo8Woo1oy+a2odFHzZgoRuFfoU8CA6IEw=;
	b=xQ740c/6iaZTnCc/giPM9R+u8rp4EOQWA0FFEej9Sh4ewD6Y10jYcCo4LlEmBO2aW6BPSs
	EIdoYs12ibW1QZHTwoyxIjfYBPKm3RJjQ2MkiPcSmdofc90GfmTtAHDQh0Rnu0mvwjo8JT
	L2T+zQgCuYD9EvdO2Kg8ftKpJuRO3ZEbT7RFp0HDB5YVLDB8M6S0sP4PlW6hMEwAWbSdJO
	jL6b6OO8Dq1051tvgrc8m4UX1jDxdqDurfkDuz3dKFwkCiysUUtIY1whDZzMX7ixkK4dUN
	l9cY3E9Ul2+CGNM2321atV6aWatEwzjFtfOAiYTAOYO6fWZ7dYQmfqfDF3pYwg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, Rahul Kumar <rk0006818@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
In-Reply-To: <20250922071137.900508-1-rk0006818@gmail.com>
References: <20250922071137.900508-1-rk0006818@gmail.com>
Subject: Re: [PATCH] mtd: jedec_probe: use struct_size() helper for cfiq
 allocation
Message-Id: <175916179288.52129.13789986252755392222.b4-ty@bootlin.com>
Date: Mon, 29 Sep 2025 18:03:12 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_090318_487764_B8306AF2 
X-CRM114-Status: UNSURE (   5.37  )
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

T24gTW9uLCAyMiBTZXAgMjAyNSAxMjo0MTozNyArMDUzMCwgUmFodWwgS3VtYXIgd3JvdGU6Cj4g
RG9jdW1lbnRhdGlvbi9wcm9jZXNzL2RlcHJlY2F0ZWQucnN0IHJlY29tbWVuZHMgYWdhaW5zdCBw
ZXJmb3JtaW5nCj4gZHluYW1pYyBzaXplIGNhbGN1bGF0aW9ucyBpbiB0aGUgYXJndW1lbnRzIG9m
IG1lbW9yeSBhbGxvY2F0b3IKPiBmdW5jdGlvbnMgZHVlIHRvIHRoZSByaXNrIG9mIG92ZXJmbG93
LiBTdWNoIGNhbGN1bGF0aW9ucyBjYW4gd3JhcAo+IGFyb3VuZCBhbmQgcmVzdWx0IGluIGEgc21h
bGxlciBhbGxvY2F0aW9uIHRoYW4gZXhwZWN0ZWQuCj4gCj4gUmVwbGFjZSB0aGUgc2l6ZSBjYWxj
dWxhdGlvbiBpbiBjZmlxIGFsbG9jYXRpb24gd2l0aCBzdHJ1Y3Rfc2l6ZSgpCj4gaGVscGVyIHRv
IG1ha2UgdGhlIGNvZGUgY2xlYXJlciBhbmQgaGFuZGxlIG92ZXJmbG93cyBjb3JyZWN0bHkuCj4g
Cj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogamVkZWNf
cHJvYmU6IHVzZSBzdHJ1Y3Rfc2l6ZSgpIGhlbHBlciBmb3IgY2ZpcSBhbGxvY2F0aW9uCiAgICAg
IGNvbW1pdDogNTI3NjY4ODY4ODYyZTBkYjY1ZWZjODhmZTgyMDQwZjFlNDhkNGFiMwoKUGF0Y2hl
KHMpIHNob3VsZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0
IG9mIHRoZSBuZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVu
KS4KCktpbmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
