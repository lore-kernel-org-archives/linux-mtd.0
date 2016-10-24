Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bymAt-0002nC-R1
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 20:48:52 +0000
Received: by mail-wm0-x241.google.com with SMTP id d128so11552374wmf.0
 for <linux-mtd@lists.infradead.org>; Mon, 24 Oct 2016 13:48:30 -0700 (PDT)
Subject: Re: [PATCH] mtd: ichxrom: maybe-uninitialized with gcc-4.9
To: Arnd Bergmann <arnd@arndb.de>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
References: <20161024152853.2673518-1-arnd@arndb.de>
Cc: Julia Lawall <julia.lawall@lip6.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <470c5483-949c-6e2a-cd52-73d99748b312@gmail.com>
Date: Mon, 24 Oct 2016 22:47:59 +0200
MIME-Version: 1.0
In-Reply-To: <20161024152853.2673518-1-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/24/2016 05:28 PM, Arnd Bergmann wrote:
> pci_read_config_word() might fail and not initialize its output,
> as pointed out by older versions of gcc when using the -Wmaybe-unintialized
> flag:
> 
> drivers/mtd/maps/ichxrom.c: In function ‘ichxrom_cleanup’:
> drivers/mtd/maps/ichxrom.c:63:2: error: ‘word’ is used uninitialized in this function [-Werror=uninitialized]
> 
> This is apparently a correct warning, though it does not show up
> with newer compilers. Changing the code to not attempt to write
> back uninitialized data into PCI config space is a correct
> fix for the problem and avoids the warning.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Marek Vasut <marex@denx.de>

> ---
>  drivers/mtd/maps/ichxrom.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/maps/ichxrom.c b/drivers/mtd/maps/ichxrom.c
> index e17d02ae03f0..976d42f63aef 100644
> --- a/drivers/mtd/maps/ichxrom.c
> +++ b/drivers/mtd/maps/ichxrom.c
> @@ -57,10 +57,12 @@ static void ichxrom_cleanup(struct ichxrom_window *window)
>  {
>  	struct ichxrom_map_info *map, *scratch;
>  	u16 word;
> +	int ret;
>  
>  	/* Disable writes through the rom window */
> -	pci_read_config_word(window->pdev, BIOS_CNTL, &word);
> -	pci_write_config_word(window->pdev, BIOS_CNTL, word & ~1);
> +	ret = pci_read_config_word(window->pdev, BIOS_CNTL, &word);
> +	if (!ret)
> +		pci_write_config_word(window->pdev, BIOS_CNTL, word & ~1);
>  	pci_dev_put(window->pdev);
>  
>  	/* Free all of the mtd devices */
> 


-- 
Best regards,
Marek Vasut
