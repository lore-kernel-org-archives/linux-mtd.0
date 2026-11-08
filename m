Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B59606A31C
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cn8LurdB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y5NnPz2f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QlYgXePETIoM6oG4I3ptNgSIBbpkkNGIt8YyoCu1IQc=; b=Cn8LurdBWIRPVdyPPEtg6EsrJ/
	GpW12hS0dGCYddmi+9xO8gsNSlXHYlXZXaePVccO5+8kw6J2MUXutPAguW++MOoYT3RdCuvAkv8Yh
	5g8uZF361tUzbPuNN/Fo+kMYXan4+KZm799nBAfnCgnbx3CXh6fsHUldyhGbmZxm0H8NIL3+9VUe9
	CBfE8/CXYkidmMBpQ3MGtE4pP4+oN54Q00JYLpNJL6h+pgMAFlfT+NTHvrIc6usJemG1ImfszG/fc
	8WGDfnGBew12Y5Kc/1MMkq5PWCBIWuakVJMUgc/XOu6y+AzdvLOM2UQpM8S8KT44wgc7BKaBNYtex
	gJ25g5Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAMq-0000000GiAN-3Q54;
	Sun, 08 Nov 2026 21:24:00 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQAMn-0000000Gi7n-26Vf
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:23:58 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6e560e00a86so161351eaf.1
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 13:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173036; x=1794777836; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZzgA6XGsC14IAPU7geG6In3ud51Yu9iRbZaXfcFbd7c=;
        b=y5NnPz2faAKI5SYInZr77nUcq+3hdKOs9lEUy97XZ/LEmUHzNPKlXKGIUDknaGqrQK
         gccowviQq6lxzAEm4zMy10YhZtWnNVUAB3aMOI2vHUqbTOoMHB46ZNRuH1AuoIyPGWi/
         hk3rf8croblXAcmIVFzHIrt4KmPiZP2JDMzNowPWBIu+j94k8VPj027z0TU4c/ylwf5J
         MA1CgA/hWwjT2TF9Qb++mQrJJ7MZYZ7S8eURPqo/qvamK/8UbZE/edi7ON5bjgZELRpK
         bGcbRD4ttVwJOOrpGmEUefUnjgQBtIVHvklwsENzKOYepZ3Awhb0so063OuefMFLRzIf
         79ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173036; x=1794777836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZzgA6XGsC14IAPU7geG6In3ud51Yu9iRbZaXfcFbd7c=;
        b=q9ZG3EgGSd4uEyqts0F9tTuMFmS8MOeF1Vnl7x7fzTyQFIJk7/LJWr6oLfEtLOtFVI
         CJOhPzqKbGUw6DQkruvjDsV+NuUpOfIjRO/RX1GD1PP3RnR0iyYEGQfOfDIlyiiWLjGf
         eyQ0knz0N0MRAUQh8DI6iq27WKAcjGM4aZq47f12vPiT9WmeWPVz5ya7oWALcDkPeSQy
         7t7fjZnhzpCZ8eUyo8DhFzoDjNiVk3wBYXOidaSP8wIyPS60pRksI0wyQAIIXFr5ohux
         o5CGjGl+jHlI81bR2D0gCvewxhHQCnMxMqwCM2DviKDQoKyNShLZ9JcO3FRmsnjPC82b
         FZrg==
X-Gm-Message-State: APuU4Z9Z099ipeXZ3WfoohgUM5fSLuHlymBD+tk717/FAvtowy2MVrK+
	XOrU4LUgW/aQzujvFGMQXBTx7gMH+CS+oioynGbQziqj1it9FTVcOpPd
