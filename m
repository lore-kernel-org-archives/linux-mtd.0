Received: from nbd.name ([46.4.11.11])
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pamj0-0006N7-98
	for linux-mtd@lists.infradead.org; Thu, 06 Jan 2011 10:05:42 +0000
Message-ID: <4D25941E.80702@openwrt.org>
Date: Thu, 06 Jan 2011 11:06:22 +0100
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 07/10] MIPS: lantiq: add NOR flash CFI address swizzle
References: <1294257379-417-1-git-send-email-blogic@openwrt.org>
	<1294257379-417-8-git-send-email-blogic@openwrt.org>
In-Reply-To: <1294257379-417-8-git-send-email-blogic@openwrt.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, Ralph Hempel <ralph.hempel@lantiq.com>,
	linux-mtd@lists.infradead.org, Ralf Baechle <ralf@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/01/11 20:56, John Crispin wrote:
>  
>  	adr += chip->start;
> +#ifdef CONFIG_MTD_CFI_CMD_SWIZZLE
> +	adr ^= 2;
> +#endif
>  
>  	mutex_lock(&chip->mutex);
>  	ret = get_chip(map, chip, adr, FL_WRITING);
>   

Hi,

What this patch essentially does is to make sure to pass a addr with the
^=2 hack already applied, so that the complex map ends up with an un
swizzled addr as it applies the hack internally again.

I think it would be cleanest to extend the read/write callbacks of
struct map_info; with a flag indicating whether we are doing a CMD or
DATA action. as the 2 following macros are used anyway, it should not be
too hard to implement this.

#define map_read(map, ofs) (map)->read(map, ofs)
#define map_write(map, datum, ofs) (map)->write(map, datum, ofs)

I am not sure however if this is the correct fix.

Thanks,
John
