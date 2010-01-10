Received: from mail-fx0-f210.google.com ([209.85.220.210])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTv8y-00076C-26
	for linux-mtd@lists.infradead.org; Sun, 10 Jan 2010 10:35:40 +0000
Received: by mail-fx0-f210.google.com with SMTP id 2so18211663fxm.5
	for <linux-mtd@lists.infradead.org>;
	Sun, 10 Jan 2010 02:35:35 -0800 (PST)
Subject: Re: [PATCH 2/6] mtd: Use get_mtd_device_nm() to find named device
	in get_sb_mtd()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Hutchings <bhutchings@solarflare.com>
In-Reply-To: <1262704813.2837.7.camel@achroite.uk.solarflarecom.com>
References: <1262704813.2837.7.camel@achroite.uk.solarflarecom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 10 Jan 2010 12:35:34 +0200
Message-Id: <1263119734.7315.158.camel@localhost.localdomain>
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
> This removes the need to know the number of MTD devices.
> 
> Signed-off-by: Ben Hutchings <bhutchings@solarflare.com>
> ---
>  drivers/mtd/mtdsuper.c |   18 ++++++------------
>  1 files changed, 6 insertions(+), 12 deletions(-)

Reviewed-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
