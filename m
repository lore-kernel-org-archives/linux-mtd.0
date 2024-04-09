Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37273C67861
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2024 06:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aN+LF9KV3RmiGCPnhqDAFH9KyOwRITocTFKk//dj6Tk=; b=JC9vHSHkW74P6u
	rkwFQQFKgZS7r/JhIzEtmrCT+czyACIidm4FUKT4F+htK47h80bjr8FNDQw38UouHS5TsiEtGqxm5
	MfOfdqGBZWGKBmMB18jiO/CwagDBZR1Uzpu0y2kJaRflw3k5SabXZ5GcLQVyKBe7J9bGY3JdB43Pp
	WZ47RsINeAK4KQSGd2h75rplQPIyv1E/vDFfR2hTYfeGHKg8ZNqqV5fwUW6kwJYFFQhKfJBNN2crQ
	JzQ1diWtH3/TwNJ6vpqYc9Q34zxhcP9KsABLe/ui9DXTOTM4zW+eBDfTavBiwI61MmSJnGa+RsFKZ
	sKQZVnFYyNH2gHKtHMKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru5Ap-00000000cnn-3Oyn;
	Tue, 09 Apr 2024 06:41:39 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru5Aj-00000000cjI-2DPk
	for linux-mtd@lists.infradead.org;
	Tue, 09 Apr 2024 06:41:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 609D9E0004;
	Tue,  9 Apr 2024 06:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712644890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oe7RFp+BwBZoK6hQUNiwVYCnvZd3pMjzXOyJ9JrbiaU=;
	b=fYI4zuGnf6GcgsRjKcnjOxuKk6eZPkxJTiBAAJNyeAI1vg629CeJxfSh3Xjp0iyLYXAX1q
	MNmozJ0hcpa3MrnPNWQiTnZR5VwHhYsWTFUsjJcIbtk6FtytGQqmdB3LXzwC3SPn5oQWex
	RTi62PX4vWdPRkuf/WOxzSXVZ4fLSJSzYRlym7GNOUmdv0E8a4aLD92RSysQPGPGDE3KIL
	FCxZ9NGNAyCXw+ZEKhK2PFyCKaBcquQqmjs8g5dW9FZV6R7uSOhpMNgxYrRPYnhz/grtQS
	bfVu4WjB1h2gVBqVBhe0KfhCMCSM9PWaSD8NA6pmcTUE/B4Z2nOSsv+xxVAGwg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arnd Bergmann <arnd@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	stable@vger.kernel.org,
	Dinghao Liu <dinghao.liu@zju.edu.cn>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: diskonchip: work around ubsan link failure
Date: Tue,  9 Apr 2024 08:41:27 +0200
Message-Id: <20240409064128.91899-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240405143015.717429-1-arnd@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'21c9fb611c25d5cd038f6fe485232e7884bb0b3d'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_234133_962875_583F8E3C 
X-CRM114-Status: GOOD (  14.88  )
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

On Fri, 2024-04-05 at 14:30:04 UTC, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> I ran into a randconfig build failure with UBSAN using gcc-13.2:
> 
> arm-linux-gnueabi-ld: error: unplaced orphan section `.bss..Lubsan_data31' from `drivers/mtd/nand/raw/diskonchip.o'
> 
> I'm not entirely sure what is going on here, but I suspect this has something
> to do with the check for the end of the doc_locations[] array that contains
> an (unsigned long)0xffffffff element, which is compared against the signed
> (int)0xffffffff. If this is the case, we should get a runtime check for
> undefined behavior, but we instead get an unexpected build-time error.
> 
> I would have expected this to work fine on 32-bit architectures despite the
> signed integer overflow, though on 64-bit architectures this likely won't
> ever work.
> 
> Changing the contition to instead check for the size of the array makes the
> code safe everywhere and avoids the ubsan check that leads to the link
> error. The loop code goes back to before 2.6.12.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
