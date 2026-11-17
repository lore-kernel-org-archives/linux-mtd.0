Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C260606A337
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1dYyNmpA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TLKYfy8l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=If4xFtjm48QYEIqXP36NSwik7OElf2gjGOxwToWAXdE=; b=1dYyNmpA+oiumfliFcJnUbdKWn
	/bRxdWhw5O+pyqJd1e01f9NGQXEPzHYhsmxMB5pzrNN/PWsH5Bmuoh0joBmg0y3IOn9zl0oa4xolR
	9oYomzGLvCS+QyQGEM6fHlOyYLEG3vSHQ/U89bFlFcW+fdPqk2KF9S8XIcWssYNZZpOJAp9filQ91
	OTxIt8OQPumPCcIiGzQe2ZeOVw3jeuyRMVg8tA+3yluk9PI3/EOWZ+HsMC65cDKrJ4ZCLr+YPSj89
	bTKMZE3BjTk9BihTlHVNf7n7sIWdrG/zuvWW4VxgCINoP4CUBqQjinY5/zRV1DlO6kADI89W1/ast
	uEIfNYBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFZs-000000056J8-33Fq;
	Tue, 17 Nov 2026 09:34:12 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFZq-000000056Io-3J9l
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 09:34:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2FF494E40B00;
	Tue, 17 Nov 2026 09:34:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDDD75FC81;
	Tue, 17 Nov 2026 09:34:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C65B11BC0B8F;
	Tue, 17 Nov 2026 10:34:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908048; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AuE4JfXLFzUDx+6R1OGPPSSy0rX3ecyLORLK9C1d1XU=;
	b=TLKYfy8l/wEs4kMrr/zo8ahpXceqadQAJ3lSoKzU+PP3cGXWGNaobo2soYFeX/USVBUsEH
	M/kXRlVKhdLTzVjUJ+ctKfvQqB33hTp6RWZPgF3fcfA9uD8okIs445vyjFERlUKamWHA0h
	uXJmVU9ny/3w70n44TNL8h4d4mSIXyAP/VDUMJE6+VmOLlTZKBja+UPS2OfOFFPBEY13J+
	2P289S2EFGjPoqg6Nm7s/E8RSJQ8mfyxQLGJiixtL6ANFHK7Un+dQIDwkGHzwDGXO4yeg+
	YeQavABR0p0PREKt7Xd0qj7ky30Yzi9SmrEocSuSLmHiLVFv8PjOmy+gbAZpYw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bough Chen <haibo.chen@oss.nxp.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  imx@lists.linux.dev,  michael@walle.cc,
  Haibo Chen <haibo.chen@nxp.com>,  stable@vger.kernel.org
Subject: Re: [PATCH v5] mtd: spi-nor: clear the default read_sr2 opcode for
 Octal DTR flashes
In-Reply-To: <20261110081355.5d7ubrgulopr7qvm@shlinux89> (Bough Chen's message
	of "Tue, 10 Nov 2026 16:13:55 +0800")
References: <20261023-spi-nor-fix-v5-1-bb6e0ce21169@nxp.com>
	<20261110081355.5d7ubrgulopr7qvm@shlinux89>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 10:34:04 +0100
Message-ID: <878q2rol83.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_013410_973902_A1F5FB9E 
X-CRM114-Status: UNSURE (   8.15  )
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

T24gMTAvMTEvMjAyNiBhdCAxNjoxMzo1NSArMDgsIEJvdWdoIENoZW4gPGhhaWJvLmNoZW5Ab3Nz
Lm54cC5jb20+IHdyb3RlOgoKPiBIZWxsbywKPgo+IEp1c3QgYSBnZW50bGUgcGluZyB0byB0aGUg
TVREIHNwaSBub3IgbWFpbnRhaW5lcnMuCj4KPiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgYW55IGNo
YW5nZXMgYXJlIHN0aWxsIG5lZWRlZC4gT3RoZXJ3aXNlLCBjb3VsZAo+IGl0IGJlIHBpY2tlZCB1
cD8KCk9uY2UgYWdyZWVkIG9uIHRoZSBwYXRjaCAoSSdsbCBsZXQgU1BJIE5PUiBwZW9wbGUgZGVj
aWRlKSwgSSBjYW4gY2FycnkKaXQgdGhyb3VnaCBtdGQvZml4ZXMgcmF0aGVyIHRoYW4gc3BpLW5v
ci9uZXh0LgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
