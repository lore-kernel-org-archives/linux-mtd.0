Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZgsJk-0005gs-W7
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 10:39:30 +0000
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: [PATCH] UBI: return ENOSPC if no enough space available
From: David Gstir <david@sigma-star.at>
In-Reply-To: <1443463039-8346-1-git-send-email-shengyong1@huawei.com>
Date: Tue, 29 Sep 2015 12:39:04 +0200
Cc: richard@nod.at,
 linux-mtd@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F7BE60EE-1993-4F26-9555-427DBE983E60@sigma-star.at>
References: <1443463039-8346-1-git-send-email-shengyong1@huawei.com>
To: Sheng Yong <shengyong1@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On 28.09.2015, at 19:57, Sheng Yong <shengyong1@huawei.com> wrote:
>=20
> UBI: attaching mtd1 to ubi0
> UBI: scanning is finished
> UBI error: init_volumes: not enough PEBs, required 706, available 686
> UBI error: ubi_wl_init: no enough physical eraseblocks (-20, need 1)
> UBI error: ubi_attach_mtd_dev: failed to attach mtd1, error -12 <=3D =
NOT ENOMEM
> UBI error: ubi_init: cannot attach mtd1
>=20
> If available PEBs are not enough when initializing volumes, return =
-ENOSPC
> directly. If available PEBs are not enough when initializing WL, =
return
> -ENOSPC instead of -ENOMEM.
>=20
> Signed-off-by: Sheng Yong <shengyong1@huawei.com>
> ---
> drivers/mtd/ubi/vtbl.c | 1 +
> drivers/mtd/ubi/wl.c   | 1 +
> 2 files changed, 2 insertions(+)
>=20
> diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
> index 80bdd5b..d85c197 100644
> --- a/drivers/mtd/ubi/vtbl.c
> +++ b/drivers/mtd/ubi/vtbl.c
> @@ -649,6 +649,7 @@ static int init_volumes(struct ubi_device *ubi,
> 		if (ubi->corr_peb_count)
> 			ubi_err(ubi, "%d PEBs are corrupted and not =
used",
> 				ubi->corr_peb_count);
> +		return -ENOSPC;
> 	}
> 	ubi->rsvd_pebs +=3D reserved_pebs;
> 	ubi->avail_pebs -=3D reserved_pebs;
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 275d9fb..eb4489f9 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -1601,6 +1601,7 @@ int ubi_wl_init(struct ubi_device *ubi, struct =
ubi_attach_info *ai)
> 		if (ubi->corr_peb_count)
> 			ubi_err(ubi, "%d PEBs are corrupted and not =
used",
> 				ubi->corr_peb_count);
> +		err =3D -ENOSPC;
> 		goto out_free;
> 	}
> 	ubi->avail_pebs -=3D reserved_pebs;
> --=20
> 1.9.1

Looks fine to me.

Reviewed-by: David Gstir <david@sigma-star.at>
