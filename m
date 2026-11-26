Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216FF606A31C
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 11:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sAJsNlzs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fxmtEvOW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eqL06Wco7Zc3gWzw9K+YkzWfFXiXiKdojFb3dgX35rQ=; b=sAJsNlzswnpINFl040uKqgFxG6
	ZrwooSTTmM6WNqk7BYZZhgBEB68kUGQKx6LeQVcuid3JLapzkjYts+oWdRJeVVpZ8e9o4fXPznWe+
	ipRGEY2SjXqgf9zaM0h1jYe3XkK3SnxPBApNQ5NFEP9MyUx85TEKMaTaUvvl42+R6MGvB8jIWpTz6
	vJ15ji7U05RlZegrhlRz0opIQs7AeMa1w+bd3XEKYKl3mZtTQQN3zVLYPZGVM1olHazdPWOgCLa3w
	C9KOwmSCtGXMRBqho3Vrv4cQhw83w4cYpeAbQQdDM+1MpRMP007uE2pV0Lh2HoLJQRwpl8IjZYwDY
	umE5NecQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXpw-0000000D2JT-0Bc2;
	Thu, 26 Nov 2026 11:40:24 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXps-0000000D2Iw-0MRY
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 11:40:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A71031A17D9;
	Thu, 26 Nov 2026 11:40:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71F6960237;
	Thu, 26 Nov 2026 11:40:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6FCFC11E6B341;
	Thu, 26 Nov 2026 12:40:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795693212; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=+G3l9u5BX5z4dfgesqHF6ebXrWCDI2SoDoExM9Bxcso=;
	b=fxmtEvOWvJ3n6hNnX7EMDpE46Uygj7BIihMA4GuxgT4apLDNMsx0cOHwGY845I9HvZ+4so
	GWlOq1AgjLHr8Hglc+ySEClDX1wyYnLJpCCeqHdpQGUqKqGnro6bnTTYD9bdomGA3bjwnK
	acabAfsprkbWuBq0fHXiPr3Dsir61SI3xuhAlhhx8/exmCNziF4Uc0PEmpkvVKtLMmpVhd
	FRZ1rIJFxFR2DE80fI9mutdXmysFxQqv6gOns9bFPiFxzyi9mjok3s4TZOKtolLOrOjaUJ
	PQZlxdEOAWRsVUbA/2Vw5BFB3ZcAfIB+hNIpxeZ8N/ov3AgbOVZEmtr2eN0kgQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Michael Walle"
 <mwalle@kernel.org>,  "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
  "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  sashiko-reviews@lists.linux.dev,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Alvin Zhou" <alvinzhou@mxic.com.tw>,
  "Cheng Ming Lin" <chengminglin@mxic.com.tw>,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/4] mtd: spi-nor: macronix: Clear the default RDCR opcode
In-Reply-To: <sashiko-outbox-233952@kernel.org> (sashiko-bot@kernel.org's
	message of "Wed, 25 Nov 2026 18:17:28 +0000")
References: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-0-0d1ab783fd8b@bootlin.com>
	<20261125-macronix-upstreaming-spi-nor-cleanup-v1-1-0d1ab783fd8b@bootlin.com>
	<sashiko-outbox-233952@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 12:40:07 +0100
Message-ID: <87ld6fx1m0.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_034020_337881_6B366D22 
X-CRM114-Status: GOOD (  19.59  )
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> [Severity: Low]
> Since this fixes the default SPINOR_OP_RDCR assignment for Macronix flashes,
> should it include a Fixes: tag?
>
>   Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write
>   Status support")

No, this fixes tag is wrong. The problem has always existed but was not
easily fixable before that rework.

>> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
>> index b3fdb4b2fa1ca..2c6f507a2dde7 100644
>> --- a/drivers/mtd/spi-nor/macronix.c
>> +++ b/drivers/mtd/spi-nor/macronix.c
>> @@ -333,6 +333,13 @@ static void macronix_nor_default_init(struct spi_nor *nor)
>>  {
>>  	nor->params->qe_mask[0] = BIT(6);
>>  	nor->params->qe_mask[1] = 0;
>> +
>> +	/*
>> +	 * The JEDEC RDCR opcode (0x35) is not valid for Macronix: some parts
>> +	 * have no CR at all, others use 0x15. Clear the core default. Parts
>> +	 * that do support the vendor opcode can opt-in from their own fixup.
>> +	 */
>> +	nor->params->opcodes.read_sr2 = 0;
>>  }
>>  
>>  static int macronix_nor_late_init(struct spi_nor *nor)
>
> [Severity: High]
> Should macronix_nor_default_init() also set opcodes.write_sr1 = SPINOR_OP_WRSR
> and clear opcodes.write_sr1_and_sr2 = 0, matching BFPT_DWORD15_QER_SR1_BIT6 in
> spi_nor_parse_bfpt()?

Might be worth adding indeed.

> spi_nor_init_default_params() initializes opcodes.write_sr1_and_sr2 to
> SPINOR_OP_WRSR and leaves opcodes.write_sr1 as 0.  On Macronix flashes without
> SFDP (such as mx25l12805d) or with a 9-DWORD JESD216 v1.0 BFPT (such as
> mx25l25635e), spi_nor_parse_bfpt() does not run the QER switch.  When
> spi_nor_generic_quad_enable() or software lock/unlock runs with read_sr2
> cleared to 0, spi_nor_read_sr1_and_sr2() leaves sr[1] = 0 and
> spi_nor_write_sr1_and_sr2() issues a 2-byte WRSR (0x01) command instead of a
> 1-byte SR1 write, either sending an invalid second byte to flashes without a
> Configuration Register or overwriting the Configuration Register with 0x00.
>
> [Severity: Medium]
> Does clearing opcodes.read_sr2 in macronix_nor_default_init() get overwritten
> by spi_nor_parse_bfpt() on flashes with a >9-DWORD BFPT table and
> BFPT_DWORD15_QER_NONE?

Yes, and that's the whole point. Certain flash do not overwrite it, so
for them we need a clean default.

...

> Because BFPT_DWORD15_QER_NONE leaves opcodes.read_sr2 untouched, any Macronix
> flash with >9 BFPT DWORDs and QER_NONE gets 0x35 restored and will still issue
> RDCR during spi_nor_init().  A later patch in the series, commit "mtd:
> spi-nor: macronix: Clear the RDCR opcode on MX25L3255E", works around this in
> late_init for MX25L3255E, but other QER_NONE Macronix parts with >9 BFPT
> DWORDs (such as octal-only flashes like MX25UW51245G) remain with read_sr2 set
> to 0x35.

This is only set on a per-chip basis, not as a wide default, because it
is safer not to user SR2 when it is available rather than use it when
it's not there.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
