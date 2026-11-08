Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E89606A31C
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cgeD1ghj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gAY2+Vf3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CrSIBZP2RLCQWXl+1VDhjcsT+y6RXNrgGe7HtDjTECo=; b=cgeD1ghjcAS85jc7He0dNsEaYr
	8FN4FgmmAseatB5oNfWObVba6Xxi2HtHNy/bU0zd67alrQlWoZWnrh0iV0w0jNmKi5i3FLzcxyoSc
	iGdT6+pwhe4uo36WH3dHF7qbQ1e7OHCKNHXKZCDZXqS5ZKyrnpqgQElO9eh1jndwgzvFQHSIAo5Af
	DG30P0SSnprDL7bFMt+8oc4YHxzR2vvTClb/fe8BKcQIyqsuAyQyulWaRLgTq32wK+QXfGsuLbrS2
	Sxo0TlJ6q+bqutzh6WhesvPcd39Jq9vD87qQ2jq5ShDAmcuGXoyccs++988DwSoS9ESRAABWFePHq
	VurmaKvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA1U-0000000Gen9-0ULn;
	Sun, 08 Nov 2026 21:01:56 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA1R-0000000GemE-41z7
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:01:55 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-4ad89c49e0dso59369fac.2
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 13:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794171712; x=1794776512; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xzZ92AGYO1/PLurTCQdhrPzW6aHFVPEii/Y+wkIOdWo=;
        b=gAY2+Vf3ZxW4rHXqByeQ4HC3//S/YaZ9ERDlTbflDnwaSmE7C6IqRZZTqNUso2DQm+
         dUxAwmBUBcr+m9Y3Hot3lmsDGMQJR8DML59OKeBfcOmsB9sS9HrUH+pJfR5Zg1Wb33k+
         Ey0ottVOxgtx4Gfo+nnU9LbgMfm6aTAiwZFtn6+9dHA9gTwCRnRb9ibXE2EFVRpUl7LX
         qrlrTLpL0hYSI942Xy0yleURwjjH+0ivY4uS3W1h6PEXg0iW1GDstkFIfRrOi7yF0JOw
         WHjDSOOhPe79/LrzJTU2xxCGWX85+bJNRFEMXpKnKLTKzX5tijg7n3IXA3xgRQQGYu7n
         M8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794171712; x=1794776512;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xzZ92AGYO1/PLurTCQdhrPzW6aHFVPEii/Y+wkIOdWo=;
        b=RzOP8lqv3B1zrTU7aYrx+SZ3NyC0qOC74urxJ0+ZGwn69Tan/qbW/M2CahSu67xuSa
         q2Eep8wV4cVx+wVDLQ/MC2L8cPQ6d3Zx3rin+UnVAs84xPeFEIg7GaB7CxKHnrJfbMAQ
         uCp6zmDIkFOeg77BfvYg64rxtKWRoCDtNbgcT5i0xQCu9HtcjJMp5g7noSUXROhEuAZf
         1BhkxQ+mnhJ8pgrEuMtCIylGYEdTuJYw1OwwzUQ1DFwioeex32wF6hxKZoyCyIBcPMAJ
         IXf452RZay0EqsBanhWHgHpb63cyY96V3SNZDtcZLxc95xO7hZwRS5FsS0NOa9pwQReJ
         YZgg==
X-Gm-Message-State: APuU4Z8XWeTQ5ortNgxuMnoOUDPENEXZrEiTTgnZnKBGuEMOIYy1B+w9
	u4w9eTq8tmthQISKsG8pdQxnThvGVaKo6/vY2I8ffvudl/YR1x7O5ading8N8g==
