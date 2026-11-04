Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585ED606A334
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2026 06:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gWX4PBMG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sot3dLza
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JBd26cPCsoqldZrcomj929o35AKWKwXT5SWyDL/msCQ=; b=gWX4PBMGPCgVsVEx/fMdwKeYB7
	mr9Pf1eJ0cCXXa7/E7vcRpJTkyheglJW3I5KOXDiJ3/zQW2uiokiail+vkaZkMdDE4A8hRM/Yc/5y
	m3qjiyUbUy8pD4N8fm5vAxoSxr0ry1x8bzQ81qLZBdmEOECqzSpUoXOLwS7MCywdvlWp2bV7aTYon
	gqsZ+ss6f8IzuVUznYRVIAyvBvlqeLigX4yC41frW1vosxMzKhybhWF4sg87xxlFsoao039iAjkU4
	GL2Qv0ZGLcV9WNkvqoHj0wUmSUyxofEgle3V217kfBH6HPaAYLZu15L7Oq9EfWeEPj6n/JLvXJ3Ub
	krkR5fUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOU66-00000004Nro-1LvK;
	Wed, 04 Nov 2026 06:03:46 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOU64-00000004NrG-0ITA
	for linux-mtd@lists.infradead.org;
	Wed, 04 Nov 2026 06:03:45 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-483c607ccb4so265685fac.0
        for <linux-mtd@lists.infradead.org>; Tue, 03 Nov 2026 22:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793772223; x=1794377023; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pgZj8XAsyakdaOHd8NPgcTUkVlwW76G6Kenmml9Zffw=;
        b=Sot3dLzaqHoSJZNtusLTHDIYyHdrt6/Fpd47987L6VxUwJBcg2H4tFw6Li7CQ3xjcc
         JtRwW/WWpnUkL/JLDNfCxFz4cEiPJnb2xTQ/yeNwOI0K/s87kgBWkGoaV9PSazgnhf9T
         jcVsy4kOGahiCqp3Asc8p2xJk5nCC11WZH56ni2ywuPn7ztvK7NgUQrriQSGl4++c/la
         9DpxU+VjNUPl9H32noZ7BdWcexq0qokdkm26j750BSTO04JzUNyHcJIQcsPgcoMO6xcH
         ljuE1eEuZkTeFAyOwSaMd+mSyEAOrO84PLgBXUWpwXAaVGOgCsQ2ylTA+hYl28X0jAHu
         raRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793772223; x=1794377023;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pgZj8XAsyakdaOHd8NPgcTUkVlwW76G6Kenmml9Zffw=;
        b=V5+vcX4wo164rBQfF1IF49ARf3DL8ouflY5Ik+B2+WMmDOdpO5cIOBkrXJ4nDxiUhD
         V2bONPnm5RE7a9GQN6QGhoUC8sGm4O9vbrkKcSBZHkljpdngWgZjDC98OlfjIqlJPg5Z
         pNnT/hG2R2rb7W1s3Xqnfd5vm5K7V0hHu9TR4IW+ScKXRQATYZY8FhmAnVcqkUskYWYj
         IUGRUNbTYrABI6NtD2t/IVAIjPzrS6TIwozK5n6IDkHoGvoDULXGAOhqChwn5ADsjove
         mUzxx7vISDS3HwZjybCT89eA6gjCIbd0FNQmvvNFMh1pe7ptkLDZwF2dio8cgyFQZJx+
         4qwg==
X-Gm-Message-State: APuU4Z/W1FWS5Zm2TLwsEVuRvEMTWVo9nTdq5xdvccKDPAzbpX4x8P5p
	9Piiklq9n6RfT5SJd4rgESbPZ/r4gsn9s91w616uSWpQBbzMnl/bB3ga
