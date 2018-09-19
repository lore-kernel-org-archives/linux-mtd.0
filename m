Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2kIq-0001DO-7a
 for linux-mtd@lists.infradead.org; Wed, 19 Sep 2018 21:46:43 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "xiaolei.li@mediatek.com" <xiaolei.li@mediatek.com>
Subject: Re: [PATCH] libmtd: don't print an error message for devices without
 ecc support
Date: Wed, 19 Sep 2018 21:45:52 +0000
Message-ID: <21d64b86e8ba49b4b7e852aeb73325cd@svr-chch-ex1.atlnz.lc>
References: <20180919082936.4011-1-david.oberhollenzer@sigma-star.at>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,=0A=
=0A=
On 19/09/18 20:39, David Oberhollenzer wrote:=0A=
> The libmtd library tries to obtain the available OOB size via the sysfs=
=0A=
> with a fallback to the ECCGETLAYOUT ioctl. For some devices (e.g. plat-ra=
m),=0A=
> the fallback path is always taken and prints an error message to stderr=
=0A=
> since the ioctl fails.=0A=
> =0A=
> This patch fixes the fallback path by suppressing the error message if=0A=
> errno is set to EOPNOTSUPP (i.e. the device simply doesn't support that).=
=0A=
> =0A=
> Fixes: a10353584f93 ("libmtd: Add support to access OOB available size")=
=0A=
> Reported-by: Chris Packham <Chris.Packham@alliedtelesis.co.nz>=0A=
> Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>=0A=
=0A=
Thanks for the fix. Works well for me on nand, spi-nor and plat-ram=0A=
=0A=
Tested-by: Chris Packham <Chris.Packham@alliedtelesis.co.nz>=0A=
=0A=
> ---=0A=
>   lib/libmtd_legacy.c | 2 ++=0A=
>   1 file changed, 2 insertions(+)=0A=
> =0A=
> diff --git a/lib/libmtd_legacy.c b/lib/libmtd_legacy.c=0A=
> index 97fef04..2b7f65f 100644=0A=
> --- a/lib/libmtd_legacy.c=0A=
> +++ b/lib/libmtd_legacy.c=0A=
> @@ -235,6 +235,8 @@ int legacy_get_mtd_oobavail(const char *node)=0A=
>   =0A=
>   	ret =3D ioctl(fd, ECCGETLAYOUT, &usrlay);=0A=
>   	if (ret < 0) {=0A=
> +		if (errno =3D=3D EOPNOTSUPP)=0A=
> +			goto out_close;=0A=
>   		sys_errmsg("ECCGETLAYOUT ioctl request failed");=0A=
>   		goto out_close;=0A=
>   	}=0A=
> =0A=
=0A=
By the way, the incoming email got flagged by my IS department. Not sure =
=0A=
if that's a false positive or something you need to bring to the =0A=
attention of whomever runs your email infrastructure. Let me know if you =
=0A=
want a copy of the original.=0A=
=0A=
 >=0A=
 > *** This email message may be dodgy ***=0A=
 >=0A=
 > The sending domain's SPF record was checked to try and prove if it =0A=
was sent by an authorised host. The sender's SPF record is invalid so =0A=
the sending host could not be validated.=0A=
 > This could be for one or more of several reasons -=0A=
 > 	The sending domain has more that one SPF record. (max=3D1)=0A=
 > 	The sending domains SPF record has bad syntax.=0A=
 > 	The sending domains SPF record requires too many DNS lookups. (max=3D10=
)=0A=
 >=0A=
 > If the email is genuine, the sender should be notified of this issue =0A=
so that they can report it to their IS team.=0A=
 >=0A=
 > ATLNZ IS=0A=
 >=0A=
 >=0A=
