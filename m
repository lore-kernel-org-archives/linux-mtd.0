Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCtVk-0001tp-3u
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2011 13:01:32 +0000
Received: by eyh6 with SMTP id 6so565106eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Apr 2011 06:01:30 -0700 (PDT)
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
Date: Thu, 21 Apr 2011 15:58:38 +0300
Message-ID: <1303390718.2757.8.camel@localhost>
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

your patch is line-wrapped and it is impossible to apply it,
unfortunately.

On Mon, 2011-04-18 at 11:42 +0200, Daid wrote:
> I've split up the patches, and moved the code the libmtd_legacy.c:

Could you pleas send separate patches as separate e-mails? Could you
please also add a nice git commit message and your Signed-off-by? Just
look how other people do this. To make a patches I usually first commit
my changes, then use git format-patch, and then use git send-email to
send them.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
