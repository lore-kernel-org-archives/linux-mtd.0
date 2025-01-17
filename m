Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B96C02183
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2025 07:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OYWn35aME8E9p01/Q7MoV42YAmS83TfQ0oWj0d9OhDs=; b=FTaZc5/sUUwQwu
	J/SHmqZSl6k+SMA2iql9i20ia+Ir7UqZC8itIOfKcIdG4Ap++ar3y8RP9yYdTZhcvWxtrSW5BGXc7
	3Ssli1JNXGaORaE9M2O8WfjfRna7ixdld0GiEKa9tDaE4pZF7xUYvtU4k3I0wrtOLSY69ogCHiYSw
	+n9FT7LaSusWx61b9zV/5AsiRUz0B1T8spL954rbSIlp/s3Kyhh/7f/UkLNJ73eKOFUCkdZpToaWa
	/UcVtPDPOn0BUc4n0bhLu1a2rguQ/t/9+/48Ej1w7Im0L5jjH3PS0rlKFbT3RLPpFVAd0zzxCC4Cd
	XA4AVzQ1JLfTqRLgPK9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYh29-0000000HECy-1hPe;
	Fri, 17 Jan 2025 07:44:49 +0000
Received: from 2a02-8389-2341-5b80-41c4-d87f-051e-5808.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:41c4:d87f:51e:5808] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tYh25-0000000HEBf-34Fd;
	Fri, 17 Jan 2025 07:44:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org
Subject: annotate noio context
Date: Fri, 17 Jan 2025 08:44:06 +0100
Message-ID: <20250117074442.256705-1-hch@lst.de>
X-Mailer: git-send-email 2.45.2
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

based on the reports from lockdep annotating q_usage_count it became
clear that we need to do noio allocations in a lot more place.  One
is when the block driver calls back into the file system as in the
loop driver, the other is anything done while a process has a queue
frozen.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
