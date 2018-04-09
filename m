Subject: Re: [PATCH 1/2] libmtd: Add support to access OOB available size
To: Xiaolei Li <xiaolei.li@mediatek.com>, boris.brezillon@bootlin.com
Cc: linux-mtd@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com
References: <1523243410-65424-1-git-send-email-xiaolei.li@mediatek.com>
 <1523243410-65424-2-git-send-email-xiaolei.li@mediatek.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <99d17022-0b07-a999-b6ac-05b51df7d18d@sigma-star.at>
Date: Mon, 9 Apr 2018 08:58:16 +0200
MIME-Version: 1.0
In-Reply-To: <1523243410-65424-2-git-send-email-xiaolei.li@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 04/09/2018 05:10 AM, Xiaolei Li wrote:
> @@ -769,6 +774,8 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num, s=
truct mtd_dev_info *mtd)
>  		return -1;
>  	if (dev_read_pos_int(lib->mtd_oob_size, mtd_num, &mtd->oob_size))
>  		return -1;
> +	if (dev_read_pos_int(lib->mtd_oobavail, mtd_num, &mtd->oobavail))
> +		return -1;
>  	if (dev_read_pos_int(lib->mtd_region_cnt, mtd_num, &mtd->region_cnt))
>  		return -1;
>  	if (dev_read_hex_int(lib->mtd_flags, mtd_num, &ret))

I'm not sure if it is a good idea to do a hard fail here, since this
depends on a recent change to the kernel.

It might be preferable to catch and handle ENOENT, otherwise the next
release of mtd-utils will only work on the next kernel release onward.

Maybe mtd_oobavail could to be set to some reasonable default that
retains the current behaviour on "older" kernels?


Thanks,

David
