Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5267CD232EF
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 08:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QacS7sOVW6K7vmZynPsm83CCPX+gPn2XyD819TkMiPA=; b=kOpDS/bCC9naAt
	d8xBsn7g37lSjKxKeneFE+Znk9VAO9qwgjGCZCg1blBLfKT2R1qE+QfNaOVxETCOMn2Qg8s2sVGze
	X6dJffTziZGtRb5EyxVor3ifb4MGmTYR/ujPQYp8XvNLIBbqdbJZPPh59KWV8Rr82/MG9mALJJER+
	2qkP6noLVNH/I72FkjX8EyxOlgJcLFfYrUPLYvJtXN7WdIaOcYr/8dJqUkOdf/1DKqkYkCJqaC0i8
	PlVGJAgHR27bLkit2NhY8BIw8Mad2SxHcU6G0Pk+YdGpGTWAwnEEyedEB5zFZERX6xr+/vEy+BIPh
	WyYjVaPUmzRZFVmS719Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Ie-00000001wnt-3Ctc;
	Fri, 09 Jan 2026 08:56:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Ic-00000001wn9-34RL
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 08:56:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 25F5D40550;
	Fri,  9 Jan 2026 08:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B0BC4CEF7;
	Fri,  9 Jan 2026 08:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767949010;
	bh=wyApNeKzNR8bAWt1nSZg/uwaAH7GLDy3BTDew/IwPJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RGGQXVZhDKTVj6dkXaQRyXSgA39RMuvlB/5kD++1j+l98uNsRGYS6I9UwJlOe1fXs
	 WePrAu1DVbmpDP3w7JCJKBrbJaYGwgOSmRANbFfiJgTYTHMkCcB3tAR5EkJaZ6gsvI
	 KjZxVbZehBoY8/Mx8pSedNbkfu1iSaaVpTMGRVahllSvwOBQhAjMkqBwvCjg2HxFfY
	 Sgqxl+qeSZiKe2c1vOGDK4WHD6x6IZQTJRWBD8wvxwmn8XwDRZcxeoeljoJwgWEeEI
	 YfrucDPAytxiZozzuPT9yeBEDWGP7J58vjx7y2ybF8NSzjJc1FC0IeXal+O2SK2l9w
	 RvNd0d3fVZJug==
Date: Fri, 9 Jan 2026 09:56:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Simon Glass <sjg@chromium.org>, 
	Linus Walleij <linusw@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Roger Quadros <rogerq@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: mtd: brcm,brcmnand: Drop
 "brcm,brcmnand" compatible for iProc
Message-ID: <20260109-enthusiastic-nickel-mouse-c8d1ea@quoll>
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
 <20260108-dt-mtd-partitions-v1-1-124a53ce6279@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108-dt-mtd-partitions-v1-1-124a53ce6279@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_005650_812359_F21CA77F 
X-CRM114-Status: GOOD (  10.92  )
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

On Thu, Jan 08, 2026 at 11:53:10AM -0600, Rob Herring (Arm) wrote:
> Some users of "brcm,nand-iproc" include "brcm,brcmnand" and some don't.
> The "brcm,brcmnand" compatible is not useful for iProc systems as
> there's a separate driver for iProc. So drop it as a fallback.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
