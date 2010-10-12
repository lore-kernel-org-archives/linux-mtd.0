Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P5agC-0002yA-7y
	for linux-mtd@lists.infradead.org; Tue, 12 Oct 2010 08:57:54 +0000
Received: by mail-ew0-f49.google.com with SMTP id 7so783889ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 12 Oct 2010 01:57:51 -0700 (PDT)
Subject: Re: [PATCH] mtd: physmap_of: Loop through all "reg" tuples for mapping
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Stefan Roese <sr@denx.de>
In-Reply-To: <1286541687-5706-1-git-send-email-sr@denx.de>
References: <1286541687-5706-1-git-send-email-sr@denx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 12 Oct 2010 11:55:03 +0300
Message-ID: <1286873703.2164.8.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-10-08 at 14:41 +0200, Stefan Roese wrote:
> This patch changes the loop over the "reg" tuples to not exit
> directly upon of_address_to_resource() failure but to continue
> with the next "reg" tuple instead. This failure could be due to
> size = 0, which might be passed via the device-tree.
> 
> This is needed for boards, where a "reg" tuple might have size 0
> (of_address_to_resource() returns with EINVAL when size = 0).
> 
> Example:
> 
> Fully equipped board:
> 
> 	reg = <0 0x00000000 0x00400000
> 	       0 0x00400000 0x00400000>;
> 
> Partially equipped board:
> 
> 	reg = <0 0x00000000 0x00400000
> 	       0 0x00400000 0x00000000>;
> 
> This could be the case on boards with runtime detection of
> multiple NOR flash configurations where the detected flash size
> is inserted into the dtb in U-Boot.
> 
> Signed-off-by: Stefan Roese <sr@denx.de>
> ---
>  drivers/mtd/maps/physmap_of.c |    8 +++++---
>  1 files changed, 5 insertions(+), 3 deletions(-)

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
