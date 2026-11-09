Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E164606D832
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 01:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=paS9ZyJ5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RLEB0oRf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UONyjw+dWC1rrJzmUg+CKnY/LXiINatjkH+0PzWlAjM=; b=paS9ZyJ58TwsnZgcQ5lp+rdcGp
	iS3w3ksrCQ41d/2CnL4LdxAgPxM3VRsYGSr6R7V43WLVKFJ/bqToq80KpZq/hYPWhnbg5mWsPS/Uo
	NTWVr8aA1AHclAmYx880xQ0crQqhMHUD3aoMwUiE1q1rqttJ5bHH9TzOQD/zg6GUHrtogJGfaiYnr
	010DMB8W98zLM1lyoEi2C2e4mNoDmaJLbrLMz5ZBs72V+xsDCwE1GriMOhUsFSzRQ4i8TIciCLPKm
	y0Mx3MP8CYvaHV3hoW+MkXypIRXhMNXd52Ig35XcHkscRuEYlZUAXF7GPApluqPjBq3SgwqDRDaSt
	AtV6hiGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQECU-0000000H3L2-3LAf;
	Mon, 09 Nov 2026 01:29:34 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQECR-0000000H3J3-221o
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 01:29:32 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-854b6e2e41fso191514a34.3
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 17:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187770; x=1794792570; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vwaqv0RwpQdofsLvckQnMd1MHOnW+8febEpuFJFq6Z0=;
        b=RLEB0oRfxt72MZcxUf30esw2CHebW3LXeeOOyVumv7a+1ALsA4HqAB7R5kZW8PUBIN
         5xOyf1kJHG96GE2DRCXX8Y+M1i/UhbMCNpfZdrht2ZH08aSScgU94gKMbMsDgh9mKKKq
         VuRPDrX2wbdAG8lx//+zrRoUpiGLHset1KHvuDnkQjDpEzPglq67ag3SETNU7By5ILUc
         +vNYZ9OxEYVGMS/TCj0zgz4qYBCjmgOKeBusbE0rgenvQgVuPfCp1iqfo7QgWffhoyUS
         YLWgNa9kjpVBUR3Mwf93u8B0aKxvqCJxo1aGGhT49R54LSu8DK27yoc1Vm0eNx79drt6
         efbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187770; x=1794792570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vwaqv0RwpQdofsLvckQnMd1MHOnW+8febEpuFJFq6Z0=;
        b=HPrWQCfxyriXBm8spMYa8CXb3LuW4zMDaxq2iIJMfFzcCLWzzYjJDmQJ/wcD4py0lm
         jc6VCW3yVCQQTnr6IfZi2m24EEPM2yAiVnrHQR/1/sJc1kuY+4G3mLslEVzftuM4A2kp
         MGDDrrzpRvSRREaM0lQrOCLa90rwzDMtdAGjjHIpvEd1ZHWUrEU3HGnVafShKrevsxmk
         aMB49/dBF3M5780pvEyK62S2Ifu0p5wILoNRWBnWQJg+jwApJYZWPPNbaR1Kr3MvIrpf
         XoP28rHsnnCN97m7pbN7V+AFqSEwTfX6oxUo5ERbualcHn9EUbEyIJwUbGM84dhKKFwe
         RsJQ==
X-Forwarded-Encrypted: i=1; AL+hErGQQkWrXINMthonYPjBb+qpZYEq4gG2IQGUW79W47f1ZDvAGumOPjWE30mfP6sTCnoo8zsaAgeznLY=@lists.infradead.org
X-Gm-Message-State: APuU4Z/SRLeDv/CHJVZ81DDuFV+iBET8Pq6yycCL9D96UnQvOuAtCLrf
	eTqRRzV3q+rB6/wtJ41xKMStzUv3YWc4HHvzccffQA4kxR8vs1TmRDKR
X-Gm-Gg: AYBFou12Nbwk+QugE1xvQL1TSesNH5H4Zf+ef3Oe65AcEF52WKFw16SCPMw9x45YuFh
	FC8qVmXAM1FWb8GNnww/vLYkQ8Vnj7xSxxVVoHtmd1sphklpIh+wD0IDANFLcZUv1a14K24PYWA
	vs3sfwdOx2AevQt46MiS9LrDOLowBK+gHoacsnZUh35ue1N9SKypA5LToOMfuefsKKYqKU8R7nK
	coDmeQyDUaG5p7v3ts/xwWP2MKWC9x9DVjS0iH5zq1ZjlKYBJWKUi4T3fShIhw8BRHHt9hrMLgU
	MPpvuY+GWLOnUwQyG6Qj5dptZ31yiH/WLqktQSZ+77Ad74Q4K488nvSQ4pHswU612SoEGWPQJP2
	WEU9RsVF+M6nb+AL9pQ2imHxU4vQ3+LoHlk9FiFOOuAmrW025SwTki/z2KIbkt7s2NAf7IrVESx
	sCXl1dM6hi5OeAh/W+BmFRE73lNnVYmc6gI5YotdJpDCjNikWNgb8bLrO6ay8inyJrCYEftU5Cq
	efA8r6xe0h5k7SkoXGlGggXPKK5YckkIJA/DPcab2i/rnGSU5gRjvAEPEhJYJ7Y5Rtk50uQ7ANs
	iGsstDzuI57lmCdQqnv1MHVuWwrifeV+5YTbls3P/jZdLIJuxGiivEHeeGvxVTUmCUU3+dN4voI
	+0mea9eyTT7y52A778dYqB9ZuJaQGyXRE4iB54gZypXpjDgSj0dKamBH0wNhln0AcUD4Q5l7C+G
	o1XqikujDkRNtvoUjEv2MFfYlB+PDhsu4W+WChIx+Yn8uoJHWRhsDw
X-Received: by 2002:a05:6808:191f:b0:561:fa43:1b17 with SMTP id 5614622812f47-5681460726amr2343413b6e.42.1794187770252;
        Sun, 08 Nov 2026 17:29:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade695a5a6sm4225818fac.10.2026.11.08.17.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:29:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 18:29:22 -0700
Subject: [PATCH 3/4] mtd: rawnand: r852: use the standard OOB write
 operation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-r852-smartmedia-attach-v1-v1-3-56d08c0571a2@gmail.com>
References: <20261108-submit-r852-smartmedia-attach-v1-v1-0-56d08c0571a2@gmail.com>
In-Reply-To: <20261108-submit-r852-smartmedia-attach-v1-v1-0-56d08c0571a2@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_172931_536396_2EDF27F5 
X-CRM114-Status: GOOD (  11.58  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

r852 uses interleaved ECC placement to transfer a complete 512-byte sector
and its 16-byte spare area through the hardware ECC engine. It supplies a
custom OOB reader but leaves the OOB writer unset, so the NAND core selects
nand_write_oob_syndrome().

With one ECC step and no prepad or postpad, that writer starts programming
at steps * (size + bytes), or byte 528. The subsequent 16-byte transfer
starts beyond the spare area instead of writing bytes 512-527. Raw OOB
writes inherit the same callback.

Set write_oob to nand_write_oob_std(), which writes the spare area starting
at the page's data size. Keep the interleaved page callbacks for full-page
ECC transfers.

Fixes: 67e054e91924 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/r852.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..e78606b97b42 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -833,6 +833,7 @@ static int r852_attach_chip(struct nand_chip *chip)
 
 	/* TODO: hack */
 	chip->ecc.read_oob = r852_read_oob;
+	chip->ecc.write_oob = nand_write_oob_std;
 
 	return 0;
 }

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
