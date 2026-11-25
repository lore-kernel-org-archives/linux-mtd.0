Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECC3606A31E
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 12:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I72ytxZJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Di0hGqCL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TNo5/cQ551ZpBuu1x8B5Gi7E5PlqDbx17gkrn2NmAx4=; b=I72ytxZJYWFAMP9qyVTnImU4Ji
	mb9QdIe8GNR5e4ikyrUH0Hek7OdZM0uEmggaEHjPnVPz3pGV/dPu8r5MAwXKcH5aqMg+aQK8991UU
	fSNtmvFhyn8PZPgxPsUYiu0RcyaPViQX6dlygFF0t4Y2/WF5bFK9JvSmSjOtyi+RxEFmgNFF+68NG
	iqKjBo3Tferj2JP1cSiy23A/YvMqsijQjpCpV3JsnlIRgYr0OshYXuApcw8kR50HXST/vWctvJGET
	kyNacMLv0bn3yCKci0iq8U7xqdDHtLvl2BCyTVQDPZMgPPu+hAIbbY2BP9v2pymhv/MJ9y8DJ06+s
	VZtSyQKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBzi-00000009nYE-2eZb;
	Wed, 25 Nov 2026 12:21:02 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBze-00000009nX4-2GXZ
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 12:21:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5772EC2BB3C;
	Wed, 25 Nov 2026 12:21:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 54E3060480;
	Wed, 25 Nov 2026 12:20:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5709011E69019;
	Wed, 25 Nov 2026 13:20:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795609250; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fHDkq205OHWCz9XPh90+pVUtgDQFIwSe/rx4XfXAeLM=;
	b=Di0hGqCLyEBCNCPaWWq5He8ykZWAJB+id9zm6OKUZUBDUAi6oKDvMa9Lh2FOYY9LR144Dy
	861YSbs4//UkVVxJF8oo+Ni9xUuZXbGQWjWy+GGvogqPWhh1ZZOShUqqX9wFkkdEkUKZWp
	Or5jsO9J3fl84XZRleNfEbx+63PHsVgnWIFvBbKA9GFA9w4hJvdbr1duD2PRz0Hf746D8c
	KgTuKPXh5nWM/Z+XZ2DVm4pikKjBOSa40ej26NKemIBbyc+D8K46SffencMhu8Mx2KOwx+
	ukcY+FNjWYHhbsIqY7hYZ5H46WAcNpULhtdQEJnlAzzmF0ND9aTcpdBydX354A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Ping Li" <leeonion.muyu@gmail.com>,  richard@nod.at,  vigneshr@ti.com,
  sashiko-reviews@lists.linux.dev,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
In-Reply-To: <sashiko-outbox-233336@kernel.org> (sashiko-bot@kernel.org's
	message of "Wed, 25 Nov 2026 12:10:29 +0000")
References: <20261125092538.1938516-1-leeonion.muyu@gmail.com>
	<20261125115108.4147741-1-leeonion.muyu@gmail.com>
	<20261125115108.4147741-4-leeonion.muyu@gmail.com>
	<sashiko-outbox-233336@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 25 Nov 2026 13:20:47 +0100
Message-ID: <87ik1lyue8.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_042059_663585_6F605A0D 
X-CRM114-Status: UNSURE (   5.60  )
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

T24gMjUvMTEvMjAyNiBhdCAxMjoxMDoyOSBHTVQsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3Jv
dGU6Cgo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3
IGZvdW5kIDEgcG90ZW50aWFsCj4gaXNzdWUgdG8gY29uc2lkZXI6Cj4gLSBbTG93XSBtdGQ6IHJh
d25hbmQ6IHI4NTI6IHVuY29uZGl0aW9uYWwgTkFORF9VU0VTX0RNQSBpbgo+ICAgcjg1Ml9yZWdp
c3Rlcl9uYW5kX2RldmljZSgpCgpDb3JyZWN0LgoKUGxlYXNlIGJlIGEgbGl0dGxlIGJpdCBtb3Jl
IGNhdXRpb3VzIHdpdGggeW91ciBBSSBzdWJtaXNzaW9ucy4KCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