X-Gm-Gg: AYBFou1yY7dHzIEHiPEnnVE5KLGNVhIm2yJMMbyZQA67mrc27Vv7Cj4abjZRiGp23se
	uzbKWLaczVGb4yldkrdlsk3OYfDO6lJaoqheXwdk3WJUzevIRjWejgb96pxvblZKKyTMxybeCi1
	l+tukfVcsDt2c6s20/rGmDIppG8GqQFZulVJ+d2Ek8WFHW7BAd06+NAi4ea4H1AF9Hi+c8OOQXf
	H8TF0KIUG5VHs9w5BhLsrZPNOYS1RwW6gyvSBKCI/DpJlzjoBD6QerNiqH+mkBuwHW3Fdtisa3Z
	wwrinRiWhibzeTQ2uIfRnLUJbYJvgye6rCOUTRz+q35Y5uk5aoiIVjIitpSpljf3jzuDNGJK+rL
	N8tod0sksggdFg2cpA5ICGqOuv95v+iz1eYEDTP/8Z2MpOD5fuwMRDEUWN6lleP/oYoHGKZ6eXO
	Quz4pQr/9SzdP6meF1TMlJYheqW4di82sEN6T5kmLK72jZlPH7GZoQ3Kj4Zo0nV7bAkIPHSPtM0
	a9G7aCldcMJJqyF5kbmuGIeH3PRZ7TjX/fodDLQSyAJKSjTv6nC21wp2c5ZdxBmCRoATfLk+374
	HZ6Qk/btKv5NILZAKCnuJX/jmeocZpQuIPrQ8V4nggrzv1K4l2L7ubHDtT4Nb/dnslsIOqDu2Fj
	Ed9SwmRQG9ihfLF+UUmsBYRYKjcTsDTXmUNZo3hCzmUAjDlXfWXmnD2HLdh5I5ybukeoptjzVPo
	CHo4HWuGAGL4MWKVvGb6Ha3zigV3uNj65QzBtDiEx4j451/7zPGtA=
X-Received: by 2002:a05:6820:a29c:10b0:717:f38:c6aa with SMTP id 006d021491bc7-7170f38cb27mr789245eaf.35.1794173036399;
        Sun, 08 Nov 2026 13:23:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8fbc55sm1908138eaf.12.2026.11.08.13.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:23:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:23:23 -0700
Subject: [PATCH 2/2] mtd: rawnand: serialize bad-block marker writes during
 BBT recovery
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-rawnand-operation-locking-v1-v1-2-565010fc5f8b@gmail.com>
References: <20261108-submit-rawnand-operation-locking-v1-v1-0-565010fc5f8b@gmail.com>
In-Reply-To: <20261108-submit-rawnand-operation-locking-v1-v1-0-565010fc5f8b@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Kyle Roeschley <kyle.roeschley@ni.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_132357_563094_89B34398 
X-CRM114-Status: UNSURE (   9.90  )
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

When erasing or writing a flash-based BBT fails, write_bbt() marks the
failed block bad before trying another reserved block. The erase and
write helpers release the NAND locks before returning, but
mark_bbt_block_bad() calls nand_markbad_bbm() without acquiring them.

A BBT update triggered by a bad-block marking request can therefore
issue the recovery marker commands concurrently with other NAND I/O or
while the chip is suspended. The chip selection and shared page/OOB
buffers are not protected on this path.

Take the chip and controller locks around the recovery marker write,
as nand_block_markbad_lowlevel() already does for normal marker writes.

Fixes: 10ffd570f117 ("mtd: nand_bbt: scan for next free bbt block if writing bbt fails")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nand_bbt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index b0e7592a2ab7..51fe991358d6 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -720,10 +720,12 @@ static void mark_bbt_block_bad(struct nand_chip *this,
 	loff_t to;
 	int res;
 
+	nand_get_device(this);
 	bbt_mark_entry(this, block, BBT_BLOCK_WORN);
 
 	to = (loff_t)block << this->bbt_erase_shift;
 	res = nand_markbad_bbm(this, to);
+	nand_release_device(this);
 	if (res)
 		pr_warn("nand_bbt: error %d while marking block %d bad\n",
 			res, block);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
