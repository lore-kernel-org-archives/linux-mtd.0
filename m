Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA768109C021
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2026 14:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJeyw/9qiYpoqp/eTqKbMKDhiPKZzlHgwYxuI37PSZM=; b=d95RMM1cD9ZSxb
	E1v3VisCd3RFteEp7zkgTo2Q+WkKI9+9DDiuZaIicND7EQ5lcra3O3hY8LSk43ysI3IYmcEOCJqk6
	SXzNIk2As6GfzV3pg70dVG+fPimNzEeW75BUtIFf2DQUGQRBmMZKcyfAd8mhw+lZfC5Mz/u3EC9WW
	kgyONsrnXQ9bwhhmLi4ZeT0ymlkrtrTlZUIIWAX5aKCRl3AfmvwDTqM2VfYX5KSDPghpxDlCJFJ4M
	xvG72PWbDtjb1Jn1ReT/F8sjPeJsz96tU4BPMwfzm/ZbF8g4OYXkvegzSINCi/X4ZfnWsRO7K2tsS
	EA4tsKcnD6FXRVcQHaJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PEy-00000003bcg-1elB;
	Wed, 25 Mar 2026 14:29:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PEx-00000003bal-0dtt
	for linux-mtd@bombadil.infradead.org;
	Wed, 25 Mar 2026 14:29:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=robXKJegIjydebPzooqXhWMK8yOnBv9Hk4kcGPso3so=; b=p1OKt/v8JcOi3yNwNvv+l3yGFU
	I+xNOAhdNktYjvladLv7qlmxhKgV2bdCIpC6yagchQLGxjrjyKoWdIVVUnv6z4wo55dGPhn/ugBdZ
	LTv83CH81qF5LcpOW+AoA3iNzGuGRbDrVz97L+fbjOOdcznvUXDnttfot7yvC4FvAe4SvPmze+jeq
	oQotDZ3yJnTJdgtYwBPvvaAY/ofztuilpt8wq8RL5i9QQdYl2dHCRrdCdU6F4ZIm0MtzGv0hvSknG
	+uSVx603jVydLj9yEvQCef7O8F1XS69lw2iS9wc7FS8l8hNFNSKnyMh9dl5nz0HJWUcpv7LRqXrOT
	3gDWAO2A==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PEu-00000006M3O-13bM
	for linux-mtd@lists.infradead.org;
	Wed, 25 Mar 2026 14:29:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 53513C580B1;
	Wed, 25 Mar 2026 14:30:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8D0C8601E2;
	Wed, 25 Mar 2026 14:29:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C67710451423;
	Wed, 25 Mar 2026 15:29:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774448974; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=robXKJegIjydebPzooqXhWMK8yOnBv9Hk4kcGPso3so=;
	b=MhR8WhEJWqRvtsJv+lIBlqXEsJH02pGNkjH+rgcd3SgSwzyCV3UPgArdqrr96P0nirQGm4
	0cV+s+EMJ9Z5gVQ9v60EAA+OifI7QkSf7Yp0g0WCep7wYmfgk9Je4TVCPXYHeZbfA3Z3D5
	zbVEesrrlo0zAJzxyfL3eX8kJXLRp1FY9D/tRqi6Mr91PKUarlh1Fxf9E6wovylCFgdCNh
	Ma7iKDKlonWZGmTUkRO5o7J9wwJOrHy3iblkjypOFkVHLN3QJzu8hN2l+KQMp5So4Ex/B0
	R/djA76DIxMzEnbhMo0Kd5RfYxw1MUp0RJu1O0ed7aT3wxjVBfcoLVnz0SLISA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Steam Lin <stlin2@winbond.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260318104750.581596-1-miquel.raynal@bootlin.com>
References: <20260318104750.581596-1-miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: spinand: winbond: Clarify when to enable the HS
 bit
Message-Id: <177444897237.837464.5001169296387669838.b4-ty@bootlin.com>
Date: Wed, 25 Mar 2026 15:29:32 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_142944_350383_2884C4CE 
X-CRM114-Status: UNSURE (   8.33  )
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

T24gV2VkLCAxOCBNYXIgMjAyNiAxMTo0Nzo1MCArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
PiBBYm92ZSAxMDRNSHogd2hlbiBpbiBmYXN0IGR1YWwgb3IgcXVhZCBJL08gcmVhZHMsIHRoZSBk
ZWxheSBiZXR3ZWVuCj4gYWRkcmVzcyBhbmQgZGF0YSBjeWNsZXMgaXMgdG9vIHNob3J0LiBJdCBp
cyBwb3NzaWJsZSB0byByZWFjaCBoaWdoZXIKPiBmcmVxdWVuY2llcywgdXAgdG8gMTY2TUh6LCBi
eSBhZGRpbmcgYSBmZXcgbW9yZSBkdW1teSBjeWNsZXMgdGhyb3VnaCB0aGUKPiBzZXR0aW5nIG9m
IHRoZSBIUyBiaXQuIEltcHJvdmUgdGhlIGNvbmRpdGlvbiBmb3IgZW5hYmxpbmcgdGhpcyBiaXQs
IGFuZAo+IGFsc28gbWFrZSBzdXJlIHdlIHNldCBpdCBhdCBzb29uIGFzIHdlIGdvIG92ZXIgMTA0
TUh6Lgo+IAo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCwgdGhhbmtzIQoKWzEvMV0g
bXRkOiBzcGluYW5kOiB3aW5ib25kOiBDbGFyaWZ5IHdoZW4gdG8gZW5hYmxlIHRoZSBIUyBiaXQK
ICAgICAgY29tbWl0OiAyNWE5MTVmYWQ1MDNjMjY3ODkwMjA3NTU2NWQ0N2RkYzJhYTQ1ZGI5CgpQ
YXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJl
CnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5
IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
