Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D10BC0218F
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jan 2025 12:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SJwBCssh2vycY1/DjDzAT0Do1jwEjgIVnrJb4qqI2JM=; b=uCX5wE/FKwJNbh
	fUx6awD2CRlLdb7U2gCMriRGXn0nq+iI5XbAwKiBW3QK2Qd64aa8duXF7qiwLoZJO2HTQzFy24LBL
	tFx05F6HmYEi6HVwIM1LqmEtUy+3nMDMTKL2B3jdom8UzujxnEQgLIq9VyqN9YVXrlfE8jYB6aMNc
	I/1MHo8KAjb9l+s+FQe4NdNFx6EzR1z7QNMFV8Q+KxFdIAMbaf4zrLnRCZLQarntALBYS+NG/5vy3
	eg4QKzTcQpYA96czyWMv8stEkmiQ3vZKc/XvyoNbBocPEtqu1zSebrthgUGp68PAd3lX90gDP2Sz3
	0xTY+ElSaXNCmMn9dp4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdpkb-0000000AZM5-2LC8;
	Fri, 31 Jan 2025 12:03:57 +0000
Received: from 2a02-8389-2341-5b80-85a0-dd45-e939-a129.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:85a0:dd45:e939:a129] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tdpkY-0000000AZLj-3pum;
	Fri, 31 Jan 2025 12:03:55 +0000
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
Subject: annotate noio context v2
Date: Fri, 31 Jan 2025 13:03:46 +0100
Message-ID: <20250131120352.1315351-1-hch@lst.de>
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
clear that we need to do noio allocations in a lot more place.  This
patch takes care of ensuring allocations with a frozen queue are
done using the noio flag to avoid deadlocks.

Changes since v1:
 - drop the loop patch that isn't needed

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
