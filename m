Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEADC61DF4
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Nov 2023 14:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xd3iGSg5jDXdIEYZxGttTWyg0LLvc3OHN8iXFzxT4w=; b=vTQtxe+8CbPvf8
	RPRvKS6PPKgFfKbkv4hfqK/bcsoIGJK35JNkSmUqZFvp/ciO6F/ZCbYM7XNOiTpS+IBxzDbWh8kVl
	mCbK7BYnQ+z3StpBmXJga/7VIOtcqH1QYkKQdN1i1Wu1hgnSRfWWcV55MDcwfIkG9QyasWgIqdo0X
	VRvBQXIPivTeso5GjkWIUdTxoIk10mEcpGxJ2eta7AqOBdto8o9XiZJjoOCpxYrXr/OcAW4gRpG4P
	ojC06GeAB/GE5TLWxdV7Ix0Pj0OZVaLffWfMJEYm/+qPBzQ90zCMchd/mB/JzvNksfITk0BNCs84u
	nFDH96VhFWDRVjJ18Dsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XMt-007R3r-1a;
	Fri, 24 Nov 2023 14:41:19 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XMr-007R3B-1A
	for linux-mtd@lists.infradead.org;
	Fri, 24 Nov 2023 14:41:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 20780CE2967;
	Fri, 24 Nov 2023 14:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45AC1C433CB;
	Fri, 24 Nov 2023 14:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700836697;
	bh=OSsETKA6fwqSq8MTrXvGGiqnQ7ZWBL+ygcVW9Hzy7zQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=p8bl87mXD4NcH6cQYh+IHmtKEZkb9we+PyWjqON3vOtuUep33sn/bGqjFOesAW7Pd
	 6h2rA9ChfqBGFdha6gFIdNzTqIk1xbJ45SgH4em1U+lcxfgNjE4pSfBJzsYaBNBfax
	 NmJ8LXB08r2hHlBNABatUaDXhOf1WYP7UXau5fMGhLNCpXaUWfXwuIE/7r4sjwZb0w
	 K9OyqiReidsOoVkcOc9LZThCB2PmJItXmKns5sdrHKx5lC9HI+YCGaxzBLn9eeRw52
	 yZCwQuHVCEbpNu8NPpNkJPAU8bmazRkucMI+i/s4lxej6nju3dH1sh0oGznGOxoyab
	 3QcVOCSwiFfzQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org,  michael@walle.cc,  linux-mtd@lists.infradead.org,
  linux-doc@vger.kernel.org,  corbet@lwn.net,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: mtd: spi-nor: drop obsolete info
In-Reply-To: <20231123160721.64561-3-tudor.ambarus@linaro.org> (Tudor
	Ambarus's message of "Thu, 23 Nov 2023 18:07:21 +0200")
References: <20231123160721.64561-1-tudor.ambarus@linaro.org>
	<20231123160721.64561-3-tudor.ambarus@linaro.org>
Date: Fri, 24 Nov 2023 15:38:15 +0100
Message-ID: <mafs0o7fjdxns.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_064117_585007_BC66BEFD 
X-CRM114-Status: UNSURE (   6.48  )
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

On Thu, Nov 23 2023, Tudor Ambarus wrote:

> The architecture description is obsolete, it no longer applies to
> the current SPI NOR framework state, remove it.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
