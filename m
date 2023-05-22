Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D486C7EE26
	for <linux-mtd@archiver.kernel.org>; Mon, 22 May 2023 15:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nud9KfPVh9QDiT23CV4kyWz5V73l2CihbKQxzE8nIdA=; b=qhjTIabKhehXWI
	ARNQS18EAIzImruTsAf4o9J9toZ4RLjaso/SVxrdgHuzE0zmGdvAAAx4Utfki56MSCZ5FNmEuGevU
	Jv9CX12DwjmZn8sgqc1rCeXtAsvBpEjxcujH0UPnAJUY2yXfFslzDle/Es2qeSveDJP5oTP4/OuBX
	SQcuqmncz/98yYNw+PUVbuy13pbEgdHXfvTpa7zlRPwN4J4Btkj83SQeZCfGQZbuR1MdQIQPN8vDP
	chaWY5Rfavl197lFbvRjBRGbilck8A39qrU0cDAB4vD0LY2nX033k2ROgitz9B0BDJKAID5LQ3WtX
	7fc56egHbS3P+2zx17vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q17vz-0077ba-1T;
	Mon, 22 May 2023 15:58:55 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q17vv-0077Z5-10
	for linux-mtd@lists.infradead.org;
	Mon, 22 May 2023 15:58:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2C9BD60003;
	Mon, 22 May 2023 15:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684771124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gFwgjCPf/4asoNSTd2rB0052AcQsns5SfkHhPLz5LaE=;
	b=fg4hZ1nrhDhCKJ9uVedfX193NoCwJ8eeuuApDSDCP27/ahRcDy22tl3vsTuhlUyb/44saU
	YHuoGm3urtJDj86mcTGQ5E2fJvNgkjpZRAefGC0c9Nn+jG3WXuOUIESM/dZrME7dMIBqXu
	xd/K+Ph1Vyb6LiJrRg2Q15I5Z/PUc3wwT75OvoRDPLpSNviOwaVIIfu1JBobK80+xzsji5
	I6oOqQdwBik5cdfCeqGWMGGbMMzMm+F4vLNCMErSM8+IeWLUs4tWhgG02iD7U6/vDqOG04
	Xi0uYzddRGpIGoFK9pBaIpoSRVXKoZdvhe+k7afrmBkS90t/2dpnAxbQ6VC4+w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Harvey Hunt <harveyhuntnexus@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: ingenic: fix empty stub helper definitions
Date: Mon, 22 May 2023 17:58:42 +0200
Message-Id: <20230522155842.46808-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516202133.559488-1-arnd@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6b31b07fc235cf089bf87de1b8b5e471a5f7a090'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_085851_477294_7B546D07 
X-CRM114-Status: UNSURE (   7.67  )
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

On Tue, 2023-05-16 at 20:21:24 UTC, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A few functions provide an empty interface definition when
> CONFIG_MTD_NAND_INGENIC_ECC is disabled, but they are accidentally
> defined as global functions in the header:
> 
> drivers/mtd/nand/raw/ingenic/ingenic_ecc.h:39:5: error: no previous prototype for 'ingenic_ecc_calculate'
> drivers/mtd/nand/raw/ingenic/ingenic_ecc.h:46:5: error: no previous prototype for 'ingenic_ecc_correct'
> drivers/mtd/nand/raw/ingenic/ingenic_ecc.h:53:6: error: no previous prototype for 'ingenic_ecc_release'
> drivers/mtd/nand/raw/ingenic/ingenic_ecc.h:57:21: error: no previous prototype for 'of_ingenic_ecc_get'
> 
> Turn them into 'static inline' definitions instead.
> 
> Fixes: 15de8c6efd0e ("mtd: rawnand: ingenic: Separate top-level and SoC specific code")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
