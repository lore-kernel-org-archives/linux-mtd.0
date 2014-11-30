Received: from mail-la0-x22e.google.com ([2a00:1450:4010:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv5uL-0002x4-Nf
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 14:55:30 +0000
Received: by mail-la0-f46.google.com with SMTP id q1so2681639lam.33
 for <linux-mtd@lists.infradead.org>; Sun, 30 Nov 2014 06:55:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1417349988-9238-3-git-send-email-richard@nod.at>
References: <1417349988-9238-1-git-send-email-richard@nod.at>
 <1417349988-9238-3-git-send-email-richard@nod.at>
Date: Sun, 30 Nov 2014 12:55:06 -0200
Message-ID: <CAOMZO5BVewD==3dDLBD_AwrffMBih5EG3YYfYBAfH=+wDpV=3Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] UBI: Add accessor functions for WL data structures
From: Fabio Estevam <festevam@gmail.com>
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 30, 2014 at 10:19 AM, Richard Weinberger <richard@nod.at> wrote:

> +/*
> + * ubi_for_each_free_peb - walk the UBI free RB tree.
> + * @ubi: UBI device description object
> + * @e: a pointer to a ubi_wl_entry to use as cursor
> + * @pos: a pointer to RB-tree entry type to use as a loop counter

tmp_rb instead?

> + */
> +#define ubi_for_each_free_peb(ubi, e, tmp_rb)  \
> +       ubi_rb_for_each_entry((tmp_rb), (e), &(ubi)->free, u.rb)
> +
> +/*
> + * ubi_for_each_used_peb - walk the UBI used RB tree.
> + * @ubi: UBI device description object
> + * @e: a pointer to a ubi_wl_entry to use as cursor
> + * @pos: a pointer to RB-tree entry type to use as a loop counter
> + */

tmp_rb instead?

> +#define ubi_for_each_used_peb(ubi, e, tmp_rb)  \
