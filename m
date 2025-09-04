Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3A6CA1013
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Sep 2025 19:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=toyIb75hTdre2VgNz/8MQ1lrkYhO/+fA9PRVCPLGWdE=; b=YxwlEpKJdcUGZA
	yssOYGbvnWZeOuTdu/HPKlHthguj1Gw2n9XIkN+fn9c54G7BMbXgLpYKKTCabjOubDlwAwG2TBS9L
	GGoAVlrOCZZtELewRtgHcbR2qJ4Ujb0gHxrPt+SSQzwHKh5AaftHq4QNVxMAreUHmN0S4biApfBpg
	mtYsbjn1Md35i0ZuMtXYy7/uZIAWWSbt6oIsXFhpBpqg+A+/G1zvkY9DAyl9sthyqjDTW93dLZjjK
	WmpxC7vgM90uKW7/BDjzYnVpIUlQM8FDt5PCEHFxw8/Jai2BI7c0mLVIeg3mErl+1N0XbedPog6ly
	py6QwzlkCxXglqSeM49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFzS-0000000E1Cu-45dS;
	Thu, 04 Sep 2025 19:51:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAwn-0000000CDGp-0vTl
	for linux-mtd@lists.infradead.org;
	Thu, 04 Sep 2025 14:28:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 99070601AD;
	Thu,  4 Sep 2025 14:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415F2C4CEF0;
	Thu,  4 Sep 2025 14:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756996100;
	bh=7rNh+q/6GiZsjQK3QzeqsPQyi4srMLPWub0MT1cyFO4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=b5NyE1DFepVzAcZVQILT/DQmvh8W6tjkIn6o6jyJWZJcnM1qke69hPWQPCMl9R2lO
	 HeuJ+iPMnY0Sj9VwXK7R5o01EFkk4OX/Jvwqi1kXNuGFc1oZrEikrOjdiSQ7z/LonE
	 4PQGlSKyZD2nH+kmq3QhZflAxy0qohsMOL0m40cLR1jCVcaqOq5lggG8Yc1Ty1VRH6
	 q1TXlWcYF4HV1qh00mCl0yzIW5yECPJLL/6BQU7ZfsgzjYe2iJtpToVSzkhVOBajwR
	 PZWLuSXp9ZQmVzY3fEek6VoXlqhZlKgzJ+oaQ+v8c6Sf2O+pe1orgBJJpFdM393dPx
	 imBlksga+P5Aw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <miquel.raynal@bootlin.com>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <praneeth@ti.com>,  <p-mantena@ti.com>,  <a-dutta@ti.com>,
  <u-kumar1@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: spansion: Modify addr_mode_nbytes for DTR
 mode
In-Reply-To: <20250904131309.3095165-1-s-k6@ti.com>
References: <20250904131309.3095165-1-s-k6@ti.com>
Date: Thu, 04 Sep 2025 16:28:17 +0200
Message-ID: <mafs03492uwam.fsf@kernel.org>
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

On Thu, Sep 04 2025, Santhosh Kumar K wrote:

> The nor->params->addr_mode_nbytes parameter defines the address byte
> count for the current addressing mode. When transitioning between SDR
> and DDR modes, this parameter must be properly updated to maintain the
> correct addressing behavior. So, implement the necessary updates to
> nor->params->addr_mode_nbytes during both DDR mode enablement and
> disablement operations to ensure address byte counts remain consistent
> with the active transfer mode.

Doesn't spi_nor_set_4byte_addr_mode() do this already? What is the
difference here? Are we missing a call to it after
spi_nor_set_octal_dtr() in some path?

Also, do you see a real bug with this or is this purely theoretical?

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
