Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71E8CED635
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Nov 2025 12:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QhQyjt4ZlNjB57qIlM7cdGdM/t/+HUpwhm3PcHv19zA=; b=vRnDVpxYDg0xeg
	eauloo7B+Jqj3qaj+kP/Obxq7kWd8cMetmVjZApxtx6oLCm8WbE19FdbwcR+8+jQiTlB99+B0QLIm
	kmVrIAHcL5AYKbEFnO6ynrXKpROSJtLcYENTmqxMPop1l2KeMqzypdR3eD+Kz9htXzzfCpWYVrceZ
	+AjXLguX4tGZ7ZBbHiIpfiRXP9Py9rOd4yMVS8XVfRKijU5ZUbA+gnvCWpWpuKlQ51zj1N3bT+t+Q
	6mpvxB0lnncOoWzQEdOIuGa7kXPs+iTF4gIoTHI+eo5wEk4SsvbwVBVcQHUbDprfdNsmnYrOe/p2E
	2qWQjsvQ+jkGkT6QwLfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKZF-00000000OBE-2IA7;
	Tue, 18 Nov 2025 12:12:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKZE-00000000OAu-18F7
	for linux-mtd@lists.infradead.org;
	Tue, 18 Nov 2025 12:12:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D075601AA;
	Tue, 18 Nov 2025 12:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97131C4AF0E;
	Tue, 18 Nov 2025 12:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763467934;
	bh=PVNOdyEBoBQTC+IxG12BmkncjarDW/d2EWLYLFyGGGM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=R4jd2y0X9Tf/r2CsubOz0PyKaFiwdynlTWSM4EwcASVqxSLHy/IFx0sYzkG5uLGat
	 NaWRlJ1Ii00hdl1eEHHCJrewqMJfD/odXVU+3oDc/WlQRzI5tm3YGhhyLV25kxVclB
	 ZWGLSHIcZUIsMP6lU8edW7YWeRukMjkcTVDNTPprA6eozH5odZqJ+CfGAQZ+POQJln
	 58qpTSOc6bXXgWT7evHoml4WC1guwskoNXJIrvh6b4beKbdNWSN+4uB3tsasoWjigc
	 lOWbVspZOcYc2VIkgxrYd7k9Zu80qXe2OY/GM5kp3wGZBuTwl9upUtgSiw2n/X3V7B
	 u8k2eTljDql0Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  imx@lists.linux.dev
Subject: Re: [PATCH v4 0/5] mtd: spi-nor: micron-st: few clean up for micron
 spi nor chip
In-Reply-To: <20251112-nor-v4-0-e4637be82a0a@nxp.com> (Haibo Chen's message of
	"Wed, 12 Nov 2025 19:05:08 +0800")
References: <20251112-nor-v4-0-e4637be82a0a@nxp.com>
Date: Tue, 18 Nov 2025 13:12:10 +0100
Message-ID: <mafs0zf8j4k11.fsf@kernel.org>
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

On Wed, Nov 12 2025, Haibo Chen wrote:

> mt35xu02gcba, mt35xu01gbba and mt35xu512aba are similar, but with
> different number of dies. According to the datasheet:
> https://datasheet.octopart.com/MT35XU02GCBA1G12-0AAT-Micron-datasheet-138896808.pdf
> these chips all support die erase command, but do not support chip
> erase. But accroding to test, mt35xu512aba support chip erase, do not
> support die erase. mt35xu01gbba do not support chip erase, but support
> die erase. 
> This patch set clean up the mt35xu512aba, and add mt35xu01gbba.
> since do not have mt35xu02gcba to do the test, just add some comment
> under mt35xu02gcba for further work.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Applied to spi-nor/next with the patch 5 touched up. See
https://git.kernel.org/mtd/c/7f77c561e2278. Thanks!

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
