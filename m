Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CE3C7EE29
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 09:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y4LAo8h02MGKG4iEqCOrJ5YkYScI2/xinORumtKNWUI=; b=EoN4yTTRb8PCua
	z1DVujnjaxUHZ1GNSWA89orUIsHa7uKeg90+S8Mv+fFPx/ffiCNOnUH8mopvUdmfMEcXjyfCqnuIv
	qLybD8YXnuP13OjK0xhno8wUYNuG1cjmii/AvEw4STp/64Oya8ltxZBoDfxR2rwYQEkdQ09V/v9O9
	bkry4LdyzFwq8iY4Eb1dLRezdZhGCfr8l8qjj8ro8tM6961+hEETQwcJUk5vm5iELxuJ9S56ul2D2
	AxnwxsfeF+W3irRXdO97eJsPA+LCzA/N4xATo3DSKfDH1MchXPofvQmOlGiu6LTNXTD7ik3x7SXM4
	nqRiK6ZSAfieEk5Y5RrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6pQg-005Ejp-2l;
	Wed, 07 Jun 2023 09:26:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6pQf-005EjA-0O;
	Wed, 07 Jun 2023 09:26:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ABC166339D;
	Wed,  7 Jun 2023 09:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74033C433D2;
	Wed,  7 Jun 2023 09:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686129968;
	bh=90WN1yUXLJUe3ExTCrm+9/jICeRfh1xqidoess9eZgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G11EvijrXOft/4fKmPbcLsj96l6rzLAMnuaIxMBioke+aBkOZjX0wCH/9fvhIEjex
	 bWiAASMid1pQ95ExZeH4vBW5SM8ilf/NZQVWxNMB0WOYPM9glBZMCr5Ac+of7EpC67
	 IUolHFn7wPq/SIHTgNke/TvkzfU5n52aulKZAQmc9SU6wqZjH3wTf5zcRlPc+Be0ZI
	 tjYNjFG0WWy5oyTijsqkj/wvHS1IkYB4WeHa/KebFhUJ8MLJna0IALZB24dyM/p5Fl
	 3AtWIIUlxdg9dCBor+iOy3BYRPzpRSoLmgc+mM3rrS6ylvh7XsRdf+ZYu3eLpchVoc
	 BEZRzrMhzDVIg==
Date: Wed, 7 Jun 2023 11:25:59 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>,
	Josef Bacik <josef@toxicpanda.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>,
	Phillip Potter <phil@philpotter.co.uk>, Coly Li <colyli@suse.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, dm-devel@redhat.com,
	linux-block@vger.kernel.org, linux-um@lists.infradead.org,
	linux-scsi@vger.kernel.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
	linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 31/31] fs: remove the now unused FMODE_* flags
Message-ID: <20230607-lehne-marken-17b031dd9165@brauner>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-32-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606073950.225178-32-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_022609_197930_16C7FD21 
X-CRM114-Status: GOOD (  11.89  )
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

On Tue, Jun 06, 2023 at 09:39:50AM +0200, Christoph Hellwig wrote:
> FMODE_NDELAY, FMODE_EXCL and FMODE_WRITE_IOCTL were only used for
> block internal purposed and are now entirely unused, so remove them.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Love it,
Reviewed-by: Christian Brauner <brauner@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
