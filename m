Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC16C624A4
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2026 08:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JGwpIt3vnc08/Boum3oEolJO1bx2FdmIgZxduYeueOI=; b=e5uNxL9TKtEODg
	OGVnOkwp8qUGsADQFcpXH8RNwqhJDo/Q+zDXR9egkLSbq/zKpsLwq3FKQZfU0IXPBGwuURInhg5Yd
	kw8v61PfxzEb1A2sz5KKkSUjCVjn8EcV3anKue3+Kom7pNC3NJ6txYy3e0K99Hv93n3LctB5jZVn+
	7VchGXqJ/Nrii85fTZl2AEbM23RsWeno8ejSP7bfc7eLLUHoG97+aw9QdyooRjbqQCFRRRQbcT1Ea
	75j4uHJHezIdVDJpilCjh0eI16EzE6K+DUKvwLUth6aQj68sqTTIlHlQn02RmF0iPZbT8vuHhsiwk
	zMkk00I0owoM0ST72k3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22cj-0000000GlYC-1tDz;
	Thu, 03 Sep 2026 08:16:41 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x22ch-0000000GlXi-06oZ
	for linux-mtd@lists.infradead.org;
	Thu, 03 Sep 2026 08:16:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B9B1A1A1970;
	Thu,  3 Sep 2026 08:16:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C227602B8;
	Thu,  3 Sep 2026 08:16:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4259511C79B6F;
	Thu,  3 Sep 2026 10:16:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788423391; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YLfdgrdlzJj/pA2hZxsG9Y8cox2mPc65rtCPL4VHF9o=;
	b=QaeMTs0YKnXkCj5NgrK/CQd21t8R3DVdCU9qx6WjgKS1bKEHNSM++I2MzZI4MJKbrTaxP+
	16ZmiVnbkjmkEPiOWLs5bwMoOxAMF1bwkIwtqyKIbXGuQpk37Ru7JfsJZuv554AhEn1XZ2
	EUfoKHh+cAh9PgfqWHbkJ9im/nNtw3fawjw4jwCYpt+rMPICSqwFdTvzelW+jwtMgJWMTz
	K7JhWC16MA2GhcGwtwBQHF2HlExG0HGlgj03PGIqAGReKEW2yZzk7hkLBO/ErRQHio5Vdu
	Tyi9aybLxs5VMNO+ppG94q3zUXl3xb+C7SHCpt+m3YGJpkWE6dWrIsQMDNrToA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: Mark Brown <broonie@kernel.org>,  <robh@kernel.org>,
  <krzk+dt@kernel.org>,  <conor+dt@kernel.org>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,
  <sebin.francis@ti.com>,  <u-kumar1@ti.com>,  <a-dutta@ti.com>
Subject: Re: [PATCH v9 08/18] spi: cadence-quadspi: add PHY tuning support
In-Reply-To: <ebf61988-9fe6-495b-b1e2-eaeba9f6b98f@ti.com> (Santhosh Kumar
	K.'s message of "Wed, 2 Sep 2026 15:15:24 +0530")
References: <20260825171737.776052-1-s-k6@ti.com>
	<20260825171737.776052-9-s-k6@ti.com>
	<8aac0c42-fad5-4146-a2a3-b60bdab71a20@sirena.org.uk>
	<ebf61988-9fe6-495b-b1e2-eaeba9f6b98f@ti.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 03 Sep 2026 10:16:28 +0200
Message-ID: <875x0m7ns3.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_011639_202547_F8D425AC 
X-CRM114-Status: UNSURE (   5.00  )
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

SGkgU2FudGhvc2gsCgo+IFRoZSBEUVMgYml0IGluIENRU1BJX1JFR19SRUFEQ0FQVFVSRSBpcyB1
c2VkIGZvciByZWFkIGRhdGEgY2FwdHVyZSBhbmQKPiBpdCdzIG5vdCBjb25zdWx0ZWQgZHVyaW5n
IHdyaXRlcy4KCkluIHRoZSBlbmQsIGhvdyBkbyB5b3Uga25vdyB5b3UgY2FuIGV4cGVjdCBhIERR
UyBzaWduYWwgZHVyaW5nIHJlYWRzPwpXaWxsIHRoYXQgd29yayBpZiB0aGUgY2hpcCBkb2VzIG5v
dCBlbmFibGUgaXQ/IEkgc3RpbGwgZG8gbm90IHVuZGVyc3RhbmQKaG93IHRoaXMgY2FuIHdvcmsu
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
