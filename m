Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0C7606A31B
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2026 05:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EvfeCd3Q;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JVdOBc0q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=q15ZZz81JA0sbEAFa2ofU+zP+tu0Rk2RgL8uWTSoNdA=; b=EvfeCd3QmX/Z1ZGTRxFj05Huzx
	XUz9xvL6KuF6CDKnfshhNVrUmehyPh6eJWzRirAjloadGd7inKTVnrDlCBAAzyLIlROshBNku1t4A
	6St7R2DZ1b+5syVExvif/rQM4fPvMA/D8SxznvNorTONJ17gZIVPDrTrFtkJKVAET5d39Ekyt0S/h
	mYt5xMAFwhj1Km9/VRQG5DYKL/hLgJAHLwHsFs2SwgsbQMvPX1/E7+6Ct2KEiWScCwLlS1BG9nZgZ
	58QAdfXi2wfV/nre5w6eItCP86V0mhKFPSI5UnWNiH8oTFHnoeZ/z/gjt5UGFx0C12DqPcglGGVa+
	dacvOj1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOTvj-00000004MiD-04hG;
	Wed, 04 Nov 2026 05:53:03 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOTvf-00000004Mhq-3NVx
	for linux-mtd@lists.infradead.org;
	Wed, 04 Nov 2026 05:53:01 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-4a71d0c4233so198385fac.0
        for <linux-mtd@lists.infradead.org>; Tue, 03 Nov 2026 21:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793771579; x=1794376379; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PWNzAEUlqUhQhzj1FRIC30hWMwZHJiTM9XF80PR/FEc=;
        b=JVdOBc0qZzElkmrlfXCD4aRnIPfrBYfXJss2CxczzN0CktwA9ciQJFvL2VaG+srLCH
         15BmWvdwsP8+Wj5C1o5LpWQfJwCo9j7UCuwP85NNVkXaXcXLXsqDxead+I7H9bzsl1s8
         T6lQp/gVn/iHr+N2nv7cbtNbbEJuwovim/CjHYr079uB9reI0DlZdO2woHbIJiOkOa1o
         XvEu1+ZL2UqUs/UiF8Lvxlwgcdi8f61sOB/frgdSBsyp6i6r31HbnGnjn4oxWrmeTIO3
         aOy/z/o4C3sv0OLdEbsC4TkNmtncNTFsvPtGS455Wtr9PXcbZsueMuGMNE5uxK7+d3p7
         a9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771579; x=1794376379;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PWNzAEUlqUhQhzj1FRIC30hWMwZHJiTM9XF80PR/FEc=;
        b=VWFxgK/vQDNJVJ4TPydc7n1vIMQc5aJ4KnU0NnZjUcV/6Av1UgJqPKw70E3KuKdXJ5
         Oipbvbo5cQbmLn9Qa6dvCnMX/E7WanCV37YJxhfFpCoo+S95le28QY+SbRLQzjpNNIV+
         xNiWk4tp+rSh91Yf+RSSEkS4Jko/2lqObSSkyBKM6gTjdRZTA1a76+SSO75ExtrBAp92
         YwBYEWKUBXqrO/RlJa62pQiTwl6/JT2ZY15zbyYi6PxkvLzveFNOOoqD+GNdnt9hNnsI
         +NPq7JnshyVRsMwOerjfjAxp/KWKIqGpjBYtW9UBLahjdbqVtZCigPaXou6dNOhQ6nNO
         S21A==
X-Gm-Message-State: APuU4Z/SZgkr6s3nKfG/Ub91LzfV2i+ia5xc8sgHFrBwQyF35ozsZaw0
	9m4xNE/d1pDWrdr9hKIv22RabZanlICEcDyPMGu/mq5XXXk0/3g2vgdl
