Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFPqD-0000qQ-2f
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2014 15:10:41 +0000
Message-ID: <1392649814.21319.17.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v6 1/3] ubi: Introduce block devices for UBI volumes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Mon, 17 Feb 2014 17:10:14 +0200
In-Reply-To: <1392581041-8099-2-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1392581041-8099-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1392581041-8099-2-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2014-02-16 at 17:03 -0300, Ezequiel Garcia wrote:
> +static void __init ubiblock_add_from_param(void)
> +{
> +       int i, ret;
> +       struct ubiblock_param *p;
> +       struct ubi_volume_desc *desc;
> +       struct ubi_volume_info vi;
> +
> +       for (i = 0; i < ubiblock_devs; i++) {
> +               p = &ubiblock_param[i];
> +
> +               desc = open_volume_desc(p->name, p->ubi_num, p->vol_id);
> +               if (IS_ERR(desc)) {
> +                       ubi_warn("block: can't open volume, err=%ld\n",
> +                                PTR_ERR(desc));
> +                       continue;
> +               }

Should we be consistent here with how UBI behaves when attaches MTD
devices? UBI will error out if it cannot attach any. And for me it makes
sense. Indeed, if, the user, say asked to attach 2 UBI volumes via the
module parameter, surely the user expects to see 2 block device when
module loading finishes without errors?

What I read from this code means that even if loading finishes without
errors, I may see zero or 1 block devices, depending on how many of them
failed.

-- 
Best Regards,
Artem Bityutskiy
