Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82580E77179
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2024 15:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fqA/bfEYBejB4Va12Qpo3baNed7plxyb/dJdEyzvGUU=; b=ysA6wB4Vr9neYi
	st7WULf75EAUM2eSdqYz3HhMQnR+UE9JpjYsuflneCJkW///FSMCrVXldenkf2bm4C99+Eh8mAq0+
	1ASK5yve6Hrg1ycBAs3jw4+S2Ya7QYVeJWuL100/Pe0RpbQF8vuF2DgVQfvJX4oqATanMI2VvTp2T
	zkkxUVMha8sD5tr02PM4C33DKnOk3dGe2vTahkOwBe+KS/4JN7AcdfwY7fegG25/SBXrx53KBhvLl
	4qLLI0i68tF0xFu88TI+xceeQT91MfxR99tP7ZHUPSqd9AHW5uypVYXhsRbpz+pxAgccup/14CNgc
	thukrMHxNTnSCWYGZtYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJabu-0000000236F-1hB2;
	Fri, 06 Dec 2024 15:51:18 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJabr-00000002357-1hx1
	for linux-mtd@lists.infradead.org;
	Fri, 06 Dec 2024 15:51:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8A93CA44358;
	Fri,  6 Dec 2024 15:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B91C4CEDC;
	Fri,  6 Dec 2024 15:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733500274;
	bh=4ST6XqOdFWhRjWNkItCEHp8dw/gXcIRdc65RQJvw+EM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fv4jpJ3FWfKKp8yuKSgt2/ocUjVOQTLPDJGkn2JFl78X2MjLUjS6gDXqztL2nWW63
	 9IH4vxRsvhsU+D5joJjBZcBk8xhKMnhrrKnne7sDCMZkJ/jqzo7zIQkojByTEQoV41
	 o7nvzKvujcEiJ9/bm1uFsbwb6xVM7VUd7ZOn32mFtmIC4RPuE6rF9G9J3q+FTikkhe
	 T0sXPY+v/NtWa6kmoj7GCkpSrKnSsRoBzEpb9EgHu9cSVQDJjaL0GRIJPdHD5/XHRt
	 x8X6H/wrehrSbex1Y2xVa+2YQkXSQF5PynEt1qmMeD1fzp6HEHifpS5jgQaWLR9Xjw
	 tn1/LYWD3zb6Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: alvinzhou.tw@gmail.com,  mwalle@kernel.org,  pratyush@kernel.org,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  chengminglin@mxic.com.tw,  leoyu@mxic.com.tw
Subject: Re: [PATCH] mtd: spi-nor: macronix: use nor->addr_nbytes
In-Reply-To: <20241111113609.12093-1-tudor.ambarus@linaro.org> (Tudor
	Ambarus's message of "Mon, 11 Nov 2024 13:36:09 +0200")
References: <20241111113609.12093-1-tudor.ambarus@linaro.org>
Date: Fri, 06 Dec 2024 15:51:11 +0000
Message-ID: <mafs07c8c4xow.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_075115_505507_B0B14D54 
X-CRM114-Status: UNSURE (   8.69  )
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

On Mon, Nov 11 2024, Tudor Ambarus wrote:

> Use the nor->addr_nbytes set by the core, we shouldn't use
> magic numbers or states that are not tracked by the core.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> Alvin claimed he tested this patch at:
> https://lore.kernel.org/linux-mtd/CAPhrvRQrugRQgQcdHBdwid3_sUkCm0mZL9zhz1=TYzXg4qUTfw@mail.gmail.com/
> Though a Tested-by tag would be nice. Thanks!

Well, we didn't get a Tested-by, but that is fine since we know it has
been tested by Alvin. Applied to spi-nor/next. Thanks!

BTW, b4 complains about DKIM signature when picking up your patch:

    BADSIG: DKIM/linaro.org

Maybe take a look at your settings or ask Linaro IT about it.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
