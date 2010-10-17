Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P7OzA-00054q-UB
	for linux-mtd@lists.infradead.org; Sun, 17 Oct 2010 08:52:57 +0000
Received: by bwz7 with SMTP id 7so2823648bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 17 Oct 2010 01:52:55 -0700 (PDT)
Subject: Re: [PATCH] mtd: Blackfin NFC: fix badblock location with BootROM OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1287268019-9426-1-git-send-email-vapier@gentoo.org>
References: <1287268019-9426-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 17 Oct 2010 11:49:51 +0300
Message-ID: <1287305391.1951.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	uclinux-dist-devel@blackfin.uclinux.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-10-16 at 18:26 -0400, Mike Frysinger wrote:
> The bbt structure isn't actually used, just the badblockpos.  This lets
> the driver correctly handle badblocks with the different OOB layout with
> certain sized flashes.  Previously, the blocks would all be reported as
> bad and be completely unusable.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  drivers/mtd/nand/bf5xx_nand.c |   14 ++++----------
>  1 files changed, 4 insertions(+), 10 deletions(-)

Taken both patches to l2-mtd-2.6.git.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
