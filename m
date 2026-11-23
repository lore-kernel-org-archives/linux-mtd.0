Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71572606A31E
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 21:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q77b8/Ql;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t1g91tR4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XQSDLRrSvWwjjQPJ1YSP+Sm+uWOkWBtONsgjtLXfwfU=; b=Q77b8/QlDhYu3x011IhbCogi9v
	iRKeioHDQeqlt4gqlp12AlPyF2EB+CgCXazLh/v8wb14bMkznUSMIJv3FbmA5VOub9barA2zXZ+Xr
	DNG/1A7Bzjlf0tGUynB1YNnM1G6qARRo8dY2yiR6ADlbi7X314NwiAzOmG3iZNO+tH9OtEQWgHMOA
	DSrNRvxxdQyEcZkl39XsVczQkiFg1wGU1nd+c+d0O6vgV0r+BkYxtjvP1jNlThnmjmxPCHUX92KzD
	VdVuhi8V8MAVV6bR2X4kO3UIsnTfzUSnBbPGXzvKM7vHX/k3QSGAnNviyPXVpAkklPAo3Zc90JInd
	3PQXH2wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbYt-00000004yKz-0QSy;
	Mon, 23 Nov 2026 21:26:55 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbYq-00000004yK5-3FI6
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 21:26:54 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso2428603e87.0
        for <linux-mtd@lists.infradead.org>; Mon, 23 Nov 2026 13:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795469210; x=1796074010; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v1WDqyjHSGv+T3SvDbv9gdEvyLdDWkrLhjth3cnoJkw=;
        b=t1g91tR4duqJpp35ZviLP38FjGHUyMRPqmdglUppR1REBJDdB6exf0wNtMOzAxYyH6
         qML3zBTql7AYbkjACl8GumicHXyr/PENMP6ijqHne3kFSueyMeSkMlGA7V4zuSnzyI/w
         d8OLtBVqt57+AE+f4EJAc9qVSxC6L2iD7OKSDM7wsDMdutAN5SfJ1j/OirLudxh0PMGR
         DJOQCch0/cPN2wcV/cCPdthfJcAY1QuqTCd7Ul8UFqDsC+BhDUwTENeORTRRxtSUkl+0
         DIBNrCxv2Lf6HZZI0bQQET7CqbS/fP/3C/XYSv+rkMyvizt8xw8y2gQz9tvBG5UPd6M/
         GGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795469210; x=1796074010;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1WDqyjHSGv+T3SvDbv9gdEvyLdDWkrLhjth3cnoJkw=;
        b=xEt+J3CxnLRJ128zDhcxUripRIdnU4SpaW8rSPQauyM6bulmh4wqQUoKo0Sf137aWj
         /r8h7e7o6y9n3JZQNAVtp1FeFxfrw2FznFueZdjvJ51BRcSL+rnk3U+0MERaylZUfvut
         8//2GsOcX1cJWYWERVvUIu6aMRMGV23FE3zJBTzv0M14bfzgvC6b7v7/OXO6M1TUOQPh
         SbACDiUsnakYKH43+awODyd09eMKAdOmagT3kiNr6wiUl4jKk8SlNZnnFxQ/jx8Fo2nD
         sQrViTxcGsfh1quBRKVNV7A056RG2p9uy13Svp+ZwgBhPRo1kAvy1v3i8IobCO0Oj2QI
         uP6g==
X-Forwarded-Encrypted: i=1; AL+hErFiqIg9iu4qo+VY/HmqLjD710M1yDnilvmuyH9fdBQIAJKKfP5cZnrWJJsGDSQolMEoMP0Njkcerpc=@lists.infradead.org
X-Gm-Message-State: APuU4Z/FmP+p79BtQ1H+eFzMXRslRFxTPFokX8yHOJqmtAuOon4bLIvT
	Nz8N2IC3Vu6F8kzpwJCFAU5Nw1AJZWYKL/KlsUuuDNYrmloOGdWVfLyM
