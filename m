Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3489EB64DB
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 03:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKF3l89fnMbBSDvBrojxQfza+1G0LbC5AbKhMfKbkU4=; b=GbmdOAU5YVoqYb
	UWdjFcolAkvCW20x/deNKMDmvLwYDCGp8rQNGqOjOcuhPVsqryMcwbqCQ/1ilHSX5p1LvIZR0rwkj
	XOmpZRBrZnNQd1luOR1qKpEllIW+rloXzVZ2iMUc8HgRkgumlFNbaRcOgqOw6RZ7yAWecRhjmIoUp
	2DQfhqL4UrZAJHOj+V1igW+oGceyDNHCxLkBDAW1Du3lYRP7jIeUkMg4vQGJOYhCBbiN5xnNswWsT
	WoIJ4FRllPcRJ0s2y/X4AuY4daZTo2WmgVPQOve2cQ6McCek1OqHR9ZPXuQEro5raUwi90u8A1m80
	5z2fWx129FnlVUuBO/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCBMZ-00Ghyn-0A;
	Thu, 22 Jun 2023 03:52:03 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCBMU-00Ghx4-24
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 03:52:00 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 685FE67373; Thu, 22 Jun 2023 05:51:49 +0200 (CEST)
Date: Thu, 22 Jun 2023 05:51:49 +0200
From: Christoph Hellwig <hch@lst.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Snitzer <snitzer@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Pavel Machek <pavel@ucw.cz>,
	dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 14/24] init: clear root_wait on all invalid root=
 strings
Message-ID: <20230622035149.GA4667@lst.de>
References: <20230523074535.249802-1-hch@lst.de> <20230523074535.249802-15-hch@lst.de> <8c1992bc-110a-4dad-8643-766c14bf6fd4@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c1992bc-110a-4dad-8643-766c14bf6fd4@roeck-us.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_205158_846593_9E2D47DE 
X-CRM114-Status: GOOD (  16.81  )
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

On Wed, Jun 21, 2023 at 02:07:13PM -0700, Guenter Roeck wrote:
> On Tue, May 23, 2023 at 09:45:25AM +0200, Christoph Hellwig wrote:
> > Instead of only clearing root_wait in devt_from_partuuid when the UUID
> > format was invalid, do that in parse_root_device for all strings that
> > failed to parse.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> In linux-next, almost all of my boot tests from usb drives as well
> as a few others fail with "Disabling rootwait; root= is invalid."
> in the log. Bisect points to this patch.

Can you send such a log, and the command line you've used?


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
