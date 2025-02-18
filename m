Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590F3C02198
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 14:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LouLnB+ys1XGQzX/h8jEactDbzY47cgWnlOfQKL0/3k=; b=Bxk6quqfeS8+Cu
	j5/eiyk0ZwPETDuLkDBr2UrW+o4B/Ecwpcusi5d9LhzghhTdR8Hd1XNyUJIldH841rNrenjIeduQ7
	/+S4UUyGBWhcCAMf/nai7rz1MgoxgOIDMajfN8NtgmeRfYWO1F+mneHAa6OzSbL9zki1KV94xzNJt
	WVIrcIe0Ir1Z67QEhV0yEzcgH/mcGUjHlXTSZHHF1mbCtnkgzIuyqPjv5XcGznWXRS4Un/Ar0oRLv
	PQq6KxktE0iBK8rBskRJcHLQM96lSmRpyheVQX1e0jEFwH/XjzikT7mF8Upz3PUNzQ81LPwtAM18C
	AKshCUaLfdl0Srax5+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOVY-00000008UV5-3u6Z;
	Tue, 18 Feb 2025 14:23:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOVW-00000008UTd-2ECr
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 14:23:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 54C6CA4041B;
	Tue, 18 Feb 2025 14:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EF7C4CEE2;
	Tue, 18 Feb 2025 14:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739888608;
	bh=6H2IVdf+klJfMtaEaYNKN81zCweCPS/MEZvVQuL1bKc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hmfgsKvjHkzqBOqZPXoCe6Nhsb/eMx1p6OFfUEZuw0Eu/exVhlPYU2EH6S5AJSNRv
	 ZRJ3G1SOIPZoA1tKAxazGIpH5ouQQ62zGMkwiRmjMVH6E86XPIcKlphiDmaz76KDuK
	 9Ptt0KuEddqD59dXVrmYK5oCWqKCNCTOApYuTxjqT29gtPoMApfh534k2Tc3yOj1oJ
	 rd8smYOhmMH9i27USaVeplihsfC/DtDC4cGy9HCAZ7cHcmYfvS5Q+DUybJUZfFADp2
	 I9XZZWkRLO+pLxWOlEIpJYa1jYNjktkysTN3uotH7uKpDs+L8uSg4UVt55OWU6Bo/l
	 5hyxixXgGqT8Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: sort headers alphabetically
In-Reply-To: <20250211-spi-nor-guard-mutex-v1-1-05ed77a484d9@linaro.org>
	(Tudor Ambarus's message of "Tue, 11 Feb 2025 09:30:53 +0000")
References: <20250211-spi-nor-guard-mutex-v1-0-05ed77a484d9@linaro.org>
	<20250211-spi-nor-guard-mutex-v1-1-05ed77a484d9@linaro.org>
Date: Tue, 18 Feb 2025 14:23:26 +0000
Message-ID: <mafs0pljfl4bl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_062330_636411_34FE22A1 
X-CRM114-Status: UNSURE (   6.28  )
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

On Tue, Feb 11 2025, Tudor Ambarus wrote:

> Sorting headers alphabetically helps locating duplicates,
> and makes it easier to figure out where to insert new headers.

Series applied to spi-nor/next. Thanks!

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
