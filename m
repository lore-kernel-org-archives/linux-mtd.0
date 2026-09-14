Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE3EC88E64
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 06:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:Subject:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JCdBW9qA3mtpPwBbLiVC2/xcjQ0BYYwrTU1FHI5jtkg=; b=jnaJUvt9B/OIJu
	wlREx85BbpCzmIk7Tw4ngFdgsEQUI7GTW2MW/HsFXDWjvgipi4KpblP/KR85kW2kNl0rYli0AbJFk
	Ugpq8FtLGq6aai0lz4oIDe+RAQwI2AvxQH0NiP22CuHyg5rCYlNRv5iQf7aWAJv2zftHp5r59v0Aq
	BBqq2x/fAn5SriSXPAuyNsz3m3suM5vJ5NWJVmIZErRt9DKgVC4Wm5f0Mts8WaZ/WlGwnD4GfWres
	LdEZ3TyNTLPcuMLUgz7k1map980WixZ67CSxH6Z5EOXq1WHiLrKkLMI4qGd+Yg8j5MWXcjo+xqMrT
	tceT4nERFZlUe9Y66yIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60GD-00000002RrB-2oO0;
	Mon, 14 Sep 2026 06:33:49 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60GB-00000002Rpa-12ii
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 06:33:48 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 13202132;
	Mon, 14 Sep 2026 08:33:45 +0200 (CEST)
Mime-Version: 1.0
Date: Mon, 14 Sep 2026 08:33:44 +0200
Message-Id: <DLETVUMUX3AN.3SSH7NN2CKAIU@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: <takahiro.kuwano@infineon.com>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Alexander Sverdlin" <alex@sverdlin.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: spansion: Assign .fixups to
 s25fs256s1
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
 <20260914-s25fs256s-fixup-v1-2-e94019455c1e@infineon.com>
In-Reply-To: <20260914-s25fs256s-fixup-v1-2-e94019455c1e@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_233347_433091_70DEE5D1 
X-CRM114-Status: UNSURE (   5.52  )
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

On Mon Sep 14, 2026 at 6:50 AM CEST, Takahiro Kuwano via B4 Relay wrote:
> From: Takahiro Kuwano <takahiro.kuwano@infineon.com>
>
> s25fs256s1 has incorrect SFDP entries, like s25fs512s and s25fs128s1.
> Assign the common s25fs_s_nor_fixups to s25fs256s1 to fix its page size
> and sector map.

Do you have an SFDP dump by chance? I haven't found one on the list
for this flash.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
