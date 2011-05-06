Received: from smtp.nokia.com ([147.243.1.47] helo=mgw-sa01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QIGTP-0005St-OF
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 08:33:21 +0000
From: <john.maxin@nokia.com>
To: <dedekind1@gmail.com>
Subject: RE: [PATCH] add a check to prevent the incrementing of possible
	NULL value for "region" in onenand_base.c
Date: Fri, 6 May 2011 08:33:02 +0000
Message-ID: <77DFD0EF40BC5042BB7221A1EFFF7570A159@008-AM1MPN1-021.mgdnok.nokia.com>
References: <77DFD0EF40BC5042BB7221A1EFFF75709578@008-AM1MPN1-021.mgdnok.nokia.com>,
	<1304621499.7222.57.camel@localhost>
In-Reply-To: <1304621499.7222.57.camel@localhost>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: dwmw2@infradead.org, kyungmin.park@samsung.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,=0A=
=0A=
>The commit message should not contain that long lines - use max 80=0A=
>lines. The commit message should not start with "Hi". The subject should=
=0A=
>be short and more high level - the details go to the commit message.=0A=
>Could you please improve this and re-submit?=0A=
=0A=
Oops.. I am sorry. Thanks a lot for pointing out my mistakes.=0A=
I will make the modifications as per your instruction and will resubmit the=
 patch.  =0A=
=0A=
Thanks and Regards,=0A=
Maxin =0A=
_______________________________________=0A=
From: ext Artem Bityutskiy [dedekind1@gmail.com]=0A=
Sent: Thursday, May 05, 2011 8:51 PM=0A=
To: Maxin John (Nokia-SD/Helsinki)=0A=
Cc: linux-mtd@lists.infradead.org; kyungmin.park@samsung.com; dwmw2@infrade=
ad.org=0A=
Subject: Re: [PATCH] add a check to prevent the incrementing of possible NU=
LL value for "region" in onenand_base.c=0A=
=0A=
On Wed, 2011-05-04 at 11:26 +0000, john.maxin@nokia.com wrote:=0A=
> Hi,=0A=
>=0A=
> Coverity has reported that inside the function "onenand_block_by_block_er=
ase()" in onenand_base.c, we should add checks to prevent the incrementing =
of possible NULL value for "region"=0A=
> Thanks a lot to Adrian Hunter for suggesting a better solution.=0A=
>=0A=
> Signed-off-by: Maxin B. John <john.maxin@nokia.com>=0A=
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/one=
nand_base.c=0A=
> index 56a8b20..fd659f8 100644=0A=
> --- a/drivers/mtd/onenand/onenand_base.c=0A=
> +++ b/drivers/mtd/onenand/onenand_base.c=0A=
> @@ -2424,7 +2424,7 @@ static int onenand_block_by_block_erase(struct mtd_=
info *mtd,=0A=
>                 len -=3D block_size;=0A=
>                 addr +=3D block_size;=0A=
>=0A=
> -               if (addr =3D=3D region_end) {=0A=
> +               if (region && addr =3D=3D region_end) {=0A=
>                         if (!len)=0A=
>                                 break;=0A=
>                         region++;=0A=
>=0A=
> ______________________________________________________=0A=
> Linux MTD discussion mailing list=0A=
> http://lists.infradead.org/mailman/listinfo/linux-mtd/=0A=
=0A=
=0A=
