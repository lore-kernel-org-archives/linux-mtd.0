Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C81AC25B74
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2024 13:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSOgAIAIjuAyZ43O1HNRvWyQ4FdPj5jPMkNgsE0Okoo=; b=Beu/9DRcdLkcNv
	aLGLXyoVF5nQWLQDNHwK6KXRUYl8/THTya5lxV1YsilEPgI4wTXslGmgHjLx/Iqb5CQrI5GZO1QTW
	D2GqTI2w8RAHpLOcC0Ds79AnLnXJvpF2uMcGvX59ZTRpIEyFGM96MvrNq9HQgJtOqmpS1XZ0Ru9OS
	ZQdvCXykwx5rmApzsEggVBpcPXXv9YATo9oVa6KwL5GWKub24SO36hOWe/SK70k8QvVpB/4InG+f8
	usTSQwe6lRvrrd5wlzv5DQBEo6cS5xnvi8MrVi1P5PP65vLrhThu7GCktYFNH6dbuwyvrAgnvzjYA
	PMB7527Xe+dAaIYKguwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBaNg-0000000F4zb-3r0U;
	Mon, 27 May 2024 13:27:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBaNf-0000000F4yj-14P5
	for linux-mtd@lists.infradead.org;
	Mon, 27 May 2024 13:27:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C05AB61217;
	Mon, 27 May 2024 13:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24221C2BBFC;
	Mon, 27 May 2024 13:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716816433;
	bh=ZyDOV+M5aNRQcxoeRg24V5eddc/YAovsvaL/j6YVyGw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CiZxRfwfJp8nIKYRU8dJ5T6vBGq+Bt0Mkn28mthMikZxjE1870baR737ift0Y+t0R
	 uukJ4B6ZoozamSouwyN8VhzVFaLY/afL7Vu+ajw0eiBl9pHbppFk42Sfv1JdO5Opyg
	 LOWpQUrPcypzvWmy3vFRPR3dWLrZ34AaEgPu336YDaBBgCZ+DG8pC0rCImd+gS7b4l
	 uLVRVXRXjuGjp3NCyP3cY/NGxdfvydmMD6Qlt4AqES/KFIxpezDi7Lc4OrmdWTbZfw
	 Jrg70BgDbsSu/Jd8V9BuEwlixKcnzyhu2niHteXuBh46vQUM/yR4vKfnyoFTlw43K0
	 4X8xpfRj+CBGw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Ricardo Ribalda <ribalda@kernel.org>,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 3/6] mtd: spi-nor: remove .setup() callback
In-Reply-To: <20240419141249.609534-4-mwalle@kernel.org> (Michael Walle's
	message of "Fri, 19 Apr 2024 16:12:46 +0200")
References: <20240419141249.609534-1-mwalle@kernel.org>
	<20240419141249.609534-4-mwalle@kernel.org>
Date: Mon, 27 May 2024 15:27:10 +0200
Message-ID: <mafs0jzjfe66p.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_062715_386448_D0119537 
X-CRM114-Status: GOOD (  11.22  )
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

Hi,

On Fri, Apr 19 2024, Michael Walle wrote:

> With the removal of the Xilinx flashes, there is no more flash driver
> using that hook. The original intention was to let the driver configure
> special requirements like page size an opcodes.  This is already
> possible by other means and it is unlikely a flash will overwrite the
> (more or less complex) setup function.

Just for comparison, I checked if U-Boot does anything with the setup
hook that we might also need. It looks like it mostly uses it for
handling non-uniform erases on Spansion flashes, since U-Boot doesn't
have proper support for them. This shouldn't be needed by Linux since it
can already do those erases.

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
