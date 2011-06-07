Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QToU5-0001hT-J4
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 05:05:46 +0000
Received: by eyh6 with SMTP id 6so1939206eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 22:05:42 -0700 (PDT)
Subject: Re: [PATCH 4/4] flash_info: display MEMGETINFO and MEMISLOCKED
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307384537-9607-4-git-send-email-vapier@gentoo.org>
References: <1307384537-9607-1-git-send-email-vapier@gentoo.org>
	<1307384537-9607-4-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 07 Jun 2011 08:01:26 +0300
Message-ID: <1307422886.11104.21.camel@localhost>
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

On Mon, 2011-06-06 at 14:22 -0400, Mike Frysinger wrote:
> I found the existing flash_info output to be a little lacking, so
> add decoders for MEMGETINFO and MEMISLOCKED.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
>  flash_info.c |   98 +++++++++++++++++++++++++++++++++++++++++++++++++++------
>  1 files changed, 87 insertions(+), 11 deletions(-)

Pushed patches 1-3.

WRT this patch - I think the sector map should be a separate option,
because it outputs too much for a default option.

> +	for (i = 0; i < reginfo->numblocks; ++i) {
> +		einfo.start = reginfo->offset + i * reginfo->erasesize;
> +		printf(" %*i: %08x ", width, i, einfo.start);
> +		if (ioctl(fd, MEMISLOCKED, &einfo))
> +			printf("RO ");
> +		else
> +			printf("   ");


MEMISLOCKED is quite new ioctl, so you should check for ENOTTY. E.g.,
with my stock Fedora 14 + nandsim I see all sectors as RO, which is
obviously not true.

Otherwise the patch looks very good.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
