Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCtSP-0001rJ-A4
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2011 12:58:05 +0000
Received: by eyh6 with SMTP id 6so564165eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Apr 2011 05:58:03 -0700 (PDT)
Subject: Re: Fwd: mtd-utils: "flash_erase -j" failes with "unable to get
	NAND oobinfo" on large flash chips.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daid <daid303@gmail.com>
In-Reply-To: <BANLkTinZwawiu=-M2qm2PDhZ_yhjM8fS5Q@mail.gmail.com>
References: <BANLkTinozqCrqaDGsAX-gWWUg2G3bvg_Rg@mail.gmail.com>
	<1302761383.2796.4.camel@localhost>
	<BANLkTikgzbGGNg7AXYt89MvM4whvKxXHiQ@mail.gmail.com>
	<1302790378.2796.45.camel@localhost>
	<BANLkTinf1qWFKz19Q2YQKg4o2wT6m-nqsA@mail.gmail.com>
	<BANLkTinZwawiu=-M2qm2PDhZ_yhjM8fS5Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 21 Apr 2011 15:55:11 +0300
Message-ID: <1303390511.2757.5.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, 2011-04-18 at 11:42 +0200, Daid wrote:
> The define comes from mtd/mtd-abi.h, if you are building against older
> kernel versions then this define does not exists. If compatibility
> with older kernel versions is not an issue then this #ifdef could be
> removed.

mtd utils has its own copy of mtd/mtd-abi.h and it does not depend on
the kernel.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
