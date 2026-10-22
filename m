Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320DA606A31B
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2026 10:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0b9Uq3SQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=znPTKa0j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=owj/D4oJznd38lqD1y9WKuJvllAq+IHe0OLbzl2Z/nU=; b=0b9Uq3SQ2LLUNpT9mQiZq5cif8
	FlOGGF9GD5nvr2b0nah5awA1gTjwlu2tdAbgvR5OxIOp8/Kam+bG3+3YGQ4933Iy2Tuu7aaouwb2m
	N8R5epXBGUwO5a0QzK1Hs92kUhbm8j1PQMUFhwdG6oRNuBeQxCHmhAKKnugJeYHbZ7zCy4WBta0O3
	dPSwzPWVa0+lEl5uY/gRzTa/M3bxTt3T9AHyL6DJypBxv0P2PP/my1KmdXsXaDyocK3E2qde3GVoX
	vi4Z7ndr/5ksogYeEifHdX+Lqxm8a36ptI9TJ+Fo08MXmdXecwQvltr7bpOJhKO1pVXFYxvzGpTZ5
	KVIGoqZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqJK-0000000DxWL-2GSH;
	Thu, 22 Oct 2026 10:46:14 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqJH-0000000DxVQ-1f4F
	for linux-mtd@lists.infradead.org;
	Thu, 22 Oct 2026 10:46:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7B057C58473;
	Thu, 22 Oct 2026 10:47:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 284A760360;
	Thu, 22 Oct 2026 10:46:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0417C10328E3D;
	Thu, 22 Oct 2026 12:46:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792665967; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=uytOd5S7nxvQrfDc9PxXqBZPkguyREFdfHpWXeT+neo=;
	b=znPTKa0ji9r2gpzA1zBt4X1noMCjJRu2rGiZZEfrJnY+MhfXEfRNJWuM6iZDg4Aol2mJG5
	5QenYglDrfA88d47VcyVjX7bXG5tjomZvhtJLk7OAoCgJ+UMbmFxiCWYehDlXopYX+pV5p
	twlz4wmmHQ2hSCa/C0hHcndpuJxtKU3rZculMgWu99JJvmdPJCJm+4/G5Ksc/alM9Ce1HH
	UA0kNvNs3u+pqoi0Lz3AnRM7DX5V2MK7yGLj/2mIwrFABvNQc1EwYfzck0fbfn4jRfGPAJ
	iB+A00oLsB59U4o+VzPJSXeQWtkE938SmMwXfquuQNtXeNAktofetqLVVg9bFw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-spi@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 3/4] mtd: spi-nor: debugfs: Correct DTR protocol
 names for 1S-xD-xD modes
In-Reply-To: <20261022102614.75696-4-changhuang.liang@starfivetech.com>
	(Changhuang Liang's message of "Thu, 22 Oct 2026 03:26:13 -0700")
References: <20261022102614.75696-1-changhuang.liang@starfivetech.com>
	<20261022102614.75696-4-changhuang.liang@starfivetech.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 22 Oct 2026 12:46:05 +0200
Message-ID: <87zew6ovwy.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_034611_602777_48FC6153 
X-CRM114-Status: UNSURE (   9.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 22/10/2026 at 03:26:13 -07, Changhuang Liang <changhuang.liang@starfivetech.com> wrote:

> The debugfs protocol names for the mixed DTR modes (1-1-1, 1-2-2,
> 1-4-4, 1-8-8) currently print the command phase as "1D", i.e. dual
> transfer on a single line.  That does not match the protocol
> definition: these modes issue the opcode on a single line in single
> data rate (S), and only the address, dummy and data phases use DTR
> (D).  The "1D" prefix is therefore wrong.
>
> Rename them to "1S-xD-xD" so the names reflect that the first phase
> is single-data-rate on one line, consistent with the "8D-8D-8D"
> naming for SNOR_PROTO_8_8_8_DTR.
>
> This only changes the strings printed by debugfs; no functional
> behavior is affected.
>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---

That's likely correct.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
