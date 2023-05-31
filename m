Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2183C7EE2E
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 12:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OSjJi0bWebikx1xytZQveRqKUmEz8L7Yl1Lzaf7kOto=; b=eV24JygLkbM3OZ
	dhft7TjHVMzDjS0H0x/WJSFZs+DySVYU/A5GzBzulaXIvTzJ1vMbr56YnanhUD3pCOJDL79VSPNXK
	nYdIe0dkKCUbXkkaWfrlCEKahOVkIVi2KH94nn4IcueGpAQtI+I92CQ7VJa6boNHvCc9/7lIXUnfQ
	v2mj6L+DODEF9jzpET60fyFM5nSY2gzbaUdpaaaX43EopcIQBxEd0WELI6iBrW+WJqUoWTILdAQTQ
	SBlRM4l8VbM9HI420c64XpA0IBV3RB6Y1WpZiyf4TWjH4f3/UDKXiRnm1pOpePFNYrQPkA0gt8+RG
	2ElPCfg8BBS+TDLS7pxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LMf-00HQw9-0s;
	Wed, 31 May 2023 12:55:45 +0000
Received: from [2001:4bb8:182:6d06:2e49:a56:513a:92ee] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LMZ-00HQu7-1g;
	Wed, 31 May 2023 12:55:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Snitzer <snitzer@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pavel Machek <pavel@ucw.cz>,
	Loic Poulain <loic.poulain@linaro.org>,
	dm-devel@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: fix the name_to_dev_t mess v2
Date: Wed, 31 May 2023 14:55:11 +0200
Message-Id: <20230531125535.676098-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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

Hi all,

this series tries to sort out accumulated mess around the name_to_dev_t
function.  This function is intended to allow looking up the dev_t of a
block device based on a name string before the root file systems is
mounted and thus the normal path based lookup is available.

Unfortunately a few years ago it managed to get exported and used in
non-init contexts, leading to the something looking like a path name
also beeing lookuped up by a different and potential dangerous
algorithm.

This series does a fair amount of refactoring and finally ends up with
the renamed and improved name_to_dev_t only beeing available for the
early init code again.

The series is against Jens' for-6.5/block tree but probably applies
against current mainline just fine as well.

A git tree is also available here:

    git://git.infradead.org/users/hch/block.git blk-init-cleanup

Gitweb:

    http://git.infradead.org/users/hch/block.git/shortlog/refs/heads/blk-init-cleanup

Changes since v1:
 - really propagate the actual error in dm_get_device
 - improve the documentation in kernel-parameters.txt
 - spelling fixes

Diffstat:

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
