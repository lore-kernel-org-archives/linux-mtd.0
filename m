MIME-Version: 1.0
In-Reply-To: <1287742484-4276-3-git-send-email-leiwen@marvell.com>
References: <1287742484-4276-1-git-send-email-leiwen@marvell.com>
	<1287742484-4276-3-git-send-email-leiwen@marvell.com>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Sun, 13 Feb 2011 17:46:40 +0800
Message-ID: <AANLkTinPyB-gUQg00kFg6SnsCpnfJRcD2PtgwfkjrUUh@mail.gmail.com>
Subject: Re: [PATCH V3 2/6] pxa3xx_nand: rework irq logic
To: Lei Wen <leiwen@marvell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Haojian Zhuang <haojian.zhuang@marvell.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, adrian.wenl@gmail.com,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Lei,

I like this idea very much. There are several places for improvement,
though, you mind take a look?

> =C2=A0static int pxa3xx_nand_dev_ready(struct mtd_info *mtd)
> @@ -580,14 +582,12 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mt=
d, unsigned command,
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pxa3xx_nand_info *info =3D mtd->priv;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct pxa3xx_nand_cmdset *cmdset =3D in=
fo->cmdset;
> - =C2=A0 =C2=A0 =C2=A0 int ret;
> + =C2=A0 =C2=A0 =C2=A0 int ret, exec_cmd =3D 0;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->use_dma =3D (use_dma) ? 1 : 0;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->use_ecc =3D 0;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->data_size =3D 0;
> - =C2=A0 =C2=A0 =C2=A0 info->state =3D STATE_READY;
> -
> - =C2=A0 =C2=A0 =C2=A0 init_completion(&info->cmd_complete);
> + =C2=A0 =C2=A0 =C2=A0 info->state =3D 0;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (command) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0case NAND_CMD_READOOB:
> @@ -596,14 +596,12 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *mt=
d, unsigned command,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->buf_start =
=3D mtd->writesize + column;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(info->data_=
buff, 0xFF, info->buf_count);
>
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (prepare_read_prog_=
cmd(info, cmdset->read1, column, page_addr))
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 break;
> -
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pxa3xx_nand_do_cmd(inf=
o, NDSR_RDDREQ | NDSR_DBERR | NDSR_SBERR);
> -
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prepare_read_prog_cmd(=
info, cmdset->read1, column, page_addr);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* We only are OOB=
, so if the data has error, does not matter */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (info->retcode =
=3D=3D ERR_DBERR)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0info->retcode =3D ERR_NONE;

Note the above statement is executed after a do_cmd() is done, so
info->retcode contains a valid return code. While the actual code
to perform the command has been moved to below.

For each transaction, there are three steps:

  1. prepare/fill the command
  2. perform the command
  3. handle the return status

I actually though of merging steps 2) and 3) together, but step
3) could be different, and that the timeout for different type of
commands might be different, that's why I introduced the do_cmd()
function.

> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_cmd =3D 1;

Maybe for those cases where commands are not executed, just simply
return will avoid introducing this exec_cmd variable.

.....

> @@ -807,10 +795,7 @@ static int __readid(struct pxa3xx_nand_info *info, u=
int32_t *id)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t ndcr;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t =C2=A0id_buff[8];
>

I saw __readid() is replaced by pxa3xx_nand_cmdfunc(NAND_CMD_READID)
in the code below.  Is it possible to completely remove this function
now??
