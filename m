Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF4DC2BD09
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 12:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYsUh+2DSqE5DbND2lJ62i362gfD9bhl35axdgh8ePs=; b=oSOEumpqnBPSQP
	EbGBfTe8A4gUJo756NcJSkrWH4lBfT/KQq1RImdytYjtc7z1oypbTYZpAGPXUdPERNG8S0RBcQLds
	JDI2p9YqLCbQDRlXfEgU4ovQ6Ih4HTscqSmeU6QtxnlWm2QmC6UrQu7AYFFAoKSBI43haM75sQiOZ
	v2hSujfuC+PE5I76S005bX6C8nuiuFNDlSVu6f/Sy2vKadn3UJ+/cPlrP3lg+iiEwoO4wmmUqLU3E
	ervXkKKuS/sMT3RlkBuohnJZ0dI1bU+U3xyXTIDkXSJepizzuzwi1CZiuknsHBm+SoYUjYsaNuW50
	U6INsRUNG46zCOlOz+SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFop-000000032nQ-1LwU;
	Mon, 01 Jul 2024 12:07:39 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFhh-00000002zuh-13rA
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 12:00:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 78FBBC000E;
	Mon,  1 Jul 2024 12:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719835214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ItJX2QwrJGe03CZSybinYRi4KXjMVifkjIchGCGtND4=;
	b=VpJd9+na/QcwfGaxjFLMIV+MEYzq0/l7d0jM4/KH5CYD93UGFu3KVUwrPIJ2a4rFRjEUFX
	ylpgCBnD4Yy7gaxfQIIQpyhur3yL+ns/yu5oiBz+WUmU9w2ONBJzaA4C5EwEf6/T1uJR0t
	G/w3OzWCRts3eWAPq9dN/YO2e+5LXqMgvMGOiyjZ1s5E1vTdak55heeVlo3gm0VHkD2OXL
	5xywfsjN1vfOA7E+7W9HQk0HFxpak3K1RTExI+OjmvUrRxXu3KiVY6dr8dn12afzqz8o8k
	WoUnSLs4KpMxaeKGdhqAhbSIy1Wbrfmb5TMa1poBZzcQSSsFI+Pa+YfGCPnqbg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: make mtd_test.c a separate module
Date: Mon,  1 Jul 2024 14:00:13 +0200
Message-Id: <20240701120013.525411-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240529095049.1915393-1-arnd@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a5cf054d325e6f362e82fe6d124a1871a4af8174'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_050017_566774_4017761E 
X-CRM114-Status: UNSURE (   8.00  )
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

On Wed, 2024-05-29 at 09:50:39 UTC, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This file gets linked into nine different modules, which causes a warning:
> 
> scripts/Makefile.build:236: drivers/mtd/tests/Makefile: mtd_test.o is added to multiple modules: mtd_nandbiterrs mtd_oobtest mtd_pagetest mtd_readtest mtd_speedtest mtd_stresstest mtd_subpagetest mtd_torturetest
> 
> Make it a separate module instead.
> 
> Fixes: a995c792280d ("mtd: tests: rename sources in order to link a helper object")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
