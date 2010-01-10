Received: from mail-fx0-f210.google.com ([209.85.220.210])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTv9a-00076C-6g
	for linux-mtd@lists.infradead.org; Sun, 10 Jan 2010 10:36:18 +0000
Received: by mail-fx0-f210.google.com with SMTP id 2so18211663fxm.5
	for <linux-mtd@lists.infradead.org>;
	Sun, 10 Jan 2010 02:36:13 -0800 (PST)
Subject: Re: [PATCH 4/6] mtd: Remove unnecessary comparisons with
	MAX_MTD_DEVICES
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Hutchings <bhutchings@solarflare.com>
In-Reply-To: <1262704857.2837.11.camel@achroite.uk.solarflarecom.com>
References: <1262704857.2837.11.camel@achroite.uk.solarflarecom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 10 Jan 2010 12:36:11 +0200
Message-Id: <1263119771.7315.160.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-01-05 at 15:20 +0000, Ben Hutchings wrote:
> MAX_MTD_DEVICES is about to be removed.
> 
> Signed-off-by: Ben Hutchings <bhutchings@solarflare.com>
> ---
>  drivers/mtd/devices/pmc551.c |    4 ++--
>  drivers/mtd/mtdchar.c        |    3 ---
>  drivers/mtd/mtdoops.c        |    5 -----
>  3 files changed, 2 insertions(+), 10 deletions(-)

Reviewed-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
