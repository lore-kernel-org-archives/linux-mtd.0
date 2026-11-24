Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF17606A31E
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 13:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sx3pAms1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Cmpnx7rl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OI0iopwM3DhAF27MuKmVCc4A54bt+/cePgsXpgBsyqg=; b=sx3pAms1WIWS8eZ/4Y/EDUPHYc
	b4DnfNbJl057M9Joo6il0E5G9c+qBCDfQllLXWjPxScqhbh0+wwskmVuQYWIySVYKWj/wLqt/W8v/
	jM5GQh8y+2h3n8BF42YlUmIof6U1N6j+ewp1bRTqCUvMeVyY6kln56dHwEpGN8C6Dj8ncxDiG2yE/
	13KoyYYrisfEUUO2136r8qGtS1MdWFkD/QGo4rA9aEM8gFs2ZFwyjE7BVEx2xsQR6cQnJGsaAXToN
	KjbXcCCyNx9PWuA5qZa26EguzdWSDF9YMNWIzVL0d+gWCh46cboP3kdSOt0R6ACRJkM4G1Vxm39U4
	TamAFCOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqtm-00000006gWh-4505;
	Tue, 24 Nov 2026 13:49:30 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqtk-00000006gW7-2bNU
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 13:49:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2DDD91A17A7;
	Tue, 24 Nov 2026 13:49:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 00B34601E1;
	Tue, 24 Nov 2026 13:49:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D53D011E681A0;
	Tue, 24 Nov 2026 14:49:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795528164; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8/5WpIiDIF7odXUhPjSua3qAHd65kH+m9W4WVcGF87U=;
	b=Cmpnx7rl6uDbr2CDscqr0Mb4Z71jVOlQ75QBuG1uXf9D63wGOvy73tgSquUSbODOnV6RC9
	Deiog/0Y+Sc/4RFXRwPR8/LrN+YjwYtor2VR1394OWR1Glq4et7ZTfl9Pyk307B+6SB2LY
	GaolzwfcqG8kTOTlfXwvnoBy8P/oLDdrDWphFrxMEt5/GwIZYg0MbvUku1hWpg9YrVWRFs
	trQ7wyA7OSDEbIdeEdqu5YBgfS0RCwXSTu8oCdA2mvWQ3WAqYsciRE2USY0UyPa0FW9BEU
	e70MLq++LQIUvGgyIERSnT5++QHuTZidN6IjGm56hFZLHDBWchIntqj+YL8H4w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Takahiro
 Kuwano <takahiro.kuwano@infineon.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  praneeth@ti.com,  u-kumar1@ti.com,
  p-mantena@ti.com,  a-dutta@ti.com,  s-k6@ti.com,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org
Subject: Re: [PATCH v4 00/11] mtd/spi-mem: Enable DQS control
In-Reply-To: <73680b0b-2c98-4ebc-bcb8-4ca144b469f7@sirena.org.uk> (Mark
	Brown's message of "Tue, 24 Nov 2026 13:45:22 +0000")
References: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
	<164905f5-2857-4b8e-8d99-26939b45cde4@sirena.org.uk>
	<875wxmttj7.fsf@bootlin.com>
	<73680b0b-2c98-4ebc-bcb8-4ca144b469f7@sirena.org.uk>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 24 Nov 2026 14:49:20 +0100
Message-ID: <87ld6is5jz.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_054928_797606_99B193D4 
X-CRM114-Status: UNSURE (   8.70  )
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

T24gMjQvMTEvMjAyNiBhdCAxMzo0NToyMiBHTVQsIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IE9uIFR1ZSwgTm92IDI0LCAyMDI2IGF0IDExOjI2OjA0QU0gKzAxMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4KPj4gV2hhdCBpcyB5b3VyIHBsYW4gd2l0aCBTYW50aG9z
aCdzIHNlcmllcz8gSWYgaGlzIHNlcmllcyB3aWxsIG1ha2UgaXQKPj4gdGhpcyByb3VuZCBJIHdp
bGwgcmVzcGluIG9uY2UgYXBwbGllZC4gT3RoZXJ3aXNlIEkgY2FuIGp1c3QgcmVzcGluIHRoZQo+
PiBpbmRlcGVuZGVudCBzcGktbWVtIGJpdHMuCj4KPiBJIGhhZCByZXZpZXcgY29tbWVudHMgdGhh
dCBoZSBoYXNuJ3QgcmVzcG9uZGVkIHRvLgoKQWgsIG9rLCBJIG11c3QgaGF2ZSBtaXNzZWQgdGhl
bSBpbiB0aGUgZmxvdyBvZiBlLW1haWxzLiBJIHdpbGwgdGhlcmVmb3JlCmV4dHJhY3QgdGhlIHNw
aS1tZW0gcmVsZXZhbnQgc2VjdGlvbiB0aGF0IGlzIG9ydGhvZ29uYWwgdG8gaGlzIHNlcmllcy4K
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
