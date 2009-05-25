Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M8aFr-0002ei-3U
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 13:30:22 +0000
Subject: Re: [PATCH] [MTD] MXC NAND support for 2k page size flashes
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vladimir Barinov <vova.barinov@gmail.com>
In-Reply-To: <1243242377-4470-1-git-send-email-vbarinov@embeddedalley.com>
References: <1243242377-4470-1-git-send-email-vbarinov@embeddedalley.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 May 2009 16:29:24 +0300
Message-Id: <1243258164.21646.123.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: maramaopercheseimorto@gmail.com, s.hauer@pengutronix.de,
	lilja.magnus@gmail.com, lanconelli.claudio@eptar.com,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.arm.linux.org.uk
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-05-25 at 13:06 +0400, Vladimir Barinov wrote:
> - Add support for 2k page size flashes
> - Fix page address access for large pages
> - Detect oob layout at runtime
> - handle pagesize_2k variable
> - Fix oob16 layout: reserve location 5 of oob area since it's used for bbt
> ---
>  drivers/mtd/nand/mxc_nand.c |   60 ++++++++++++++++++++++++++++++++++++------
>  1 files changed, 51 insertions(+), 9 deletions(-)

I've added this to my git tree. You did not provide your signature,
but I assume you have just forgotten about this and have added it for
you:

Signed-off-by: Vladimir Barinov <vova.barinov@gmail.com>

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
