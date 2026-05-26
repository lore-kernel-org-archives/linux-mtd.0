Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B33ECD5BD0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 10:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IzvB2mCHIOYA9Wg4+GYgblk1G2XjUFRlRg4x6BDJrk0=; b=ZKEC21X9coU2wh
	FvS69wSwoE9F2amPUoKJptMh3Yxo20fN36LyEI9IHMfMHmYTOt/ZokWE+BUWfBBKI/r7iQqctJ5Ny
	WsDa+4MyLeqA30zv4dkf+5mXoEiMagnhjQfmd9Rh4s9rnNpWu3HEEbdlFtjDDtU+yeg0f1FVPv76R
	413ewHr+FrD/PLVUXEEryYt2If+LNeswozpz3HqVa+0VacTY1PlgZeVbeDvy0t8kF6VmQjZGODgMJ
	DKDkWFNPKYyL3gbwEgrBHMIBrEgQ+ZtV/jh5sDnShb9xf7gHLWEoUrJT15fb00xM6Fbk1jTXs/wVg
	ViGV0vy9N+mtdJC+gbpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpGn-00000001gDE-2jfK;
	Tue, 26 May 2026 10:44:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpGk-00000001gCi-45yB
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 10:44:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A4A2F4199B;
	Tue, 26 May 2026 10:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D41FA1F000E9;
	Tue, 26 May 2026 10:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779792258;
	bh=bj+t4GaLPxYHxub3Nubh4yJqxbNmryX2vF6uefNugk4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Z82UxL9zMqOwMlpfzJN8M5ZCmPTrOlXkIB8NzP1ZRULPAkeiTOXTDm/jcdk/Zib/4
	 gJvRxD0539CRQOVselQbzmgp1fFOuybCMAdx/pauQxwk0W4jCFOthpXZreT6xWLjg+
	 6Y2rkWY6Qm1K2oXXJObt8lhFN02qIIQNIgnU8E1adKTCvNAvQ9PoggLTBo3/f8a37Z
	 MGMrI1VLkGOQqiA+2VKF+ltBVIJeIydecKPCP4AkIncPi27O4xflU1aC3pg+nWiVY+
	 bsbA9H7Nh9sldHkMc5SBVDrfvG/gHRg7v4y7069y6Mm+acndVP4LYZpRe5+nQnRBY8
	 M6qLJWfmBeLLg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Takahiro Kuwano <tkuw584924@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>
Subject: Re: [PATCH RESEND 2/2] mtd: spi-nor: spansion: add die erase
 support in s28hx-t
In-Reply-To: <20260522-die-erase-fix-v1-2-733ac8967df1@infineon.com> (Takahiro
	Kuwano's message of "Fri, 22 May 2026 17:48:11 +0900")
References: <20260522-die-erase-fix-v1-0-733ac8967df1@infineon.com>
	<20260522-die-erase-fix-v1-2-733ac8967df1@infineon.com>
Date: Tue, 26 May 2026 12:44:15 +0200
Message-ID: <2vxzzf1m4fi8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_034419_035580_BFC70C33 
X-CRM114-Status: UNSURE (   5.94  )
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

On Fri, May 22 2026, Takahiro Kuwano wrote:

> S28Hx-T family has multi-die devices that support die erase opcode.
> Update die erase opcode when the device is multi-die.
>
> Signed-off-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
