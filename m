Received: from mail02.prevas.se ([62.95.78.10])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eOeBb-0003YG-4d
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 06:37:05 +0000
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
To: Greg Cook <greg@morpheus.ws>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>
CC: Miquel RAYNAL <miquel.raynal@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Kasper
 Revsbech (KREV)" <krev@triax.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128140210.34215e19@xps13>
 <dd07aafc-0d23-e00a-4996-cd233f8a9065@prevas.dk>
 <20171128143055.1ff22979@xps13>
 <CAAEAJfBGG9wMVGnwSBfgr+tpr_E_weVBqTc=EvDGU6JUQveFQg@mail.gmail.com>
 <20171210151734.7e1aac59@xps13>
 <CAAEAJfCX5wakFfuPbEvyQjCu3V8Qv3O98=kF1STxDQcQ+vkgoQ@mail.gmail.com>
 <CAL92e2W7fLjVOWFgH2PpRLRP7Tf5L1vta0jduWm+bTVm647MNQ@mail.gmail.com>
From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Message-ID: <c5eb13a6-85b5-d98c-086e-6a0ce2707a22@prevas.dk>
Date: Tue, 12 Dec 2017 07:36:40 +0100
MIME-Version: 1.0
In-Reply-To: <CAL92e2W7fLjVOWFgH2PpRLRP7Tf5L1vta0jduWm+bTVm647MNQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Greg
>
> I am not completely up-to-date on this, but everything in your traces 
> reads like the same issue I was having on bringup for Armada 385 nand 
> (under 4.9). I've been stuck on another project, so I haven't had time 
> to follow up further, but I just diffed against linux-stable v4.12 
> pxa3xx_nand.c and it looks like the problem is still there.
>
> As far as I can see, the driver is broken for OOB reads when BCH is 
> enabled because the setup in prepare_set_command() results in 
> drain_fifo() not reading enough words from the read fifo in the nfc2 
> IP block.
>
> The patch we are using is below. I have the following in my DTS. 
> nand-keep-config is commented out because I was having some issues 
> with u-boot at the time and it may no longer be relevant:
> flash@d0000 {
> status = "okay";
> num-cs = <1>;
> //marvell,nand-keep-config;
> marvell,nand-enable-arbiter;
> nand-on-flash-bbt;
> nand-ecc-strength = <4>;
> nand-ecc-step-size = <512>;
> };
>
> --- /home/user/build/linux-stable/drivers/mtd/nand/pxa3xx_nand.c
> +++ 
> /home/user/build/beam/openwrt/build_dir/target-arm_cortex-a9+vfpv3_musl_eabi/linux-mvebu/linux-4.9.34/drivers/mtd/nand/pxa3xx_nand.c
> @@ -668,7 +669,7 @@
>  static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int 
> len)
>  {
> -if (info->ecc_bch) {
> +if (info->use_ecc && info->ecc_bch) {
> u32 val;
> int ret;
> @@ -1012,7 +1014,11 @@
> if (info->cur_chunk < info->nfullchunks) {
> info->step_chunk_size = info->chunk_size;
> -info->step_spare_size = info->spare_size;
> +if (info->use_ecc) {
> +info->step_spare_size = info->spare_size;
> +} else {
> +info->step_spare_size = info->spare_size + info->ecc_size;
> +}
> } else {
> info->step_chunk_size = info->last_chunk_size;
> info->step_spare_size = info->last_spare_size;
>
> Regards,
> Greg
>
This patch does indeed fix our issues :-)
I'm able to run the nanddump command without any timeouts and
run without bbt (not that i would prefer that).

root@output-module:~# nanddump -oa /dev/mtd1
ECC failed: 0
ECC corrected: 0
Number of bad blocks: 0
Number of bbt blocks: 8
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x00000000 and ending at 0x0ff00000...
UBIXS

Please submit a patch.

Thanks
/Sean
