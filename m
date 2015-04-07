Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YfXhs-0001X8-Vr
 for linux-mtd@lists.infradead.org; Tue, 07 Apr 2015 17:54:37 +0000
Received: by pdea3 with SMTP id a3so86334234pde.3
 for <linux-mtd@lists.infradead.org>; Tue, 07 Apr 2015 10:54:15 -0700 (PDT)
Date: Tue, 7 Apr 2015 10:54:06 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH] mtd: m25p80: remove unused flash entries from id_table
Message-ID: <20150407175406.GK32500@ld-irv-0074>
References: <1428395981-21012-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1428395981-21012-1-git-send-email-zajec5@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Ben Hutchings <ben@decadent.org.uk>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 Ian Campbell <ijc@hellion.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ a few others, some who have had trouble with DT on this driver

On Tue, Apr 07, 2015 at 10:39:41AM +0200, Rafał Miłecki wrote:
> We had many entries that were recently added just to allow selecting
> some flashes directly but were never used. They weren't providing any
> special flash handling, we just needed them due to the lack of some
> generic binding string.
> 
> With the introduction of "nor-jedec" (in 1103b85) they won't be needed
> unless we discover some faulty flash requiring workarounds.
> As explained in m25p80 DT documentation we require specifying
> "nor-jedec" now as less specific compatible entry.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
> To verify list of removed entries by yourself:
> egrep -R "at25fs010|at25fs040|at25df041a|at26f004|at26df161a|at26df321|at45db081d" ./
> egrep -R "en25f32|en25p32|en25q32b|en25p64|en25q64|en25qh128|en25qh256" ./
> egrep -R "f25l32pa" ./
> egrep -R "mr25h10" ./
> egrep -R "gd25q32|gd25q64" ./
> egrep -R "160s33b|320s33b|640s33b" ./
> egrep -R "mx25l2005a|mx25l8005|mx25l3205d|mx25l3255e|mx25l12855e|mx25l25655e|mx66l1g55g" ./
> egrep -R "n25q256a|n25q512ax3|n25q00" ./
> egrep -R "pm25lv512|pm25lv010|pm25lq032" ./
> egrep -R "s25sl032p|s25sl064p|s25fl256s0|s70fl01gs|s25sl12800|s25fl129p0|s25fl129p1|s25sl004a|s25sl008a|s25sl016a|s25sl032a|s25fl016k|s25fl132k" ./
> egrep -R "sst25vf080b|sst25vf064c|sst25wf512|sst25wf010|sst25wf020" ./*
> egrep -R "m25p05|m25p20|n25q032|m25pe20|m25pe80|m25pe16|m25px16|m25px32|m25px32-s0|m25px32-s1|m25px80" ./
> egrep -R "m45pe10|m45pe80|m45pe16" ./
> egrep -R "w25x10|w25x20|w25x40|w25x64|w25q64|w25q80" ./
> egrep -R "cat25c11|cat25c03|cat25c09|cat25c17|cat25128" ./

The thing is, the kernel tree is not necessarily the definitive source
for device tree files. Just because no one's using these in the kernel
DTS (or board) files doesn't mean no one can. People can maintain
out-of-tree DTS files, and even bake them into their firmware, as long
as they use the standard bindings. That's kinda why DT becomes ABI...

That said, I don't expect most people using this could expect that kind
of stability with the current situation (and that's why we'd like to
improve it). And I think the Debian folks who tripped over the m25p80
bindings were using the kernel-provided device trees. So I might be OK
with this. I'd like to see if anyone else has comment to the contrary,
though.

Brian

> ---
>  drivers/mtd/devices/m25p80.c | 60 ++++++++++++++++++--------------------------
>  1 file changed, 24 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 7c8b169..052bd19 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -261,45 +261,33 @@ static int m25p_remove(struct spi_device *spi)
>   * keep them available as module aliases for existing platforms.
>   */
>  static const struct spi_device_id m25p_ids[] = {
> -	{"at25fs010"},	{"at25fs040"},	{"at25df041a"},	{"at25df321a"},
> -	{"at25df641"},	{"at26f004"},	{"at26df081a"},	{"at26df161a"},
> -	{"at26df321"},	{"at45db081d"},
> -	{"en25f32"},	{"en25p32"},	{"en25q32b"},	{"en25p64"},
> -	{"en25q64"},	{"en25qh128"},	{"en25qh256"},
> -	{"f25l32pa"},
> -	{"mr25h256"},	{"mr25h10"},
> -	{"gd25q32"},	{"gd25q64"},
> -	{"160s33b"},	{"320s33b"},	{"640s33b"},
> -	{"mx25l2005a"},	{"mx25l4005a"},	{"mx25l8005"},	{"mx25l1606e"},
> -	{"mx25l3205d"},	{"mx25l3255e"},	{"mx25l6405d"},	{"mx25l12805d"},
> -	{"mx25l12855e"},{"mx25l25635e"},{"mx25l25655e"},{"mx66l51235l"},
> -	{"mx66l1g55g"},
> -	{"n25q064"},	{"n25q128a11"},	{"n25q128a13"},	{"n25q256a"},
> -	{"n25q512a"},	{"n25q512ax3"},	{"n25q00"},
> -	{"pm25lv512"},	{"pm25lv010"},	{"pm25lq032"},
> -	{"s25sl032p"},	{"s25sl064p"},	{"s25fl256s0"},	{"s25fl256s1"},
> -	{"s25fl512s"},	{"s70fl01gs"},	{"s25sl12800"},	{"s25sl12801"},
> -	{"s25fl129p0"},	{"s25fl129p1"},	{"s25sl004a"},	{"s25sl008a"},
> -	{"s25sl016a"},	{"s25sl032a"},	{"s25sl064a"},	{"s25fl008k"},
> -	{"s25fl016k"},	{"s25fl064k"},	{"s25fl132k"},
> -	{"sst25vf040b"},{"sst25vf080b"},{"sst25vf016b"},{"sst25vf032b"},
> -	{"sst25vf064c"},{"sst25wf512"},	{"sst25wf010"},	{"sst25wf020"},
> -	{"sst25wf040"},
> -	{"m25p05"},	{"m25p10"},	{"m25p20"},	{"m25p40"},
> -	{"m25p80"},	{"m25p16"},	{"m25p32"},	{"m25p64"},
> -	{"m25p128"},	{"n25q032"},
> +	/*
> +	 * Entries not used in DTs that should be safe to drop after replacing
> +	 * them with "nor-jedec" in platform data.
> +	 */
> +	{"s25sl064a"},	{"w25x16"},	{"m25p10"},	{"m25px64"},
> +
> +	/*
> +	 * Entries that were used in DTs without "nor-jedec" fallback and should
> +	 * be kept for backward compatibility.
> +	 */
> +	{"at25df321a"},	{"at25df641"},	{"at26df081a"},
> +	{"mr25h256"},
> +	{"mx25l4005a"},	{"mx25l1606e"},	{"mx25l6405d"},	{"mx25l12805d"},
> +	{"mx25l25635e"},{"mx66l51235l"},
> +	{"n25q064"},	{"n25q128a11"},	{"n25q128a13"},	{"n25q512a"},
> +	{"s25fl256s1"},	{"s25fl512s"},	{"s25sl12801"},	{"s25fl008k"},
> +	{"s25fl064k"},
> +	{"sst25vf040b"},{"sst25vf016b"},{"sst25vf032b"},{"sst25wf040"},
> +	{"m25p40"},	{"m25p80"},	{"m25p16"},	{"m25p32"},
> +	{"m25p64"},	{"m25p128"},
> +	{"w25x80"},	{"w25x32"},	{"w25q32"},	{"w25q32dw"},
> +	{"w25q80bl"},	{"w25q128"},	{"w25q256"},
> +
> +	/* Flashes that can't be detected using JEDEC */
>  	{"m25p05-nonjedec"},	{"m25p10-nonjedec"},	{"m25p20-nonjedec"},
>  	{"m25p40-nonjedec"},	{"m25p80-nonjedec"},	{"m25p16-nonjedec"},
>  	{"m25p32-nonjedec"},	{"m25p64-nonjedec"},	{"m25p128-nonjedec"},
> -	{"m45pe10"},	{"m45pe80"},	{"m45pe16"},
> -	{"m25pe20"},	{"m25pe80"},	{"m25pe16"},
> -	{"m25px16"},	{"m25px32"},	{"m25px32-s0"},	{"m25px32-s1"},
> -	{"m25px64"},	{"m25px80"},
> -	{"w25x10"},	{"w25x20"},	{"w25x40"},	{"w25x80"},
> -	{"w25x16"},	{"w25x32"},	{"w25q32"},	{"w25q32dw"},
> -	{"w25x64"},	{"w25q64"},	{"w25q80"},	{"w25q80bl"},
> -	{"w25q128"},	{"w25q256"},	{"cat25c11"},
> -	{"cat25c03"},	{"cat25c09"},	{"cat25c17"},	{"cat25128"},
>  
>  	/*
>  	 * Generic support for SPI NOR that can be identified by the JEDEC READ
> -- 
> 1.8.4.5
> 
