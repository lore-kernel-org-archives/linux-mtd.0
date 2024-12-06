Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89670E77179
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Dec 2024 15:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MhPUc+pKOC0kvsEXZ0eO6GQYYeG2AX3kwmFZVVHqvjs=; b=Wt83D9VBzMhyCm
	YgrDMOogDnDZY90je3XkdUdyApEjWbwUXSZq5ALYeOUty0CrA1jrlfVHJ6NwGXZ9AVDdJsPq+z1Rt
	DGtnPoQ2ZaiSAYG1W5z7Ms+wUHcojBB3IpiNM/I3DaOoUP5tFr0IDNgCTVqdclVK0mdzW0J/JYho6
	92EDvP41xmM6TryOcjS5PtoPhKSzsSjKZdA5+5hDbmFwTW7bO5XlZeDWE+eLLutZZEEUW32rkePhw
	c7NCoMTdMxQcGxa8+TkT8BXmVUKsFpY+clpynIM4n9bYZGFIK9AOf5sOgvhX9YfZbJoMzBke6UP4R
	lT6fFdUSmNxpTJWblE7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJZwv-00000001wCv-3wCz;
	Fri, 06 Dec 2024 15:08:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJZwt-00000001wCO-0CSG
	for linux-mtd@lists.infradead.org;
	Fri, 06 Dec 2024 15:08:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6C962A44279;
	Fri,  6 Dec 2024 15:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442F4C4CED1;
	Fri,  6 Dec 2024 15:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733497734;
	bh=X2DFbcfifLoFen+Ra01s5FegQTebcs9sJl+7t0SB9Hw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lAxHjcIrMCwVXDzbd/Fs8nycOCLReNZA37YFWNJPh964Vx2BV2ITra5Uv0nKpBfy6
	 mmiC+C97GljNlzAXZ1e1YWeckTkYwTK+EcGfBzN6aYWkcdhMfr9OWjS57XtREW/fBn
	 PG/usixa3pvP6Y4kjgvC+sZLKZVfZKD5bPxwq86carDoofyqlGVSd64uZagQ5Wq8TI
	 cWtYk3rXQsWpIRA23yXDdbkk2nK0rwEgjlRTrcl+0SdzQW+q/twbPb1Mz8sAwgNg50
	 dmpnl3V81GOMXufNYkc2pQXnWWBFakbcJmaHlugfosmwzg+PatIN7GcNdb2Ary8BWI
	 n0Cox4DTp802g==
From: Pratyush Yadav <pratyush@kernel.org>
To: Vishwaroop A <va@nvidia.com>
Cc: <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,
  <mwalle@kernel.org>,  <cmiquel.raynal@bootlin.com>,
  <thierry.reding@gmail.com>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <jonathanh@nvidia.com>,  <kyarlagadda@nvidia.com>,
  <smangipudi@nvidia.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: Add support for spansion s25fs512s1
In-Reply-To: <20241126185834.1130949-3-va@nvidia.com> (Vishwaroop A.'s message
	of "Tue, 26 Nov 2024 18:58:33 +0000")
References: <20241126185834.1130949-1-va@nvidia.com>
	<20241126185834.1130949-3-va@nvidia.com>
Date: Fri, 06 Dec 2024 15:08:51 +0000
Message-ID: <mafs0frn04zng.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_070855_145459_B0C5757A 
X-CRM114-Status: UNSURE (   8.94  )
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

On Tue, Nov 26 2024, Vishwaroop A wrote:

> Add support for the spansion s25fs512s1 SPI NOR flash. This device has
> a 64MB size (SZ_64M), dual/quad read capabilities and apply
> s25fs_s_nor_fixups to handle specific chip behavior.
>
> Erasing, reading and writing this flash device has been validated on
> the Jetson AGX Orin platform using mtd_debug and dd utilities.

Please read https://docs.kernel.org/driver-api/mtd/spi-nor.html for
requirements for adding new flashes. Also, see if you even need a new
entry at all, or the generic SFDP-based driver works for you already. If
not, explain in your patch why.

Same applies to patch 3/3.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
