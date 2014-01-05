Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VzreJ-0007zp-Pq
 for linux-mtd@lists.infradead.org; Sun, 05 Jan 2014 17:38:08 +0000
Date: Sun, 5 Jan 2014 14:37:57 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [RFC/PATCH] mtd: Hide CONFIG_MTD_BLKDEVS from the menu
Message-ID: <20140105173756.GA13922@localhost>
References: <1386943124-8005-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140105084547.GA2929@brian-ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140105084547.GA2929@brian-ubuntu>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 05, 2014 at 12:46:10AM -0800, Brian Norris wrote:
> 
> Hmm, I'm seeing some issues with this patch. I think it's problematic
> that you are changing MTD_BLKDEVS from tristate to bool. We can't have
[..]
> 
> I believe the correct solution would be the following additional diff:
> 
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index cdaa4e512c97..5ebcda39f554 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -161,7 +161,7 @@ comment "User Modules And Translation Layers"
>  # MTD block device support is select'ed if needed
>  #
>  config MTD_BLKDEVS
> -	bool
> +	tristate
>  
>  config MTD_BLOCK
>  	tristate "Caching block device access to MTD devices"
> --
> 
> I'll squash this into your patch if I don't hear any objections.
> 

The solution looks fine. Thanks for taking care of it.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
