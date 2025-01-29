Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A08C0218D
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jan 2025 15:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fsd/jJcosQNvgHcaklhsZn6neqrn5AT6dLQ7H7QLIqw=; b=GgyBNv4NlYTcg7
	wIIHbEub3oH/W8vAjNthvcUJfOWp0TAZHTMrE7pJIrsd7nl9RMx4EvbKeS0BIHkI5V1Ybx2VpaZWc
	GnkV6X3bfzvziZqbWBZi0VJgwrljmJO5DaBcyuiqVsAzQnGFx3TC4Zz9akbR3V6n6RPCMsdwhjXot
	DYZujWwYfco+Oxo+D+WLWYDZHG060dvkqdWQVRntsNCsOAH9jLnFmWu3ELw0K58u5mJ0+qfkDjrjv
	xCRcTMh/0408YNCDw72aV3Ggzel+KZbQCgq8auih9N2GQ/y1UvNaCqbBCFTjLpG7o/bgirgIPYqiw
	YdLsO7Qqaf4tZdsL0+nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAAf-00000007HJh-2qa9;
	Wed, 29 Jan 2025 15:40:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAAc-00000007HJE-3fGz
	for linux-mtd@lists.infradead.org;
	Wed, 29 Jan 2025 15:40:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47448A417D9;
	Wed, 29 Jan 2025 15:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293DCC4CED1;
	Wed, 29 Jan 2025 15:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738165201;
	bh=5TTRpWnzjied1uqHfdobXvvLBdbbNHUAt9u5uMwEKxo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Mlko5GlNE30NppleJK0+O3J296S60U2R1cLmwuGENMu2BQZSdOT/0hzlR8X0q+xkb
	 RI5ZLxSeR0/HViFKENyRO4p9nyK4AfQuMJtfPahc4jbSIQP3BHs77J+bTxLnU+S1zC
	 8itspJxIbLxyStPhtWmndcAOIiFMx4Kog7bptqQnFBSzyagPk/yiVG/euKgp6WZeTC
	 KOwRv2t/gacBFXBbUfVvq7KnO161EOeMFe+PAidCKfoiArpc+dpwFew88P9mQBBt6x
	 r1KKINHA2gvB0kMrnEaQlZreemXqycBu0iT6mu8Ir6styfYFMIjXZmVV1VINHB0z4N
	 /6KqtX+Tsq3OQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: winbond: Add support for w25q02jv
In-Reply-To: <20250110-winbond-6-12-rc1-nor-volatile-bit-v3-2-735363f8cc7d@bootlin.com>
	(Miquel Raynal's message of "Fri, 10 Jan 2025 15:49:31 +0100")
References: <20250110-winbond-6-12-rc1-nor-volatile-bit-v3-0-735363f8cc7d@bootlin.com>
	<20250110-winbond-6-12-rc1-nor-volatile-bit-v3-2-735363f8cc7d@bootlin.com>
Date: Wed, 29 Jan 2025 15:39:59 +0000
Message-ID: <mafs0ed0lk4s0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_074002_980865_349AD68E 
X-CRM114-Status: UNSURE (   7.09  )
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

On Fri, Jan 10 2025, Miquel Raynal wrote:

> Add support for Winbond w25q02jv spi-nor chip which shares most of
> w25q01jv's specificities as, this time, the chip is made of 4 different
> dies.
>
> Link: https://www.winbond.com/resource-files/W25Q02JV_DTR%20RevD%2007092024%20Plus.pdf
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
