Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRgjT-0002sw-2q
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 08:24:52 +0000
Received: by fxm14 with SMTP id 14so4795023fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 01:24:49 -0700 (PDT)
Subject: Re: [TRIVIAL PATCH next 09/15] mtd: Convert vmalloc/memset to vzalloc
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joe Perches <joe@perches.com>
In-Reply-To: <adc50014679048de28c7d536f1686cd945fc40f6.1306603968.git.joe@perches.com>
References: <cover.1306603968.git.joe@perches.com>
	<adc50014679048de28c7d536f1686cd945fc40f6.1306603968.git.joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Jun 2011 11:20:24 +0300
Message-ID: <1306916424.4405.68.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jiri Kosina <trivial@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2011-05-28 at 10:36 -0700, Joe Perches wrote:
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  drivers/mtd/mtdswap.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
