Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKV38-0001ng-BK
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 12:31:27 +0000
Received: by eyh6 with SMTP id 6so481195eyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 05:31:24 -0700 (PDT)
Subject: Re: [PATCH] mtd: sst25l: fix section markings
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1304950078-27141-1-git-send-email-vapier@gentoo.org>
References: <1304950078-27141-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 May 2011 15:28:02 +0300
Message-ID: <1305203282.2713.118.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-05-09 at 10:07 -0400, Mike Frysinger wrote:
> The previous section mismatch fix for this driver wasn't entirely correct.
> The sst25l_flash_info array is now used in the devinit probe func, but is
> marked as initdata, so building results in the warning:
> 
> WARNING: drivers/mtd/devices/sst25l.o(.devinit.text): Section mismatch
> 	in reference from the function sst25l_probe()
> 	to the variable .init.data:sst25l_flash_info
> 
> Further, the remove func should be devexit rather than exit to match the
> probe func.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
