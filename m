Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153BAC7EE2E
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 08:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b1lW8WeudQHJ2qrvTFoKkWkkNXgA3jUuKbXTScDXnqw=; b=P5g4mmk2Jj7Png
	/OwoSuxgwUdJ30fvO1NoHf1PWGOlPy+yMJd9/lAzRKOQzUWSGBCDFJrZXruT69JVelekXgvxMf4lH
	qlLfOrNx4UaH6/EKMv4al55ym9Rpu2yzjGpCsLSN1JXwbv8K+dTch+8hirDDigJM83FYGbPR2PAFM
	xCZ+AxoDhW8HeLyNclHx+qR7/JXSJJRc3+WO/5S2Wbp/UR4svGLgU4Jc8T3BC37a7cU2APcgf0e4Q
	z08cw+wSxdSzjq6fnQjsX762Q0Ge64vUxjBZ60o9AWkjU0a2NqvNIf+IdrGgYzLKoPL/s9jRXiwGh
	HOJwLLnIQn8Rte9Utc9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ox1-0055el-2z;
	Wed, 07 Jun 2023 08:55:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6owz-0055e0-1v;
	Wed, 07 Jun 2023 08:55:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DAEC563090;
	Wed,  7 Jun 2023 08:55:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A3BC433EF;
	Wed,  7 Jun 2023 08:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686128128;
	bh=FoyjSRZZap6QVtk4PUjAg/56aVYmk7Q/bKSVf+qsCpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lbLPSEzx5CHmJxbGbMCZtSL+WOgA+Ir+19+KzebHBOcStdriYooqRFCT5Z85L5SBQ
	 26HQ8bhocu6wvemqw13N0fGcVjMBRXTDOwCQLDmfzOEmX7ULrDVKcbEwQ6RgCJokv1
	 LwwrPIPH7Dy4Dqq3Z1/wJFPI+nCdq9XhVYQv9lER7EKMRobBVVmCazkd0VI6FPwQYd
	 0aqANlbYbCCg4IAbUW/09Y1bmFZmnmzbyNy0/ajwIsz0dA7ufP/Yer8+FEBJ0alkmD
	 C7h1CsWGU6uOFwKET7Igjn6D9mKWpSspjotrIzNqf/5Wvwq23wfp2KPy2h5RhLAsAf
	 pjxzISbJRmiew==
Date: Wed, 7 Jun 2023 10:55:20 +0200
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
Subject: Re: [PATCH 17/31] block: add a sb_open_mode helper
Message-ID: <20230607-ballverlust-notstand-c4f9b36c6af4@brauner>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-18-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606073950.225178-18-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_015529_674340_62E6125E 
X-CRM114-Status: GOOD (  12.65  )
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

On Tue, Jun 06, 2023 at 09:39:36AM +0200, Christoph Hellwig wrote:
> Add a helper to return the open flags for blkdev_get_by* for passed in
> super block flags instead of open coding the logic in many places.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Looks good to me,
Acked-by: Christian Brauner <brauner@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
