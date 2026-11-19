Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A5D606A33D
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 12:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qY38Grfr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=V4ram5fM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oX6W+ouKB5ydy8i1ErufPej5kw1sb0o8Cxn/s9xm4Cs=; b=qY38GrfrKbJlZd37CrEMaaXG4p
	ezWAqyrxn+5cKkZqUmZOrYqBR7Arw7zljsNVciENWMkkNTM8s/5y70BSIjOOpf092pXgCuOSoOtV+
	/p5swSA/fEta9rKFib16dJJliZUa0srp4Z5F5l4sTbSEx0EHZVlCCOzPq36xMoekUazD1RMEzSNET
	I+73r1wSlNQu8Yx78ugDz2IuNFGJiKlZbxJM4vCz5b/P8D+UF05fIpdNymmnTffMl8NhVRi2uN+2S
	Bjk4DXTcCXsWk8HXnw//VqqzWb21nM4lITG1fnc2mb3xa8j9f/C21blJ0gyfzTe5CHhzPKDuulDoZ
	/wwrabxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1OR-0000000BrUa-3qRz;
	Thu, 19 Nov 2026 12:37:35 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1OL-0000000BrOu-0qBN
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 12:37:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DB1CCC4CBF5;
	Thu, 19 Nov 2026 12:37:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9D84060237;
	Thu, 19 Nov 2026 12:37:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C375411BC05F4;
	Thu, 19 Nov 2026 13:37:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795091847; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wMTVp4RCbnjnn/8YS/U7H/wC9SRIjlDLdXyhSR363UM=;
	b=V4ram5fMUuigIRc3Fs8dsN0ybdczSmRqhfkdgfqlHEPeg7TSF//X/uH5t7dPbwBggZQeX2
	0CmE3bSrUlaalqTRKR0dAK8DXwyq+LwL2lNBZ18qXHnmpltH7CDFFvngjS1mxtvWydzMka
	nIZ+5QuND2VWRvKDy/tJkKtpQ1tyVaWg3NhH5oMRMXkTPo4DV/WLJdmJjrtXxYLCATbMGS
	YwDkwg+rL9bgOJk8LFRBNFXb6CO47bZSVO3wUNf0mDgrJdIYsyEuV531I4aA9Bs0RWAiby
	wuy5v+HOQ7GL9ItYhwaViWGzEuGmEmXBwFdegjrrazef94YDU19MrsOdBdU9uw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Thomas Gleixner <tglx@kernel.org>, 
 "Artem B. Bityuckiy" <dedekind@infradead.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261118-submit-rawnand-bbt-scan-error-v1-v2-1-c7b71dd22ad6@gmail.com>
References: <20261118-submit-rawnand-bbt-scan-error-v1-v2-1-c7b71dd22ad6@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: abort BBT creation on scan failure
Message-Id: <179509184572.2889394.2633668875586837291.b4-ty@bootlin.com>
Date: Thu, 19 Nov 2026 13:37:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_043729_985619_8C0F5ABC 
X-CRM114-Status: UNSURE (   9.21  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCAxOCBOb3YgMjAyNiAxMDozNzoyOCAtMDcwMCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6
Cj4gQSBub24tRUNDIGVycm9yIHJlYWRpbmcgYSBmYWN0b3J5IGJhZCBibG9jayBtYXJrZXIgZnJv
bSBPT0Igc3RvcHMgdGhlCj4gc2Nhbi4gY2hlY2tfY3JlYXRlKCkgaWdub3JlcyB0aGUgZXJyb3Ig
YW5kIGNhbiB3cml0ZSB0aGUgcGFydGlhbCB0YWJsZQo+IHRvIGZsYXNoIGFzIGJvdGggdGhlIHBy
aW1hcnkgYW5kIHRoZSBtaXJyb3IuIEJvdGggY29waWVzIHRoZW4gbGlzdAo+IHVuc2Nhbm5lZCBm
YWN0b3J5LWJhZCBibG9ja3MgYXMgZ29vZC4KPiAKPiBSZXR1cm4gdGhlIHNjYW4gZXJyb3IgYmVm
b3JlIHNldHRpbmcgdGhlIHRhYmxlIHZlcnNpb25zIG9yIHdyaXRpbmcKPiBlaXRoZXIgY29weS4K
PiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogcmF3
bmFuZDogYWJvcnQgQkJUIGNyZWF0aW9uIG9uIHNjYW4gZmFpbHVyZQogICAgICBjb21taXQ6IDI3
YzYxYzUyMGU5NDQ0ZDBiMTZjZDhlMTBjMTNkOGI2N2Y4MGFkZWUKClBhdGNoZShzKSBzaG91bGQg
YmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4
dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJl
Z2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
