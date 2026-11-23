Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE68606A31E
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 16:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a2W6rrna;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HZQ3ANEm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IRwdlYwQ/2DK+mbC5mPorJTO1SMTKdhHcrbA4neQRD4=; b=a2W6rrnabFQEjldIa+Hvn2KhDC
	GtCwmOG0acZGZ2nvf/JB266u6U/tsn4gdbOHuLRK9mJHOe895aQWZ+KuyFrvvlvBwl3n3WUoALqWW
	x5dkf3qnZF6LOtBavlXqFo3R9+dtpzUTOpy5f418JP0PNM5rfUr4MogLUOzmOEJ16kgEpr72coYlK
	nQSXWJAKvTFmUGxsK3PcCCKs2neD+BDFG3XibIOW+L4+wBzkkmmaMyDm6W60qnW+eOdkYkEzTS0Ds
	g6SrgMQM7TecTenI3XyhoykEm0nyH+JT2eltl51nEOLKONh3JmFKK6mRw6sdLNF4pi6pXkJ32HR70
	E7K1g9qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXMA-00000004GwW-2sCP;
	Mon, 23 Nov 2026 16:57:30 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVXM5-00000004Gun-2UQy
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 16:57:26 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-386bd881d39so184161eec.1
        for <linux-mtd@lists.infradead.org>; Mon, 23 Nov 2026 08:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795453045; x=1796057845; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Co4SdvXZ9sSIXs1Uh5/HXOpqDLiA1vGpW3W0bsDAIpY=;
        b=HZQ3ANEm79zsuShLJz8eLECi4cKD6ya8lcacnWLHrp47kGrtrrm+u4um4oMvGaxQIy
         IyZ4SjnrydTzldHWP1JVtAGNFmx0dghkzHFhQ/yXG8WiApUyofrlRNcR0ro28h6LjW8J
         yS+f2OqhAqtTS+Ds3HGKoIIM6B9zbTsLW2WZRJ94m2SXF+NHmuvjCeaUhnm/WTfIuYzV
         /Sw2ueHFpcx7fLnmAc4nWjYhAe7p9f7oMl3jSejr2tfoT60Td4xiXXfNg3RZpd76crWO
         ej/Ig8bzhr3SvHoyvYsIr19XkAEMQyZiJo/lSDm6b3/gbcUTRUSO/7CYe4+Nrm2/uttD
         dDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795453045; x=1796057845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Co4SdvXZ9sSIXs1Uh5/HXOpqDLiA1vGpW3W0bsDAIpY=;
        b=zlppOgrtYgrV2ZuMi2Om3KQ2RqFuQ+gvcyAs/BuyHEbeDe4/RE2PEhwKuTQXfP7DHO
         /3khRanvAFg+Y66a/6wTzx2ExZ4bObgFj+snXHvtlv678StUZX3SOrAmtz41CG4xuUtW
         QmT5ATu+EmJOd6jQI46aVzz4qhaRWang+C4et3mlKp4P4ElXK6p9iGxQRsuK3szWkgny
         whk6MFEk5XMk3OxJUcP6NgeDovGicihTKIfinU438YPgj9u05RLV5Cq0X3JFCAGXvNbm
         yPqngXUEejPKLWS93MLUXPV2etrRZ0YhNTmBAUiPoj1MB6h5U4zMFDQDEu/U/Yzrt3aL
         FDAA==
X-Forwarded-Encrypted: i=1; AL+hErHKzk5jmw09YTvAYMdHH0VirHza+Q3XPyARrxoPX1sjXm1f3oq+SymzNIlD1H2Y8DA3MD5f9MM87Ao=@lists.infradead.org
X-Gm-Message-State: APuU4Z9n2mgRdrI3VOOD0AGXgE+89deQe+EuM/o4eS9rITwFwYyJaVO3
	GE2kkKEQQKbXciJfYgJYBQcrPvhCWOtGjx6GQAmtCP/ZZUTQSzclBrIF
X-Gm-Gg: AZFdTZf/d7JVtWmb5GninMk0ZjP1mKHpKiG3xtxExKAaBbKziWI0a8Y1ux3BoersIf7
	4lS5mYnUgbUB4GT5KTml4vaSPkcG3DcyNtmAK+giZJB/Ob8d1zsot1NSYh1jxMnXGnW++Wu3m2T
	wVeefzDZ4arsdIg0dPLwnJUwaIlNuLLHk5EnDMxD69NyBT0fW5UNpcaFJrYeH+Z3v8tqTl9u3IP
	S/391oWlA6aDV71zHa3dwSJXQVA+10L1zgzc4lS+QcRhoOuPmlbklwUt6KuNjREvbRVal2uDHLQ
	DZDqaHr5K1yMD3crva/tLux7FUp+GDYM4ZWtmHHZ3NO1mwUpHUdrKq95/kFzmWeqqUSHZ6RJsKp
	K5NHHFWsraA0Nzgdbojzzm9JiHCZLk/i5CzLo7PLhdor8CMTB+64NSnLx8LhRbbiW9/9hgGfZNZ
	taryOdnxHYRhQbto63QNa5VB2iafHSdHnvk38gKgEGXdP/gwAb143MKiu13hRRKSTpmtwWhQnXG
	UBK2TIZtkF3NpqOyZOvK7cIkGi4j3CG26pJIz5JUljEnvzo6iHLqyifhd1k0wDwNR1LtN/WlZFa
	Ua29NcUXDovKvfijoj93v4LUFLOvgdDoB/su+NCxAWbXEYyObQ4A1ghrD4Ygn/csaboiMkDfAIP
	1mGNmaUrCCu7767TLsqP+hA==
X-Received: by 2002:a05:7300:5994:b0:386:a915:8b97 with SMTP id 5a478bee46e88-386a9158dcamr6410286eec.27.1795453044778;
        Mon, 23 Nov 2026 08:57:24 -0800 (PST)
Received: from acemagic-m1 ([2401:7400:c804:b668:77b4:9837:f7af:7965])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm39766715eec.22.2026.11.23.08.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:57:24 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Ho Jie Feng <hjf3108@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spinand: fmsh: add support for FM25S01
Date: Tue, 24 Nov 2026 00:57:01 +0800
Message-ID: <20261123165702.641230-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_085725_643092_5BCF506D 
X-CRM114-Status: UNSURE (   7.92  )
X-CRM114-Notice: Please train this message.
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

Add the original FudanMicro FM25S01 (1 Gbit, 2048 + 128 bytes per page,
64 pages per block, 1-bit on-die ECC per 512 bytes).

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/mtd/nand/spi/fmsh.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/spi/fmsh.c b/drivers/mtd/nand/spi/fmsh.c
index 6352e9c9e5..a2bdf3a445 100644
--- a/drivers/mtd/nand/spi/fmsh.c
+++ b/drivers/mtd/nand/spi/fmsh.c
@@ -216,6 +216,15 @@ static const struct spinand_info fmsh_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&fm25g01b_ooblayout,
 				     fm25g01b_ecc_get_status)),
+	SPINAND_INFO("FM25S01",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xa1),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 20, 1, 1, 1),
+		     NAND_ECCREQ(1, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&fm25g01b_ooblayout, NULL)),
 	SPINAND_INFO("FM25S01A",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xE4),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),

base-commit: ec1e844b9486302a488abc03ea918db60709766e
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
