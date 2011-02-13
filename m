MIME-Version: 1.0
In-Reply-To: <AANLkTinPyB-gUQg00kFg6SnsCpnfJRcD2PtgwfkjrUUh@mail.gmail.com>
References: <1287742484-4276-1-git-send-email-leiwen@marvell.com>
	<1287742484-4276-3-git-send-email-leiwen@marvell.com>
	<AANLkTinPyB-gUQg00kFg6SnsCpnfJRcD2PtgwfkjrUUh@mail.gmail.com>
Date: Sun, 13 Feb 2011 23:46:05 +0800
Message-ID: <AANLkTikRp4mdcAcGPaJ8QVXOcYMvUOA5g6azhCSYXn9M@mail.gmail.com>
Subject: Re: [PATCH V3 2/6] pxa3xx_nand: rework irq logic
From: Lei Wen <adrian.wenl@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Lei Wen <leiwen@marvell.com>, Haojian Zhuang <haojian.zhuang@marvell.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Eric,

On Sun, Feb 13, 2011 at 5:46 PM, Eric Miao <eric.y.miao@gmail.com> wrote:
> Hi Lei,
>
> I like this idea very much. There are several places for improvement,
> though, you mind take a look?
>
>> =A0static int pxa3xx_nand_dev_ready(struct mtd_info *mtd)
>> @@ -580,14 +582,12 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *m=
td, unsigned command,
>> =A0{
>> =A0 =A0 =A0 =A0struct pxa3xx_nand_info *info =3D mtd->priv;
>> =A0 =A0 =A0 =A0const struct pxa3xx_nand_cmdset *cmdset =3D info->cmdset;
>> - =A0 =A0 =A0 int ret;
>> + =A0 =A0 =A0 int ret, exec_cmd =3D 0;
>>
>> =A0 =A0 =A0 =A0info->use_dma =3D (use_dma) ? 1 : 0;
>> =A0 =A0 =A0 =A0info->use_ecc =3D 0;
>> =A0 =A0 =A0 =A0info->data_size =3D 0;
>> - =A0 =A0 =A0 info->state =3D STATE_READY;
>> -
>> - =A0 =A0 =A0 init_completion(&info->cmd_complete);
>> + =A0 =A0 =A0 info->state =3D 0;
>>
>> =A0 =A0 =A0 =A0switch (command) {
>> =A0 =A0 =A0 =A0case NAND_CMD_READOOB:
>> @@ -596,14 +596,12 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info *m=
td, unsigned command,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->buf_start =3D mtd->writesize + colu=
mn;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memset(info->data_buff, 0xFF, info->buf_c=
ount);
>>
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (prepare_read_prog_cmd(info, cmdset->re=
ad1, column, page_addr))
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> -
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pxa3xx_nand_do_cmd(info, NDSR_RDDREQ | NDS=
R_DBERR | NDSR_SBERR);
>> -
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 prepare_read_prog_cmd(info, cmdset->read1,=
 column, page_addr);
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* We only are OOB, so if the data has er=
ror, does not matter */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (info->retcode =3D=3D ERR_DBERR)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0info->retcode =3D ERR_NON=
E;
>
> Note the above statement is executed after a do_cmd() is done, so
> info->retcode contains a valid return code. While the actual code
> to perform the command has been moved to below.

It is my fault not delete those line here...
In my following 0004 patch, I would unify the prepare step into one functio=
n.
BTW, for OOB data, I think we also shouldn't omit the DB error.
Like BCH crc algorithm, it also protect the oob area, so it is reasonable t=
o
be aware that area...
>
> For each transaction, there are three steps:
>
> =A01. prepare/fill the command
> =A02. perform the command
> =A03. handle the return status
>
> I actually though of merging steps 2) and 3) together, but step
> 3) could be different, and that the timeout for different type of
> commands might be different, that's why I introduced the do_cmd()
> function.

I agree. :)
That is what I want to do in this patch set, unify the prepare behavior
into one function, and then execute it.

>
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 exec_cmd =3D 1;
>
> Maybe for those cases where commands are not executed, just simply
> return will avoid introducing this exec_cmd variable.

For I unify the prepare process into one function according to different
command, simply return would be unable to notify the execute action...
The exec_cmd would be made as the return value for the prepare function.

>
> .....
>
>> @@ -807,10 +795,7 @@ static int __readid(struct pxa3xx_nand_info *info, =
uint32_t *id)
>> =A0 =A0 =A0 =A0uint32_t ndcr;
>> =A0 =A0 =A0 =A0uint8_t =A0id_buff[8];
>>
>
> I saw __readid() is replaced by pxa3xx_nand_cmdfunc(NAND_CMD_READID)
> in the code below. =A0Is it possible to completely remove this function
> now??

I made the remove behavior in the patch 0003. :)

Thanks,
Lei