X-Gm-Gg: AYBFou3IEFPi0D3pdV0DMP5EuQ0DuFala3LeihOwFQCdHuMvzf3Guc2D9KEh3+yh3NT
	fvRqSMzRxxNud6zarnHacYTdJW2WlPIhUDMzqbe6I+Z2Wsz/zfTdAs9glaI5wLxfUCInLTMqFzC
	TAoeMF2rT4rq6uiE4uQyw8N8c3wAPKP4xUPgUsxx0+qJ/aJEOg0/kusCMwwi4gFmORnfMVCKbtF
	dX4+XEf6hfwQijQd+vBLhcxL1CHFeB/g8d4QP1JM8bAo7Y+fBaJtAAh87whD4cJwxh6FIA5OPTc
	PaKzjIqinlQ9SBbyfrUrfNwoGmULno5X3dgCvPF6HDlymycOgZRjwUqBnE7UKm/s7UGt8Aox3lL
	G14ZfqLGm/pHQccileXdLNXgvzUDmYlXCwFRsvgyafqgmSjRMidZzhYlXfyhH8TZEdI+JGUJXMU
	y5DLuRTVLIV8FfrBo9U3uo619gnQb+HzOHUeBVEOyn36FsBcAxUYxjR2Mg0o8/NfzxH9dTvr0/4
	ybPEG025070GRVJdJze9lEW9SheVOaTNICX5q1q2Anbi/PYfhixCeNM67dL0HrBmKtcNFz9kTPB
	i7MrFWsZW5FOiX/jXNFRzM0VaaYRsq74Cic1PHUkNd9X4SMgYBfXkRgXKGoTFU84dEhjvOpw+I1
	V/I74x2In4mM7Q5mQQw8rbPEBQHCJd+tDMsjWJuzRsiUUHAj48OnvA56OKWhpQHelJ4tI242An4
	jN2leKrd+4YcamieS22zdQIRCX3po6RD8iP2ATquRki4pOw5NSeKU=
X-Received: by 2002:a05:6870:e254:b0:47c:2737:edd0 with SMTP id 586e51a60fabf-4a9072fc9d4mr9853692fac.1.1793772222723;
        Tue, 03 Nov 2026 22:03:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea4a360asm1065695fac.5.2026.11.03.22.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 22:03:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 23:03:39 -0700
Subject: [PATCH] mtd: rawnand: propagate BBT read transport errors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261103-submit-rawnand-bbt-read-error-v1-v1-1-2ff0abffaf2e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCQAyF4auUrA1MKlj0KuIiM4kawalkahVK7
 27U3fs2/1ugqZs2OHQLuM7WbKwB2nRQrlwviiZh6FO/I0pbbM98twmdX5WrYM6xlQXVfXScCZV
 LFiEd9kOCyDxcz/b+XRxPf0fjpmX6dmFdP8xNmdOEAAAA
X-Change-ID: 20261103-submit-rawnand-bbt-read-error-v1-eacbdd1e7970
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_220344_142145_F03CD506 
X-CRM114-Status: GOOD (  12.25  )
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

check_create() handles uncorrectable ECC errors by invalidating the
affected BBT copy and handles corrected errors by scheduling a rewrite.
Other read_abs_bbt() failures are ignored, allowing initialization to
succeed with missing entries in the RAM table or to rewrite a table that
was not completely read.

Return non-ECC read errors from both the selected table and the second
unversioned copy before updating versions or writing tables. A transport
failure does not establish that the selected table is corrupt or that an
older mirror contains all of its bad-block information. Preserve the
existing ECC-specific recovery paths.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nand_bbt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index b0e7592a2ab7..93c798ac4f9e 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -1023,6 +1023,8 @@ static int check_create(struct nand_chip *this, uint8_t *buf,
 				i--;
 				continue;
 			}
+			if (res < 0 && !mtd_is_bitflip(res))
+				return res;
 		}
 		/* If they weren't versioned, read both */
 		if (rd2) {
@@ -1034,6 +1036,8 @@ static int check_create(struct nand_chip *this, uint8_t *buf,
 				i--;
 				continue;
 			}
+			if (res2 < 0 && !mtd_is_bitflip(res2))
+				return res2;
 		}
 
 		/* Scrub the flash table(s)? */

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261103-submit-rawnand-bbt-read-error-v1-eacbdd1e7970

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
