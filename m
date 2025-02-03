Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95EEC02194
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Feb 2025 14:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aQISyrWtMKILoQOXIaPl1KRQDkPKV9RrCTRzB8k7bvE=; b=MkRWTQsGo3CtjN
	7NZBcs0KfRDLy/RzdQ8/76MVzcTL4XxLZj7RRmfprG6IFxU+tfMHv1c6DiBi/qI5EWimEMNpZKk5b
	CQ6TiQ9P653OxOewYq4lyDv0PosRgosUNoR779jL8qFLKClQpk8qe4sMTgB44SkHsSxKPArT2IzpA
	8WMgx+G31pxoFSEpHh7bHzfw8IrT1LTAmvzhOo6/eSteQMVRI6SYtbr4owyqTFmnf85d35svtr8sO
	NM/cwM8n/d4M/2TAFC22UOMvVZoPIsagGEfzRh+Htik/on/ONbyuNrM4NiH/8p2F5GfxMc9FvKiT3
	TJl+0FEp25s4Hbdl7tag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1texR9-0000000Fg0b-2roN;
	Mon, 03 Feb 2025 14:28:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1texR7-0000000Ffzg-3Etu
	for linux-mtd@lists.infradead.org;
	Mon, 03 Feb 2025 14:28:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EF57FA40582;
	Mon,  3 Feb 2025 14:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CA3C4CED2;
	Mon,  3 Feb 2025 14:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738592907;
	bh=cGTnJdwkADCS/rsw+snLIpAnNc/xI/HEQqbTpUxRrdU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JWvVy8ZXcUlFWjwfOFHkUHB3NZFW7Gp+jIKZwmIUKsPmBmP+zi7u+NRM2dJzw/iN5
	 JnPX2AyU10+g5P7ZgIwOwHIvBJ1pak/sLiVWRomeHQRdEbXzKf2/E8hQq1p7f3cJZx
	 h3rA6xWdrnFqxh+vupLcpUK7vcYK28aP4ipiWyvi8l6V7KCj2xcbptuhdZs2nx3fQG
	 AnEgaFLw09ewRbKVM7fA8vsQwtxm8HPe+uxaD+E4L4fMEtrbK+XditYhexwv+/QIAG
	 B2kez2jGwRsfNw9zWTi9YIK0evJd4H4PPMZD3cdFmkqAK5mFnndn6+4nvcH00m6YHQ
	 lDbsFFL9C2iHA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] mtd: spi-nor: winbond: Add support for flashes
 with several dies
In-Reply-To: <20250110-winbond-6-12-rc1-nor-volatile-bit-v3-0-735363f8cc7d@bootlin.com>
	(Miquel Raynal's message of "Fri, 10 Jan 2025 15:49:29 +0100")
References: <20250110-winbond-6-12-rc1-nor-volatile-bit-v3-0-735363f8cc7d@bootlin.com>
Date: Mon, 03 Feb 2025 14:28:24 +0000
Message-ID: <mafs0a5b3je5z.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_062829_871627_C787049E 
X-CRM114-Status: GOOD (  10.69  )
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

On Fri, Jan 10 2025, Miquel Raynal wrote:

> Some Winbond devices are made of up smaller stacked dies, like for
> instance W25Q01JV which is a 1G-bit serial flash memory made of two
> 512M-bit dies, and W25Q02JV which is made of four of them. Internally,
> the dies can either be in the active state (only one at a time), the
> others being in the idle state. Problem: there are commands impacting
> all 4 dies, for which we monitor the state of the chip reading the
> status register, but the status register only gives the status of the
> active die. It was observed a possible internal deviation of up to 200us
> between each die when doing similar operations, which can lead to
> races. This series aims at supporting these chips properly.

Applied to spi-nor/next. Thanks!

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
