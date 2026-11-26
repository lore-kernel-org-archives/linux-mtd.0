Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A5C606A31C
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 05:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bw2rVuba;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=poXqaXvR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VQ95hyS8nE62Nm2/uANMnPfJMARS7ZLH/zuJ/4SAi2A=; b=bw2rVubasjapdIbeIzrIYn1JVe
	Y5mG+CdFQ3pQjk4DLfMI4RQYaaeF6l7wsl/6HISTi88vB5HqEu3+ltl3spNWdfJgWtOKSxLfvoDx6
	SFLCSO9HOx6CQmoyyicjKlQuMRubgtXio9uHH9wIK1z1PsKimvUOnkqRFd3uJuKi4fVsLxPjpPYix
	8gc09n3++QmrlVrtWx3sjf4nrmwqE1tzdb6RAYXd82bQ8ozRq3Rwyxjk5kzN0dvVu4+WAILTCCmY6
	lbiiM3svcDhGzzWQSezmeJuq3V3cuNpe/+mKNu2PvwAAmFC/adoZ4vi09oTW1cuYx7wz1zl6etCut
	boI6kHGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRzU-0000000C7oH-2nsu;
	Thu, 26 Nov 2026 05:25:52 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRzR-0000000C7ni-1aAB
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 05:25:50 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2f0464dd6b6so41074835ad.1
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 21:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795670748; x=1796275548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kj9OnfHKDgvvaSCC/2rH11WH3QsDA+JckreBPEmumlM=;
        b=poXqaXvRaSUaz5r/uROWTddJi3n2F3mOZY1j9mFBkffBY5zmaZZsIcUmKUDWZWOHFn
         AgtPftTlRhQvsy9bW0DlMrGB9R5c8wRClC4mpPHZTWD3kdgRQ/O9fchl334+p8/DXZM7
         KeYnAzc1K8Q+lQ5V/Utd4QH6J4OrVkcIyGuR5pfDOATqM0EUM+6aDOEZ60QXl6P6RYjZ
         g5qsGR9oe2jgudSjmc/E7VbYmyOghRwBYReVy47zlZr97LoTZHOTB82Mk0nqfP7JtD8n
         uGnSMssLZDgE3SeubZBGqkBxpazbau3DhO07s+shcLwO7TN/7F9ukqRpDjsnsG0+dfU2
         eDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670748; x=1796275548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kj9OnfHKDgvvaSCC/2rH11WH3QsDA+JckreBPEmumlM=;
        b=QMCDcbGdRFmm6AO/19j8JjDn1gZbiG9vFY8RcmyC9/Z17hTe9XEQ3jCg95kYZhlSIl
         YdZZ2bQ7b9EBg9OJbMr/9A8aOqunXBTRGE4yfRd7ry1BtjgYM8wFnmy9Wy4olcTkjjxC
         94e952DLNSMjSDIRJ6ZO/QXZV7zJcUg9Qtk7nSf2yJZbSb5mix8DJ9ZnFTDFxmddliTC
         N+Jay9ykHymhmuinmCzTdhtitJe40/G+HitR8V38um6lSDc74lPjmdMh7JQbMY1NWYsV
         F/Wcw0ui4abF0idoo5zsFN2buefI8aYd8qZwLfy4AzooOr4NP/UAPFYL5w6vwSEYlS7z
         bufw==
X-Forwarded-Encrypted: i=1; AL+hErFKpEkNaSJPnPmW/51rgEdNzeUMY8ZJgDVhy+550DUJYjeOS6loe319snShR9+6EQVdFYMOBY7WipU=@lists.infradead.org
X-Gm-Message-State: APuU4Z9JE16+TSCdmKgbAmACEN+BNJDLMThbKqEW3kZVUKAPonPX8r7n
	fFFlI0D+milAiq3B/iTCHJs13W0V2GRHhyCzM3LEaeuultlCEcFJr1b8
