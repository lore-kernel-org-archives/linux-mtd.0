Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eORDP-0008AW-F7
 for linux-mtd@lists.infradead.org; Mon, 11 Dec 2017 16:46:05 +0000
Date: Mon, 11 Dec 2017 17:45:31 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Greg Cook <greg@morpheus.ws>, Sean =?UTF-8?B?Tnlla2rDpnI=?=
 <sean.nyekjaer@prevas.dk>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "Kasper Revsbech \(KREV\)"
 <krev@triax.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Miquel RAYNAL <miquel.raynal@free-electrons.com>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
Message-ID: <20171211174531.492d9b5f@bbrezillon>
In-Reply-To: <CAAEAJfDyn2Ud_06DyT2fb0Y+jYDMMKbTvceAyxh_hnCcHvR-EA@mail.gmail.com>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128140210.34215e19@xps13>
 <dd07aafc-0d23-e00a-4996-cd233f8a9065@prevas.dk>
 <20171128143055.1ff22979@xps13>
 <CAAEAJfBGG9wMVGnwSBfgr+tpr_E_weVBqTc=EvDGU6JUQveFQg@mail.gmail.com>
 <20171210151734.7e1aac59@xps13>
 <CAAEAJfCX5wakFfuPbEvyQjCu3V8Qv3O98=kF1STxDQcQ+vkgoQ@mail.gmail.com>
 <CAL92e2W7fLjVOWFgH2PpRLRP7Tf5L1vta0jduWm+bTVm647MNQ@mail.gmail.com>
 <CAAEAJfDyn2Ud_06DyT2fb0Y+jYDMMKbTvceAyxh_hnCcHvR-EA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 11 Dec 2017 13:24:56 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> Greg,
> 
> On 11 December 2017 at 10:18, Greg Cook <greg@morpheus.ws> wrote:
> > Sean,
> >
> > I am not completely up-to-date on this, but everything in your traces reads
> > like the same issue I was having on bringup for Armada 385 nand (under 4.9).
> > I've been stuck on another project, so I haven't had time to follow up
> > further, but I just diffed against linux-stable v4.12 pxa3xx_nand.c and it
> > looks like the problem is still there.
> >
> > As far as I can see, the driver is broken for OOB reads when BCH is enabled
> > because the setup in prepare_set_command() results in drain_fifo() not
> > reading enough words from the read fifo in the nfc2 IP block.
> >  
> 
> Yes, this sounds just like the bug I was expecting for OOB reads.
> 
> > The patch we are using is below. I have the following in my DTS.
> > nand-keep-config is commented out because I was having some issues with
> > u-boot at the time and it may no longer be relevant:  
> 
> Probably.
> 
> > flash@d0000 {
> > status = "okay";
> > num-cs = <1>;
> > //marvell,nand-keep-config;
> > marvell,nand-enable-arbiter;
> > nand-on-flash-bbt;
> > nand-ecc-strength = <4>;
> > nand-ecc-step-size = <512>;
> > };
> >
> > --- /home/user/build/linux-stable/drivers/mtd/nand/pxa3xx_nand.c
> > +++
> > /home/user/build/beam/openwrt/build_dir/target-arm_cortex-a9+vfpv3_musl_eabi/linux-mvebu/linux-4.9.34/drivers/mtd/nand/pxa3xx_nand.c
> > @@ -668,7 +669,7 @@
> >
> >  static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int len)
> >  {
> > - if (info->ecc_bch) {
> > + if (info->use_ecc && info->ecc_bch) {
> >   u32 val;
> >   int ret;
> >
> > @@ -1012,7 +1014,11 @@
> >
> >   if (info->cur_chunk < info->nfullchunks) {
> >   info->step_chunk_size = info->chunk_size;
> > - info->step_spare_size = info->spare_size;
> > + if (info->use_ecc) {
> > + info->step_spare_size = info->spare_size;
> > + } else {
> > + info->step_spare_size = info->spare_size + info->ecc_size;
> > + }
> >   } else {
> >   info->step_chunk_size = info->last_chunk_size;
> >   info->step_spare_size = info->last_spare_size;
> >  
> 
> Looks like a decent change.
> 
> Boris: do you think this is stable material worth backporting?
> In other words, does it make sense to fix it, given the reworked driver?

Ye it's always worth fixing existing bugs in stable releases, even if
the driver has been completely rewritten in newer kernels.

I can't tell if the fix is correct though, so I'll let Miquel who has
worked on the driver rework for last couple months answer this
question.
Miquel, is this fix valid?
