Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E0A606A323
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 09:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ifwELMB9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=w5vlP6IL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zkp7/fBTFXzH9rDVEhJYN8OsGnYGtQJKBkVql2RvwOc=; b=ifwELMB92V86tZE0STPivC2QC0
	z70lR7uYTgyKq92a06FtKBqzSjWw5pjhrJPfCWEPsv8358Zy3NDFzJVBdX4xCkkJHbORLm9qrwLbC
	g9QIkUyxXwdtUkiypGdvVHUBy88V7QhGz2kvxki5B5Ap6WVhSgbvprtDNLUN9zUfIyaYuveGoDAOa
	fuTlMTgrf5aiVTqj9xR7CVRhtJRYjNFG5FYV3f1nxVrsR+cDGDFap+xB9hX8CPkEhvm21VbSxocjL
	5sQ1ihL1KJf4L0An4Vcw5M49XhCoQb98/qER75oedfuXyZFKCc9RnJ6VnzBd6y7z55ZPWGEyQpXWD
	C0KdRRyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFY6-000000055mK-2iZ7;
	Tue, 17 Nov 2026 09:32:22 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFY3-000000055lO-42vE
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 09:32:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1554E4E40B00;
	Tue, 17 Nov 2026 09:32:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2F465FC81;
	Tue, 17 Nov 2026 09:32:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 33EDB11BC0B8F;
	Tue, 17 Nov 2026 10:32:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794907937; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IBxaDtxEFbt7EaXeVIegfF0agASFb0b/mgcN6FmZRmo=;
	b=w5vlP6IL/GycJsIMBHMBkgYPBSS75OMaJOjzH1dsEqPf4LEf9C4kiWOZ4Kg2Hsvhuc0+O5
	JFAtymxLsx6azH7GOpnh8nmHAdh0aC5lMNrMqF0fcnccQsY/5NKECpuCk8JrnMtr4AWKOW
	xKoDD/wESnByY9GgprQrfQho+H5ErjZCsDW80DjIX/AVycnIdkvfEHaSdv2UPmMOCl0Hgf
	68M+Eu5rqwUxW+p+x/GYRqD3cE/B3sEWE9cbj90AseIliq2kMjg/Zv06OenE0PSFE0UEs9
	ADxkoXJncxo0t2eMvOlfaESNTkG45wQDlvo7M6KTm7aiLNELi9SWkE2Cd+Snfw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Zhao Feng" <zhaofeng2@cmss.chinamobile.com>,
  linux-mtd@lists.infradead.org,  sashiko-reviews@lists.linux.dev,
  richard@nod.at,  michal.simek@amd.com
Subject: Re: [PATCH 1/2] mtd: rawnand: fix GPIO descriptor leak in
 rawnand_dt_parse_gpio_cs()
In-Reply-To: <sashiko-outbox-205535@kernel.org> (sashiko-bot@kernel.org's
	message of "Mon, 09 Nov 2026 20:05:33 +0000")
References: <20261109052724.1032-1-zhaofeng2@cmss.chinamobile.com>
	<20261109052724.1032-2-zhaofeng2@cmss.chinamobile.com>
	<sashiko-outbox-205535@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 10:32:13 +0100
Message-ID: <87eccjolb6.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_013220_148646_D8CBFC85 
X-CRM114-Status: UNSURE (   6.61  )
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

T24gMDkvMTEvMjAyNiBhdCAyMDowNTozMyBHTVQsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3Jv
dGU6Cgo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3
IGZvdW5kIG5vIG5ldyBpc3N1ZXMKPiBpbiB0aGlzIHBhdGNoLCBidXQgbm90aWNlZCAxIHJlbGF0
ZWQgcHJlLWV4aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90Cj4gaW50cm9kdWNlOgo+IC0gW01lZGl1
bV0gbXRkOiByYXduYW5kOiBhcmFzYW46IEdQSU8gZGVzY3JpcHRvciBsZWFrIGluIGFuZmNfcHJv
YmUoKQo+ICAgYW5kIGFuZmNfcGFyc2VfY3MoKSBbMV0KCkkgYmVsaWV2ZSBzd2l0Y2hpbmcgdG8g
dGhlIG1hbmFnZWQgdmVyc2lvbiBsaWtlIFNhc2hpa28gcHJvcG9zZXMgaXMgYQpiZXR0ZXIgYXBw
cm9hY2guCgpDYW4geW91IHBsZWFzZSByZXNwaW4/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
