Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PHCa4-000755-1N
	for linux-mtd@lists.infradead.org; Sat, 13 Nov 2010 09:39:34 +0000
Received: by bwz5 with SMTP id 5so3910613bwz.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 13 Nov 2010 01:39:29 -0800 (PST)
Subject: Re: [PATCH] mtd: bcm963xx-flash: try JEDEC probe if CFI fails
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <20101029141749.23774.90495.stgit@dev.siriade.com>
References: <20101029141749.23774.90495.stgit@dev.siriade.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 13 Nov 2010 11:39:17 +0200
Message-ID: <1289641157.2218.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Mike Albon <malbon@openwrt.org>, Daniel Dickinson <cshore@csolve.net>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Florian Fainelli <florian@openwrt.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-10-29 at 16:17 +0200, Guillaume LECERF wrote:
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
> ---
>  drivers/mtd/maps/bcm963xx-flash.c |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)

Pushed to l2-mtd-2.6.git, thanks you.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
