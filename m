Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE06CAC5A5
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Sep 2025 07:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OeamJegFKT4Koy+7th+8o7mQzZIyv57WlxdMxPm+jlg=; b=vtf8bh3+SOWscY
	zgXVN0nhC0B5JyrwJcDpUkCQVlmbklcvY9OyOEgIkB23tqSfi+PkgpS3ermXRyzxzQqS8gWaGVAmF
	c5W2Ys+FcssfGhJRBrL6ex3rdL2kXRb8XPDiioXgC73oyDY/wnMskR2RmQfJB8gZysZg9/A6VNFps
	Na6vnoMDOjr+xB4EWv2IvwPlzlkjp2Y/Il10blQQBGQPlWuv/mprPLBpkurn/fY7CZxGnO6ahcuVH
	bTUlQC+6pJjCw9ok/AYTI0TY0Qk2tKEphytte5FMqCFIUSBnFucyREVP1IPbJUa2gP3+818/s3NxA
	uddipr0G6oLrFDJbpLdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1KA1-0000000FltQ-12KP;
	Wed, 24 Sep 2025 07:43:33 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1K9x-0000000Flsf-2IEj
	for linux-mtd@lists.infradead.org;
	Wed, 24 Sep 2025 07:43:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A276B4E40D1A;
	Wed, 24 Sep 2025 07:43:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70DBA606B5;
	Wed, 24 Sep 2025 07:43:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95138102F18E0;
	Wed, 24 Sep 2025 09:43:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758699803; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kVm9WUZprq8Oz+SY2IG0V7UF+iOnsRaBXZJyJc3BusM=;
	b=fMXEa7IiY4ulp0K7jeHZd9LsNKG+xjGqwEvwAj+h0qnZHKX5YNdLm1mKcJifroCcZmjhNa
	jqziOwapABmIWd71jA9sYCVMsO+D4iwqbKBu8NtfEi15LTcg3g22mCSkrJwbvm9nJFBb4X
	p58L7YIk6c54TSBNcZd66cQkOxvL/Lub34FIh9H4WkHEadnZuFJx27BHS60N66bgRf/1cm
	3RfT6aszI0rOLd4OFnzq8m60yAi4WlXOsIZTyUzAvB8DMc7NRmNMO0WW1sKfiRmvZu/yKc
	4wGWfk0gCCJ0nwzun9nKaWgBjEjT/hl/Shb5HBn4eGKTxNfuwT2V1S5DQ2F+/A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Johan Hovold <johan@kernel.org>,  linux-mtd@lists.infradead.org,  LKML
 <linux-kernel@vger.kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: rawnand: omap2: fix device leak on probe failure
In-Reply-To: <1341dc6b-49da-44f9-8b57-6828a64114fe@web.de> (Markus Elfring's
	message of "Tue, 23 Sep 2025 19:05:19 +0200")
References: <20250922152204.15702-1-johan@kernel.org>
	<1341dc6b-49da-44f9-8b57-6828a64114fe@web.de>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 24 Sep 2025 09:43:16 +0200
Message-ID: <87zfakpa7f.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_004330_075041_BDE5FAD1 
X-CRM114-Status: UNSURE (   6.95  )
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

SGkgTWFya3VzLAoKPj4gQEAgLTIwODMsMTAgKzIwODQsMjQgQEAgc3RhdGljIGludCBvbWFwX25h
bmRfYXR0YWNoX2NoaXAoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPj4gIAkJZGV2X2VycihkZXYs
Cj4+ICAJCQkiTm90IGVub3VnaCBPT0IgYnl0ZXM6IHJlcXVpcmVkID0gJWQsIGF2YWlsYWJsZT0l
ZFxuIiwKPj4gIAkJCW1pbl9vb2JieXRlcywgbXRkLT5vb2JzaXplKTsKPj4gLQkJcmV0dXJuIC1F
SU5WQUw7Cj4+ICsJCWVyciA9IC1FSU5WQUw7Cj4+ICsJCWdvdG8gZXJyX3B1dF9lbG1fZGV2Owo+
PiAgCX0KPiDigKYKPgo+IE1heSBzdWNoIGFuIGVycm9yIGNvZGUgYXNzaWdubWVudCBiZSBtb3Zl
ZCBiZWhpbmQgYW4gYWRkaXRpb25hbCBsYWJlbD8KCkkgZG9uJ3QgdGhpbmsgdGhhdCdzIGhvdyBs
YWJlbHMgYXJlIHN1cHBvc2VkIHRvIGJlIHVzZWQsIGN1cnJlbnQKcHJvcG9zYWwgbG9va3MgY29y
cmVjdCBJTU8uCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
