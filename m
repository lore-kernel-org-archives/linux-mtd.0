Received: from relay1.mail.timico.net ([62.121.20.91] helo=relay.timico.net)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PAaWM-00018s-L8
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2010 03:48:25 +0000
From: Jon Povey <Jon.Povey@racelogic.co.uk>
To: Frank Li <Frank.Li@freescale.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>
Content-Class: urn:content-classes:message
Date: Tue, 26 Oct 2010 04:48:11 +0100
Subject: RE: [PATCH 1/1] MTD: Fix MTD_MODE_RAW write fail
Message-ID: <70E876B0EA86DD4BAF101844BC814DFE093EEF8EAC@Cloud.RL.local>
In-Reply-To: <1288061660-23363-1-git-send-email-Frank.Li@freescale.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
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

linux-mtd-bounces@lists.infradead.org wrote:
> mtdchar have not initilized all field of struct mtd_oob_ops
> in mtd_write when mode is MTD_MODE_RAW.
>
> function nand_do_write_ops
>         if (ops->ooboffs && (ops->ooboffs + ops->ooblen > oobmaxlen))
>                 return -EINVAL;
>
> ooboffs is not initilized at mtd_write.
> So random data cause nand_do_write_ops return fail.

Looks like you have found the same thing:

http://lists.infradead.org/pipermail/linux-mtd/2010-September/032453.html
http://lists.infradead.org/pipermail/linux-mtd/2010-October/032538.html

> Signed-off-by: Frank Li <Frank.Li@freescale.com>
> ---
>  drivers/mtd/mtdchar.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index b7ed09c..58839fa 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -319,6 +319,7 @@ static ssize_t mtd_write(struct file
> *file, const char __user *buf, size_t count
>                 case MTD_MODE_RAW:
>                 {
>                         struct mtd_oob_ops ops;
> +                       memset(&ops, 0, sizeof(struct mtd_oob_ops));
>
>                         ops.mode =3D MTD_OOB_RAW;
>                         ops.datbuf =3D kbuf;



--
Jon Povey
jon.povey@racelogic.co.uk

Racelogic is a limited company registered in England. Registered number 274=
3719 .
Registered Office Unit 10, Swan Business Centre, Osier Way, Buckingham, Buc=
ks, MK18 1TB .

The information contained in this electronic mail transmission is intended =
by Racelogic Ltd for the use of the named individual or entity to which it =
is directed and may contain information that is confidential or privileged.=
 If you have received this electronic mail transmission in error, please de=
lete it from your system without copying or forwarding it, and notify the s=
ender of the error by reply email so that the sender's address records can =
be corrected. The views expressed by the sender of this communication do no=
t necessarily represent those of Racelogic Ltd. Please note that Racelogic =
reserves the right to monitor e-mail communications passing through its net=
work
