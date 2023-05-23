Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBED2C77B75
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 16:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vGIGYCgpyLU36c2nl/QXRB38q9rcMmP6wKwwK5AXnhA=; b=AJl5Uay8A02uBb
	psTav9jZPSKxCJdMXY1FP9UiYbyDM3/e155CZN0Y54W0kfJxFnFcAbvBzXfcNUfpy6ycEr/btyN82
	grp7QY3rDRI0FJxZ8s/jbUgwn+b/9VIomh9V8xK6tU+aDMRcIaABW7IHONw8ypalFWXr56H+XqOzY
	wnIkzHB4Rj0xx5PCAEoi/4vTUxChF6Jeeb4jbleHurd2dWyAueHhjhN/MaOl/NnsvYkuq/hzAxC7I
	EwiqaDCJE+n8xJwJWMGYxIUTr3ELAL9nB+FVNRVMmgEDGSJ5vy87JMWAmGqH1GR03mHG5oLZV7xQP
	/aGLNCHuHvhQ8ldxFUrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1UyE-00Aogo-1l;
	Tue, 23 May 2023 16:34:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1UyB-00Aofw-2i
	for linux-mtd@lists.infradead.org;
	Tue, 23 May 2023 16:34:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 15ACD62510;
	Tue, 23 May 2023 16:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F164DC433EF;
	Tue, 23 May 2023 16:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1684859682;
	bh=F/c4b6SDJLSjnmx0l1YhNCJYsfrfz7bbIyvWirnoONE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=y1F873iGV7qiSJp8jB27qP3VdL7p/Yqsp0nQoA6P2mOxMchv2Km77Ocgue5H4Z3Zd
	 WUpNTp+FYIKLD5fXQlFDucQD/qm/1M3vAcmET6I5ccJJtPnphZ93T6vtddFyMWQ0H7
	 mxZ50MBpYuwHmtxHJ63pwMtKkfCh6UrlNJQpkJ04=
Date: Tue, 23 May 2023 17:34:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Snitzer <snitzer@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Pavel Machek <pavel@ucw.cz>,
	dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 01/24] driver core: return bool from driver_probe_done
Message-ID: <2023052330-perpetual-baritone-f867@gregkh>
References: <20230523074535.249802-1-hch@lst.de>
 <20230523074535.249802-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230523074535.249802-2-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_093443_919564_57A5DD8F 
X-CRM114-Status: GOOD (  15.30  )
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

On Tue, May 23, 2023 at 09:45:12AM +0200, Christoph Hellwig wrote:
> bool is the most sensible return value for a yes/no return.  Also
> add __init as this funtion is only called from the early boot code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/base/dd.c             | 6 ++----
>  include/linux/device/driver.h | 2 +-
>  init/do_mounts.c              | 2 +-
>  3 files changed, 4 insertions(+), 6 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
