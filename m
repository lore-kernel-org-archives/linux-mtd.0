Received: from mail-pf0-x233.google.com ([2607:f8b0:400e:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eOehb-0007mf-Qg
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 07:10:11 +0000
Received: by mail-pf0-x233.google.com with SMTP id y89so13570681pfk.0
 for <linux-mtd@lists.infradead.org>; Mon, 11 Dec 2017 23:09:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAL92e2Vgmq_aJrxDm9+JT3TodRoreu_dB8x8SCXUhFkdodTu+g@mail.gmail.com>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128140210.34215e19@xps13>
 <dd07aafc-0d23-e00a-4996-cd233f8a9065@prevas.dk>
 <20171128143055.1ff22979@xps13>
 <CAAEAJfBGG9wMVGnwSBfgr+tpr_E_weVBqTc=EvDGU6JUQveFQg@mail.gmail.com>
 <20171210151734.7e1aac59@xps13>
 <CAAEAJfCX5wakFfuPbEvyQjCu3V8Qv3O98=kF1STxDQcQ+vkgoQ@mail.gmail.com>
 <CAL92e2W7fLjVOWFgH2PpRLRP7Tf5L1vta0jduWm+bTVm647MNQ@mail.gmail.com>
 <CAAEAJfDyn2Ud_06DyT2fb0Y+jYDMMKbTvceAyxh_hnCcHvR-EA@mail.gmail.com>
 <20171211221603.37fd2685@bbrezillon>
 <CAL92e2Vgmq_aJrxDm9+JT3TodRoreu_dB8x8SCXUhFkdodTu+g@mail.gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 12 Dec 2017 04:09:45 -0300
Message-ID: <CAAEAJfBX5U1LctAY9qKC+b-6vWpJdB43VCPVh1FgzjbALY1w6g@mail.gmail.com>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
To: Greg Cook <greg@morpheus.ws>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 =?UTF-8?Q?Sean_Nyekj=C3=A6r?= <sean.nyekjaer@prevas.dk>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Miquel RAYNAL <miquel.raynal@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12 December 2017 at 03:01, Greg Cook <greg@morpheus.ws> wrote:
> On 12 December 2017 at 05:16, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
>> On Mon, 11 Dec 2017 13:24:56 -0300
>> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
>>
>>> Greg,
>>>
>>> On 11 December 2017 at 10:18, Greg Cook <greg@morpheus.ws> wrote:
>>> > Sean,
>>> >
>>> > I am not completely up-to-date on this, but everything in your traces=
 reads
>>> > like the same issue I was having on bringup for Armada 385 nand (unde=
r 4.9).
>>> > I've been stuck on another project, so I haven't had time to follow u=
p
>>> > further, but I just diffed against linux-stable v4.12 pxa3xx_nand.c a=
nd it
>>> > looks like the problem is still there.
>>> >
>>> > As far as I can see, the driver is broken for OOB reads when BCH is e=
nabled
>>> > because the setup in prepare_set_command() results in drain_fifo() no=
t
>>> > reading enough words from the read fifo in the nfc2 IP block.
>>
>> May I ask how you you get to this conclusion? What makes you think
>> there's still unread data in the FIFO?
>
> Because I added some debug lines to count the number of bytes read and
> I could  see handle_data_pio() was reading 2048 bytes, followed by 32
> bytes of spare. If you have Marvell MV-S109094-00 REV C handy, you can
> see in Table 36 that this is not correct. The correct number of spare
> bytes for the NFCv2 IP block is
> - 64 bytes when SPARE_EN=3D=3D1 and ECC_EN=3D=3D0
> - 32 bytes when SPARE_EN=3D=3D1 and ECC_EN=3D=3D1
>
>>> >
>>>
>>> Yes, this sounds just like the bug I was expecting for OOB reads.
>>>
>>> > The patch we are using is below. I have the following in my DTS.
>>> > nand-keep-config is commented out because I was having some issues wi=
th
>>> > u-boot at the time and it may no longer be relevant:
>>>
>>> Probably.
>>>
>>> > flash@d0000 {
>>> > status =3D "okay";
>>> > num-cs =3D <1>;
>>> > //marvell,nand-keep-config;
>>> > marvell,nand-enable-arbiter;
>>> > nand-on-flash-bbt;
>>> > nand-ecc-strength =3D <4>;
>>> > nand-ecc-step-size =3D <512>;
>>> > };
>>> >
>>> > --- /home/user/build/linux-stable/drivers/mtd/nand/pxa3xx_nand.c
>>> > +++
>>> > /home/user/build/beam/openwrt/build_dir/target-arm_cortex-a9+vfpv3_mu=
sl_eabi/linux-mvebu/linux-4.9.34/drivers/mtd/nand/pxa3xx_nand.c
>>> > @@ -668,7 +669,7 @@
>>> >
>>> >  static void drain_fifo(struct pxa3xx_nand_info *info, void *data, in=
t len)
>>> >  {
>>> > - if (info->ecc_bch) {
>>> > + if (info->use_ecc && info->ecc_bch) {
>>
>> This one might explain timeouts occurring when you drain the FIFO for
>> an operation that does not enable the ECC engine (like
>> READ_PARAM_PAGE).
>>
>> So this fix is indeed valid, but I'm almost sure it won't fix Sean's
>> problem.
>
> From memory, I don't *think* specific line wasn't causing me any
> issues, but I noticed it was not correct because of the way use_ecc
> and ecc_bch flags are initialised and then used. As you say, without
> this patch, you can get timeouts on non-ECC operations when you have
> BCH ECC enabled generally.
>
>>
>>> >   u32 val;
>>> >   int ret;
>>> >
>>> > @@ -1012,7 +1014,11 @@
>>> >
>>> >   if (info->cur_chunk < info->nfullchunks) {
>>> >   info->step_chunk_size =3D info->chunk_size;
>>> > - info->step_spare_size =3D info->spare_size;
>>> > + if (info->use_ecc) {
>>> > + info->step_spare_size =3D info->spare_size;
>>> > + } else {
>>> > + info->step_spare_size =3D info->spare_size + info->ecc_size;
>>> > + }
>>
>> The only case this change would fix is when you try to read/write pages
>> in raw mode, and I'm pretty sure this driver does not support raw
>> accesses.
>
> Why do you say it would only affect raw mode? This code is not
> specific to raw mode, nor
> is the related code in handle_data_pio(), which uses the value of
> step_spare_size to drain
> the hardware FIFO.
>

AFAICS, this patch affects READOOB commands, which are
issued when there is no BBT to detect bad blocks.

It "fixes" the timeout, but I wouldn't go as far as assuring
it makes the on-flash bad block scheme work, given
OOB writes will still be done with ECC enabled.

It seems this drivers mandates a BBT to work properly,
so perhaps a better patch would be to (a) force BBT usage,
and avoid OOB operations altogether, avoiding nasty
timeouts and unhappy board-bringupers.

Or (b) fix the READOOB and then
WARN/pr_warning about OOB I/O being broken.

The new driver under discussion, apparently makes AOOB
actually usable (arguably, without much utility as OOB
is mostly used for ECC anyway).

Ideas?
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
