Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WZeLL-00026v-Ug
 for linux-mtd@lists.infradead.org; Mon, 14 Apr 2014 10:42:29 +0000
Message-ID: <1397472124.3287.6.camel@karhu>
Subject: Re: [PATCH] ubiblock: Support UBI volume name or volume ID
 parameter passing
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Mon, 14 Apr 2014 13:42:04 +0300
In-Reply-To: <1397141020-6363-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1397141020-6363-1-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-04-10 at 11:43 -0300, Ezequiel Garcia wrote:
> +static int ubi_open_volume_by_id(libubi_t desc, const char *node, int vol_id, int mode)
>  {
> +       char file[256];
> +       struct ubi_dev_info dev_info;
>         int err, fd;
> -       libubi_t libubi;
>  
> -       err = parse_opt(argc, argv);
> +       err = ubi_get_dev_info(desc, node, &dev_info);
>         if (err)
> +               return errmsg("cannot get information about UBI device \"%s\"", node);
> +
> +       sprintf(file, "/dev/ubi%d_%d", dev_info.dev_num, vol_id);

Device node names may ve anything. Please, do not rely on the "/dev/ubi%
d_%d" naming scheme in the tool.

I think device node can be found out by scanning "/dev" and looking at
the device node major/minor numbers. This is more work of course.

However, libubi does exactly the same assumption about UBI volume names
as you do, so if you move this function to libubi, I think it will be
good enough. At least if someone wants to change this in the future,
then it will only require changing the library, but not its users.

> +       fd = open(file, mode);
> +       if (fd == -1)
> +               errmsg("Failed to open '%s' volume device", file);
> +       return fd;
> +}
> +

-- 
Best Regards,
Artem Bityutskiy
