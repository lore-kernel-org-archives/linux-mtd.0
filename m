Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7FCC88E6A
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 08:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XnxcHMK7gZknJaCEXsioOBOaTNaPpSH3tM+EQBOVo6E=; b=1GFSO2WvG+MKgV
	skvmAZSeR1X1lfyViaA8eYa0RAzrRhH4hQc47Kw0ZlXPAcWJoQrYqEElRnNSJ4NDihZMWnWaBERlJ
	bjvohocGtAW8c8llbOXUvEm4mJ5aHzJ1dnTYI9gaLVZaLQwBPvhVXgC7bzsEakltTzG22lDwKPSju
	1q5KLhubg8XrtK4p97vEBOnBFZ6gKdYsdoQq4EUCms6yJ/BPTX/xttfI/Hbo16eyoaVjBq2i51rrO
	hLXMj+90anLlWjVtP3+UXNjyQqM6QJM0HDs5f6iQn5+2PfXGJzCLR+XR2bXue0qy1nI7ppT/rK8qi
	HYUFx3Ixdnzpa5hjXFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61nx-00000002gTy-2sgE;
	Mon, 14 Sep 2026 08:12:45 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61nv-00000002gS2-0nOM
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 08:12:44 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4838dbf1bbeso231698f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2026 01:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789373561; x=1789978361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfBKtg2pSNUBsI4+N4eKUAVwi5zQ46GSi86GxU4/gUs=;
        b=PfizpYeeXlldEpjHOA5sjj3c8pzuXKYiIkb+CzxZNR9yQli9GVfqtMu4OlpKv04Mmt
         X/KOzTp27kP7ujjedlTQD47axmFh6Fiu2KgOYjzEQ3wY3tgmk+BlzcUz4Kaf8yjEtmJc
         ikzx7/nnOWAszOsKlY7wY7Xqi5Byj1XCUBNkQhzYX4P7UUYPZZ8Ut0NsRu5Db1FrGGJV
         qUHiBDPEO6ylsb31E0/utDLUIoSfXRbg0snorJ8583eWr0yZ7YGymQNC+mWtUNJFGFso
         weic6iN5HKG+9GwFDWmgFtlrvdg0INzDG2LVNjfejkZtnjY57IPFN646pIPCz7wdsAlp
         jHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789373561; x=1789978361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dfBKtg2pSNUBsI4+N4eKUAVwi5zQ46GSi86GxU4/gUs=;
        b=E2K+GN/4kXyo4HaV5v8NdYunGPbUylFhlQywDem7EpFnS6JU2gn70tl+QGaKJJo/l4
         ls68C1g5Pg7SU/Xe8rduOwJcXIw+/l4j3qSnrqZLGv0QVO0NJnKC7MuGJjXXcAutI3ix
         dSuHPpLz+0bun0ERxhRfg6eZy8HtymOGsdbZDobb0JWgKtC4frm615tf1g44790ZaE95
         A4vT2zep08r0O4g6HeHTuM/dqWEgb+PMiMcijZJqu493tZD5x1ME2xg+JO1UPg3p52V3
         RJm5SLEdbmCLiAfLkHemn9fNoMU7cW9zp3/pMLmHSbLDa+o7b5uikxEVnbN9F/e4NVQK
         XOsg==
X-Forwarded-Encrypted: i=1; AKwUvBwKx6YDCQgTxTMH3CqAmofTJVUC5SzZ/HFFy2FdLSRl3Nf+yuufwokZu2pUG6nymOI8/E11KJSfQio=@lists.infradead.org
X-Gm-Message-State: AFuF++nYTFwU/90J4+DRE3lfoP7a+lNRYUybTrTvMmGckEF/NoTEgpnm
	m7M0x8Yfyur6cQxZizTTJqnOVM1O6bfjdAjo0glAtScn+i2b8L8WN45g
