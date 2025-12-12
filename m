Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FD0D43370
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Dec 2025 07:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2DU6gIcGTE5c/S2WrFwmuWv/VxDNi3QLi1JkK3FDoAI=; b=nsjBh1bx+7U3+c
	N1hZcud9nEYMshEDAQxL30Wh1hcjAe5sGQGELb8mY/8nUmIkzonT0zRvqAEm9FEWh56fQjDqUpH6a
	TK/rxfh9RVPENfZiPMf84L0SqviKTH4AfoHwhwHdoJyVCS6Ydsfm2GdXGDu18YDtsRBjJNboKkBCD
	UWb0W+/WhxeJMSovx3uXOV09CxpT7+c0JDbNHhuBcURJwM7RyNAHijAMzlJYyXloPSeOpimlRDS/A
	WuuYeGlWvrJMwR2U1FyBuTkJDqoktOktuaVkaFlQn8S58O2JiLmmSefQvguApY9KY2oaQr2Osg9xp
	xg5w/WbXWzLfjKuotTIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTxS2-00000000CLy-0VJw;
	Fri, 12 Dec 2025 07:20:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTxRz-00000000CLV-1e08
	for linux-mtd@lists.infradead.org;
	Fri, 12 Dec 2025 07:20:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 70DB5440A3;
	Fri, 12 Dec 2025 07:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A0EC4CEF1;
	Fri, 12 Dec 2025 07:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765524025;
	bh=dhNhFtOI2xytRXsi6ATgp3idSIXBWLJxXg8Hf/TiTBY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qVe565xz7Whzbp2GCcXbvsYKu/hOsrjvXDkfIiaxq7DHmdDiicLgv0XjMEXshJ3Hb
	 A3NVP7m1rbD+owmgm9zHlxUaeoCW98YxRyGabo35xk+bgRz81HqoE8+Cn27gTSXy8F
	 72hzgSDmztgteO8xW6DdGJ+oxPtlTvehBVzJM6xDdauseV+koBMM43iy7WKO4Dk6h1
	 4ryJbL9gaBNGt863U8OCK2n+Nrcu3HmcR4aUSTVwyqkyuBvPlDXcrFkOWOlHWw3WnR
	 F7mhJCKJsTEtHam/Bj20NwKg07HCTkQntReJjcow9FZs/oJWuP/DYHKAW8yiRe2bcg
	 XqqYvL8BEKvug==
From: Pratyush Yadav <pratyush@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Pratyush Yadav <p.yadav@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  imx@lists.linux.dev
Subject: Re: [PATCH] mtd: spi-nor: core: correct the op.dummy.nbytes when
 check read operations
In-Reply-To: <20251208-spi-nor-v1-1-f6669a645395@nxp.com> (Haibo Chen's
	message of "Mon, 08 Dec 2025 17:14:14 +0800")
References: <20251208-spi-nor-v1-1-f6669a645395@nxp.com>
Date: Fri, 12 Dec 2025 16:20:19 +0900
Message-ID: <86pl8k6ua4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_232027_456382_C9CA4A30 
X-CRM114-Status: UNSURE (   7.25  )
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

On Mon, Dec 08 2025, Haibo Chen wrote:

> When check read operation, need to setting the op.dummy.nbytes based
> on current read operation rather than the nor->read_proto.
>
> Fixes: 0e30f47232ab ("mtd: spi-nor: add support for DTR protocol")
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
