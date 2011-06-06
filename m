Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTUpQ-0005aM-5U
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 08:06:29 +0000
Received: by bwz1 with SMTP id 1so4432395bwz.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 01:06:26 -0700 (PDT)
Subject: Re: [PATCH 050/104] physmap_of: separate parse_obsolete_partitions
	to separate parser
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307026293-8535-16-git-send-email-dbaryshkov@gmail.com>
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
	<1307026293-8535-16-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 11:02:10 +0300
Message-ID: <1307347330.3135.29.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-02 at 18:51 +0400, Dmitry Eremin-Solenikov wrote:
> Separate parse_obsolete_partitions() to external ofoldpart partitions parser.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
>  drivers/mtd/Kconfig           |   10 +++++
>  drivers/mtd/Makefile          |    1 +
>  drivers/mtd/maps/physmap_of.c |   53 +------------------------
>  drivers/mtd/ofoldpart.c       |   89 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 101 insertions(+), 52 deletions(-)
>  create mode 100644 drivers/mtd/ofoldpart.c
> 
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index 4be8373..2aa8afb 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -144,6 +144,16 @@ config MTD_OF_PARTS
>  	  the partition map from the children of the flash node,
>  	  as described in Documentation/powerpc/booting-without-of.txt.
>  
> +config MTD_OF_OLD_PARTS
> +	bool "Obsolete OF tree partition info"
> +	depends on OF
> +	help
> +	  This provides a partition parsing function which derives
> +	  the partition map from the the flash node, being an obsolete
> +	  way to describe physmap_of partitioning info.
> +
> +	  If you aren't sure you need this, you can say N.

I think this tiny piece of code does not deserve to be a separate
module...

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
