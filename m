Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D60C021B8
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Mar 2025 12:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Rr4TrtAjhXZ2Am52ORdWR+UzDwdpCXHhKBDCuL/Mj4=; b=LOopT5YgYq6W1K
	7CRdu1xxb+gtk9xk3vOOZsKnRuMnx6u4mdw3yu+RjDqA3Pfy5fC6OTCP0gSy/U2JGG6fsJBSfMOcn
	PspEfEtX2wgeEWz8rrL7/EYCIdOf4uZVT1WIHaGuxnRQxatedHbzhLlgeJDLhzzkl8LyongEsHaht
	KkyUhcjAVyGL5SK6+Ucx9Gss4x7BHTw480OU/YXYlgnF0mikJoZ/fjPoVkuXcUXvFQH0GIRmeRP0I
	os6zr0SRbiqA6/MBEk1J1TRX/FWM0g4Wsj68CZAbBbtrgizxGPdpV3aZyiH+r/3KPIMgi4t/2Ys5I
	kTG3hrW6N1l7fxOaQYbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRWP-00000004evE-3LkY;
	Tue, 04 Mar 2025 12:37:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRTp-00000004eSt-04PQ
	for linux-mtd@lists.infradead.org;
	Tue, 04 Mar 2025 12:34:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 36A0C5C48FF;
	Tue,  4 Mar 2025 12:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DA4FC4CEE5;
	Tue,  4 Mar 2025 12:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741091675;
	bh=fUV9oCdw2/Vr0Yg1PFXBhdcspyjyNSW7xfpXx/38pCA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qb4S8ruzc7pSnXvaJHMQUXKJjuv1IMGBtSLZCdHfs9xawlskKeSVyHHMyjACH9Owz
	 fZ1L9Owpc7r+FqZ5594ym8g6QurjcUQO56CQJrGV6/3UgjszfkFZZouMiJXyXwHrBd
	 Mq6ezlNakSliuzVTv9+z7kPxLbrn02VKRYzNDUa7RHByWfaJNPFpbnzNe9XpQEl4/o
	 DssqVYYbHEeS2P5OeZYk7kTywAGvFB0tY6iqmNQsjuO0FKXcSSo0h0m0whj7Rp59o0
	 8pqlXmFl3evVGUbQ4+Mi2rbN/s6ImcGl0RiOuuBiw9rFZ4BpMg4nOvzouSP+CClhUk
	 ukY92OrbKPwkA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush
 Yadav <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,
  <linux-mtd@lists.infradead.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Cheng Ming Lin
 <linchengming884@gmail.com>
Subject: Re: [PATCH] mtd: spinand: Improve spinand_info macros style
In-Reply-To: <20250304110539.2290873-1-miquel.raynal@bootlin.com>
References: <20250304110539.2290873-1-miquel.raynal@bootlin.com>
Date: Tue, 04 Mar 2025 12:34:33 +0000
Message-ID: <mafs0a5a1j7om.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_043437_092511_BE2C2B5D 
X-CRM114-Status: UNSURE (   7.59  )
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

On Tue, Mar 04 2025, Miquel Raynal wrote:

> Let's assume all these macros should not have a trailing coma, this way

s/coma/comma

Acked-by: Pratyush Yadav <pratyush@kernel.org>

> the caller can use a more formal and usual C writing style, as reflected
> in the Macronix driver.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