X-Gm-Gg: AZFdTZeTdkjciW1esrpCgOaoYUshZeiSa9N+Me99627v8wPI29d+so5A4rr/aJH5zje
	TZa8R1WWQwCCwIxNo9KLxVQGbEoOsljtKepXMbphjeBbSG8uYTxSYp9j24fETzZjNmDGW3t4XzF
	Z4WJAYzG2DKBGAbkSkciVlFdEprJbGFBoS9dHSfrtTcy7SN+86FyLP6cwKLk6THPPlrnAdnvijM
	CCzPt3iJCZK6bZ9kxG00UZGr7XUJci+IUBWiHdqB9hBv4VVATcLDg0bwhKRxZb10B8EcxCQ6f4f
	B4mvQiXaK+lPORgfLiH7jRu7oKK0CHe2hSxUTDTBt3rsHZYbiS2Wt8qsz11H5FOfHyJJDZUdVsF
	deeLI7blyiPf2vVP1xvaAhvivr21oHb2mFlmRM5EEtGiIpYhQDlocYGRBrpIBkAbTk32u2JoIHg
	USIZ8FW8br+EzWEzC6xuMKjZfzLwtWYe3v8HLhScaHX7u2UCl6yg1E+euc9fI5fTy3BKbfJDVjM
	z/QAexfJMbVUpFTkpSendqR0AAKOmGtsJlw5n2Cj+SSAzgoLBhlUpYoihMKtd8fkPewDmKEFcO0
	IbUf4GPEVqMvqmJ+cX3aweOQlPWg/fogQwv1084c8JHX+w/jpg==
X-Received: by 2002:a17:903:b0e:b0:2e8:e17d:c8c3 with SMTP id d9443c01a7336-2f03f1da4e5mr192444935ad.62.1795670748092;
        Wed, 25 Nov 2026 21:25:48 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f191464sm99968545ad.1.2026.11.25.21.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:25:47 -0800 (PST)
From: Cheng Ming Lin <linchengming884@gmail.com>
X-Google-Original-From: Cheng Ming Lin <chengminglin@mxic.com.tw>
Received: from hqs-appsw-a2o.mp600.macronix.com (unknown [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 740CE4163B63;
	Thu, 26 Nov 2026 13:25:45 +0800 (CST)
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] mtd: spi-nor: macronix: Clear the RDCR opcode on MX25L3255E
Date: Thu, 26 Nov 2026 13:25:24 +0800
Message-Id: <20261126052524.1816136-1-chengminglin@mxic.com.tw>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-2-0d1ab783fd8b@bootlin.com>
References: <20261125-macronix-upstreaming-spi-nor-cleanup-v1-0-0d1ab783fd8b@bootlin.com> <20261125-macronix-upstreaming-spi-nor-cleanup-v1-2-0d1ab783fd8b@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_212549_416999_3F64CAA2 
X-CRM114-Status: GOOD (  14.19  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Miquel,

On Wed, Nov 25, 2026 at 07:01:35PM +0100, Miquel Raynal wrote:
> The MX25L3255E BFPT table is incorrect which leads to the RDCR opcode to
> be reset. Make sure the configuration for this chip remains correct.

I think this patch is not needed.

The MX25L3255E BFPT is JESD216 rev 0, its parameter table length is
0x09 DWORDs (see Table 9, offset 0Bh, on page 64 of the datasheet [1]).
spi_nor_parse_bfpt() returns before touching the SR opcodes and the
QE mask in this case:

	/* Stop here if not JESD216 rev A or later. */
	if (bfpt_header->length == BFPT_DWORD_MAX_JESD216)
		return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);

Since macronix_nor_default_init() now always runs before
spi_nor_parse_sfdp(), the read_sr2 = 0 set in patch 1 is kept for
this part. So the BFPT is not incorrect, it just predates the QER
field.

>  	params->qe_mask[0] = BIT(6);
>  	params->qe_mask[1] = 0;
> +	params->opcodes.read_sr2 = 0;

The same is true for the qe_mask lines above. They were only needed
because the old spi_nor_init_params() did not call the manufacturer
default_init() when SFDP was required. With the reworked init flow
they can be dropped too, and only the 1-4-4 PP part needs to stay.

[1] https://media.digikey.com/pdf/data%20sheets/macronix/mx25l3255e.pdf

Thanks,
Cheng Ming Lin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
