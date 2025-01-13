Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAC7C02183
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2025 17:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LRYn63DDbMit+jJ4lQMSE0ylQ3/kD7fEIfdLPOLT3+g=; b=0aZWnWLbAHweRL
	YhtpOn+lnRfb15GIdWPE4WeLnNn2NLfKtF5LEB6HVuU1Vt7x4BEoJp5D0haBISgIS3AO6XHDH0BoJ
	5nybqOyA6PXadAL80YhCCpmCpvHlV76ktmO1BcgxD+jpUDoab8XdGykRI8LbryBymJabbDI/SpQ+e
	QpZZXBy9QIuut8Rkcby4NgYQ260AtBYt2Jy6vInzWXKcOFoCwudE0w+Iubqgu9KH3+tIIaghaf+bc
	fSUpj/luL/tVqOgS8XkKVilVw0fuEw1Lyy+MH2uoSU0HQBEjJ9jkgOPghYjCE0GbeBzZM8ITw9qgn
	KBHgmTwGCMcdy6ltDLoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOcK-000000066fI-3xHu;
	Mon, 13 Jan 2025 17:52:48 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXOcI-000000066ds-0vZB
	for linux-mtd@lists.infradead.org;
	Mon, 13 Jan 2025 17:52:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1F339A41290;
	Mon, 13 Jan 2025 17:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9E10C4CED6;
	Mon, 13 Jan 2025 17:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736790765;
	bh=4eb7aFIfUTW9f9gOymN+fTT0Ae3iJ2H7ofb06csQLPo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jg0Pql8axrJ38KvVUBBZoxMltaoL8oyEOlEP8kt/z3AlaWB0j7sqA5S6EevbEGMT6
	 WIV57mQ0swtTMw0ItLWcqnk/MJ5HGItfmgAgAqrGJDfiJOC6TUQVKgywrLhi7X4R4M
	 7B/1bw/WHhfUgi4yawnCpFTFowizo1GJc1M3D4mDU91o0IDosX2c07bNR0DQTToqDA
	 LSz8EkCA82YFc/016o14v3dz9FsDG9bfpsKFly15WHdcG5EIAnH9Xzuvw9fCcNge+O
	 dGnaRnDQ1FdVVH8SnIVrjtHS80mmmLpcsX0Fp8n/Jo1RtE9N1JquffSAGtHcK5xg6C
	 PcnDd1uDW1MUg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Renjun Wang <renjunw0@foxmail.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: extend description of size member of
 struct flash_info
In-Reply-To: <20241219-spi-nor-flash-info-size-desc-v1-1-6b53cf011027@linaro.org>
	(Tudor Ambarus's message of "Thu, 19 Dec 2024 09:20:04 +0000")
References: <20241219-spi-nor-flash-info-size-desc-v1-1-6b53cf011027@linaro.org>
Date: Mon, 13 Jan 2025 17:52:42 +0000
Message-ID: <mafs0h6627g9h.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_095246_321162_F109995E 
X-CRM114-Status: GOOD (  10.00  )
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

On Thu, Dec 19 2024, Tudor Ambarus wrote:

> We use the size as an indicator whether to parse SFDP or not. We don't
> introduce a dedicated member for SFDP parsing because we'd like to keep
> the struct size at a minimum, as it's used for every flash declaration.
> Ideally we won't have flash entries at all, but there are still flash
> parameters that aren't defined by SFDP, thus we need to statically
> specify them.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Applied to spi-nor/next. Thanks!

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
