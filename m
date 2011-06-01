Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRjhV-00075m-HG
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 11:35:02 +0000
Received: by fxm14 with SMTP id 14so4918872fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 04:34:59 -0700 (PDT)
Subject: Re: [PATCH] mtd: OneNAND: OMAP2: Return proper error if
	regulator_get fails
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Axel Lin <axel.lin@gmail.com>
In-Reply-To: <1306848053.13412.1.camel@phoenix>
References: <1306848053.13412.1.camel@phoenix>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Jun 2011 14:30:35 +0300
Message-ID: <1306927835.4405.107.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-05-31 at 21:20 +0800, Axel Lin wrote:
> Signed-off-by: Axel Lin <axel.lin@gmail.com>
> ---
>  drivers/mtd/onenand/omap2.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Pushed to l2-mtd-2.6.git, thank you.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
