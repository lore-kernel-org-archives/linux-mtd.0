Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QtLCM-0006K7-VS
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2011 15:04:59 +0000
Received: by vxj2 with SMTP id 2so5687189vxj.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Aug 2011 08:04:56 -0700 (PDT)
Subject: Re: [PATCH] mtd-utils: fix corrupt cleanmarker with flash_erase -j
	command
From: Artem Bityutskiy <dedekind1@gmail.com>
To: b35362@freescale.com
Date: Tue, 16 Aug 2011 18:06:35 +0300
In-Reply-To: <1312350638-25566-1-git-send-email-b35362@freescale.com>
References: <1312350638-25566-1-git-send-email-b35362@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313507201.2679.2.camel@sauron>
Mime-Version: 1.0
Cc: linuxppc-dev@linux.freescale.net, Li Yang <leoli@freescale.com>,
	dwmw2@infradead.org, linux-mtd@lists.infradead.org, linuxppc-dev@ozlabs.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-08-03 at 13:50 +0800, b35362@freescale.com wrote:
> From: Liu Shuo <b35362@freescale.com>
> 
> Flash_erase -j should fill discrete freeoob areas with required bytes
> of JFFS2 cleanmarker in jffs2_check_nand_cleanmarker(). Not just fill
> the first freeoob area.
> 
> Signed-off-by: Liu Shuo <b35362@freescale.com>
> Signed-off-by: Li Yang <leoli@freescale.com>

...

>  	/*
>  	 * Process user arguments
> @@ -197,15 +198,40 @@ int main(int argc, char *argv[])
>  			if (ioctl(fd, MEMGETOOBSEL, &oobinfo) != 0)
>  				return sys_errmsg("%s: unable to get NAND oobinfo", mtd_device);
>  
> +			cleanmarker.totlen = cpu_to_je32(8);
>  			/* Check for autoplacement */
>  			if (oobinfo.useecc == MTD_NANDECC_AUTOPLACE) {
> +				struct nand_ecclayout_user ecclayout;
>  				/* Get the position of the free bytes */
> -				if (!oobinfo.oobfree[0][1])
> +				if (ioctl(fd, ECCGETLAYOUT, &ecclayout) != 0)
> +					return sys_errmsg("%s: unable to get NAND ecclayout", mtd_device);
> +

Hmm, shouldn't we instead make MTD_OOB_AUTO be available for userspace
via an ioctl instead and make flash_eraseall use it instead?

-- 
Best Regards,
Artem Bityutskiy
