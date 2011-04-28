Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QFUlg-0001H3-NM
	for linux-mtd@lists.infradead.org; Thu, 28 Apr 2011 17:12:45 +0000
Received: by ewy3 with SMTP id 3so1045312ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Apr 2011 10:12:42 -0700 (PDT)
Subject: Re: [PATCH] powerpc/44x: Add multiple chip select support to NDFC
	driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Felix Radensky <felix@embedded-sol.com>
In-Reply-To: <1303810606-2068-1-git-send-email-felix@embedded-sol.com>
References: <1303810606-2068-1-git-send-email-felix@embedded-sol.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 28 Apr 2011 20:08:26 +0300
Message-ID: <1304010506.2737.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, sr@denx.de, linuxppc-dev@lists.ozlabs.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-04-26 at 12:36 +0300, Felix Radensky wrote:
> This patch extends NDFC driver to support all 4 chip selects
> available in NDFC NAND controller. Tested on custom 460EX board
> with 2 chip select NAND device.
> 
> Signed-off-by: Felix Radensky <felix@embedded-sol.com>
> ---
> 
> I'd appreciate some testing on 44x boards with multiple NAND
> devices, like bamboo or DU440, as I don't have access to these 
> boards.
> 
>  drivers/mtd/nand/ndfc.c |   52 +++++++++++++++++++++++++++++++---------------
>  1 files changed, 35 insertions(+), 17 deletions(-)

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
