Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2890360A3839
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 17:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4VNLSok8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KftAfTiG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GRKg5918OvEjcGMXbsbUqGmnIonslmVEN+eGKNrTyPE=; b=4VNLSok89yifQoT7xaOvj4ui/D
	hpobXly0SFVrIi+9c9BmdqDwO8/vIQB2vRdStKXQmBbOPS/IkuFMz02E6GJCsttDd6/tiYrvY3YAh
	56wo3JtdSTOaTBhIrt4F38Ze7p3qumO9ZUCom7lB2kuHUdMoe5yu+axyTru1W3WxDeMG3p+MKdRRk
	TUm9JfqzCyAgOpIC6k1W/Bhs8RpebwbAfOBS9x/MgKJqNpwGcO7Sr1GVO/tF0HjEylzSSLHrEifSM
	1fttGemDrmy0SI4Age1zpe8vPIoZ/hx6FOBhhO1NZfZyw1GEyYbLOAz1eNu3HResudBnzf2YsiFOy
	KizdqO/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjpE-00000009pQi-3Dc7;
	Wed, 18 Nov 2026 17:52:04 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjpC-00000009pP9-1AQt
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 17:52:03 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-845788309b4so633748a34.1
        for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2026 09:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795024321; x=1795629121; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lrYP1FavFeNWo91iBiZFr6F+xFd7OUXt7KDpgSm32fY=;
        b=KftAfTiGkTgZ4RlMN18DnZgsEYJ4lrO3/Dk8ytnsFYDUW4twbrZZz3sQi8ZTneiun6
         eh7oRFuGwFZaA9DvLdfhfjw4S1Kb4adHxxfy7g9vrZHs5gfmmPkZIWvVhDsN1hVd0Fdp
         sWkwHfs5OGfn5izuI5f12jnsTY3KmvUT+gEwuxh4qp0bw19cgv2CEHBk8wfuBE4geet3
         lU+9LfqSRyWqOORJZ2fj2TV35/WK7iZfhI7VkPTfjh+iZ5K+hjo/VoArM/ZobCL1lT/U
         VFlKWSkBRUrzda/rsVnF0gG4fsBciIgPuigB9XunDqyUHBfGBqGT4LOujUqeN3d34s/T
         5pOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795024321; x=1795629121;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lrYP1FavFeNWo91iBiZFr6F+xFd7OUXt7KDpgSm32fY=;
        b=zXflA1IutIv4oUyp8lqKUZUV1+6SJDWXepDjEDwFuTCx0HMYSy50f2E1djb2wVjjvr
         ND9M9kF4WeKWMPor8wLJ465avOeDx82uqrWccumfjEsdPL5dFzHC/ffd68rcnN6DQgBx
         ipCGLlNucSm0UqR2yhCCcpqIZRIPXEhSBmp7Y7MkKviqXgG9mZwHC/8jXFIMUriSJHsu
         O1EjypeRBx6nTvOwRDwmUVhz8zlt17XZEGC7doNYMGyPZFYV8gG2yUp4KpB7WNdWIY6k
         UbpKJnfyBcwFXCaUC8ElDeZ5CR9vZ4E5IsBRG4GGHOUhtYiGIgrfYUucub+1IzIr1dH4
         a5IA==
X-Gm-Message-State: APuU4Z8I8xQfhyWt+Px/KMl5pk3ym1qqLgFp8GvJjaZhFgqcTiJhL40G
	8831827FdTSG54UqJqKniwrjhTinMSg2zDJhWXSUWquj+C4lsRW5hHnSIYAw7ir4
