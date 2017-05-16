Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAfAC-0003xr-Lm
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 16:17:34 +0000
Date: Tue, 16 May 2017 18:17:10 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Mario J. Rugiero" <mrugiero@gmail.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr
Subject: Re: [PATCH] mtd: create per-device and module-scope debugfs entries
Message-ID: <20170516181710.6a88ede7@bbrezillon>
In-Reply-To: <20170516155616.26558-1-mrugiero@gmail.com>
References: <20170516155616.26558-1-mrugiero@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 16 May 2017 12:56:16 -0300
"Mario J. Rugiero" <mrugiero@gmail.com> wrote:

Please add a commit message here.

> Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
> ---

[...]

> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index f8a2ef239c60..905c119a2efe 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -206,6 +206,18 @@ struct mtd_pairing_scheme {
>  
>  struct module;	/* only needed for owner field in mtd_info */
>  
> +#define MTD_DFS_DIR_NAME "mtd%2d"
> +#define MTD_DFS_DIR_LEN 3 + 2 + 1

I think you can drop these defs. They're never used since you use
mtd->name directly.
