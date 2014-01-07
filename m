Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0Q7o-0006dy-4Z
 for linux-mtd@lists.infradead.org; Tue, 07 Jan 2014 06:26:52 +0000
Date: Tue, 7 Jan 2014 13:52:44 +0800
From: Huang Shijie <b32955@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 5/5] mtd: nand: use __packed shorthand
Message-ID: <20140107055243.GC8109@shlinux2.ap.freescale.net>
References: <1388795828-24808-1-git-send-email-computersforpeace@gmail.com>
 <1388795828-24808-5-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1388795828-24808-5-git-send-email-computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 03, 2014 at 04:37:08PM -0800, Brian Norris wrote:
> To be consistent with the rest of include/linux/mtd/nand.h, we should
> use the __packed shorthand instead of __attribute__((packed)).
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> No change since v1
> 
>  include/linux/mtd/nand.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index e3621aba1417..2413bac095ae 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -292,7 +292,7 @@ struct nand_onfi_params {
>  	u8 vendor[88];
>  
>  	__le16 crc;
> -} __attribute__((packed));
> +} __packed;
>  
>  #define ONFI_CRC_BASE	0x4F4E
>  
> -- 
> 1.8.3.2
> 
> 
> 
Acked-by: Huang Shijie <b32955@freescale.com>