X-Gm-Gg: AZFdTZejCofcR/brnX425EcBtimTGx9lPGTDFk3UHcXhNRCX1VKbJzi7svTWW9bcHMF
	ue6Cpkwu3g1hsMNDc7X/m3jAtnt5hoNQdaUSUnyuzSy4YEwEU25urbEmuOW5HiJWM3YHK0oRcDp
	Ia21ViMQMxjTK5Bq/fwC1rXyHPE5OcCZzYFzx2jmtY1F+uthXyoXlJrVEcp3r7y2T8OtpnpT0pN
	59J3aw9pEPXkdgNkFxMM3DE8S2G3l2GGY6tJow5X2xjSKodGtSldFLdY/xHpWxinwzUp6X0uIB0
	v1CPzG6/I40a6Q2n1HVWgeSbH1fJ7iderj2K6D1ZTa/Db06riwkI7q4PenlMbs/UbxAcMAu+C2b
	UaRuEBs8kBuEJPPfd6dl9ZN61HRnRlcMDdIVfccKS0cHQijBaow4ZipEWp76JhRbMmRkcZM9/nK
	8PzWDh7sJ5zayhfVSrva0zQlNl0aIqaII6Vksde1303xqHXwoYbspArjPRZezdbXrsTow74mgh8
	NbQc412t2997tt334gKeewRjA54+Lf2SgzXSHiE56TYF8b75qRy8a6DaaBNO1ura0rcUGpeQmU+
	rBC9GlwiNioVRC7EUhNYkZG161aC0SS/f/hdARptq1sfyQtGOsNF0tQ=
X-Received: by 2002:a05:6512:688b:10b0:5bf:d93d:77b9 with SMTP id 2adb3069b0e04-5c1bc7d629bmr2709291e87.30.1795469209627;
        Mon, 23 Nov 2026 13:26:49 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd07b270sm3229875e87.80.2026.11.23.13.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:26:49 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: sashiko-bot@kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard  Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob  Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor  Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mtd: rawnand: Add Cortina CS7542 controller support
Date: Tue, 24 Nov 2026 00:26:45 +0300
Message-ID: <179546920557.4112741.10222765658884997584@gmail.com>
In-Reply-To: <sashiko-outbox-230010@kernel.org>
References: <20261123-b4-cs7542-nand-v2-0-9d9f08608534@gmail.com>
 <20261123-b4-cs7542-nand-v2-2-9d9f08608534@gmail.com>
 <sashiko-outbox-230010@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_132652_852580_8FC0D499 
X-CRM114-Status: UNSURE (   9.08  )
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Should cs752x_nand_pio() also set NF_ACCESS_EXTADDR() in FLASH_NF_ACCESS for
> row-addressed operations?

I checked the two paths on Almond+ with the 6.18 backport of this v2
driver, using read-only access to the existing flash.

MEMREAD in MTD_OPS_RAW mode with data and OOB uses read_page_raw() and
cs752x_setup_page_regs(), which sets the bank. OOB-only MEMREADOOB64
uses the core read_oob_std/exec_op path and cs752x_nand_pio(), with the
bank field zero. These are separate reads, not the same software cache.

At physical offsets 0x08600000, 0x10600000 and 0x18600000 (banks 1, 2 and 3),
the 64 OOB bytes matched between those two paths. In each case the OOB
was non-erased and differed from the lower-bank alias at 0x00600000.
ECC corrected/failed counts remained 0. Thus the generic OOB register
path does retain the upper row bits on this 512MiB device.

The generic path programs all address cycles in ADDRESS_1/_2. The
vendor erase path also clears EXTADDR and supplies the full row; its
register-PIO OOB loops clear EXTADDR before each word as well. This is
different from selecting the vendor's 128MiB memory/DMA aperture.

I do not think adding an aperture bank to these register transactions
is required. The read comparison above does not claim a new OOB-write
test; no flash writes were performed during this check.

Thanks,
Fil

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