X-Gm-Gg: AYBFou1Q+Lv2sCriHD17lA1WbP6c0a/es+3ZfKm7sLkl1wJm6kQABrcux86Z92W1IHr
	ba40upbLFiBkFwHSWoI0oxv/0gbvxxQFiFUWj985XXeFdZjTG6F0qgWloTImO6SYVukvP/Z1VXH
	F2I3TNQWeHqMeCGvDJGxcbxPIL3jH2FH0rnaCzWoACmnf/4S95PGFPogdgPdKJuxjYaJ0ctNTS/
	sflwxL+qT+nLIGcSM/J2wj6E8fVhm0zc2Xns5S8sKVNrU+K3Ew10Njdm4EWHHUDMM/vdC4ok7U8
	Vn25NiDqiP+W0S71yuU4XbDVmTeMhgMLjRV6xa5YDW6aUKvJfFd4xqBi4UVOpTMZyqmM2EeGY+R
	MlXOO6/K62oYRO9ioWla7aZ+o3w9dq3I6d4SRcDk6IFlcdqlbVLVLUopSAE9zu1sPwag0PNsuAw
	wjHk/MPzPX32y9EYlgl8cuvxzvbKn6FieQS+tJgnwDKVLubtaKthZoJ5h7jhqUlj4as6qDcSEmJ
	fGQfBsEg7fhPEiHXzdegnQcjPdVXK0JEnwYYSVVfkz3K6R1lGpSX+43Y/J8ZXaf6v7HqcbYNV6J
	ZC+ux4kqk5uKB85MpWE9nLVlxXU8Ucb0gaT/jS2L3EX0jVmewD3a2fLHGxGZZS7ZWCEPw3Pqsw+
	KskEv1TlfzIiqkxQj7AYruzvE+VYGTyB+mAAM/4Bj+2EYeaU+qS0m6e2rgOoy6d95Xe9U0MTgG9
	EdFoWQISUMzEz49vNSMNcpDlJITDWZDZGl2n+hUc+hfrCapacEukuzxUgJmGsit5YhGAC3c2f3
X-Received: by 2002:a05:6871:3a13:b0:48f:e25f:1dcd with SMTP id 586e51a60fabf-4a9077eed93mr9988226fac.61.1793771578554;
        Tue, 03 Nov 2026 21:52:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acd52a6ffcsm1069814fac.1.2026.11.03.21.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 21:52:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 22:52:39 -0700
Subject: [PATCH] mtd: rawnand: stop BBT creation when the marker scan fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261103-submit-rawnand-bbt-scan-error-v1-v1-1-0bef8334198c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNTQrCQAxA4auUrA00UyqDVxEX8xM1glNJplUov
 XtHXb7N91YwVmGDU7eC8iImU2lBhw7SPZQbo+TW4Hp3JOoHtDk+paKGdwklY4wVLYWCrDopLoR
 EfsjeE4/RQWNeylf5/Bbny7+b8eBUvy5s2w4KwM/WhAAAAA==
X-Change-ID: 20261103-submit-rawnand-bbt-scan-error-v1-1183d881e5b2
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Thomas Gleixner <tglx@kernel.org>, 
 "Artem B. Bityuckiy" <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_215259_855414_C6836796 
X-CRM114-Status: GOOD (  12.68  )
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

create_bbt() returns an error if reading a bad-block marker fails, but
check_create() ignores that result. It can assign version 1 to the
incomplete RAM table and write it to the primary and mirror locations.
Unscanned factory-bad blocks then appear good in the persisted tables.

Propagate the scan failure before changing table versions or writing
either copy. Keep explicit NAND_BBT_CREATE_EMPTY initialization unchanged.

Fixes: eeada24da8bd ("[MTD] NAND: Read only OOB bytes during bad block scan")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nand_bbt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index b0e7592a2ab7..db9d6458af51 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -1005,8 +1005,11 @@ static int check_create(struct nand_chip *this, uint8_t *buf,
 				continue;
 
 			/* Create the table in memory by scanning the chip(s) */
-			if (!(this->bbt_options & NAND_BBT_CREATE_EMPTY))
-				create_bbt(this, buf, bd, chipsel);
+			if (!(this->bbt_options & NAND_BBT_CREATE_EMPTY)) {
+				res = create_bbt(this, buf, bd, chipsel);
+				if (res)
+					return res;
+			}
 
 			td->version[i] = 1;
 			if (md)

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261103-submit-rawnand-bbt-scan-error-v1-1183d881e5b2

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
