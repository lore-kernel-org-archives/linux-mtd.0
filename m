Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTuJL-0007QT-EG
	for linux-mtd@lists.infradead.org; Sun, 10 Jan 2010 09:42:19 +0000
Received: by fxm22 with SMTP id 22so23102645fxm.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 10 Jan 2010 01:42:14 -0800 (PST)
Subject: Re: [PATCH] UBI fails to initialise in kernel update marker
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Peter Horton <zero@colonel-panic.org>
In-Reply-To: <20100105111436.GA2046@turtle.localnet>
References: <20100105111436.GA2046@turtle.localnet>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 10 Jan 2010 11:42:11 +0200
Message-Id: <1263116531.7315.143.camel@localhost.localdomain>
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

On Tue, 2010-01-05 at 11:14 +0000, Peter Horton wrote:
> The in kernel copy of a volume's update marker is not initialised from the
> volume table.
> 
> Signed-off-by: Peter Horton <zero@colonel-panic.org>
> 
> --- linux-2.6.32.orig/drivers/mtd/ubi/vtbl.c	2010-01-05 10:56:13.000000000 +0000
> +++ linux-2.6.32/drivers/mtd/ubi/vtbl.c	2010-01-05 10:57:03.000000000 +0000
> @@ -566,6 +566,7 @@
>  		vol->reserved_pebs = be32_to_cpu(vtbl[i].reserved_pebs);
>  		vol->alignment = be32_to_cpu(vtbl[i].alignment);
>  		vol->data_pad = be32_to_cpu(vtbl[i].data_pad);
> +		vol->upd_marker = vtbl[i].upd_marker;
>  		vol->vol_type = vtbl[i].vol_type == UBI_VID_DYNAMIC ?
>  					UBI_DYNAMIC_VOLUME : UBI_STATIC_VOLUME;
>  		vol->name_len = be16_to_cpu(vtbl[i].name_len);

Am I right that this means that whole "forbid using volume with
unfinished update" functionality has not worked properly? Or I miss
something? Looks like I should send this patch to -stable as well.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
