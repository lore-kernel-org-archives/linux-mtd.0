Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CAIiy-0007IZ-OR
	for linux-mtd@lists.infradead.org; Wed, 22 Sep 2004 21:48:46 -0400
To: Ben Dooks <ben-mtd@fluff.org>
References: <20040920234450.GA17169@home.fluff.org>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 22 Sep 2004 19:48:40 -0600
In-Reply-To: <20040920234450.GA17169@home.fluff.org>
Message-ID: <m3brfxycuf.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
Cc: ben@fluff.org, linux-mtd@lists.infradead.org
Subject: Re: Fix to jedec_probe unlock addresses
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ben Dooks <ben-mtd@fluff.org> writes:

> Fix unlock address calculation for non-x8 chips for the
> cfi cmdset code, which assumes always X8
> 
> Patch against 2.6.9-rc2 with 19th September CVS
> 
> Signed-off-by: Ben Dooks <ben-mtd@fluff.org>
> 
> --- linux-2.6.9-rc2-bk6-mtd20040919/drivers/mtd/chips/jedec_probe.c 2004-09-20
> 13:02:46.000000000 +0100
> 
> +++ linux-2.6.9-rc2-bk6-mtd20040919-work/drivers/mtd/chips/jedec_probe.c
> 2004-09-20 23:21:40.000000000 +0100
> 
> @@ -2046,7 +2046,15 @@
>  	printk(KERN_INFO "%s: Found %d x%d devices at 0x%x in %d-bit bank\n",
>  	       map->name, cfi_interleave(cfi), cfi->device_type*8, base, 
>  	       map->bankwidth*8);
> -	
> +
> +	/* fixup unlock addresses for the cmdset */
> +
> +	cfi->addr_unlock1 *= cfi_interleave(cfi) * cfi->device_type;
> +	cfi->addr_unlock2 *= cfi_interleave(cfi) * cfi->device_type;
> +
> +	printk(KERN_DEBUG "unlocks at %08x,%08x\n", 
> +	       cfi->addr_unlock1, cfi->addr_unlock2);
> +
>  	return 1;
>  }

Hmm.  I think that points out a real issue but I think the bug actually
lies in cfi_cmdset_0002.  

That fix makes below comment from cfi_cmdset_0002 clearly wrong.
	/*
	 * The CFI_DEVICETYPE_X8 argument is needed even when
	 * cfi->device_type != CFI_DEVICETYPE_X8.  The addresses for
	 * command sequences don't scale even when the device is
	 * wider.  This is the case for many of the cfi_send_gen_cmd()
	 * below.  I'm not sure, however, why some use
	 * cfi->device_type.
	 */

So I think it is more likely we need to change this hunk of code below.

		/*
		 * These might already be setup (more correctly) by
		 * jedec_probe.c - still need it for cfi_probe.c path.
		 */
		if ( ! (cfi->addr_unlock1 && cfi->addr_unlock2) ) {
			switch (cfi->device_type) {
			case CFI_DEVICETYPE_X8:
				cfi->addr_unlock1 = 0x555; 
				cfi->addr_unlock2 = 0x2aa; 
				break;
			case CFI_DEVICETYPE_X16:
				cfi->addr_unlock1 = 0xaaa;
				if (map_bankwidth(map) == cfi_interleave(cfi)) {
					/* X16 chip(s) in X8 mode */
					cfi->addr_unlock2 = 0x555;
				} else {
					cfi->addr_unlock2 = 0x554;
				}
				break;
			case CFI_DEVICETYPE_X32:
				cfi->addr_unlock1 = 0x1554;
				if (map_bankwidth(map) == cfi_interleave(cfi)*2) {
					/* X32 chip(s) in X16 mode */
					cfi->addr_unlock1 = 0xaaa;
				} else {
					cfi->addr_unlock2 = 0xaa8; 
				}
				break;
			default:
				printk(KERN_WARNING
				       "MTD %s(): Unsupported device type %d\n",
				       __func__, cfi->device_type);
				kfree(mtd);
				kfree(extp);
				return NULL;
			}
		}

Does anyone have cfi cmdset 0002 devices in an interleaved configuration
who would care to comment?


Eric
