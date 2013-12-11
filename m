Date: Tue, 10 Dec 2013 17:27:48 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 15/36] mtd: st_spi_fsm: Fetch boot-device from mode pins
Message-ID: <20131211012748.GI27149@ld-irv-0074.broadcom.com>
References: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
 <1385727565-25794-16-git-send-email-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1385727565-25794-16-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 29, 2013 at 12:19:04PM +0000, Lee Jones wrote:
> --- a/drivers/mtd/devices/st_spi_fsm.c
> +++ b/drivers/mtd/devices/st_spi_fsm.c
> @@ -346,9 +348,48 @@ static void stfsm_fetch_platform_configs(struct platform_device *pdev)
...
> +	/* Use device size to determine address width */

Since you're splitting this patch series up so much, shouldn't this
comment go in when you add the two lines below?

>  	if (info->sector_size * info->n_sectors > 0xFFFFFF)
>  		info->flags |= FLASH_FLAG_32BIT_ADDR;
...

BTW, even though it doesn't exactly make for the best (runtime)
bisectability (since your driver is not functional yet), this approach
to splitting your driver introduction into logical chunks does make it a
little easier to review. So thanks.

Brian
