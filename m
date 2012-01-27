Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rqqam-0008OO-SU
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2012 18:32:09 +0000
Received: by wico1 with SMTP id o1so1943564wic.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2012 10:32:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1327689046-1450-2-git-send-email-computersforpeace@gmail.com>
References: <1327689046-1450-1-git-send-email-computersforpeace@gmail.com>
 <1327689046-1450-2-git-send-email-computersforpeace@gmail.com>
Date: Fri, 27 Jan 2012 10:32:07 -0800
Message-ID: <CAN8TOE-MD4Zgm+UdZ3qa5d-vTP+dNaFgY=2FsN+3Ym77tuKEPg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtdinfo: fix `--all' for non-consecutive device
 numbers
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Brian Foster <brian.foster@maxim-ic.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hmm, didn't CC Brian Foster. Must have mixed up my headers...

On Fri, Jan 27, 2012 at 10:30 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> When we have assigned non-consecutive device numbers to our MTD devices,
> then we run `mtdinfo --all', we get errors once mtdinfo tries to process
> the devices in the "hole". For instance, suppose that at boot time, we ha=
ve
> one MTD (/dev/mtd0) then perform a sequence like the following:
>
> =A0# modprobe mtdram
> =A0# modprobe nandsim
> =A0# rmmod mtdram
>
> Then at this point, we have should have devices 0 and 2 without 1. Then:
>
> =A0# mtdinfo --all
> =A0...
> =A0mtdinfo: error!: mtd1 does not correspond to any existing MTD device
>
> We add a check to first see if device is present, then continue to the ne=
xt
> ID if it doesn't exist.
>
> Reported-by: Brian Foster <brian.foster@maxim-ic.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> =A0ubi-utils/mtdinfo.c | =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
> index ead4bce..d25595a 100644
> --- a/ubi-utils/mtdinfo.c
> +++ b/ubi-utils/mtdinfo.c
> @@ -378,6 +378,8 @@ static int print_general_info(libmtd_t libmtd, const =
struct mtd_info *mtd_info,
>
> =A0 =A0 =A0 =A0for (i =3D mtd_info->lowest_mtd_num;
> =A0 =A0 =A0 =A0 =A0 =A0 i <=3D mtd_info->highest_mtd_num; i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!mtd_dev_present(libmtd, i))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err =3D print_dev_info(libmtd, mtd_info, i=
);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (err)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return err;
> --
> 1.7.5.4
>
