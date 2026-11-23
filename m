Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFA4606A31A
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 14:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bAiiWMsB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=z9oT49X9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9gHCBR+IKkDigWJv/JS6q+R97rdhvD2fqn67NOv5Kl4=; b=bAiiWMsBigIY1ltQNyPlXohWmz
	vjjxuX0NPb72SXd6VVu5Ppb8Pe4UB0hFk8SwGCQSvb4ICXPkTc11KVUgF0uNgdeR9vXtcO8sCkTwU
	s9JG9OkU3CIViYrrfUKtgPKwoNgwXVbttu0QFUaP6tEb6Cog/Xn/uRisScJTBHE0gOYXYTtkNDpe4
	c+jUsmIWk3A2LwK5cBn4AQUE4lk1q7RIxy7PIR3qo1RpEQcTpRv9/sshba8E6UomnkzSeDGsv5RFC
	b0vaKKczGI8MubKIxcqahlXedS4MUnbIn6PdtYxhChzj3ZHPpmeQoelzTDx468bumAOXW3yCMJ3tQ
	hLylAQoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVGM-00000003mCY-2ttR;
	Mon, 23 Nov 2026 14:43:22 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVGK-00000003mBd-0OKT
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 14:43:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 03B9FC69161;
	Mon, 23 Nov 2026 14:43:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DF23B601E1;
	Mon, 23 Nov 2026 14:43:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F32911E6A573;
	Mon, 23 Nov 2026 15:43:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795444992; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K2ZBTu5FPEAc2aDNIGM3UHtvI9TE4pMe5TUNHjDZbP0=;
	b=z9oT49X9XmE6aTc9yjc9P+kCRuzonn0YVsqXu9jffgdJa+BOlvuXcFP/F2UwLZ02B1cxip
	y/VQD07mij/5JHEGyuKtrcJvIg73tB4Yi4oOGFQw/RD0SNOSnta5qOslkpU6g/WEWMj3gH
	Hrc8tqmAJt+fteEU6q2HR5l8pxT1NUP+marovUsn73IAJGlsdvGWIsOHYy7VUKekW25TG6
	stjpavVSuAULVJLOpIOGKYnGe/S3WRxZcsasVxhxGk2HhnKz/a2siDbUbIa9lczE0s4atc
	qY/YhG/Ulz8BHAhdojPSJufV5AoxGZRaOhusN4PUnTGYn7zI3p6MKgIQFJWqLA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?B?VsOtdCBLYXrDrWs=?= <vitkazik@vitkazik.cz>
Cc: richard@nod.at,  vigneshr@ti.com,  tudor.ambarus@linaro.org,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  m.felsch@pengutronix.de,  sshivamurthy@micron.com
Subject: Re: [PATCH] mtd: spinand: micron: add support for MT29F1G01AAADD
In-Reply-To: <DF6A2762-566D-4A13-892A-AA18B9F987F0@vitkazik.cz>
 (=?utf-8?Q?=22V=C3=ADt_Kaz=C3=ADk=22's?=
	message of "Sun, 22 Nov 2026 00:26:20 +0000")
References: <20261121234125.16093-1-vitkazik@vitkazik.cz>
	<DF6A2762-566D-4A13-892A-AA18B9F987F0@vitkazik.cz>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 23 Nov 2026 15:43:08 +0100
Message-ID: <87mrqztxqb.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_064320_274762_2586C8DE 
X-CRM114-Status: UNSURE (   7.70  )
X-CRM114-Notice: Please train this message.
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

T24gMjIvMTEvMjAyNiBhdCAwMDoyNjoyMCBHTVQsIFbDrXQgS2F6w61rIDx2aXRrYXppa0B2aXRr
YXppay5jej4gd3JvdGU6Cgo+IEhpLAo+IEkgZm91bmQgTWFyY28gRmVsc2NoJ3MgZWFybGllciBz
dWJtaXNzaW9uIGZvciB0aGlzIGNoaXAgKDIwMTkvMjAyMCkKPiBvbmx5IGFmdGVyIHNlbmRpbmcg
dGhpcyBwYXRjaCwgYW5kIGhhdmUgcmVhZCB0aGF0IGRpc2N1c3Npb24gbm93LiBNeSBwYXRjaCB3
YXMgd3JpdHRlbiBpbmRlcGVuZGVudGx5IGZyb20gdGhlIGRhdGFzaGVldCwgYW5kIGl0IGFscmVh
ZHkgdXNlcwo+IDQtYml0LzUxMi1ieXRlIEVDQyBhcyBhZ3JlZWQgdGhlcmUuCj4KPiBPbmUgZGlm
ZmVyZW5jZSBpcyB0aGUgZnJlZSBPT0IgYXJlYS4gSSBleHBvc2UgYnl0ZXMgMi03IG9mIGVhY2gK
PiBzZWN0aW9uLCBmb2xsb3dpbmcgVGFibGUgMTEsIHdoaWxlIE1hcmNvJ3MgdmVyc2lvbgo+IGV4
cG9zZWQgYnl0ZXMgNC03IHNvIHRoYXQgdGhlIGZyZWUgYXJlYSBpcyBhbHdheXMgRUNDLXByb3Rl
Y3RlZC4gSSdtCj4gaGFwcHkgdG8gc3dpdGNoIHRvIDQtNyBpZiB0aGF0IGlzIHByZWZlcnJlZC4K
ClllcyBwbGVhc2UuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
