Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E701D606A330
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 16:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GLgC8BjJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=riGSXRd/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TgvMGl3sfRBDdQKdE3VEMSwKQlBeQdF4qtlDFl6iGvc=; b=GLgC8BjJtOHbtebF0dlITXendu
	kYqwqC7ZxqRdKNOTETuXvC+0LRZCeP0CdUdFBFCk2q0Sy9Old/YrvUM13e2PLMeRHpFWpmXGGE3bc
	+T5udKeD04+w8t07IH6UGprJdxrbfXmE6YL7VdUXACwDu5+do602+7RekAwZarqP92jGQGawSfs/i
	udnISWKc3NB5fPBS8BpMBQjAQ0Q7mFCQJ5mz2N2ERR7o6Jn+ws9wRQJPSOMvVTb2XWtQHcI4/GgtM
	rLH/8gfpC18lpuAX6XwpQ/DJ9yki6KJo6p7QIwebouIzKf5+B/XU1ZTYssVbCDLB7bG3SuaC1Sonn
	17EQdJbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzJj-00000003AZF-3VJS;
	Mon, 16 Nov 2026 16:12:27 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzJh-00000003AYk-1wqY
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 16:12:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 09F72C4EFDB;
	Mon, 16 Nov 2026 16:12:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 017136023F;
	Mon, 16 Nov 2026 16:12:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 043D111BC146D;
	Mon, 16 Nov 2026 17:12:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794845538; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WL42cWBPuyCFWlEF/5Nn+QC5AN/XCgSMhpRtAl3fZBE=;
	b=riGSXRd/myHb5u8n6/BiinflJE9PCHCIQkASe3+enQEEMPlS7Ns9BC/mT0H8WJG0Wjjh1w
	f+lviNzHVXBT0Y3e+PoiY/lYOA/3wT6CQkvrsuECFuKu0vR9uZy6Ex/ZRAd9fOCJxlfhph
	6IjvX4jHgGcTfDtre56AbRQF1YEtTtLhNRxeh9fqdiMetaWEJ+aZMOiIbzhf3q0/Ta59Cs
	qN+sCfUXAnfDG/obKM035JktQEN8+OYExdWfqteguehklPj4DwfQMU3W5KYJfQPUVRl/+h
	s3eNdFnAFvuaIU4aqN5ts6KXvkmm45MfkBKEBJfOcwzNJGQN1OzX7vtpu/n2Hw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: Han Xu <han.xu@nxp.com>,  "sashiko-reviews@lists.linux.dev"
 <sashiko-reviews@lists.linux.dev>,  "richard@nod.at" <richard@nod.at>,
  "vigneshr@ti.com" <vigneshr@ti.com>,  "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>,  "imx@lists.linux.dev" <imx@lists.linux.dev>,
  Daniel Baluta <daniel.baluta@nxp.com>,  "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>,  "Frank.Li@kernel.org"
 <Frank.Li@kernel.org>
Subject: Re: [EXT] Re: [PATCH] mtd: rawnand: gpmi: Fix possible NULL pointer
 dereference in gpmi_nfc_exec_op()
In-Reply-To: <DB7PR04MB4474F2E3C2C31984F1A0C8299D772@DB7PR04MB4474.eurprd04.prod.outlook.com>
	(Stefan Ghetu's message of "Thu, 5 Nov 2026 10:49:48 +0000")
References: <20261105103410.4424-1-stefan.ghetu@nxp.com>
	<sashiko-outbox-198870@kernel.org>
	<DB7PR04MB4474F2E3C2C31984F1A0C8299D772@DB7PR04MB4474.eurprd04.prod.outlook.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 16 Nov 2026 17:12:14 +0100
Message-ID: <87se10pxgh.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_081225_671266_38399B9F 
X-CRM114-Status: GOOD (  12.45  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgU3RlZmFuLAoKT24gMDUvMTEvMjAyNiBhdCAxMDo0OTo0OCBHTVQsIFN0ZWZhbiBHaGV0dSA8
c3RlZmFuLmdoZXR1QG54cC5jb20+IHdyb3RlOgoKPiBIaSwKPgo+IFRoZSByZXZpZXcgaXMgcmln
aHQuCj4KPiBNb3ZpbmcgdGhlICFkZXNjIGNoZWNrIG91dCBvZiB0aGUgbG9vcCBsZXRzIHRoZSBs
b29wIGNvbnRpbnVlIGFmdGVyIGFuCj4gaW50ZXJtZWRpYXRlIGdwbWlfY2hhaW5fKCkgZmFpbHVy
ZS4gVGhhdCBjYW4gc3VibWl0IGEgdHJ1bmNhdGVkIERNQQo+IGNoYWluIGFuZCwgb25jZSBnZXRf
bmV4dF90cmFuc2ZlcigpIGhhcyByZXR1cm5lZCBOVUxMLCBpbmRleCBwYXN0Cj4gdGhpcy0+dHJh
bnNmZXJzW10gYm90aCBpbiB0aGUgbG9vcCBhbmQgaW4gdGhlIHVubWFwIGNsZWFudXAuCj4gVGhl
IG9yaWdpbmFsIGNvbmNlcm4gZG9lcyBub3Qgc2VlbSByZWFjaGFibGUgZWl0aGVyOgo+Cj4gKiB0
aGUgY29udGludWUgaW4gdGhlIE5BTkRfT1BfQ01EX0lOU1RSIGNhc2Ugb25seSBoYXBwZW5zIHdo
ZW4gdGhlIG5leHQKPiAgaW5zdHJ1Y3Rpb24gaXMgTkFORF9PUF9BRERSX0lOU1RSLCB3aGljaCBz
ZXRzIGFuZCBjaGVja3MgZGVzYzsKPiAqIGEgemVyby1sZW5ndGggTkFORF9PUF9EQVRBX0lOX0lO
U1RSIG9ubHkgYnJlYWtzIG91dCBvZiB0aGUgc3dpdGNoLCBzbwo+ICB0aGUgZXhpc3RpbmcgaW4t
bG9vcCBjaGVjayBzdGlsbCBjYXRjaGVzIGRlc2MgPT0gTlVMTDsKPiAqIHRoZSBjb3JlIGhlbHBl
cnMgZHJvcCB6ZXJvLWxlbmd0aCBkYXRhIGluc3RydWN0aW9ucyAob3IgcmVqZWN0IHRoZW0KPiAg
d2l0aCAtRUlOVkFMKSwgc28gLT5leGVjX29wKCkgbmV2ZXIgZ2V0cyBhbiBvcGVyYXRpb24gd2l0
aG91dAo+Cj4gU28gdGhlIENvdmVyaXR5IHJlcG9ydCBsb29rcyBsaWtlIGEgZmFsc2UgcG9zaXRp
dmUgYW5kIHRoZSBjdXJyZW50IGNvZGUKPiBpcyBjb3JyZWN0Lgo+Cj4gUGxlYXNlIGRyb3AgdGhp
cyBwYXRjaC4KCk9rLCB0aGFua3MgYSBsb3QgZm9yIHRoZSBmZWVkYmFjay4KCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
