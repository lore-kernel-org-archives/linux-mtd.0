Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6iQg-0001Md-Ad
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 11:58:46 +0000
Received: by wyb28 with SMTP id 28so5547735wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Apr 2011 04:58:44 -0700 (PDT)
Subject: Re: [PATCH] mtd: onenand: add ecclayout and subpage_sft for
	none-flex 4kb page onenand
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roman Tereshonkov <roman.tereshonkov@nokia.com>
In-Reply-To: <1301915224-7571-1-git-send-email-roman.tereshonkov@nokia.com>
References: <1301915224-7571-1-git-send-email-roman.tereshonkov@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Apr 2011 14:56:12 +0300
Message-ID: <1301918172.2760.77.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kyungmin.park@samsung.com, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

just few minor nit-picks.

Please, try to make the commit subject shorted and less detailed, but
more readable.

On Mon, 2011-04-04 at 14:07 +0300, Roman Tereshonkov wrote: 
>  /**
> + *  onenand_oob_128 - oob info for OneNAND with 4KB page
> + *  and using reserved bytes as free bytes instead of
> + *  free bytes that are managed by ECC.
> + *  For now, we expose only 64 out of 72 ecc bytes
> + */

Do not use /** since this is not a proper kerneldoc comment. Use /*
instead.

Also, make the lines longer - we have 80 characters per line for
comments.

Also, why you use expression "for now" - does it mean you are going to
change this soon? If not, please, amend the comment.

> +static struct nand_ecclayout onenand_oob_128_none_flex = {

none_flex sounds a bit strange. I think it is better to:

1. Re-name onenand_oob_128 into flexonenand_oob_128 (in a separate
patch)
2. Introduce onenand_oob_128

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
