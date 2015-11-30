Date: Mon, 30 Nov 2015 12:55:05 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: cfi: don't warn about broken geometry for !CONFIG_MTD
Message-ID: <20151130205505.GN64635@google.com>
References: <3747078.dk5V5gxuXa@wuerfel> <4492128.vrqmf1niG3@wuerfel>
 <7025557.qur2fOT79A@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7025557.qur2fOT79A@wuerfel>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 24, 2015 at 11:09:02PM +0100, Arnd Bergmann wrote:
> The linux/mtd/map.h header file is included by a couple of
> platform specific files that are built even when CONFIG_MTD
> is disabled, and we always get
> 
>  warning "No CONFIG_MTD_MAP_BANK_WIDTH_xx selected. No NOR chip support can work"
> 
> in that case. This adds an #ifdef around the pointless warning,
> as everything is really fine when we don't build the drivers
> anyway.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> > I'm actually still getting the warnings for any file that includes <linux/mtd/map.h>
> > while CONFIG_MTD is disabled. I have a fix now that I'm testing overnight
> > and plan to post tomorrow, then we can decide whether it should be part of
> > the same patch, or we should have two separate patches.
> 
> The patch fixes the remaining warnings I see on ARM randconfigs in this file,
> and I think it makes sense to keep it as a separate patch, as these are really
> distinct problems even thought the symptom is the same.
> 
> Please apply both.
> 
> diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
> index 366cf77953b5..58f3ba709ade 100644
> --- a/include/linux/mtd/map.h
> +++ b/include/linux/mtd/map.h
> @@ -142,7 +142,9 @@
>  #endif
>  
>  #ifndef map_bankwidth
> +#ifdef CONFIG_MTD
>  #warning "No CONFIG_MTD_MAP_BANK_WIDTH_xx selected. No NOR chip support can work"
> +#endif
>  static inline int map_bankwidth(void *map)
>  {
>  	BUG();
> 

I guess no one includes mtd/cfi.h with CONFIG_MTD=n? Otherwise, we might
have the same problems there.

Pushed to l2-mtd.git, thanks!

Brian
