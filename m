Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F21BCCFA13
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Nov 2025 11:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aagoBVojBdPcIH8bvX7adSztN+ZDax09WOny3NcT/HQ=; b=G1x/RACWFZ0ZSs
	nwX7pEjFR8e7cn1Re0IEpFN/HcS1DUcZCXpLQm64C4XgGzKbpYjd5A03/P/aa14OIj2G0aIIZKpn+
	ztetC3OSDf1nQfR+QZqnB2baJaDdXyWvxgeEzp7ypGiM3mC+yf7f2bBBfHXtzms/bWAwIHd8p+RWK
	XGMVeF4eIc2HBSVkl1B1aMHGOKDo++hKHJ71BWzSFbUg6hJ2w0ejO+xWr37hKyCD/03k04fmdnOC/
	V8uPfCXYcWKrDa7iKdFaKo7a8szYoHpIUSDryH+J0yFNDE7IalYLfRnjP8R55joWFt9A7dupBWlgr
	sMseNKkVLOpUxs4CCbnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI3ym-00000003ymd-0CCa;
	Sun, 09 Nov 2025 11:53:08 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI3yh-00000003ym0-36pd
	for linux-mtd@lists.infradead.org;
	Sun, 09 Nov 2025 11:53:05 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-471191ac79dso22408335e9.3
        for <linux-mtd@lists.infradead.org>; Sun, 09 Nov 2025 03:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762689182; x=1763293982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oi5/iqZfrxw/CP5GK2yW/mE7gxZjVbgvC6f7zP3R/B4=;
        b=H2PxmpN7sWTgC/3e2bUr7KkQFGV1GVtgu/CHUlf/GwT/Qbph+b10sB6saP1EkEMIfC
         y2hr0PGf+sim46XDhoVE6ZCZxKt2dHmcbzF/H38TQITOHk1/LxrW+2iSfSVT9yuYn5dn
         FbZO/LVUmk7R3v6gq3bf9lQcYcIjzsg4HIAEHOOkMyJpm1xwl+hkLGp57WlGYg/nEleu
         kVXC1XIZkn5N54eZGCZMAPYym6cwevMrcdDCB47mH5iPiT3Zpr6DTF2qpfH5iGkhQomc
         QZkiSxphcPXPmqWr3+8OjQ5w382QP0I7p0nf4kL4fMBM+yest2nIBSLdZ1dw2QtbAEcF
         VdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762689182; x=1763293982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oi5/iqZfrxw/CP5GK2yW/mE7gxZjVbgvC6f7zP3R/B4=;
        b=TuGNC2vib8i2SvQtJHg0UoQmHTeDoN0YFw5xIR9CF4fe+ioAl8+/krtn9PX2KODHl/
         fNEW5fyQoBQfp062q7Lw/ETmOICNMsqzAAhWM9Rvr0MRp9Gg/L0E+xW+3zKaU2+61uxU
         h7LnhHpw1qplIZDc54M60Ko91GE+/2HGesqAd0ynbKJkEACMzl9npIkgf6hBgpWHT6mG
         DKfoU+MGb2j0sLyalvfnwgDyFV//xXRvpdAofDP+woX9UcJO/Z8xC9iDI9H4ZaGxzFYA
         SZiOI9G9W/+Hs5V7JkpxjDblL5SYsQ0YqGjgFpd/n0mOht94dMhqfv1KdzsrZqGrOTs/
         c9/w==
X-Forwarded-Encrypted: i=1; AJvYcCUQKIwE9zD3o+6oWYEy1+2uc752ECIAnhLAJD/TzEopxzbYE9tkI7wYlVQ8JaWLHIFtK3VOoXl3KFs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1n8AGvF3vQlw4XIulFuDEZTp/ZqTGSF3ehozJzFmilluQGjol
	CF8At5HEj/MReXoguGuwvKIRwccRtJCX6O/hmnTIKX/ErVo2GWlAl/lI
