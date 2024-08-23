Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C155C531DC
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2024 17:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FMOoTB2/xtwus4z7PhOXCJ0MrSzGM1JAfUP4ObI/JfE=; b=YGEJJZ7Gq6UqgU
	3n149px1Lqq9zPyjz6lucAoUsbLIBqPpojVDw/owSDe2WmReoPYKlh3iE4Mlr/C0f+qzSdXoeIaG0
	QuEK4ihceDXh7DLylsp3OhIpv7rkIfQH1+A+P2WZsvExlJBXo3Ci4FS67x2iPMJkf5S3dn4yMv1IY
	M61T7Rc/DRIb1OVL3E0MumecsPUmUtPEsdvhNOqc1FriJEmxqmXq4uMuQmspI47zdL6QsIbq00GcS
	nvNeTl42eD1R3uavCQymGcEBBIHPFE/81ST0MIEfVlyyPv4qjMo6v/efvJ+3LSmdfy5cIcoDKVnID
	P95WJqgByioPARuWN/Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shYBz-00000000ASD-1LDp;
	Fri, 23 Aug 2024 17:35:19 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shYBw-00000000AQ5-2WA4
	for linux-mtd@lists.infradead.org;
	Fri, 23 Aug 2024 17:35:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E50C040007;
	Fri, 23 Aug 2024 17:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724434514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nak4z/1artOEKYnquWyMtHGZNqWW8VcXZpYkd6Npm4Y=;
	b=kHcwluRrRyOHi5BCU4EXFlNkHZQSSziNXfIn+cxt1bQ33wbreHG0S3ccwM6ynVHPcmGBIb
	LYACgRa6Lg6g3wzLHqYXwOGyW4Jcu9FGHuaohDRkGwUgCosLYFg7sgdUDTB+o521XM0kH3
	FUm93HTuYWOP6dnbzbpF4G2TTXRP+EK5+W8fdIbd+QYc7Zqmql8b+N3mKzBPm5IY5yU8NN
	sE1RYWdnscyLrR7aEsjZSYOsTRh0NgsHSrOzWBwGRA4YdP5zyOh10bQavX/YUDTkexX0O3
	7eGdDRjBsn2ROovhPNklGZ+fbJFEcM0diuZ7eLTIWZYPekinrRHAGVvq8G3FQQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Robert Marko <robimarko@gmail.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spinand: winbond: add support for W25N01KV
Date: Fri, 23 Aug 2024 19:35:13 +0200
Message-ID: <20240823173513.517469-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240805175125.6658-1-robimarko@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e2a9fcb36e851adb5b25c4acea53a290fd48a636'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_103516_799242_CD43FAA8 
X-CRM114-Status: UNSURE (   5.71  )
X-CRM114-Notice: Please train this message.
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

On Mon, 2024-08-05 at 17:51:02 UTC, Robert Marko wrote:
> Add support for Winbond W25N01KV 1Gbit SPI-NAND.
> 
> It has 4-bit on-die ECC.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
