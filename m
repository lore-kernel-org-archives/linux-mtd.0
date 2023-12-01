Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01365C4167B
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Dec 2023 18:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3NVvclMbnLVn2KeavWXcOpkTIpy8rrmbRiyue8y6xk0=; b=ac2NDhdSEnejUm
	xwztdqNwA23m/yWmTcDrXcYN0kaMJVuGp5oD4SXE3i/Euson83YdlGlhW2n9LMMwwfz1UtLVMWE+Z
	PyefCpfJsNdBrWsvQcZpVrfrcPPV4ft6QGnzs+dLrjRJWhi0kKNYMxL9qCak0O7U/35XMBKnMqKNw
	lmNC5k2cO27m1+GJ6t2pHUFcBUuelIo0kCNbAWcaZdbtgly+lwyFlI4J3m33btOJmOMDWAC8TXbh9
	hJ0BoIwVEgr+S7yLkNIJbXLQPy16MxzBIhOpxMUbetOLT/KajpKI5282oFi+AWCo/xT0gWQ7EpT3B
	xeRppghLy17xPgYVoFGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r98PW-00ERso-21;
	Fri, 01 Dec 2023 18:38:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r98PU-00ERrx-08
	for linux-mtd@lists.infradead.org;
	Fri, 01 Dec 2023 18:38:45 +0000
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1B4E0660739A;
	Fri,  1 Dec 2023 18:38:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701455918;
	bh=nshdBGarWc9GZ7/hAoBX4o9Dx3BkRnL4SICEx41+/Ys=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KnJJWZpmHLwkB+keOQZvI7md6rHIRpT6G5/imUC16l0vH+mS6lXkgAM9TdbmMiXw8
	 YsCvTpgsZnoWe53/HWWYUZcQBRJKopfp5lsvPV9pjqdSmkisasku0LQCeRj0XBEACA
	 kR3KXuoTTxDNyoqwqYBplTPnxT54+D697KNDLiFt7qq2SsXjzxFGuh75ct0C4qQ4Ub
	 YdttgPdNA90ZTkM83B8v6WT+4MbLoEV/5Z+qUL+9WP5AsvRyQftY/WGPTaWPwZbIVz
	 cjslp+LDvct0vf5ilw5LA6luiAoP1DCtYhF+MMNueZ3GPd8/wtyAVKy6hqkgbOfwrH
	 Tje10/yajjCIQ==
Date: Fri, 1 Dec 2023 19:38:34 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dregan <dregan@broadcom.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Boris Brezillon <bbrezillon@kernel.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH 1/1] mtd: rawnand: Add deassert_wp comment
Message-ID: <20231201193834.5da80273@collabora.com>
In-Reply-To: <20231201181542.421077-1-dregan@broadcom.com>
References: <20231201181542.421077-1-dregan@broadcom.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_103844_302052_F42DA625 
X-CRM114-Status: GOOD (  17.30  )
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

On Fri,  1 Dec 2023 10:15:42 -0800
dregan <dregan@broadcom.com> wrote:

> From: Boris Brezillon <bbrezillon@kernel.org>

I'm pretty sure I shouldn't be the author. The original patch might
have been partly written by me, but this is a fixup on top of it.

> 
> Add deassert_wp description comment
> 
> Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>

and you should drop my SoB too.

> Signed-off-by: David Regan <dregan@broadcom.com>
> ---
>  include/linux/mtd/rawnand.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index fcad94aa0515..3049b05d8a20 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1001,6 +1001,8 @@ struct nand_op_parser {
>  /**
>   * struct nand_operation - NAND operation descriptor
>   * @cs: the CS line to select for this NAND operation
> + * @deassert_wp: set to true when the operation requires the WP pin to be
> + *		 de-asserted (ERASE, PROG, ...)
>   * @instrs: array of instructions to execute
>   * @ninstrs: length of the @instrs array
>   *


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
