Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274DCFF60CF
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Mar 2026 07:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSwib2BcjhkjQTIWL6sX3eKSPlMk98ITRcWFKKgyUtE=; b=qZXX6eX/fL/F+4
	6ssusC/KjuXV8JnT8lGtU3w8+wIQjHC6AVU5U3JCP+ewtGaeSAnx3Jrk7dKqla7pyuUwp5jGIgGc2
	a60RW8xLIs/eVr3vGhdkkAcgpb5/muMmG73zbwEHe1vE4B6NdKs2qy/eFIazDRGMidQFnVG7obGg9
	LKxilUOa2l3dyU7iF/3ATXozXad7XbhmWIi8tHK+zMVVdmkZ/audpbPjzWsUX/ZL31S5bCzC1Qgkp
	yZs9CzARvX6/A/xKZ1X+VDDNfD0e+ckmNILe0Ea+clcwE3ayiRl+gEyN4OApQmYjgM+dZnNOs76iF
	T1IDgWK2PXQj7XtqcREg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TUC-0000000CU3Z-4AFj;
	Tue, 31 Mar 2026 07:26:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TUA-0000000CU2R-40Qw
	for linux-mtd@lists.infradead.org;
	Tue, 31 Mar 2026 07:26:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B43B6091C;
	Tue, 31 Mar 2026 07:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30204C19423;
	Tue, 31 Mar 2026 07:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774941962;
	bh=J/7X+rQIo5zVinBT3FXkg0ilM9H8ma02sqnI5YAvjc4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FFDzRNrdpX6MZRGUDWl6u1Wx+lPoS0ARP2Anzjb2OG5UnMjLNIXeEmHbcMs8rfYA1
	 yb9TrU5ktqKRIGSeNp2muHjjc2zy2iWGCrVbNKGWuoduOL4ePXy/tcNKUnudeH7AOS
	 8Xn/tNvrkf6rclUDDkGs/dhy2ifIFGF+jhlk+/Zbr1N+mkMhfxiWs0Ua5HO+egBpIt
	 jNK+uN8XbuIHAAUgeBqnijMFKy0I56hhghVdPyJ+46XNumcq/6CGYgT0wODKS3CuJQ
	 FO/k3WKbgtUY+QbiAlgEBlw/IGAk+aY0MVd940IB0WOyVlo/iZHUhO4IvCfjCnx5ft
	 APGeEvHdDmUuQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Haoyu Lu <hechushiguitu666@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: micron-st: Enable die erase support
 for MT35XU02GCBA
In-Reply-To: <20260331030644.1120-1-hechushiguitu666@gmail.com> (Haoyu Lu's
	message of "Tue, 31 Mar 2026 11:06:42 +0800")
References: <20260331030644.1120-1-hechushiguitu666@gmail.com>
Date: Tue, 31 Mar 2026 07:25:58 +0000
Message-ID: <2vxzqzp0iho9.fsf@kernel.org>
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

Hi Haoyu,

On Tue, Mar 31 2026, Haoyu Lu wrote:

> The MT35XU02GCBA flash device does not support chip erase according
> to its datasheet, but supports die erase. The existing code had a TODO
> comment noting that the SPI_NOR_IO_MODE_EN_VOLATILE flag probably needs
> to be enabled and the driver implementation needs to be converted to
> use die erase.
>
> This patch enables the SPI_NOR_IO_MODE_EN_VOLATILE flag and adds the
> mt35_two_die_fixups to the MT35XU02GCBA entry, which includes the
> micron_st_nor_two_die_late_init() function that sets up die erase
> support.
>
> With these changes, the flash device can properly use die erase
> operations instead of chip erase.
>
> Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>

I tried applying this patch and it fails to apply. It seems you have
sent the v2 on top of your v1 patch. You should do the v2 as a fresh
patch on top of spi-nor/next with all the changes, and not a incremental
version on top of v1.

Please squash your two patches and resend.

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
