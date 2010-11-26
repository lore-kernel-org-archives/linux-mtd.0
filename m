Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PM0V6-0003GN-9E
	for linux-mtd@lists.infradead.org; Fri, 26 Nov 2010 15:46:19 +0000
Subject: Re: [PATCH] MTD: NAND: jz4740: Make 'struct platform_driver
	jz_nand_driver' static
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <1289498568-12191-1-git-send-email-lars@metafoo.de>
References: <1289498568-12191-1-git-send-email-lars@metafoo.de>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 26 Nov 2010 17:45:30 +0200
Message-ID: <1290786330.2552.22.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-11-11 at 19:02 +0100, Lars-Peter Clausen wrote:
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
>  drivers/mtd/nand/jz4740_nand.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 

Pushed both patches to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
