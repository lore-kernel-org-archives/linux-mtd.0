Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BA7C77B7A
	for <linux-mtd@archiver.kernel.org>; Wed, 24 May 2023 06:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bHQW1oXmOs0VqVXJTIcqwDE/DaaqLLoTjcS78fOk/7A=; b=OtqfFWJfJHo5d9
	rqPU9eQX3ijSGeM3FsJ2vP5sDYrMkcuh2/GA6s12Ofj50Kbe1vReyryOTq+8+wJ1r5ynqfrOQFAE3
	ODtcqF4BfDlSA4vpsOZHBSC8kJtDbZ5yNa8sMg7u1DyTjfiopmhcbfpErxGFUAl3eQaqiqvkxr2oH
	BwNA+a2LBJG1IzcFlZOLnbjVue9BUUn/6VsBQIS2hR+md046/oM8kutb3i7PkW99iYNJZ/Ky0N7HJ
	E7Z0OHWfHSAx87nLqwZhVpEIO1yUz/4P+m+cJLebTTV+EJ5k3QPo9I7ntFZlFtyOn8Qtsc2EjOvvS
	M1e/m9x4MZIfhiI05Xxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1hbh-00CSMb-1l;
	Wed, 24 May 2023 06:04:21 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1q1hbe-00CSMD-0L;
	Wed, 24 May 2023 06:04:18 +0000
Date: Tue, 23 May 2023 23:04:18 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@axis.com
Subject: Re: [PATCH 2/2] ubi: block: Fix deadlock on remove
Message-ID: <ZG2o4rrfqWGbYziq@infradead.org>
References: <20230523-ubiblock-remove-v1-0-240bed75849b@axis.com>
 <20230523-ubiblock-remove-v1-2-240bed75849b@axis.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230523-ubiblock-remove-v1-2-240bed75849b@axis.com>
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

If you imlement ->free_disk, the list_del and kfree can move into
that, and we don't really care if a new opener raced with the delete.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
