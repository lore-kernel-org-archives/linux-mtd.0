Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P7Cca-0003Mp-Ee
	for linux-mtd@lists.infradead.org; Sat, 16 Oct 2010 19:40:49 +0000
Received: by bwz7 with SMTP id 7so2571849bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 16 Oct 2010 12:40:47 -0700 (PDT)
Subject: Re: [PATCH] [MTD] cfi_cmdset_0002: code cleanups
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
In-Reply-To: <1287233782-21319-1-git-send-email-w.sang@pengutronix.de>
References: <1287233782-21319-1-git-send-email-w.sang@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 16 Oct 2010 22:40:43 +0300
Message-ID: <1287258043.1781.45.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guillaume LECERF <glecerf@gmail.com>, yidong zhang <zhangyd6@gmail.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-10-16 at 14:56 +0200, Wolfram Sang wrote:
> - remove disabled code (hasn't been touched since the beginning of git
>   and should be reimplemented if really needed)
> - convert remaining c++-comments to plain c-style
> 
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: yidong zhang <zhangyd6@gmail.com>
> Cc: Guillaume LECERF <glecerf@gmail.com>
> Cc: David Woodhouse <David.Woodhouse@intel.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |   47 ++++++-----------------------------
>  1 files changed, 8 insertions(+), 39 deletions(-)

Pushed to l2-mtd-2.6.git.

Just FYI, we use "mtd:" prefix for MTD patches. Please, do not use [MTD]
- git am kills it. I think [SUBSYSTEM] prefixes is some ancient pre-git
era stuff. Modern way is to use "SUBSYSTEM:".

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