X-Gm-Gg: AYBFou1I/vY1HiX6mVjjj37afEg4WJH4PynVbuMf/tDepVDv3fPd8/JpWl5BcPMABVa
	SSW0MphxdSY56gstI4FMptValsyjw/aMdepQuBbC3ZQnZX1pR4hiwlBIfeZ/OEgiFNxmNnNZnUH
	9sAoeujQT9fJmr5w1tpc4ShADoKIJG6ehi5LRGPVs6WazkNnffkPe0Nj2ypqyWZBdwWmjy1CrGH
	J8M5eD+vhDKEXTGbr941vhkjU8zzDxeZikfCTfuLoXbRMX0Gt+EbWFhBvzQjgsagoJ+yG/tp1Gc
	nKbVEIRVfCMkNEaWtOaLogvjNSeMD8hssU0iiohWWIdTmPWmSG7tk+oh6M+03iHyuitWVGsydkZ
	22wKHRpmXIzrdFfJZFG3yndX2w+p0sLK22XBPstZ//LgKprjHV415IpC1RB6cZZW7PNuMaM1lL/
	Q/Hqo1c5bAZ2bhqVlXZH937TQi4XxmUG1shJ2WewwnpnO9pgZ4ETVj1rzvTT6u02LAtyoAXrsId
	ozsO8A79Yl4FrEcraA=
X-Received: by 2002:a05:600c:3ba4:b0:49e:6806:5712 with SMTP id 5b1f17b1804b1-49e7a66d0f5mr18491365e9.2.1789373561412;
        Mon, 14 Sep 2026 01:12:41 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60acff8bsm301434385e9.9.2026.09.14.01.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:12:41 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: mwalle@kernel.org,
	pratyush@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	vigneshr@ti.com,
	richard@nod.at,
	miquel.raynal@bootlin.com,
	takahiro.kuwano@infineon.com,
	Itai Handler <itai.handler@gmail.com>
Subject: [PATCH v2 3/3] mtd: spi-nor: take the flash lock in spi_nor_remove()
Date: Mon, 14 Sep 2026 11:11:49 +0300
Message-Id: <20260914081149.1916589-4-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260914081149.1916589-1-itai.handler@gmail.com>
References: <20260914081149.1916589-1-itai.handler@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_011243_264981_DB7608F0 
X-CRM114-Status: GOOD (  17.66  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

spi_nor_remove() restores the addressing mode with the same unlocked
call to spi_nor_restore() that spi_nor_shutdown() used before the
previous patch, and it is exposed the same way: the MTD device is still
registered at that point, so an unbind can run the restore while another
thread is in the middle of an operation. A busy flash silently ignores
the restore, and a restore that lands between two chunks of a read
switches the chip to 3-byte addressing while the driver keeps sending
4 address bytes.

Moving the restore after mtd_device_unregister() would not fix this.
Since commit 19bfa9ebebb5 ("mtd: use refcount to prevent corruption")
del_mtd_device() drops a reference instead of refusing with -EBUSY when
the device is in use, so unregistering returns right away and does not
wait for an operation that is already running.

Take nor->lock for the restore, as spi_nor_shutdown() now does. The
unregister stays unconditional, so a flash whose restore had to be
skipped is still torn down.

Fixes: 59b356ffd0b0 ("mtd: m25p80: restore the status of SPI flash when exiting")
Signed-off-by: Itai Handler <itai.handler@gmail.com>
---
 drivers/mtd/spi-nor/core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 647bf8dce719..8d0302565445 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3852,8 +3852,14 @@ static int spi_nor_probe(struct spi_mem *spimem)
 static int spi_nor_remove(struct spi_mem *spimem)
 {
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
+	int ret;
 
-	spi_nor_restore(nor);
+	/* As in spi_nor_shutdown(), do not restore under an operation. */
+	ret = spi_nor_prep_and_lock(nor);
+	if (!ret) {
+		spi_nor_restore(nor);
+		spi_nor_unlock_and_unprep(nor);
+	}
 
 	/* Clean up MTD stuff. */
 	return mtd_device_unregister(&nor->mtd);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
