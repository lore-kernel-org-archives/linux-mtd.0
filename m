Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA54C00528
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Aug 2023 13:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z8wf9KS1dzT9qY2QWxjhFUKf2C7KLUq5WOLmVMv1rJ8=; b=F2rgXkIv5tr2MQ
	CySJKv/vjn2jqF/pJGXrgfsAKc9EKH+nST/bnG+6AoXh6wX67c4iMf1XVMpdJ859R6KBDYwwKXpkJ
	p5q0E2R9dbYvYJnUWWd8pKgX1oDgpT1OPdbPh+HqEWh2dEYrDktBusD39iI1IT5haE7Yb2dCjyZX6
	wBAfX3rbtTFVBLp5wjjRZQUE+SINYWw7zredn9pF0H7VrgyMrfKVb1PsAOobbeeE4FtBpr8zAHtK7
	5zpZZDMuk2ubFQ7LxsxeEQx7PFfERx7B/wxEpWogbbRP7OuozzdJCJz+UVMILurjLmVsNmQPadmZK
	EmUqRpGN9mS9dXGzuu9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRut2-00CUmC-16;
	Fri, 04 Aug 2023 13:30:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRut0-00CUlp-1I
	for linux-mtd@lists.infradead.org;
	Fri, 04 Aug 2023 13:30:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8D7E061FFC;
	Fri,  4 Aug 2023 13:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73F87C433C7;
	Fri,  4 Aug 2023 13:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691155833;
	bh=im2RMECXabHoMAl6aoY/p4hXCll2/KJcbIiea1mLir8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofNDSiWzVm0r4xjuy9aOUMs1uNTeXTfZCnUkjNUhaFV5M9txgRHS1AUo5AAArQbH3
	 MzMtKRv4PI00/z539qt+HoROQ+2+b3uRVrvQYfJC/csYFEbUgcZJ03ZMwm0WNun/9H
	 7fMIGryo5UW8koPC5Wyo9ik6eSLHkVNK84aj4kZQ=
Date: Fri, 4 Aug 2023 15:30:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jens Axboe <axboe@kernel.dk>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Snitzer <snitzer@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Pavel Machek <pavel@ucw.cz>,
	Loic Poulain <loic.poulain@linaro.org>, dm-devel@redhat.com,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [PATCH 04/24] PM: hibernate: move finding the resume device out
 of software_resume
Message-ID: <2023080422-hurricane-rehab-7c2d@gregkh>
References: <20230531125535.676098-1-hch@lst.de>
 <20230531125535.676098-5-hch@lst.de>
 <2cfa5f55-1d68-8a4f-d049-13f42e0d1484@suse.cz>
 <20230804103101.GA23613@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230804103101.GA23613@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_063034_484417_1F60B3BC 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

On Fri, Aug 04, 2023 at 12:31:01PM +0200, Christoph Hellwig wrote:
> Looks good, thanks!
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
