Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFB6D5D682
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2024 18:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HRhlDcS/ofHrTaZkXwPrgIFiOCfimpibwXMWyW0OUYI=; b=Iu5oi+qRiRJd/F
	YYbHlWAaramsYKHc60G5TvZdPvGaCJH/Uff5bXA17VAa1aTNSi5+w6khCFcbH+1rC3z08/M7CBGkm
	AjYuabd0L3GDXemqN7TYfHTyvxoU2CJ/abRv6jMPKakcoY8SDOK3+kvi/tWWICMJKvu3SJS8z3HqU
	22tVo+B786abYCOUVNSH4yk8OjYo8/dmftPiWhf4qAX7yPl3KXHEoma3809ebSkao+WgUbatUdQNv
	3gsl/Epn9fq1jtELbW/m148qQOEXhLb5TUK36d7HxAQuX64P0hjXYKfdPaNPeU0y7zCEy3CRiQCTb
	rl58d6AJXJjymBji26Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t973h-00000007v2s-39pL;
	Thu, 07 Nov 2024 18:16:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95s0-00000007k2H-2Wvm
	for linux-mtd@bombadil.infradead.org;
	Thu, 07 Nov 2024 17:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7xJQ8PRClRx/G/uC6ZDPRhLZup1QBQXHZih8qzyEFAw=; b=E5MJQv9dQbEl3Aa11rJq9QnNYG
	w0d60M5XQocsajggVrNDdajtmfpYnsL4JL+0eM9FoipEcv1ckuDu/NWw+ROCOzOZjFkOXXbGlIWEe
	ewSiI4zwBkI+j9EYjKkSzhTwIf/ErAGazeVFPWcRKf9Pr3uBJpASwQmx2GdcDLpnXHwhIfR9vm2Va
	Ra0p7PjEvdHxq9hzawg/lJqNIrYkwSkEMnLYYFhrU5kCA6xPyzGfl511yUWfK2vTsvBsKBFXOigBV
	5oYcfV93xmd/7ZacmEH9aSTPFOnd0JbA1F1ZcELgO5mZB6HR5oU1Vj3oQLTQX7kDvmbHEcgDzJWmP
	SbxuDxXg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95rx-0000000CAMI-0QzP
	for linux-mtd@lists.infradead.org;
	Thu, 07 Nov 2024 17:00:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 177D85C309C;
	Thu,  7 Nov 2024 16:59:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204B8C4CECD;
	Thu,  7 Nov 2024 17:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730998824;
	bh=fmEMZSN8aYDktJAftW6kTuaO7wJAwwzSFJuKFKEOrmI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bXaGhoDSo3pT7F+q6VnOjjxAJKmMyTf3z43Vw6z3BrqOuoGzRAup2kUvvObIE3bsx
	 YmMIgnVEo7EwHtOKAmdylTlqn6vThURcB8YPWkE58fsaQqXgyaiqptHx/ERu0tZP0M
	 /wxwRFenyvfTGxbp1M6NqafnaH6cKXWDL7gB1Cz8taM6FICIaKlJCsbR6GZ449xv4Z
	 AFHHO0Q0j2D0JuSkw5muppQSdEz5lsitrJjEecaHNXR1Yx+bR4rJqtd36F+bbdAv4+
	 ZWO0a0kZQoFMBoAWQQNckpCCnRzXQOemPJB2EEu/UMgA7tt0LFchvRLD90gh1AleDo
	 f0NyZ8bXMlHtw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: tudor.ambarus@linaro.org,  pratyush@kernel.org,  mwalle@kernel.org,
  miquel.raynal@bootlin.com,  richard@nod.at,  vigneshr@ti.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  leoyu@mxic.com.tw,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>
Subject: Re: [PATCH] mtd: spi-nor: core: replace dummy buswidth from addr to
 data
In-Reply-To: <20241107093016.151448-1-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Thu, 7 Nov 2024 17:30:16 +0800")
References: <20241107093016.151448-1-linchengming884@gmail.com>
Date: Thu, 07 Nov 2024 17:00:21 +0000
Message-ID: <mafs0cyj77zdm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_170029_355331_07201B62 
X-CRM114-Status: UNSURE (   9.87  )
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

On Thu, Nov 07 2024, Cheng Ming Lin wrote:

> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>
> The default dummy cycle for Macronix SPI NOR flash in Octal Output
> Read Mode(1-1-8) is 20.
>
> Currently, the dummy buswidth is set according to the address bus width.
> In the 1-1-8 mode, this means the dummy buswidth is 1. When converting
> dummy cycles to bytes, this results in 20 x 1 / 8 = 2 bytes, causing the
> host to read data 4 cycles too early.
>
> Since the protocol data buswidth is always greater than or equal to the
> address buswidth. Setting the dummy buswidth to match the data buswidth
> increases the likelihood that the dummy cycle-to-byte conversion will be
> divisible, preventing the host from reading data prematurely.

Makes sense.

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
