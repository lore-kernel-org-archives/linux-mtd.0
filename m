Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QbHCv-0003zu-Kk
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2011 19:10:54 +0000
Received: by bwf12 with SMTP id 12so2152496bwf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Jun 2011 12:10:47 -0700 (PDT)
Subject: Re: [PATCH] mtd: nand: handle ECC errors in OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 27 Jun 2011 22:10:43 +0300
In-Reply-To: <1308872724-6196-1-git-send-email-computersforpeace@gmail.com>
References: <1308872724-6196-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1309201845.24805.0.camel@koala>
Mime-Version: 1.0
Cc: Jim Quinlan <jim2101024@gmail.com>, linux-mtd@lists.infradead.org,
	Kevin Cernekee <cernekee@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-23 at 16:45 -0700, Brian Norris wrote:
> While the standard NAND OOB functions do not do ECC on the spare area,
> it is possible for a driver to supply its own OOB ECC functions (e.g., HW
> ECC). nand_do_read_oob should act like nand_do_read_ops in checking the
> ECC stats and returning -EBADMSG or -EUCLEAN on uncorrectable errors or
> correctable bitflips, respectively. These error codes could be used in
> flash-based BBT code or in YAFFS, for example.
> 
> Doing this, however, messes with the behavior of mtd_do_readoob. Now,
> mtd_do_readoob should check whether we had -EUCLEAN or -EBADMSG errors
> and discard those as "non-fatal" so that the ioctls can still succeed
> with (possibly uncorrected) data.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/mtdchar.c        |   15 +++++++++++++++
>  drivers/mtd/nand/nand_base.c |    9 ++++++++-
>  2 files changed, 23 insertions(+), 1 deletions(-)

Looks good, pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
