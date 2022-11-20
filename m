Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC52C4332F
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Nov 2022 15:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ex5QLiT8osCo0E5rG09cYTNAo37nvb6xmv0AGv1H9Nw=; b=uOak+/WVxIzf6e
	V0OGTnDSoTfByAYDxc8Uh2/YSEFtD+aWIN2XINXiKeKYcYKImcSxlRAV092ObXneJ57d0P37K7Ihm
	TvdMAAs9ffwDlVx7xQz7l4cL8SB+sgqkUk7WYjH2dH3i4jP8A/gcsdKr2GwvDjWEGoj9dm2inVLGn
	/qwUrpCFAEFsxTOtRWE0MWIgODNu8sHwB5jwpzo3ZFPiBxiSCZec4XF/zW/VWOBrDTg4f9pQnztds
	bkmR5f2K7sgIzY7cjHLJaO9HeTkoq2c7W/oKh23+GDyf4O/vRC5BgQPqICGkMK23c7LzkziO9GFwc
	B6WsFkCvfA6UBXOldHdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owmRk-005GYv-JN; Sun, 20 Nov 2022 15:41:28 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owmRg-005GXZ-AR
	for linux-mtd@lists.infradead.org; Sun, 20 Nov 2022 15:41:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B7963B80AAF;
	Sun, 20 Nov 2022 15:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75026C433C1;
	Sun, 20 Nov 2022 15:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668958881;
	bh=942efgTy7L0p4SnhjyHVDdfyN3Ad1MY2bvz8beVh7EQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AT2SLhsbFsizY2CL+7UF0zE19uB6xhwrVagpqKT5Ok4ovt9oBc7lCam6dUF207WW0
	 DYLbdt/iXHe0Ut2oNk+iQxrzoa8ts/BvBys5OuBDk3UqOfBQVybjZbqQB60hcAVkxQ
	 liSDPAykv/7ZXDEM9mwRL03r+nxUp+TttnnzKQV4EZg/0vgKj4cG672dI3+Jd8sPLP
	 DOSyJVDONuB9o9z06ym7NwwavPzUhCAElJL7bsuZTW1T+aBuNTYEeAnVxZRHZb7jda
	 n5yHtyJdHhYSdRnf1DBCNtBGholLqBuwv4mbMKuxZYmi0gE2rucknHDmrHka8MaFVD
	 LpEOvBkl6BXOw==
