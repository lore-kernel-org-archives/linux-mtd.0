Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF31C021A4
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 17:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z3slPxJ80GSpFTKaMZqkLBZznSw0PVUc0aayo0h0iXA=; b=aZglmUgqSzUtEi
	0rahpChA5Ry834c1RnxOl3ipF2ZCQlm3NRwtj+E0w+WdUHQ8OLom/kgQXTWKk/Js06dlmoteCM4BQ
	KSoD0D+60+2/uGfmxwc2a50FG0S/x5XWzM72uLWno59BWTqIKjGRV5kW45MchYOQU036FMaTFTQRW
	gVP0inPr7jK13feiA+TmIx3pxzMcEX9wOAceXrCWguWTTX9IXC89XeKmSDz+VOJuZeEWMsPtwlU98
	Yoe90+yEJYU/w3rtO2JkSvde90KfO0c9ohqcdF+L5m/8wtyERz+uTXZKhY11bcLkogV2PxNm41No0
	aaIJJWxfB3NU6HYZoSsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmbzJ-0000000EZPU-2NNr;
	Mon, 24 Feb 2025 17:11:25 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmbx3-0000000EYwg-07FA
	for linux-mtd@lists.infradead.org;
	Mon, 24 Feb 2025 17:09:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7995B611BE;
	Mon, 24 Feb 2025 17:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B77C4CED6;
	Mon, 24 Feb 2025 17:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740416944;
	bh=f3FWAWqKObBU7iKw0nZ9RZrNN4S7jDVi0Qku/f/biv4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sHiKVSf+mE/PTtYlQ9mYjKF9Y0zbDlyq2ehTJ7Bk/U0WosG1elNo02pi4EYnUNz0t
	 AXYg1cON8o1ayNWx5+ffQqzEKUPkBvFJXnPY0n3fxun1IO6auYtyXYuygoswTBYaIp
	 +87bmcdw04lymq+RmN7dKhFCDOzxvVt+j6uoSuOYrZxySNPyw4G7GHiI4pna6gll3e
	 M3VOUbDj4gVCfRESrQsRwCVD7WpiSU0gKXiYn1Bze2UJk9Ga8e6vcg5uWEskd2FPo2
	 uG+UolnQMQ5k6R90HM06C07oloOcmB4WhS/U2qPqEVe+zPo5rv3UuJq64BxBDGK/dj
	 sJEMtl4C3Nefg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: explicitly include <linux/math64.h>
In-Reply-To: <20250223-snor-math64-v2-1-6f0313eea331@linaro.org> (Tudor
	Ambarus's message of "Sun, 23 Feb 2025 06:51:10 +0000")
References: <20250223-snor-math64-v2-1-6f0313eea331@linaro.org>
Date: Mon, 24 Feb 2025 17:09:01 +0000
Message-ID: <mafs0bjurl176.fsf@kernel.org>
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

On Sun, Feb 23 2025, Tudor Ambarus wrote:

> swp and otp drivers use div_u64 and div64_u64 and rely on implicit
> inclusion of <linux/math64.h>.
>
> It is good practice to directly include all headers used, it avoids
> implicit dependencies and spurious breakage if someone rearranges
> headers and causes the implicit include to vanish.
>
> Include the missing header.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
