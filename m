Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2FBC7EE29
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 09:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hG2Qyv656NtS6HSQzJmr3yjpx6Mt+WihzpzQUV/rlRA=; b=T8+6JhBb7uKypt
	j9lv8RrbDmtv7oGjOKUfyJOayv5jpbdYCtp8/mXpaL3iGvJnACnSlw7aLZjLCgX4AjKAjTeP0OMXi
	P2FrPXJOl4lwTK+DBO9G14j4PtNIgf/nD/XHSIY2KRc+MBDsn/uaLZhWTabIg3YwPmuWzwv5FxMX4
	LvwHYV3fmFS9AT3wtv0HItlX9cjRpajdjOhej1vkuASrE4HINFGJZmM6iHmL9/0DewULzZ2CLW92W
	sEm4RosdBLLipHzLcAzP/rR8XLo4VAhVHmIWFD1/sRAFo/5F/YXWfgNsmg5cFBP3nUhuckX8ayv2T
	bw8GRTXMwl+MMR+o7hTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6pOI-005Dtd-2V;
	Wed, 07 Jun 2023 09:23:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6pOG-005Dsq-2R;
	Wed, 07 Jun 2023 09:23:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53E8661645;
	Wed,  7 Jun 2023 09:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B328C433EF;
	Wed,  7 Jun 2023 09:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686129819;
	bh=2dBZxelf4g0w/gdLM0HKDBqAqVXwuGv1PlJcXlPn9lY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FA37ryzewz3+4K4l8Ktr97eYBVVqBLv2pVXW0viLjV+m+r/uNhWaJUioMBllxDrcb
	 m/2rQlbq2vyk3xPBmVzj29M7JVrvLsSMjwUJJkNN8B6XdEYn5s49h4hyw6bLTtoi9p
	 EjTM+zpv2Dhmnnkhitfx/vj2brk5MHkYyJoQRtsq8+0xWW/1nK8yf7e6n1c+pCWVlV
	 C1XYMaOxwobfzPLR8thTUoG0bwIiC1DRhAZeaP57LjbKOs0qtf1boJvs5JbZewwmWa
	 ZNyTmf20EjV9XQz4d8qaTsyPbhurixlhBxn2jxz+gzDDr74A/rLls/VWc0tFau9VX+
	 GD8kCkpo5IuUg==
Date: Wed, 7 Jun 2023 11:23:31 +0200
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
Subject: Re: [PATCH 29/31] block: always use I_BDEV on file->f_mapping->host
 to find the bdev
Message-ID: <20230607-thermal-sohlen-1ff852d8a99d@brauner>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-30-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606073950.225178-30-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_022340_833298_EC4BB173 
X-CRM114-Status: GOOD (  11.81  )
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

On Tue, Jun 06, 2023 at 09:39:48AM +0200, Christoph Hellwig wrote:
> Always use I_BDEV(file->f_mapping->host) to find the bdev for a file to
> free up file->private_data for other uses.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Looks good to me,
Acked-by: Christian Brauner <brauner@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