X-Gm-Gg: ASbGnctKbp4bjWoVg2k07FwBpVDbZrTL/uDXWX81ZduNfXXM6CVZSyu7s3BT3ii6nL+
	cuPuTk9h1plflTdFZq4T4sdcUtsFZiWLgpVw8uO4ZMwFKVmdirzsTAyQ5zbra1UbDHosjYn4y1j
	ns18pI9TAzDeekcKynveKN12/mTioDuKCsWdrOuiE3qX/3I6aed1hg5Q5X54CkBc56qpWV2X1rZ
	WLWFQx9Yd+SGHsCTtrm57X4I59GaRGBe97bFHw++hDrSRoSOQnPnGRYpmkLwfaI44xDXimIidLz
	oRGgn+jXC4zbSoS0ATP0YjbUf21G72I8J0UDIGMcy63HrSCfG5SEB13WThPTYGzPM2s39dWfK1A
	pxwxMOx/R3F7PZ7NqlY+e/Tnb8A856OkbzMO4S0j53rxhzVrls0ZBxctAwzxkO415UJGxWE1fNt
	zQ3TUt/WSe9HuRJzHxd4ys4S/4pFNzahZTpG2qqINF
X-Google-Smtp-Source: AGHT+IF0OdPl7P7zek6LN5EpjrwqGOR8oHSE9cecr6daRpyCulT9z+cFJeMMKofyvzMK78abF/CwMw==
X-Received: by 2002:a05:600c:4f4c:b0:477:7a87:48d1 with SMTP id 5b1f17b1804b1-4777a874db1mr13826495e9.30.1762689181321;
        Sun, 09 Nov 2025 03:53:01 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4776bcfd021sm185197325e9.11.2025.11.09.03.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 03:53:00 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: mtdpart: ignore error -ENOENT from parsers on subpartitions
Date: Sun,  9 Nov 2025 12:52:44 +0100
Message-ID: <20251109115247.15448-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_035303_826706_6E3DF008 
X-CRM114-Status: GOOD (  19.53  )
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

Commit 5c2f7727d437 ("mtd: mtdpart: check for subpartitions parsing
result") introduced some kind of regression with parser on subpartitions
where if a parser emits an error then the entire parsing process from the
upper parser fails and partitions are deleted.

Not checking for error in subpartitions was originally intended as
special parser can emit error also in the case of the partition not
correctly init (for example a wiped partition) or special case where the
partition should be skipped due to some ENV variables externally
provided (from bootloader for example)

One example case is the TRX partition where, in the context of a wiped
partition, returns a -ENOENT as the trx_magic is not found in the
expected TRX header (as the partition is wiped)

To better handle this and still keep some kind of error tracking (for
example to catch -ENOMEM errors or -EINVAL errors), permit parser on
subpartition to emit -ENOENT error, print a debug log and skip them
accordingly.

This results in giving better tracking of the status of the parser
(instead of returning just 0, dropping any kind of signal that there is
something wrong with the parser) and to some degree restore the original
logic of the subpartitions parse.

(worth to notice that some special partition might have all the special
header present for the parser and declare 0 partition in it, this is why
it would be wrong to simply return 0 in the case of a special partition
that is NOT init for the scanning parser)

Cc: stable@vger.kernel.org
Fixes: 5c2f7727d437 ("mtd: mtdpart: check for subpartitions parsing result")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/mtd/mtdpart.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 994e8c51e674..2876501a7814 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -425,9 +425,12 @@ int add_mtd_partitions(struct mtd_info *parent,
 
 		mtd_add_partition_attrs(child);
 
-		/* Look for subpartitions */
+		/* Look for subpartitions (skip if no maching parser found) */
 		ret = parse_mtd_partitions(child, parts[i].types, NULL);
-		if (ret < 0) {
+		if (ret < 0 && ret == -ENOENT) {
+			pr_debug("Skip parsing subpartitions: %d\n", ret);
+			continue;
+		} else if (ret < 0) {
 			pr_err("Failed to parse subpartitions: %d\n", ret);
 			goto err_del_partitions;
 		}
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
