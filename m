Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B62606A330
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2026 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c4hhR9u7;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTldXOJD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nb58QpSJPuHOEA/GvKqvmoGRiz+nW+XqL+FE8Tr8VK0=; b=c4hhR9u7n38qpwJa2L0F1WW1Wn
	7cXDgkkoGMKU4zzPq6I0XMNoizC6FtglF/Yz2DUEazgn22wgZneL0qw0DQOXe3Tj5UO79JpvOArqR
	mn4fZnPw9yybNgDeOQ8ql+3/QaXhVvQCi03J2vykhTYARsRG/fR2ZYHh6PDrbSS7IXnGN61w867Wc
	90PO2vJ6Q0//57Q33G3xpUlUi/aZaTG9j+AX6h5ZwRtT9nupFHi7cHpZTAjhA26Yj+1OMpuogwsdN
	i4xCe9IuhWiHFhnKrzzyuI6jPC3ZMYVXczgTV8dLm0flto6xE1HXgxkhswoSoA17VApFyAh1RrpRv
	LuPbih+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3pn-00000000uPf-1XQa;
	Sun, 22 Nov 2026 09:26:07 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV3pf-00000000uO9-25iv
	for linux-mtd@lists.infradead.org;
	Sun, 22 Nov 2026 09:26:00 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-4ad60ec5eaaso2176376fac.0
        for <linux-mtd@lists.infradead.org>; Sun, 22 Nov 2026 01:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795339558; x=1795944358; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nG3yzDOrObg/oDwHdoEhmw7sw76zpjbwPxW4S93B/2w=;
        b=fTldXOJDwZvHR8TQ9E4fEhf2vXWlkSk7W2+O12CZF/SHK+N8Lz+85C1ApX3umH/ifA
         zqTy2Zn0d14YN51sCAtQSrRNIuTXZ5vJsOBlgtWgHDuKcr8rnnREt0MByWn+NjLUWczQ
         xH0X/xnfJqk4mv9BGSf++dcmMFduWidNrztyLbaVQUl08iIWEg7Fy0AZUYitJSjnNaEP
         OdQNnLWg424uFgRGnr50pGRUGgez3I7mqOmyPd9vf6H0WWNE+aKtKwu1FGN3olx3iRBP
         C3XpnsVCWZMymYfxrn+71IS5oGAEEEkthlUHvoteBy9SpntsD2Sa9rwojQA53G+7e2zp
         /ZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795339558; x=1795944358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nG3yzDOrObg/oDwHdoEhmw7sw76zpjbwPxW4S93B/2w=;
        b=PpqJ/w1exdSFiCg8pud54csQjBtO+PIlTLGbRggDovuf7Jeu43Svh5AC4n6oR3B27w
         0XE9tEuyGTqU/PAxtyv7sFeDEuSCHHhHTCANW6wnr2cawDQIXXwcbJFWvm0d7mVBsI1U
         xAAM+tsph4Au61DHVXM2sSsj1PjNgQ7p90RK2rR1H9SZjC3BwzbQCZR5ZV/FC/n/MD58
         j5iTUJuUkwztBDmVbjfE6c2/3JSbtmo1kx4e8rHjY5+VisEFHD4CaoyevEG4PhIUK47l
         zVD/gy7/cLJkLl7uXkZAyMK3n4kT4OQAY3l1zJanELcZyyxUC8TyRIw/NBuu8m3F8F4m
         j7Tw==
X-Gm-Message-State: APuU4Z8KVs3ZNFeTX2XkbIzGAfVNqybxuIQ036LWwOiEiv5CbqkfGNc4
	Rl6T8LaHIO6vgWHp4U8/bo03yZGEoK8XXbuK3aFv301s+kFvapgIjmtF
X-Gm-Gg: AZFdTZdqNsuJHhH3v7gjaz4G9E0tD56bMgiEen19j0BN2T3nXV7VMFsS1/bXdHj5EiO
	7cBIqxLjNulpcTcVSM3/DvavlrvZNynFsusAz2Y5kWDG7lT+9Q/kaNhuCPWyMo1zW6mw83xtLw7
	607aszyRJ48nYh9AcVa4n5b7YQM9w7tb0v93DRWGZaZtwxVYwPl9cgeATTfiSGIE/I2JqeVULmW
	iaIKuMsVx5OEjYzbErpuPL/SrFEViMTtl0s/2KXgiARQ9UzUh1bCLgXo/TdM/PnOKMWOz+XfdVa
	8w4tFfR3N5x4KnxmHigtrnBdnIBN1R4wgFLJPg85BBtteZZh3LclTW1Z5Og3LRR7awp7jY3E0bP
	VRCkhCxOKZKn75628L3ztOveqcDgXDaNXaE7B7QGLKoGIwwUhVcyqLNuRwc+WnUmJt3pnPVTzdN
	YyCqCm+Xgr6WrPpWmZ+pIzoyJg6+JGWMeyS91dQTEAKsNME9YoYlJEtOtn8HqcgC0HCqOCc+N3j
	mmqiinGFk98L7e+FSelqnRBLc+FvC/ipVPZ4h0Jv2WSSweYUo3zXvceS6ob/N0d8v/fZDky3Guj
	HgaHnx+AslDWIZMXe2djEtwPvGP6Q2iEBpCwgI1hBSkC2/0AExdiJOm11G9irW4FAm0NsnmuA5t
	QQOJFbPq2bzegeaE6Sx1x8Aeyz+E/ufwsLIGpsN7RUQRhJNPxFVTJScOgICTjDPc+TEIr5Pahg9
	t8o1NqMw7n9Cd3KFLvQaEGw/mWoW+FN2lmrHoGNe9ZAR33n7XP/Ifq
X-Received: by 2002:a05:6870:31ab:b0:4ad:60e2:474b with SMTP id 586e51a60fabf-4bc77f2d42amr5237085fac.0.1795339558408;
        Sun, 22 Nov 2026 01:25:58 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5ebdc0acsm8698476fac.3.2026.11.22.01.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:25:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 22 Nov 2026 02:25:21 -0700
Subject: [PATCH v2 2/2] mtd: rawnand: serialize bad-block marker writes
 during BBT recovery
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261122-submit-rawnand-operation-locking-v1-v2-2-030bc867f0c7@gmail.com>
References: <20261122-submit-rawnand-operation-locking-v1-v2-0-030bc867f0c7@gmail.com>
In-Reply-To: <20261122-submit-rawnand-operation-locking-v1-v2-0-030bc867f0c7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Kyle Roeschley <kyle.roeschley@ni.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_012559_550869_66D57787 
X-CRM114-Status: UNSURE (   9.01  )
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
index a18e10284b9f..a56597dfcea0 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -721,10 +721,12 @@ static void mark_bbt_block_bad(struct nand_chip *this,
 	loff_t to;
 	int res;
 
+	nand_get_device(this);
 	bbt_mark_entry(this, block, BBT_BLOCK_WORN);
 
 	to = (loff_t)block << this->bbt_erase_shift;
 	res = nand_markbad_bbm(this, to);
+	nand_release_device(this);
 	if (res)
 		pr_warn("error %d while marking block %d bad\n",
 			res, block);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
