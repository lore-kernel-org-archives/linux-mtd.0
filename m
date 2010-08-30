Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq3VM-0005ZA-Rb
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 12:30:32 +0000
Received: by gwb10 with SMTP id 10so2406399gwb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 05:30:28 -0700 (PDT)
Subject: Re: [PATCH 1/2] mtd: nand: Support new Toshiba SLC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <1282332973-12077-1-git-send-email-norris@broadcom.com>
References: <1282332973-12077-1-git-send-email-norris@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Aug 2010 15:27:35 +0300
Message-ID: <1283171255.12995.54.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-08-20 at 12:36 -0700, Brian Norris wrote:
> Toshiba does not use ONFI for their NAND flash. So we have to continue
> to add new IDs used by Toshiba devices as well as heuristic detection
> for scanning the 2nd page for a BBM. This is a relatively harmless
> start at supporting many of them.
> 
> These chips mostly follow the same ID fields of previous generations,
> but there is a need for a few tweaks:
> 
> * These chips introduce a strange 576 byte OOB (that's 36 bytes per
>   512 bytes of page). In the preliminary data, Toshiba has not
>   defined exactly how their ID strings should decode. In the future,
>   a new tweak must be added.
> * NAND_MAX_OOBSIZE and NAND_MAX_PAGESIZE should be increased soon.
> 
> Data is taken from, among others, Toshiba TC58TxG4S2FBAxx
> 
> Signed-off-by: Brian Norris <norris@broadcom.com>
> ---
>  drivers/mtd/nand/nand_base.c |    5 +++--
>  drivers/mtd/nand/nand_ids.c  |   31 +++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 2 deletions(-)

Pushed both patches to my l2-mtd-2.6.git / master, but in reverse order,
which seems to be more logical.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
