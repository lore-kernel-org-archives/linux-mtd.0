Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A2AEB64D9
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 14:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Q6AeFG6Oi85LUeuEGCAtfJLC2n46zehTIRuuB5F3Mc=; b=Vn806FOJ7r5iYD
	vmUToxFbIS100QCIiWubsG8G8o15jxog2fv1Azerk7zXMANxXPEsGLy86fVu4NcidNfNS6BsnyqgN
	RfPA5ynao4My0fs8crfB9v/LzDb0os76Zmby0z3WnWDo/zlbFbdoYEqqjaARH8KLjkFuq6MIgJZgb
	W6LdPaFcOxZ650IuqY0GeXPqpH0i6izAC81LWj5U4ulT4KlWNUBG6RdecE/MX/b9xs2yO71lJG3VP
	jzuVwwXlRHjuHuioopmbdlQYDt1wmk9FfgTipzW+ZEAzjiVYAqB+XvxYLwXWFvd3rwUYvLo+UieOD
	RBPbXh1hf06ZH1IwSqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaWw-0009Py-1h;
	Wed, 12 Jul 2023 14:09:22 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaWt-0009NY-2c
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 14:09:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1AEAAC000D;
	Wed, 12 Jul 2023 14:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689170955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PGTpF0Tv1MnyUCLXT3/f6TxaSFnsYhUPXa2xH9Zje4M=;
	b=YJ4GOY1ISqS+K7tJboSJGkcVNY1ROaWHxzTf6aCWo5pvb1uIzJ8susJYXBPmFm1WAX8j7N
	ORvlM/W2G+YKZkGEVr4txz3lUQHw6MCFBU+0O/AOkgKubbfOU+9G4QGn+VrTb0TptKUx19
	C1mdeipDnLPHbt6jEzuXeeUjC9N/02PfN5TOsmxM86GHlnM9z0Yu62gtsJRZKVi8l5xlb0
	/n43P1tNTyn7kvKbDtjCbAmLg8Yr2NU+VTDmU3XLanDlWqazgqVmhJShLQETZHh335YTTM
	EaC6PyN/fF5acuxwOLqQiLy5DgH2N4BWG++HnQiIMO3KD3OeVETlAYnd/6oxkA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: krzk@kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mtd: rawnand: omap_elm: Fix incorrect type in assignment
Date: Wed, 12 Jul 2023 16:09:12 +0200
Message-Id: <20230712140912.284188-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230624184021.7740-1-rogerq@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd8403b9eeee66d5dd81ecb9445800b108c267ce3'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_070920_170002_871CC2BE 
X-CRM114-Status: UNSURE (   7.47  )
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

On Sat, 2023-06-24 at 18:40:21 UTC, Roger Quadros wrote:
> Once the ECC word endianness is converted to BE32, we force cast it
> to u32 so we can use elm_write_reg() which in turn uses writel().
> 
> Fixes below sparse warnings:
> 
>    drivers/mtd/nand/raw/omap_elm.c:180:37: sparse:     expected unsigned int [usertype] val
>    drivers/mtd/nand/raw/omap_elm.c:180:37: sparse:     got restricted __be32 [usertype]
>    drivers/mtd/nand/raw/omap_elm.c:185:37: sparse:     expected unsigned int [usertype] val
>    drivers/mtd/nand/raw/omap_elm.c:185:37: sparse:     got restricted __be32 [usertype]
>    drivers/mtd/nand/raw/omap_elm.c:190:37: sparse:     expected unsigned int [usertype] val
>    drivers/mtd/nand/raw/omap_elm.c:190:37: sparse:     got restricted __be32 [usertype]
> >> drivers/mtd/nand/raw/omap_elm.c:200:40: sparse: sparse: restricted __be32 degrades to integer
>    drivers/mtd/nand/raw/omap_elm.c:206:39: sparse: sparse: restricted __be32 degrades to integer
>    drivers/mtd/nand/raw/omap_elm.c:210:37: sparse:     expected unsigned int [assigned] [usertype] val
>    drivers/mtd/nand/raw/omap_elm.c:210:37: sparse:     got restricted __be32 [usertype]
>    drivers/mtd/nand/raw/omap_elm.c:213:37: sparse:     expected unsigned int [assigned] [usertype] val
>    drivers/mtd/nand/raw/omap_elm.c:213:37: sparse:     got restricted __be32 [usertype]
>    drivers/mtd/nand/raw/omap_elm.c:216:37: sparse:     expected unsigned int [assigned] [usertype] val
>    drivers/mtd/nand/raw/omap_elm.c:216:37: sparse:     got restricted __be32 [usertype]
>    drivers/mtd/nand/raw/omap_elm.c:219:37: sparse:     expected unsigned int [assigned] [usertype] val
>    drivers/mtd/nand/raw/omap_elm.c:219:37: sparse:     got restricted __be32 [usertype]
>    drivers/mtd/nand/raw/omap_elm.c:222:37: sparse:     expected unsigned int [assigned] [usertype] val
>    drivers/mtd/nand/raw/omap_elm.c:222:37: sparse:     got restricted __be32 [usertype]
>    drivers/mtd/nand/raw/omap_elm.c:225:37: sparse:     expected unsigned int [assigned] [usertype] val
>    drivers/mtd/nand/raw/omap_elm.c:225:37: sparse:     got restricted __be32 [usertype]
>    drivers/mtd/nand/raw/omap_elm.c:228:39: sparse: sparse: restricted __be32 degrades to integer
> 
> Fixes: bf22433575ef ("mtd: devices: elm: Add support for ELM error correction")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202306212211.WDXokuWh-lkp@intel.com/
> Signed-off-by: Roger Quadros <rogerq@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
