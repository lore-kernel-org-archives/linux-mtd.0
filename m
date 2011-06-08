Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULEw-00077S-VN
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:04:19 +0000
Received: by fxm14 with SMTP id 14so592047fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:04:15 -0700 (PDT)
Subject: Re: [PATCH] mtd: lart.c: cleanup: drop HAVE_PARTITIONS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307548789-5733-1-git-send-email-dbaryshkov@gmail.com>
References: <1307548789-5733-1-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 18:59:58 +0300
Message-ID: <1307548798.7374.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Russell King <linux@arm.linux.org.uk>, linux-mtd@lists.infradead.org,
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

On Wed, 2011-06-08 at 19:59 +0400, Dmitry Eremin-Solenikov wrote:
> Consolidate knowledge about partitions in drivers/mtd/devices/lart.c.
> Drop all HAVE_PARTITIONS conditionals. Always use partitioning.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  drivers/mtd/devices/lart.c |   18 +-----------------
>  1 files changed, 1 insertions(+), 17 deletions(-)

Looks good, thanks, pushed to l2-mtd-2.6.git.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