X-Gm-Gg: AYBFou0BBDMplbnPpw9CJd6O/CHhjMMriMzAZ1IuEYaw1BdEXFLy47/n3qWrSNLpSla
	012hYBT9jnt48wUpmTcogieixhWx9ywArrq0+KlYn/UjeJZwFt/ixbQIBl+Hcf+qEafvLzUSmM7
	h8Y7iQJlfeW+j1HUJKlIZUMiiFEcCNw3xxdHurNabvNTdrvRm72Df7UDDQ+NgreXEVUcEgUirqa
	0hEGvxW/Ad0jOYg/bTjbfgF91I9LkiduO3VweydvLx2Nnd0J7b5CAbWj+z7epklRo9K2oqOhQuj
	dy3bUj4LUtfkEzpAUO72PrCAS88F/KzmNhZtG7WcpxoLbG1TI4eghxagU56Z/bDzUUUnnCrwdlb
	5u0Laf6abHXya+2d6DLsFNSIDvChTUBhVSs8PGMf/RzgDgWzF2D+3fZjFibS7KEPcRjI9jf4HWZ
	0UYOuY1yz4iYm0bZdaZu506qipCvPFmSlqDkeUXrHUZfNSQw1tXrxI14oDbxu5dyomnky7ldT4j
	4MyJTBO5QupdGDCT/5cMp6IHMO+zfhn09lEogL/MYjn2EpfoBvCoYA6555PfQtVKA9IjRKLq0vD
	IgNvTKleg/LgXgiCl//FGypEan6oqc+GBEbf5TUIK2x5LGUgKBMe+fq0PBQDNIa5VhgwnFnCHFB
	RbrGARYuM6AYq3EOYyKBrqlKVBL+gOziN5wKgqJQIEhSYLwwbL9zw0W2CAXmpc0me9xmhSNc6Fq
	wPvHfM9B5WtJmQSf11Iog7uwDOUmCSaBqJ2OMX7i3SK0ZvHUv3WbaT
X-Received: by 2002:a05:6871:201:b0:4a7:1685:49f0 with SMTP id 586e51a60fabf-4adebfe9930mr1320398fac.11.1794171712263;
        Sun, 08 Nov 2026 13:01:52 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ade6a0c000sm3239010fac.14.2026.11.08.13.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:01:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:01:38 -0700
Subject: [PATCH] mtd: rawnand: nandsim: validate overridesize before
 shifting
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-nandsim-overridesize-bound-v1-v1-1-9cde7657a69b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNSw6CQBBEr0J6bQcGDaJXMS7m00qb0JjpgRAJd
 3dGl69S9WoDpcikcK02iLSw8iQZzKECP1h5EnLIDG3TdsY0Z9TZjZxQrATlEaeFYuRAyh9CN80
 ScDFofH/0jvrm1F0gq96RHrz+bm73P2fPi3wq7tJwVvM+WvFDicYU6nJRC60J9v0L2yG+VqgAA
 AA=
X-Change-ID: 20261107-submit-nandsim-overridesize-bound-v1-1c83cbe80469
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 wang wei <a929244872@163.com>, stable@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_130154_013944_826BFA28 
X-CRM114-Status: GOOD (  13.14  )
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

The size overflow check shifts by overridesize before validating it, so
values at least 64 already cause an invalid shift. Smaller values can
pass that check but exceed the width of the later eraseblock-count shift.

Use check_shl_overflow() to calculate the unsigned eraseblock count and
reject values that cannot be represented. Derive the byte size by
multiplying the two 32-bit quantities in 64-bit arithmetic.

Fixes: a5ac8aeb2900 ("[MTD] nandsim: enhance nandsim to allow arbitrary NAND size")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nandsim.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index fe968037f75a..6716eafb4b00 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -16,6 +16,7 @@
 #include <linux/types.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
+#include <linux/overflow.h>
 #include <linux/vmalloc.h>
 #include <linux/math64.h>
 #include <linux/slab.h>
@@ -2341,21 +2342,21 @@ static int __init ns_init_module(void)
 	}
 
 	if (overridesize) {
-		uint64_t new_size = (uint64_t)nsmtd->erasesize << overridesize;
 		struct nand_memory_organization *memorg;
+		unsigned int eraseblocks;
 		u64 targetsize;
 
 		memorg = nanddev_get_memorg(&chip->base);
 
-		if (new_size >> overridesize != nsmtd->erasesize) {
+		if (check_shl_overflow(1U, overridesize, &eraseblocks)) {
 			NS_ERR("overridesize is too big\n");
 			ret = -EINVAL;
 			goto cleanup_nand;
 		}
 
 		/* N.B. This relies on nand_scan not doing anything with the size before we change it */
-		nsmtd->size = new_size;
-		memorg->eraseblocks_per_lun = 1 << overridesize;
+		nsmtd->size = (u64)nsmtd->erasesize * eraseblocks;
+		memorg->eraseblocks_per_lun = eraseblocks;
 		targetsize = nanddev_target_size(&chip->base);
 		chip->chip_shift = ffs(nsmtd->erasesize) + overridesize - 1;
 		chip->pagemask = (targetsize >> chip->page_shift) - 1;

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261107-submit-nandsim-overridesize-bound-v1-1c83cbe80469

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