X-Gm-Gg: AYBFou3zp9H56K340cpvfiCGnI2lT7A8O52SuIpSGdASRe2mtWFse4PyjLUu8Up64gM
	CB8K9LU9bnSWY5CWuwg82R7pr1S2ohwmFMHcjvkMXZsWNDV5wsq1wso7ObjgRsDZ5lc5jrPUhc3
	mfG80CbowopioCQrGT3In/mQzLcRTKI1NFWSWgLJdv99FniEhJa5XAwTEUSKS55cQ57Ba1fdSqu
	QsG2HJRjb1hmITj1pBKC5eOvhE9TLvCYmJv8VvOc0Ptkt6f8kjz5WJ028PiB+/viJ8bcgM8oRt+
	bEfRD7lNM5iwIN5zW/7o6aKfKo+S1GDEnBwr8uLisa1dxB85NhvIwAGcHNH2arD/D5S2ZbGAltN
	pZqf/aYidbwwE8hFVb3uMJkgnIYYOT8jVvcYT4hMrtm5d4TrdQBG6juW4qilQQziJdB6PpOS9/S
	9HX6MfWwrRb+AWA1w4lSa0P/klSUMu8G0wCGp+EXzcoaF6WxM1IPMvDb3cM8tzforO9Icdmoqka
	qEWRYmDIx29VVptK8KQ5WSnNqCaPljpXgEWAUuv11A1syLDv6sOyNkLnfL26crLWjtsZnboZ73X
	Bd4RMmXBDY89v4Q79KUFTnvcLIW/cZY3CfyyXivg2y1IBGpBiIlBOyt5JTCrkcCXzKYEQT4PGnT
	BEbN/KJy1KC+vilkFMjFqjOGAS+6WF49bFL/eaY0z4ttQynQ8UOyFvUGA5kb23gga2Vw6l9wa/R
	8vb4wQW23gNIcAZskBk/rI7R56PZB+SABw/3fehlZBBndsziPGSCBY
X-Received: by 2002:a05:6830:2695:b0:862:c3b7:c2b0 with SMTP id 46e09a7af769-862f08ed656mr3149683a34.9.1795024321103;
        Wed, 18 Nov 2026 09:52:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01d4759sm2476806a34.8.2026.11.18.09.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:52:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 18 Nov 2026 10:51:15 -0700
Subject: [PATCH v2] mtd: rawnand: propagate non-ECC errors when reading the
 BBT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-submit-rawnand-bbt-read-error-v1-v2-1-1a3f5d121c5f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOQQrCMBBFr1KydiSJYNGV95AuJsmkHbGpTGpVS
 u9uWk8gzOI/+Lw/s8okTFmdq1kJTZx5SAXsrlK+w9QScCisrLZHY/QB8tP1PILgK2EK4FzJhAF
 IZBCYDBB6F4Kh+lRrVTQPocjvbeLa/Lg4buTH1bs2Os7jIJ/th8msvT/myhmwMWp0MWK0dGl75
 PveD71qlmX5Ahcd63riAAAA
X-Change-ID: 20261103-submit-rawnand-bbt-read-error-v1-eacbdd1e7970
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_095202_328840_6970D72D 
X-CRM114-Status: GOOD (  11.74  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When loading a bad block table from flash, check_create() invalidates a
copy on -EBADMSG and schedules a scrub on -EUCLEAN. It ignores other
read errors, so it can report success with an incomplete table in RAM.

Propagate those errors when reading either copy.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Explain how a failed BBT read differs from the ECC recovery cases.
- Link to v1: https://patch.msgid.link/20261103-submit-rawnand-bbt-read-error-v1-v1-1-2ff0abffaf2e@gmail.com
---
 drivers/mtd/nand/raw/nand_bbt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index 93f162805f31..f3a1fd31ca03 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -1024,6 +1024,8 @@ static int check_create(struct nand_chip *this, uint8_t *buf,
 				i--;
 				continue;
 			}
+			if (res < 0 && !mtd_is_bitflip(res))
+				return res;
 		}
 		/* If they weren't versioned, read both */
 		if (rd2) {
@@ -1035,6 +1037,8 @@ static int check_create(struct nand_chip *this, uint8_t *buf,
 				i--;
 				continue;
 			}
+			if (res2 < 0 && !mtd_is_bitflip(res2))
+				return res2;
 		}
 
 		/* Scrub the flash table(s)? */

---
base-commit: 292f737382d3913d0d9addf220b7170fedd7a04f
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
change-id: 20261103-submit-rawnand-bbt-read-error-v1-eacbdd1e7970

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
