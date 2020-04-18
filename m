Return-Path: <SRS0=cSwW=6C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E0DC38A2E
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Apr 2020 12:11:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 930C221D79
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Apr 2020 12:11:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JcZ+9yr/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 930C221D79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j8eP21NPGK9grYj7sR2dU7Nj6/7xVPw32dPZp5ppzcE=; b=JcZ+9yr/zODdie
	A/9MdiEooAKq3H38OyGlvPvPs4NfrBfjiv+nuabaXWnyBgZkdGscwAJ6DCZ/LLZ/OrEN6AVoindeC
	WjIaax2xfH0ZWCUyaWvskMCpFgHjJVS1KmGboVLbjc0zz2fQOAIxVWDVXXnwWBUkFcYLzc6oy75BT
	F3xRyoEOrSVNcpEq9vMtaQBpvnhWjH+iF9coj8CJRbAfvMk7Z7KHWD1b8deMaY8+yOFKLHhNyHOQr
	l6YIE3Lmts70fuZcbYWWjmVgvttVfxIyDAtVB/iud0kyQ/sYrtd9DzwHWHN8s0JDZYqD3ipw/8PUv
	RYcoq6PNCF1R+VE3Lafw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPmJW-0008AK-4i; Sat, 18 Apr 2020 12:11:14 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPmJO-00084E-Hw; Sat, 18 Apr 2020 12:11:08 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F00092A0FCA;
 Sat, 18 Apr 2020 13:11:01 +0100 (BST)
Date: Sat, 18 Apr 2020 14:10:58 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH RESEND] MAINTAINERS: adjust to renaming
 physmap_of_versatile.c
Message-ID: <20200418141058.567a80d7@collabora.com>
In-Reply-To: <20200418100933.8012-1-lukas.bulwahn@gmail.com>
References: <20200418100933.8012-1-lukas.bulwahn@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_051106_723878_D6D44475 
X-CRM114-Status: GOOD (  14.35  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh R <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Linus Walleij <linus.walleij@linaro.org>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Joe Perches <joe@perches.com>,
 Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
 Sebastian Duda <sebastian.duda@fau.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

+ MTD maintainers and the MTD ML

On Sat, 18 Apr 2020 12:09:33 +0200
Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 6ca15cfa0788 ("mtd: maps: Rename physmap_of_{versatile, gemini}
> into physmap-{versatile, gemini}") renamed physmap_of_versatile.c to
> physmap-versatile.c, but did not adjust the MAINTAINERS entry.
> 
> Since then, ./scripts/get_maintainer.pl --self-test complains:
> 
>   warning: no file matches F: drivers/mtd/maps/physmap_of_versatile.c
> 
> Rectify the ARM INTEGRATOR, VERSATILE AND REALVIEW SUPPORT entry and now
> also cover drivers/mtd/maps/physmap-versatile.h while at it.
> 
> Co-developed-by: Sebastian Duda <sebastian.duda@fau.de>
> Signed-off-by: Sebastian Duda <sebastian.duda@fau.de>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Boris, please pick or ack this patch.
> applies cleanly on current master and next-20200417

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
> v1: https://lore.kernel.org/lkml/20200228063338.4099-1-lukas.bulwahn@gmail.com/
>   - was wrongly sent to old boris.brezillon@bootlin.com address

Please Cc the MTD ML and maintainers next time.

>   - got Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Linus' reviewed is missing in this version.

> 
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c77f02282044..52bb8819230a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1342,7 +1342,7 @@ F:	arch/arm/plat-versatile/
>  F:	drivers/clk/versatile/
>  F:	drivers/i2c/busses/i2c-versatile.c
>  F:	drivers/irqchip/irq-versatile-fpga.c
> -F:	drivers/mtd/maps/physmap_of_versatile.c
> +F:	drivers/mtd/maps/physmap-versatile.*
>  F:	drivers/power/reset/arm-versatile-reboot.c
>  F:	drivers/soc/versatile/
>  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
