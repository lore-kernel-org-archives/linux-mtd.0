Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF78C7EE2E
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 09:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hd2P9bOZEwe9ozY5vp3LE/9qr837mjpgLacaFqLhGlQ=; b=TmRkUokmyENFgr
	SFoyENXkFPuLyxeKSGxZRAsbCMdcEkm6valcd1PsY0rXBvSTuYZhdwKVsFg9zIn37iV8T5MXAd8bP
	+WOgQfVhbJDjg4exn1flhUmLfCH8SSNr2sOXJ4/MJovDE6tTOsQbFpQ1U/96Jd+43ZugzVICv946b
	dKozcMz8Kb3lvWMQRjRM0cTdOEIpFwvJvGXRMztRyvemQUqJxNTnCjU7ojULEG9kgDgyBJpTlevkC
	53eX+7eIZaW5G0tXo5gHfVfw9v7Xww1hFTgTOd0TSD/QkpEE+zavwip1xq5cwmIfMdOYSqehRcvGH
	XrdN/y0e+9tbiEBMBkPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6p1M-0057Vr-0V;
	Wed, 07 Jun 2023 09:00:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6p1J-0057UV-0t;
	Wed, 07 Jun 2023 08:59:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BDEA3635B9;
	Wed,  7 Jun 2023 08:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB4EC433D2;
	Wed,  7 Jun 2023 08:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686128396;
	bh=dWWAX+xiOcKgosI96OuwvEEnQrX5qRsaWpXnfV3wzsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rwe2e1Ca9g5PndSdWAR4ZxhkRR64XFN5oQuwRMk1FjfKraaCfNVTxn+BRhKyU+j/u
	 jg5JQ/jKXtDHzI9Uwmc7YThBmkwPCntyA1Nizp191gMau+kmlELxOjWKjvxjAc9JC2
	 RzBDL0p3j0FOCM7TOYUceH21NOI4PozRLAB2K3uQBAYBUemNsIy2dYg//LtIYEwErf
	 BV8xPRNRnufBYP0cou5VW32ptS1X7HphuSax6//1cqt1yDk43UFdKboMkPJBkTDSpW
	 GYhjav9dOdhYt8kknuatTMef0vgcOMh+q/hcr0bQH+Xq3sSPWUNEM6OXHtet+bxkeT
	 12uBxWHxB1Ryw==
Date: Wed, 7 Jun 2023 10:59:48 +0200
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
Subject: Re: [PATCH 22/31] nvme: replace the fmode_t argument to the nvme
 ioctl handlers with a simple bool
Message-ID: <20230607-pechvogel-monument-a22bf628a09c@brauner>
References: <20230606073950.225178-1-hch@lst.de>
 <20230606073950.225178-23-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606073950.225178-23-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_015957_359716_C1EA456A 
X-CRM114-Status: GOOD (  11.73  )
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

On Tue, Jun 06, 2023 at 09:39:41AM +0200, Christoph Hellwig wrote:
> Instead of passing a fmode_t and only checking it fo0r FMODE_WRITE, pass
> a bool open_for_write to prepare for callers that won't have the fmode_t.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

Looks good to me,
Acked-by: Christian Brauner <brauner@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
