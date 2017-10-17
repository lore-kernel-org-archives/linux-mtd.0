Subject: Re: [PATCH] mdt: slram: use memremap() instead of ioremap()
To: Roy Franz <rfranz@cavium.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr
Cc: roy.franz@cavium.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ddaney@cavium.com
References: <20171017205642.1791-1-roy.franz@cavium.com>
From: David Daney <ddaney@caviumnetworks.com>
Message-ID: <befe7e20-da85-1ea5-d3ad-4698af0b7d05@caviumnetworks.com>
Date: Tue, 17 Oct 2017 15:02:18 -0700
MIME-Version: 1.0
In-Reply-To: <20171017205642.1791-1-roy.franz@cavium.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/17/2017 01:56 PM, Roy Franz wrote:
> Convert slram to use memremap() to map the memory it uses to back an MTD
> device, as this is the proper interface for mapping memory. This change
> enables normal memory to be used to back an MTD device on arm64, as arm64
> prevents ioremap() being used on normal memory.
> 
> Signed-off-by: Roy Franz <roy.franz@cavium.com>

Thanks Roy.  I just tested on MIPS64 with no regressions, so:

Tested-by: David Daney <david.daney@cavium.com>


> ---
> Tested on arm64 simulation, using simulator to preload filesystem image into RAM,
> and also tested on x86_64 using video card memory.  This is useful for speeding
> up booting on (very slow) emulation environments by avoiding any processing of
> an initramfs.
> 
>   drivers/mtd/devices/slram.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
> index 8087c36dc693..0ec85f316d24 100644
> --- a/drivers/mtd/devices/slram.c
> +++ b/drivers/mtd/devices/slram.c
> @@ -163,8 +163,9 @@ static int register_device(char *name, unsigned long start, unsigned long length
>   	}
>   
>   	if (!(((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start =
> -				ioremap(start, length))) {
> -		E("slram: ioremap failed\n");
> +		memremap(start, length,
> +			 MEMREMAP_WB | MEMREMAP_WT | MEMREMAP_WC))) {
> +		E("slram: memremap failed\n");
>   		return -EIO;
>   	}
>   	((slram_priv_t *)(*curmtd)->mtdinfo->priv)->end =
> @@ -186,7 +187,7 @@ static int register_device(char *name, unsigned long start, unsigned long length
>   
>   	if (mtd_device_register((*curmtd)->mtdinfo, NULL, 0))	{
>   		E("slram: Failed to register new device\n");
> -		iounmap(((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start);
> +		memunmap(((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start);
>   		kfree((*curmtd)->mtdinfo->priv);
>   		kfree((*curmtd)->mtdinfo);
>   		return(-EAGAIN);
> @@ -206,7 +207,7 @@ static void unregister_devices(void)
>   	while (slram_mtdlist) {
>   		nextitem = slram_mtdlist->next;
>   		mtd_device_unregister(slram_mtdlist->mtdinfo);
> -		iounmap(((slram_priv_t *)slram_mtdlist->mtdinfo->priv)->start);
> +		memunmap(((slram_priv_t *)slram_mtdlist->mtdinfo->priv)->start);
>   		kfree(slram_mtdlist->mtdinfo->priv);
>   		kfree(slram_mtdlist->mtdinfo);
>   		kfree(slram_mtdlist);
> 
