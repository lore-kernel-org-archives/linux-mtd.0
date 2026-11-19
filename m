Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E2C606A330
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 12:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z49Vhjpr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Omh1GDDh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DVGHRL5torCMLNbHXCeogf/3fvIij1uWJ7fMqOqLAkY=; b=z49Vhjpr8xoeAW1PAVhyLlAfH3
	qP8Ao5ChW0FXetBDbQ3/iLXc2fPSzx2wvyvp/pEoX7/1sYnvh1ELa54scBeLxoqNn3tJsj8VcRltc
	wmGg/RuwsXy8ljNKEE82xAnTysmd9sx5S7pwMvXiAy/ollHBUJT6r05nkdmE3f7CqPnVnemhIu/BU
	D2FiVCZ8dtNW73F19qtjEWkHETnRFgEIqi1Wlk1pP2pJUXbQGEz7X+suAVQm5Yunk1QEW/Eeg/cNf
	106k8mz5qxlA9lmpjflFoyl49jEUuNZiCmAT13qWhXojDNzFtjOQxeyXfioqfbbzJTE5r+Xi1GjhH
	zOJ/Zrow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1OS-0000000BrUn-0cHq;
	Thu, 19 Nov 2026 12:37:36 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1OL-0000000BrOy-3gZ3
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 12:37:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A0CA9C4CBEF;
	Thu, 19 Nov 2026 12:37:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 640A460237;
	Thu, 19 Nov 2026 12:37:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3CFDB11BC0662;
	Thu, 19 Nov 2026 13:37:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795091847; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PoTjrDwaaROZfYcyiVMNXY2eDUE3A9RMMRmZDiOLOV0=;
	b=Omh1GDDhb/OW7/i6hnOvWKaElu3Kt8qWLLxVvNgKoDJjrUBFveqntLKc6YpVn7/czS1aD0
	YeXc7hbxoBqt8gCCI0e7z5WjVeibhvbKco751UrPU3+Uk9bR/LeFM7cZ0/qtvdeKXmWNz0
	GX2bRPiRxcN1mj3Um1MSHL5riXiRGnvCIKxlb+WrkNI0MVRqTZJQhVfBPhUxpx1+3+CstH
	7nOPwlusLMB1WIevUyjSBzc/jvWKVmCvIt/Vf6YAFWlWW5OvUUEyvqkse7YeR+5ZAOH3UG
	n26S+hnWZImEiPYINtFesES3MlA85mcJrWrhGOLTlKjbxh103oRjETWWdX6Z3g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261118-submit-rawnand-bbt-read-error-v1-v2-1-1a3f5d121c5f@gmail.com>
References: <20261118-submit-rawnand-bbt-read-error-v1-v2-1-1a3f5d121c5f@gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: propagate non-ECC errors when reading
 the BBT
Message-Id: <179509184715.2889394.12952023230770454975.b4-ty@bootlin.com>
Date: Thu, 19 Nov 2026 13:37:27 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_043730_096070_287B71C9 
X-CRM114-Status: UNSURE (   8.32  )
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

T24gV2VkLCAxOCBOb3YgMjAyNiAxMDo1MToxNSAtMDcwMCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6
Cj4gV2hlbiBsb2FkaW5nIGEgYmFkIGJsb2NrIHRhYmxlIGZyb20gZmxhc2gsIGNoZWNrX2NyZWF0
ZSgpIGludmFsaWRhdGVzIGEKPiBjb3B5IG9uIC1FQkFETVNHIGFuZCBzY2hlZHVsZXMgYSBzY3J1
YiBvbiAtRVVDTEVBTi4gSXQgaWdub3JlcyBvdGhlcgo+IHJlYWQgZXJyb3JzLCBzbyBpdCBjYW4g
cmVwb3J0IHN1Y2Nlc3Mgd2l0aCBhbiBpbmNvbXBsZXRlIHRhYmxlIGluIFJBTS4KPiAKPiBQcm9w
YWdhdGUgdGhvc2UgZXJyb3JzIHdoZW4gcmVhZGluZyBlaXRoZXIgY29weS4KPiAKPiAKPiBbLi4u
XQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogcmF3bmFuZDogcHJv
cGFnYXRlIG5vbi1FQ0MgZXJyb3JzIHdoZW4gcmVhZGluZyB0aGUgQkJUCiAgICAgIGNvbW1pdDog
YjQ5Nzc3MDIzNjg1OGRmZDk3MTFiMWQxZjBhZTMxOWI3ZDE5MjZhZQoKUGF0Y2hlKHMpIHNob3Vs
ZCBiZSBhdmFpbGFibGUgb24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBu
ZXh0IFBSIChwcm92aWRlZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQg
cmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