Date: Sun, 20 Nov 2022 16:41:16 +0100
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org, Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 0/9] mtd: spi-nor: read while write support
Message-ID: <20221120154116.htz5tx24pjjipzj4@yadavpratyush.com>
References: <20221110155513.819798-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221110155513.819798-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_074124_684495_2049F2AC 
X-CRM114-Status: GOOD (  45.96  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On 10/11/22 04:55PM, Miquel Raynal wrote:
> Hello folks,
> =

> Here is the follow-up of the RFC trying to bring a little bit of
> parallelism to support SPI-NOR Read While Write feature on parts
> supporting it and featuring several banks.
> =

> I have received some hardware to make it work, so since the RFC, the
> series has been updated to fix my mistakes, but the overall idea is the
> same.
> =

> There is nothing Macronix specific in the implementation, the operations
> and opcodes are exactly the same as before. The only difference being:
> we may consider the chip usable when it is in the busy state during a
> write or an erase. Any chip with an internal split allowing to perform
> parallel operations might possibly leverage the benefits of this
> implementation.
> =

> The first patches are just refactoring and preparation work, there is
> almost no functional change, it's just a way to prepare the introduction
> of the new locking mechanism and hopefully provide the cleanest and
> simplest diff possible for this new feature. The actual change is all
> contained in "mtd: spi-nor: Enhance locking to support reads while
> writes". The logic is described in the commit log and copy/pasted here
> for clarity:
> =

> "
> The following constraints have to be taken into account:
> 1#: A single operation can be performed in a given bank.
> 2#: Only a single program or erase operation can happen on the entire chi=
p.

Is this a limitation of the chip you are working with? A chip with =

multiple banks can in theory support parallel erases and programs on =

each bank as well, right? If so then it might make sense to allow =

parallel erases and program operations too, and then allow for extra =

chip-specific constraints.

I have not yet read the code so I am not sure how complex implementing =

this would be. Just thinking out loud for now.

> 3#: The I/O bus is unique and thus is the most constrained resource, all
>     spi-nor operations requiring access to the spi bus (through the spi
>     controller) must be serialized until the bus exchanges are over. So
>     we must ensure a single operation can be "sent" at a time.
> 4#: Any other operation that would not be either a read or a write or an
>     erase is considered requiring access to the full chip and cannot be
>     parallelized, we then need to ensure the full chip is in the idle
>     state when this occurs.

Makes sense.

> =

> All these constraints can easily be managed with a proper locking model:
> 1#: Is protected by a per-bank mutex. Only a single operation can happen
>     in a specific bank at any times. If the bank mutex is not available,
>     the operation cannot start.
> 2#: Is handled by the pe_mode mutex which is acquired before any write
>     or erase, and is released only at the very end of the
>     operation. This way, no other destructive operation on the chip can
>     start during this time frame.
> 3#: A device-wide mutex is introduced in order to capture and serialize
>     bus accessed. This is the one being released "sooner" than before,
>     because we only need to protect the chip against other SPI accesses
>     during the I/O phase, which for the destructive operations is the
>     beginning of the operation (when we send the command cycles and
>     eventually the data), while the second part of the operation (the
>     erase delay or the programmation delay) is when we can do something
>     else with another bank.
> 4#: Is handled by the "generic" helpers which existed before, where
>     basically all the locks are taken before the operation can start,
>     and all locks are released once done.
> =

> As many devices still do not support this feature, the original lock is
> also kept in a union: either the feature is available and we initialize
> and use the new locks, or it is not and we keep using the previous
> logic.
> "
> =

> Here is now a benchmark with a Macronix MX25UW51245G with bank and RWW
> support:
> =

>      // Testing the two accesses in the same bank
>      $ flash_speed -b0 -k0 -c10 -d /dev/mtd0
>      [...]
>      testing read while write latency
>      read while write took 51ms, read ended after 51ms
> =

>      // Testing the two accesses within different banks
>      $ flash_speed -b0 -k4096 -c10 -d /dev/mtd0
>      [...]
>      testing read while write latency
>      read while write took 51ms, read ended after 20ms
> =

> Here is a branch with the mtd-utils patch bringing support for this
> additional "-k" parameter (for the second block to use during RWW
> testing), used to get the above result:
> https://github.com/miquelraynal/mtd-utils/compare/master...rww
> =

> Cheers,
> Miqu=E8l
> =

> Miquel Raynal (9):
>   mtd: spi-nor: Create macros to define chip IDs and geometries
>   mtd: spi-nor: Introduce the concept of bank
>   mtd: spi-nor: Add a macro to define more banks
>   mtd: spi-nor: Reorder the preparation vs locking steps
>   mtd: spi-nor: Separate preparation and locking
>   mtd: spi-nor: Prepare the introduction of a new locking mechanism
>   mtd: spi-nor: Add a RWW flag
>   mtd: spi-nor: Enhance locking to support reads while writes
>   mtd: spi-nor: macronix: Add support for mx25uw51245g with RWW
> =

>  drivers/mtd/spi-nor/core.c     | 224 +++++++++++++++++++++++++++++----
>  drivers/mtd/spi-nor/core.h     |  61 +++++----
>  drivers/mtd/spi-nor/macronix.c |   3 +
>  include/linux/mtd/spi-nor.h    |  12 +-
>  4 files changed, 250 insertions(+), 50 deletions(-)
> =

> -- =

> 2.34.1
> =

> =

> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- =

Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
