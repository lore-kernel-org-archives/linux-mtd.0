Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B979CD4F54
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2026 13:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=32x+gBFjdsWmLF998q3ZxT+ERLEVKNcafIWHpzuhPmU=; b=i3mRqkOfvSs8Lu
	SJwYr5+jmDKeIMdnp/yymzLZkhWOCKv/tJpD7t2cAKXoNNnFYo5iKoRf369H0yshjlMbPrLOboBty
	Jef0f3WAt6juuCnJI0ZqqN1yfzetyV5+YunEBu3XMzElz81tJbpW3oD4uRVA9Pvb1kdEyYEHjGp6o
	0KYxL0yjq2C306uBowTolDEkeFLmoHLt3XVe2JazwJqf/KquELVZcsI5vBqcaBuah+HYMW19765GQ
	1ExjXEVHuhVeW3gu+4VMFU0wW1hMLMR3NO+UFjWHwHFRlYvO2Z/oIpmQIRCoqqlr/RJQt6TkdURx8
	nM3dlOO7IeEwqdHgdmxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbB0-00000005oW0-0VQk;
	Thu, 28 May 2026 13:53:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbAy-00000005oVc-1shn
	for linux-mtd@lists.infradead.org;
	Thu, 28 May 2026 13:53:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B9186054B;
	Thu, 28 May 2026 13:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7524C1F000E9;
	Thu, 28 May 2026 13:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779976411;
	bh=sy9Ib1N/ndkD0KL+Q8VtgPA5qcxytBx25LWx2GOl+Jw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ew4jxaG6LUmodTNOR2WkX/Rf5pNz6F0MVEau9DR5Q9tLUGtfhFQMfH5qtLZP+aozF
	 rPscTvY0WOkwiWHYfXC5g71Ls+tCL2Xc6kMwsWZtIlqYEdlVCYSNnJN6nLbt0SpCX7
	 FPBcq2ZVZJqgG5LWdD/vhFAg2/apoQ9XFekV43ZOiDMdhNSqofNVLxkAdpXZM3TYPj
	 2AwEGQhXrEy0s97Sor0TmwkL5zmkva9TBEoi97ckP2zsLgBJ+wSxct6PvYdALMw2lV
	 R39c3FCI99QHJIyGxJMb8AQC/U/qhWusTl4B1A9bEFYV+xQuAZJtTFpoZnNFwlZuUM
	 Qaus5fPPz5GYQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org,  Jonathan Corbet <corbet@lwn.net>,  Shuah
 Khan <skhan@linuxfoundation.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  linux-mtd@lists.infradead.org,  Miquel
 Raynal <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH -next] mtd: spi-nor: testing locking, fix new doc build
 warnings
In-Reply-To: <20260526172341.773398-1-rdunlap@infradead.org> (Randy Dunlap's
	message of "Tue, 26 May 2026 10:23:41 -0700")
References: <20260526172341.773398-1-rdunlap@infradead.org>
Date: Thu, 28 May 2026 15:53:27 +0200
Message-ID: <2vxz4ijr4p48.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
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

On Tue, May 26 2026, Randy Dunlap wrote:

> Add a blank line to prevent documentation build warnings:
>
> Documentation/driver-api/mtd/spi-nor.rst:215: ERROR: Unexpected indentation. [docutils]
> Documentation/driver-api/mtd/spi-nor.rst:216: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> # for spi-nor/next

Folded into "mtd: spi-nor: Add steps for testing locking support".
Thanks!

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
