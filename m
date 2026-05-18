Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0138DCD4F56
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2026 11:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MIWp5lPugsw0leugGa5TyjBmgsRF9on9NfNzmriCOMc=; b=1KuMFh8iuBLgew
	8OHoY6ptGBBY+NRDAnbZ48xgQKJuhq8OYfkG3wk02prx8tJjyM/vCAsYoGV4FoXrjiXa0QDiHvb/x
	k4xvHlVyWrfm2GajHW+dE6sJIF8wNxJprMcBZY4Z6LJJJITr3/8vHs17YLPOvE8VtnEFHeFjE1meY
	PMqFTG0qHQl0P4c9Wbj+MryYGhZ0K+aePja9IjS02HhO4Vm0OtPnl9UC6BqCDY7dt7E/wttBahPst
	USNsdNIC8USHVmbprzhW+ZcGs8g+9nyHXWVVWLAY05DBU1Xl4yMiCKmtV2zmkzs/pom8Ubf2MlYKh
	WTfE2rXsEv0Eotk3hBHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwRL-0000000FUPt-2ci9;
	Mon, 18 May 2026 11:47:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwRK-0000000FUOc-19XM
	for linux-mtd@bombadil.infradead.org;
	Mon, 18 May 2026 11:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ezhWSslS+RucQI+0tAHxOGAEb51o6QdhaggvM2yWnxk=; b=MIFhkym2EFcTWHx49jJTI60rsN
	QzB04qzJa1q2H5z4CmI7pBk4WAODnRLhCkuqcuC2e81swVjjTk3ZnrpxR20XJPCWZJKWJIPxkeNdD
	U8mNK+2Z8U4yENqvFVY35p/Qf+RYs95Gfv6qYYOgF06XlFWCzpZhoBBy9v3OXOaTyWxJcveq0I9R3
	0kJH1XuzKD4WJoml4mn2z0VYJR+N6VBsGELsYJi10V/7u5LvpSn0SSkk6174jE9iabF1hqbrHr2pr
	4xu+9Ek965dTvAFq392L/vCgnzIRcm03qsQjJx4d+QGNY3WpOWHtsMCrFIuL9CNv5CeQcZu4wLkZC
	7fpa31bg==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwRG-0000000Azvn-0ocD
	for linux-mtd@lists.infradead.org;
	Mon, 18 May 2026 11:47:17 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-488b150559bso16957335e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 18 May 2026 04:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779104833; x=1779709633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezhWSslS+RucQI+0tAHxOGAEb51o6QdhaggvM2yWnxk=;
        b=KVjdQxxniDJzR9LTOj91wXU10jXrvNOW6WHYp8oH5P5dUnMNkRoIXT2Lz/izi+PDBR
         v/AXk+Er4Ge96UU6zvrBwZOIBm5IkF5O0xCT2Rv5YLOSrNlwZCRBqGayCxoFb9hPBI0c
         pVaPoq1o+MoYBMWTFtRq95rxBiK5bjIyseEKHYjsxDVNFkkb4M1KVtXfBHuXnUG7m6DP
         P8OCB1a36IzOjEJQmiWjO6eG0EUwTvLdu9j1ZR3MS4H5MeVMxocNpCW0LgsgZQgkB2Z1
         qqGVTEyGF+V2G6qcjIq6onxSPll1rHvf3Xbjv8PLgIqNtk2X6j4XKHZFtF3UifW/g9i8
         sCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104833; x=1779709633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ezhWSslS+RucQI+0tAHxOGAEb51o6QdhaggvM2yWnxk=;
        b=mYlo4mWso7D8PpchNuLbiOJ381MYKsmuEBUvvN8lGarl6HRNNtTfNxByHrZHlfysZb
         v1qav/Bg3m1wqBkc7QRWA0N5brSSWbbC2lsOw1liA84DLr3Qn3TQ+E305sS7bPKEWnUQ
         nPckS516AcUX+M2pWUu3g6VNgg3x3QBstDqbxeehrHfcA3IEsV/XIqLa4WpHsElwOPt4
         JomVflQNWSDPAwKS6X419BX5fZdl0U71tgqxgRljLczf/gimOCoxwPYdldY/fdgHtUAH
         EOm50OZgLJgb6qbinli2/B+T1l2f0xOCp809gmYvkMoGj6q8+Z32nwGYS8BegucMyi6P
         jADw==
