Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF31C369A4
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Apr 2025 14:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h2FSsuZLrEqjz6lUIaE20vPOev5grgaTdHo2ve7h+s8=; b=0Qf0d+YhmO0USV
	PB/8FiHrnUxjXtYhMKKyeoyVdgEzjzD5A3PLzMprBqI4EEr9/VTxxIt1JdGNSztbSNkDnQz05+/rr
	TLlqXosWWC08XqD3NmgjupD/udS0yO/RJuBEacsRKuRQMLkc8oTWfxk9GGcCvLKzINA4shhB9S7+E
	uLDF4+IKiwalh7lunntedCNjiHN4s7LqbqmWEpPh0uAWBT6e6jJtJIv0etfm7LkUm13sCSJPcO83n
	YDgOs1C+B3smb/yffAU7COJOqXCwRmrrUFQCIqQgeceJpTPSSv1uH7lLijyVoBcJ08Yv8c2f7h+VM
	djZa/qfB/gAISFGpWfbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2A2l-00000004PDv-3XXc;
	Tue, 08 Apr 2025 14:35:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2A16-00000004Otx-2y9X
	for linux-mtd@lists.infradead.org;
	Tue, 08 Apr 2025 14:33:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9BF5A43627;
	Tue,  8 Apr 2025 14:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47617C4CEEA;
	Tue,  8 Apr 2025 14:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744122812;
	bh=Pg6/6HQH/WJQOW7Hm4yg9XYPQcZuvvJ9b5Hb9Jlj6S4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T64H7E742tnVBt1TEQZlnWSazJG6FFTRjQftaVvIjvGYP2ZL7MFmV3XodNTWUMHAU
	 RQtiwPai+rd69u0HuFG5FjwX8dLaGgXqvxnyDZv47CVg3aly0I5nZV/Ugjk3tnYiwK
	 AriXSICIesZ1qOswZgaJIonREHz9OqqYBtzB7aZUbqug5ZxGklf5gZWPUaLtjLgOAF
	 DI3Xz+xmdN9YVKlV+VeiA7VvZSpcE9xB/r/eqlOTwJo+SS1dI8wQwmt+Js272OPnF9
	 lywEOL3MTuYGgGe0Hte3jtc6B6Pm7a+Lv9ai7lYHGjygfVrTcckBJs4Wq/TTT8snIf
	 Nfr94i/BZLvSQ==
Date: Tue, 8 Apr 2025 15:33:27 +0100
From: Keith Busch <kbusch@kernel.org>
To: Sean Anderson <seanga2@gmail.com>
Cc: Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: Re: bio segment constraints
Message-ID: <Z_Uzt423-H_YlO5u@kbusch-mbp>
References: <8dfd97ac-59e7-ae69-238a-85b7a2dae4f1@gmail.com>
 <8a232716-74f8-4bba-a514-d0f766492344@suse.de>
 <a0ffa9b9-8649-1b63-3d56-3fc45fdfda83@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a0ffa9b9-8649-1b63-3d56-3fc45fdfda83@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_073332_773108_DD32C55F 
X-CRM114-Status: GOOD (  12.24  )
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

On Mon, Apr 07, 2025 at 10:14:28AM -0400, Sean Anderson wrote:
> On 4/7/25 03:10, Hannes Reinecke wrote:
> > 
> > The driver surely can. You should be able to set 'max_segment_size' to
> > the logical block size, and that should give you what you want.
> 
> But couldn't I get segments smaller than that? max_segment_size seems like
> it would only restrict the maximum size, leaving the possibility open for
> smaller segments.

If your driver never wants to see segments smaller than the logical
block, you could update your queue_limits dma_alignment to be
logical_block_size - 1. It is 511 by default so works for you only if
logical block size == SECTOR_SIZE.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
