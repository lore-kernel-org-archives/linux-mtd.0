Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YV6tB-0005aY-UU
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2015 23:15:10 +0000
Received: by padfa1 with SMTP id fa1so76138063pad.9
 for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2015 16:14:48 -0700 (PDT)
Date: Mon, 9 Mar 2015 16:14:38 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Frans Klaver <fransklaver@gmail.com>
Subject: Re: [PATCH 01/60] mtd: core: tone down suggestion that dev.parent
 should be set
Message-ID: <20150309230250.GA13266@ld-irv-0074>
References: <1425418844-25177-1-git-send-email-fransklaver@gmail.com>
 <1425418844-25177-2-git-send-email-fransklaver@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425418844-25177-2-git-send-email-fransklaver@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 03, 2015 at 10:39:45PM +0100, Frans Klaver wrote:
> add_mtd_device() has a comment suggesting that the caller should have
> set dev.parent. This is required to have the device show up in sysfs,

What do you mean "have the device show up in sysfs"? AFAICT, this only
has bearing on whether the *parent* device shows up as a sysfs symlink
within the MTD device directory. i.e.:

   /sys/class/mtd/mtd*/device

For instance, this sort of symlink:

   /sys/class/mtd/mtd0/device -> ../../../f03e2800.nand

It might be good to clarify this in the commit message, since you make
the problem sound worse than (I think) it is.

Brian

> but not for proper operation of the mtd device itself. Currently we have
> five drivers registering mtd devices during module initialization, so
> they don't actually provide a parent device to link to. That means we
> cannot WARN_ON() here, as it would trigger false positives.
> 
> Make the comment a bit less firm in its assertion that dev.parent should
> be set.
> 
> Signed-off-by: Frans Klaver <fransklaver@gmail.com>
> ---
>  drivers/mtd/mtdcore.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 11883bd..2093676 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -422,7 +422,7 @@ int add_mtd_device(struct mtd_info *mtd)
>  	}
>  
>  	/* Caller should have set dev.parent to match the
> -	 * physical device.
> +	 * physical device, if appropriate.
>  	 */
>  	mtd->dev.type = &mtd_devtype;
>  	mtd->dev.class = &mtd_class;
> -- 
> 2.2.2
> 
