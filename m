Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PM10y-0005dN-VM
	for linux-mtd@lists.infradead.org; Fri, 26 Nov 2010 16:19:13 +0000
Received: by bwz5 with SMTP id 5so2059586bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Nov 2010 08:19:11 -0800 (PST)
Subject: Re: [PATCH] mtd: fix nand kernel-doc warnings
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Randy Dunlap <randy.dunlap@oracle.com>
In-Reply-To: <20101118150221.2f38e9b0.randy.dunlap@oracle.com>
References: <20101118150221.2f38e9b0.randy.dunlap@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 26 Nov 2010 18:18:39 +0200
Message-ID: <1290788319.2552.32.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	lkml <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-11-18 at 15:02 -0800, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Warning(include/linux/mtd/nand.h:543): No description found for parameter 'badblockbits'
> Warning(drivers/mtd/nand/nand_bbt.c:1101): No description found for parameter 'mtd'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> Cc:	David Woodhouse <dwmw2@infradead.org>
> Cc:	linux-mtd@lists.infradead.org
> ---
>  drivers/mtd/nand/nand_bbt.c |    3 ++-
>  include/linux/mtd/nand.h    |    2 ++
>  2 files changed, 4 insertions(+), 1 deletion(-)

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
