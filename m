Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39E8C79F9F
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2026 18:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nUD5eb25L3kA34ELWS0ax5GgfoyROpBZjYdKScq1GGs=; b=NC5nUEq++9+nao
	+Ken+vkxA1ilOz/BAgGUGG/C6T1aB6Kn8jDUToo/n/XbPnv8CD+hYMA7ZtYifb7dgWG+tl+PbKLTN
	J4oTCKgLjF5WQEwY8NJwA61Qimtmb4BAIylnN+ySKbZWfwlhJwJ3QHDhc9dcAQUoeqXcpylHwcPqI
	CwOAVH5OOthRIUYp7oRYPFNaTSFISJnzoLJ3ezqKplsgkvtM9yhDOmaF6YDsSSeyKgM2FeuFEEE0z
	o+Bu3eeKXW5924TIc4qcv3DbKr3pDimaxeoKMHqqnBT7ckiHuXOJsZKGXDeYcpc7iyJ/RGL7w+/Rr
	6ZSf1djAGyZAy+51CJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jmT-0000000FB7z-1dKT;
	Thu, 10 Sep 2026 18:45:53 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jmR-0000000FB68-1eVZ
	for linux-mtd@lists.infradead.org;
	Thu, 10 Sep 2026 18:45:52 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49c5a927a1fso212535e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 10 Sep 2026 11:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789065950; x=1789670750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xlX1xFkfC7DC5AceUSqJtuVKq5LOsuWpndKOpYXkAdI=;
        b=OEg3i3g55qJ/Nhhoxg2ZZnaMLv6608zuvtVXgKiXGMcUb6aDYdVb74OLku4oKmrD/2
         11qdJxXXJnF6G1x8t2ahm9nmDZEMUvxd5UBSrOtUiWGrIgEFEPedpII/+8VIsIvU8RUg
         UYotRZqvJVko+svpHaV99Y4BFEK+WrldQFo0E8WCwEE5TwsatLTvMYkWNagflttN0bAf
         4wTxjIrjCASwabkY/D83Cz2mZED8Dp4V3yi2W8Or9Q1jRgxQs0pH8lvSkTE6y93hRsZT
         CopfQC/3MN/2ySMSsaeKCouQ6raC3ll4ziPHkuisetPtjJaGztPitW1TH2PciujZyMY8
         vG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789065950; x=1789670750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xlX1xFkfC7DC5AceUSqJtuVKq5LOsuWpndKOpYXkAdI=;
        b=BrUTjFM+7nsDl9dFvJWkx5UQhuxDw919X+AhxfvADQcoRPbL3UYMwkQu4vyDxq6KGf
         AbYzCMRcpFj60JRbmnEicBnzI/viJqIkFgUtSOjgWZJmrRBcy4ApyoZgduQof+3mPbj6
         KpzJPFFgtooWs9yoXWLiUv919GjmUjOETtFXuY2ut8dmcP4PkqtWy5Mj1+wSrZBv4GHl
         vWxnWndw5AsaQQp/+r93xAEbScykIECF+VzfKHq2Da1YcqbRmHigyeMXh7umE+6WJYOC
         OxZaE5xUWWnfVREkspKd00Syi+mXOhCklnfI05fpqe+Xp+lZKXoSnECIZXxGo8kx4036
         SYbw==
X-Forwarded-Encrypted: i=1; AKwUvByzfm/EUOj+DSOS/qBi/+jSl2ygFypIT7dPcqia70LRgd8PryLnGUNhgoNZfLDaPP6XPYFrBhy3aAw=@lists.infradead.org
X-Gm-Message-State: AFuF++lUdpwg6Bt+YAWL42S6HzHUd93u7TpHSWUj/pEpGbpMfr5OrHEH
	Od7acqcA9L64xpbIphHZ/kF8nS/RdfEfyRiRasXTJ2Dn5ABJVGXUnSoL
X-Gm-Gg: AYBFou0N7k/zoX8/+Nyc+o3QWZ7gJhfNtDSgslKAEPFk566J3OvDifIl2oQG1RaGtPD
	dNzCdrb1QvQmKt+xQLnOffamMyzuVEJE7ym7DtHpZQ8X0zPSBke/BvqlvXDVTi5Hgv6nic4ED/P
	HuEKuZh63bv/gL6rpB1HHafxmuSk6Eo4KiirAlukr1z7E/FxwojHTwSk280QHLDyXhJIBFfMOEV
	J64RDsMxgHko4PVlpaoyajN/TQwK2+LgbxmM0zvuaCFlBWjYMVtRblOChA2jQGiDhwLkcU9eSZw
	hX3o+jxMT//y5rwPhpo5lle65KAfoWHR/D6wEPLl5GroQn104f8o+cZGuANJz/pE/eA4joUMGcU
	nWdu5dgd6q4GV8rGrBmxLb9w3h4Hh6jOkTzJAZXDXr4av9CARso9PyyPJaUgVxw2zVp/+wL88a+
	nQg3HbbCxw8SIzkP+JAB1KvjUkZa16x9EwyrhuJt6TSAlSlZ1nCCjLZLzZpHkQxK31ORxDQkix5
	Q1iisu5tIb85fvbgnA=
X-Received: by 2002:a05:600c:4712:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49e61643939mr4500135e9.0.1789065949382;
        Thu, 10 Sep 2026 11:45:49 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm18760055e9.14.2026.09.10.11.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:45:48 -0700 (PDT)
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
Subject: [PATCH 2/2] mtd: spi-nor: take the flash lock in spi_nor_remove()
Date: Thu, 10 Sep 2026 21:44:52 +0300
Message-Id: <20260910184452.895485-3-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260910184452.895485-1-itai.handler@gmail.com>
References: <20260910184452.895485-1-itai.handler@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_114551_452333_C481C417 
X-CRM114-Status: GOOD (  17.80  )
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
index 96dd6ae6d619..51128c94d1ce 100644
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

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
