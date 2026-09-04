Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF38C61DD6
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 13:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B8oq6948qLC0rWwzRu4VC5M3y3ebebOnqfd9UEQ+5Y0=; b=1LrX0Syqv11Zrg
	1atB2AKZLAmdxFCpQ8ecjpH/iVhqDlk44jGscGLWtVCu0yMoKsQ+XdbXLWihpDBOgfW5d5hqlEQmb
	56Dq4lYL4LliGIXirYYqkm8lH9G7KlL0j538FnZJ1L+F3e77rFOvwmOv2AlRJjSIBsciMWIpGDCmR
	WwlkEjCKbF2NBFhx2i2yClymM3kIJ4N8GYLV2Ec8khBuThRS+0YjH7iLYDqxIhjswG+oExrg+hFYs
	6LUoD9EIhciYS5py86lHR1OVBgih/ZjyMAVWLFL9ot0NBEQ6nBDXMKb/M0x/a5zuYgsGUjVdbuo92
	WW/zAMHhGnVZJXv1EEaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U9t-00000002Fxb-0ADE;
	Fri, 04 Sep 2026 13:40:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2U9p-00000002FvC-4C6Q
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 13:40:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BDD5A404E8;
	Fri,  4 Sep 2026 13:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2ADB1F00A3D;
	Fri,  4 Sep 2026 13:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788529241;
	bh=w5BleKMYPEzBnvbvt1SnxpNmZhMc1N9txPtpLqhEb+s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RyNRLXWpz9O5yPxAqpgC1ssktH6LIgjCA8rAGGJdoHxytVJpU2e4CiYNDyi66hFKN
	 16szjn5f0awDmwkPfFX1o9J5jRz07cALR6m0IMZfXWXEoAaKruP5BPfgN7B9omGV/3
	 YhPrGsKjnM8FVeijyhBg5nPG8eijiX3hhSkO9IR+/Fl+cGLbB4GqaEySNyxIgpAMGV
	 r5a3uuuBJQ3oVqR4u0xaXRsqx7Rm9aJy20S6iwLtvqP9dg7N1i8iZdT92Khze9TOaB
	 c1kLeOqgwbkhEgudyW9q7+4iWjAxwIEQcG4g06pLj0sOANpsRxA3puXcvEDupF+4vu
	 EhBkX/ncWxg1A==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260811-perso-rww-fixes-v1-1-5866a70e5d1c@bootlin.com>
References: <20260811-perso-rww-fixes-v1-1-5866a70e5d1c@bootlin.com>
Subject: Re: [PATCH] mtd: spi-nor: Unprepare legacy controllers upon RWW
 wait interruption
Message-Id: <178852923952.3340372.11391066199956007622.b4-ty@b4>
Date: Fri, 04 Sep 2026 15:40:39 +0200
MIME-Version: 1.0
X-Mailer: b4 0.16.0
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


On Tue, 11 Aug 2026 17:56:23 +0200, Miquel Raynal wrote:
> All the parallel locking helpers (spi_nor_prep_and_lock(),
> spi_nor_prep_and_lock_pe() and spi_nor_prep_and_lock_rd()) call
> spi_nor_prep() then wait with a killable sleep. If the sleep gets
> killed, we leave the controller in its prepared state.
> 
> Call ->unprepare() in these cases.
> 
> [...]

Applied, thanks!

[1/1] mtd: spi-nor: Unprepare legacy controllers upon RWW wait interruption
      commit: f594a33f9721f08facd98d0a31adc14ff6da9d70

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
