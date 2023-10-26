Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51083C25B48
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Oct 2023 13:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4Slys8M1nNb55ZtSm6XIR9g9cFUBFK1psQ0jdx0MVM=; b=qtJs8ng/rzcKLv
	3GKR50eoFw/uTUXQS7/KbmrTy0ZOy3+Meu6ERF8OXa+nQlhGVmyxT8LKz0VkXBKO5SQViCXhlzoX0
	hpGzL45BNo8GW5vGNV7LK23tA58oEQRciGlqmFvbCSMkRcCC6P0vDz6gbygD9PL+5aXFwwNQDfUmd
	hpWkyNNrL5qzfwn/jsl0X7f5+oMjq+zVyXXx5x58292t9UBDs44VgXzHQoYTaTtmFDM0GdMJpPk7K
	YhNd6DhWQdHyRFXYD9qmOhobmfBGl1u5/uTQPyJvjc4nhKbHo/nEi4zfCiLVFp8hCtD20PXzGI1K4
	cKef8OO8trd2+rsWnjcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw0af-00EZYz-2l;
	Thu, 26 Oct 2023 13:40:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw0ad-00EZYU-0X
	for linux-mtd@lists.infradead.org;
	Thu, 26 Oct 2023 13:40:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E768560D2E;
	Thu, 26 Oct 2023 13:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32633C433C8;
	Thu, 26 Oct 2023 13:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698327597;
	bh=Yo1Jp9MQveisgDNa7SmJESLL8DTmwQjMaMUWrbBXxQ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IdX7isk4NJaVOXcPxsCULZn8rikRNx7vqIfiZeABmRI621N7Cvlsn56W7+1HNsMrh
	 G/tm35NXAg7C4dXWXtbxzcgABqW4TqOyGhMWrR6fpjxS/Ngs9+O8ynCykZFW1FtrR+
	 R/ycI79jMq++DsW5LLDfVgarZpTC/6qsPRVR4T1/uRerxpXbOwOckF8KDct9ws50ac
	 mwZm1HUF6z4nCDJqJyusf6pwv5W5dX3I/4IjRPYJT5BWDlln55oLU1GhLFn2MdjehF
	 3JgrmVxs+r/cuINidO7zi5VxB7ix19gdcKzUtcltqPqcIjo5adLPEB8R1LqEIOXMUE
	 dd45wcEkfGtXg==
From: Pratyush Yadav <pratyush@kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Mika Westerberg
 <mika.westerberg@linux.intel.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] mtd: spi-nor: Improve reporting for software reset
 failures
In-Reply-To: <20231026012017.518610-1-acelan.kao@canonical.com> (AceLan Kao's
	message of "Thu, 26 Oct 2023 09:20:17 +0800")
References: <20231026012017.518610-1-acelan.kao@canonical.com>
Date: Thu, 26 Oct 2023 15:39:54 +0200
Message-ID: <mafs0fs1xmrit.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_063959_290604_C8ED505D 
X-CRM114-Status: GOOD (  12.39  )
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

On Thu, Oct 26 2023, AceLan Kao wrote:

> From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
>
> When the software reset command isn't supported, we now report it
> as an informational message(dev_info) instead of a warning(dev_warn).
> This adjustment helps avoid unnecessary alarm and confusion regarding
> software reset capabilities.

I still think the soft reset command deserves a warn, and not an info.
Because it _is_ a bad thing if you need to soft reset and are unable to
do so. Your bootloader (or linux if you rmmod and modprobe again) might
not be able to detect the flash mode and operate it properly.

I think we should just not unconditionally run this and instead only
call it when the flash reset is not connected -- that is only call this
under a check for SNOR_F_BROKEN_RESET, like we do for 4-byte addressing
mode.

I don't have a strong opposition to this patch but I do think it is
fixing the problem in the wrong place.

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
