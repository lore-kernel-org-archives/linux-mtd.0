Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF576C61DA4
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Feb 2023 11:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RA8HIVgdXFvVBN22HPW9AJ4KIxCHbnGCiX70pPsay5s=; b=dReJnrABbLxIkO
	b94XO3gHCjW6qU7vdzTagQyfVSLF4VVetDsH6cOn8bHiLmUxpVwycy7XUZzsCbu/ct6ALQG6C5siz
	MJpuaCvcXDEdEJF631xqgwv5dzeFEzG0gQJ2c2r8KUOY6chIQgqeLBDMqJJ0alqrpfLVmLZS5uj24
	j1bWVfbS2mE9CcHjXdvujWP/kvCyOoGERnGYnA2gp5cSCB8SKKEOZ/bGRuTTFMdey6k0N/xv9VmPd
	W/A+1I/HxEavgqB0ltLffVMlI07I8gYv+iT2FIDiwUB/CRwBuVAE/G0ba8wCulPyES1ExsfxYFTn4
	hRlreh0S78Jt1UGT4DkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP068-008Mi8-QP; Mon, 06 Feb 2023 11:55:48 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP05n-008MW5-Op; Mon, 06 Feb 2023 11:55:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D8273240005;
	Mon,  6 Feb 2023 11:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675684523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jilgdZMYBDG0g0b3kjgZTGVaf8ZHW1xW/txAPD3ybGU=;
	b=Uv6s0gf1wUs5U8zAu6tPeMur8xwv3BQqk32wbHvq0/Zd6vEXt4EJ8s0JLwTj9fqQLDNX3Y
	2j+FItCYJtOvtiCSQS9BTiweSu8bKimCQOoIQq1HmnqSsaaUqsKND7CfbyWKLFUisHCvXM
	Cv+tKfqcbAXv7LNLQvwpAq4cLgq4yq6fvaBZU6u4UOCyWBIy+iqSvtPQFBtR7dR3iq8iNQ
	MXqh4pEBN30IyeqLlrSQhml2lYlgnrtiBYPG1/lSIltfczCG9pfbYVmqhqRBT3wO1guUl3
	XI8LHtv+eDcypuG6ATgsRmf38C9pDIVVOn/Z6EIa6oNns9xSoGs6KjjG+DwvVQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/3] mtd: rawnand: sunxi: Embed sunxi_nand_hw_ecc by value
Date: Mon,  6 Feb 2023 12:55:20 +0100
Message-Id: <20230206115520.560842-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204143520.9682-3-samuel@sholland.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ac1c7072e38e492b27353a6e7b144e64cbbf9495'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_035527_957501_0C8C0A0C 
X-CRM114-Status: UNSURE (   7.34  )
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

On Sat, 2023-02-04 at 14:35:19 UTC, Samuel Holland wrote:
> The sunxi_nand_hw_ecc object is not shared, and it has the same lifetime
> as the sunxi_nand_chip which points to it, so we can embed it in the
> outer structure instead of using a pointer. This removes an unnecessary
> memory allocation and simplifies the error handling code.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
