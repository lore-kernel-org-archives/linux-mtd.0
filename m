Received: from mail-lf0-x22d.google.com ([2a00:1450:4010:c07::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eOddb-0002bM-3u
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 06:01:57 +0000
Received: by mail-lf0-x22d.google.com with SMTP id 94so21835234lfy.10
 for <linux-mtd@lists.infradead.org>; Mon, 11 Dec 2017 22:01:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171211221603.37fd2685@bbrezillon>
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
From: Greg Cook <greg@morpheus.ws>
Date: Tue, 12 Dec 2017 14:01:31 +0800
Message-ID: <CAL92e2Vgmq_aJrxDm9+JT3TodRoreu_dB8x8SCXUhFkdodTu+g@mail.gmail.com>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 =?UTF-8?Q?Sean_Nyekj=C3=A6r?= <sean.nyekjaer@prevas.dk>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Miquel RAYNAL <miquel.raynal@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12 December 2017 at 05:16, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Mon, 11 Dec 2017 13:24:56 -0300
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
>
>> Greg,
>>
>> On 11 December 2017 at 10:18, Greg Cook <greg@morpheus.ws> wrote:
>> > Sean,
>> >
>> > I am not completely up-to-date on this, but everything in your traces reads
>> > like the same issue I was having on bringup for Armada 385 nand (under 4.9).
>> > I've been stuck on another project, so I haven't had time to follow up
>> > further, but I just diffed against linux-stable v4.12 pxa3xx_nand.c and it
>> > looks like the problem is still there.
>> >
>> > As far as I can see, the driver is broken for OOB reads when BCH is enabled
>> > because the setup in prepare_set_command() results in drain_fifo() not
>> > reading enough words from the read fifo in the nfc2 IP block.
>
> May I ask how you you get to this conclusion? What makes you think
> there's still unread data in the FIFO?

Because I added some debug lines to count the number of bytes read and
I could  see handle_data_pio() was reading 2048 bytes, followed by 32
bytes of spare. If you have Marvell MV-S109094-00 REV C handy, you can
see in Table 36 that this is not correct. The correct number of spare
bytes for the NFCv2 IP block is
- 64 bytes when SPARE_EN==1 and ECC_EN==0
- 32 bytes when SPARE_EN==1 and ECC_EN==1

>> >
>>
>> Yes, this sounds just like the bug I was expecting for OOB reads.
>>
>> > The patch we are using is below. I have the following in my DTS.
>> > nand-keep-config is commented out because I was having some issues with
>> > u-boot at the time and it may no longer be relevant:
>>
>> Probably.
>>
>> > flash@d0000 {
>> > status = "okay";
>> > num-cs = <1>;
>> > //marvell,nand-keep-config;
>> > marvell,nand-enable-arbiter;
>> > nand-on-flash-bbt;
>> > nand-ecc-strength = <4>;
>> > nand-ecc-step-size = <512>;
>> > };
>> >
>> > --- /home/user/build/linux-stable/drivers/mtd/nand/pxa3xx_nand.c
>> > +++
>> > /home/user/build/beam/openwrt/build_dir/target-arm_cortex-a9+vfpv3_musl_eabi/linux-mvebu/linux-4.9.34/drivers/mtd/nand/pxa3xx_nand.c
>> > @@ -668,7 +669,7 @@
>> >
>> >  static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int len)
>> >  {
>> > - if (info->ecc_bch) {
>> > + if (info->use_ecc && info->ecc_bch) {
>
> This one might explain timeouts occurring when you drain the FIFO for
> an operation that does not enable the ECC engine (like
> READ_PARAM_PAGE).
>
> So this fix is indeed valid, but I'm almost sure it won't fix Sean's
> problem.

>From memory, I don't *think* specific line wasn't causing me any
issues, but I noticed it was not correct because of the way use_ecc
and ecc_bch flags are initialised and then used. As you say, without
this patch, you can get timeouts on non-ECC operations when you have
BCH ECC enabled generally.

>
>> >   u32 val;
>> >   int ret;
>> >
>> > @@ -1012,7 +1014,11 @@
>> >
>> >   if (info->cur_chunk < info->nfullchunks) {
>> >   info->step_chunk_size = info->chunk_size;
>> > - info->step_spare_size = info->spare_size;
>> > + if (info->use_ecc) {
>> > + info->step_spare_size = info->spare_size;
>> > + } else {
>> > + info->step_spare_size = info->spare_size + info->ecc_size;
>> > + }
>
> The only case this change would fix is when you try to read/write pages
> in raw mode, and I'm pretty sure this driver does not support raw
> accesses.

Why do you say it would only affect raw mode? This code is not
specific to raw mode, nor
is the related code in handle_data_pio(), which uses the value of
step_spare_size to drain
the hardware FIFO.

>> >   } else {
>> >   info->step_chunk_size = info->last_chunk_size;
>> >   info->step_spare_size = info->last_spare_size;
>> >
>>
>> Looks like a decent change.
>>
>> Boris: do you think this is stable material worth backporting?
>> In other words, does it make sense to fix it, given the reworked driver?
>