X-Forwarded-Encrypted: i=1; AFNElJ9sMl+HVz+mH6QqjhuTE/XHsSqRoZGQj7wKVfk0iNtIYfirPViX3hYExh9GSOwi8V270ZbgneaPylY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzeyOIOBebpvQNloGzyO8iEKWeAaDg2vqEhBHtkJRI87YyuAPGC
	sMEMKpsZmdkSzKutif0ArW3T5KDhxpdwXKm+BSJxITnYE5Cq+qs1lj8=
X-Gm-Gg: Acq92OETO7jrdMgNud/+xdPH19/8tQpE+9m3Vm4o7y+Z7jlEkdmDQaB5opmHd+n+Wta
	893CHwiOHxGcbjdE/Bn6GZhA5VrDLySFUWND8arVbeopwBEJE7XfJUKwaEdkiZy3IhM3Iuhsddq
	qAt28ipjhzS/LKaP7Y3iRWEKyEXvsAd+LCLhsiqNsh/j0RzYR5sFDTnqwshycXZc4cGbUkxO02j
	ZDoTGsV9GkricYjZEt8xyPLPyrDQTfdSPv4/v35r4n9u9/WRIHHUF9sOpqq60PbVifvgihn7kCO
	qED6vhlt5QhZhS3rBwMrvlDxRx4QEV2HYj1k0OzBYsThZbkN5PpABRscLUwB/ocHAYOnOkymI0g
	R9oLJsXH1egiGnPLbPYIB+Idlef7sxyNl3GmPW5aTC+rug+gEkzCmGhu3JFwVrlSOfaaVpqV2OG
	6cBn59D3w+0dgg6UShdKmTmDSiIm58X4yf8tMV6tRlXVjVmlb7gDN1+Z6tcEzZgLtqFNd2s9cPE
	4Ve2g7b
X-Received: by 2002:a05:600c:4e87:b0:487:21c7:2885 with SMTP id 5b1f17b1804b1-48fe60e142emr233996405e9.5.1779104832846;
        Mon, 18 May 2026 04:47:12 -0700 (PDT)
Received: from localhost ([2a02:810d:4a94:b300:f15c:fd38:3fe1:9653])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fe53ab671sm250281165e9.1.2026.05.18.04.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 04:47:12 -0700 (PDT)
From: Florian Fuchs <fuchsfl@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Adrian McMenamin <adrian@newgolddream.dyndns.info>,
	Florian Fuchs <fuchsfl@gmail.com>,
	Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v3 3/3] mtd: maps: vmu-flash: fix NULL pointer dereference in initialization
Date: Mon, 18 May 2026 13:45:21 +0200
Message-ID: <20260518114521.81564-4-fuchsfl@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518114521.81564-1-fuchsfl@gmail.com>
References: <20260518114521.81564-1-fuchsfl@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_124714_641210_EC1C0BC9 
X-CRM114-Status: GOOD (  10.14  )
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

The mtd_info contains a struct device, which must be linked to its
parent. Without this, the initialization of the MTD fails with a NULL
pointer dereference.

Fixes: 47a72688fae7 ("mtd: flash mapping support for Dreamcast VMU.")
Cc: stable@vger.kernel.org
Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
---
v2->v3: no functional change, added Fixes, Cc tag according to feedback
v1->v2: no functional change

v2: https://lore.kernel.org/lkml/20260427114750.2480900-4-fuchsfl@gmail.com/
v1: https://lore.kernel.org/lkml/20251117224408.498449-4-fuchsfl@gmail.com/

 drivers/mtd/maps/vmu-flash.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/maps/vmu-flash.c b/drivers/mtd/maps/vmu-flash.c
index b76d0609d1b7..10244e6731d0 100644
--- a/drivers/mtd/maps/vmu-flash.c
+++ b/drivers/mtd/maps/vmu-flash.c
@@ -547,6 +547,7 @@ static void vmu_queryblocks(struct mapleq *mq)
 	mpart->partition = card->partition;
 	mtd_cur->priv = mpart;
 	mtd_cur->owner = THIS_MODULE;
+	mtd_cur->dev.parent = &mdev->dev;
 
 	pcache = kzalloc_obj(struct vmu_cache);
 	if (!pcache)
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
