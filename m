Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF34DC54EE9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Sep 2022 16:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBL1rjxqbW2lWSUz2LO7b4QuyQkG2hsT6CsXtxvl3KE=; b=I+VgTwW74+zn05
	i8g4+KLmul4sqYZpF5e6bwFx+6Sf6epTC3R3FconHYwQiXEpmUpRiwTRnhogGp5Yzou6GbPB2PGkA
	DgUePu0r7w8fbpVgdfwPCyK2FcdjZcZ0dIW5rTKiNDlrMGrvXzyfvTeGJlxnXwL2StjMUVOqbbbQl
	lacwsQ9NqjW6b3Ne16ycXORHbhxqqy2Lh+ySnbwU+EUHB+VBj18Zx98SZAbRrYFFtvm4ts8tafWgo
	4ydBrFcNmrfhzWZ9XT+9M5AYu2HNrMgfobzgkV6csmRPNQF+d7kCy4G/CC/xNXFtyiOHO83dqar1Z
	wE3/xmnUcoVwrtcwpFYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJRO-00Co1j-BT; Mon, 19 Sep 2022 16:16:14 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJRJ-00Cnwc-Gp
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2022 16:16:11 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1C5651BF209;
	Mon, 19 Sep 2022 16:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663604166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6s1GEq/NI5LtLtoKNvI8GY+IRQMhDfNQ2NfkC4suIrE=;
	b=p2LLNDPsZ2c8y/bc3+rdRKTyzUDu0PaZzdiZWvYDZW4rBfzS1Aee4IqRVGDxLnU2t7j190
	TfKzVyb+2bBNxxiEgjQ3zGBh2z0jSq8Xm7RhEP3hLbK4BjLUDcjbC/62BBKVI/CuV1C5PZ
	6BDJRZRNFbkQwvbG/TBAo+gVPyGMrUHqeZgz7xloU+CDPvx841cFmxKIntMHB4CO2TWJWz
	PKsNj86q74xG2Kpb9Y4iz2jf2tq2wcHWekSF4xZXPVd4YSKoRkp2SctrqLjzqSbQEqN19a
	PG5XF0JJtGP1J72J0n2QecrVcryzOIQCa16WMzP7nDvf1ItdKivHcGe7Q/0xZA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zeng Jingxiang <zengjx95@gmail.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zeng Jingxiang <linuszeng@tencent.com>
Subject: Re: [PATCH] mtd: physmap-core: Fix NULL pointer dereferencing in of_select_probe_type()
Date: Mon, 19 Sep 2022 18:16:04 +0200
Message-Id: <20220919161604.226569-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727060302.1560325-1-zengjx95@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'8b740c08eb8202817562c358e8d867db0f7d6565'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_091609_722700_6862114F 
X-CRM114-Status: UNSURE (   7.39  )
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

On Wed, 2022-07-27 at 06:03:02 UTC, Zeng Jingxiang wrote:
> From: Zeng Jingxiang <linuszeng@tencent.com>
> 
> Coverity complains of a possible NULL dereference:
> 
> in of_select_probe_type():
> 1. returned_null: of_match_device() returns NULL.
> 2. var_assigned: match = NULL return value from of_match_device()
> 309	match = of_match_device(of_flash_match, &dev->dev);
> 
> 3.dereference: Dereferencing the NULL pointer match.
> 310	probe_type = match->data;
> 
> Signed-off-by: Zeng Jingxiang <linuszeng@tencent.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
