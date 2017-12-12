Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eOePN-0000eX-F1
 for linux-mtd@lists.infradead.org; Tue, 12 Dec 2017 06:51:19 +0000
Received: by mail-pf0-x241.google.com with SMTP id p84so13545442pfd.3
 for <linux-mtd@lists.infradead.org>; Mon, 11 Dec 2017 22:50:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <c5eb13a6-85b5-d98c-086e-6a0ce2707a22@prevas.dk>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128140210.34215e19@xps13>
 <dd07aafc-0d23-e00a-4996-cd233f8a9065@prevas.dk>
 <20171128143055.1ff22979@xps13>
 <CAAEAJfBGG9wMVGnwSBfgr+tpr_E_weVBqTc=EvDGU6JUQveFQg@mail.gmail.com>
 <20171210151734.7e1aac59@xps13>
 <CAAEAJfCX5wakFfuPbEvyQjCu3V8Qv3O98=kF1STxDQcQ+vkgoQ@mail.gmail.com>
 <CAL92e2W7fLjVOWFgH2PpRLRP7Tf5L1vta0jduWm+bTVm647MNQ@mail.gmail.com>
 <c5eb13a6-85b5-d98c-086e-6a0ce2707a22@prevas.dk>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 12 Dec 2017 03:50:56 -0300
Message-ID: <CAAEAJfD+qZvL6zUO2aC6NHF74nwdteyQYJQqTtOOW4kWg1Vqkg@mail.gmail.com>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
To: =?UTF-8?Q?Sean_Nyekj=C3=A6r?= <sean.nyekjaer@prevas.dk>
Cc: Greg Cook <greg@morpheus.ws>,
 Miquel RAYNAL <miquel.raynal@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
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

On 12 December 2017 at 03:36, Sean Nyekj=C3=A6r <sean.nyekjaer@prevas.dk> w=
rote:
> Hi Greg
>>
>>
>> I am not completely up-to-date on this, but everything in your traces
>> reads like the same issue I was having on bringup for Armada 385 nand (u=
nder
>> 4.9). I've been stuck on another project, so I haven't had time to follo=
w up
>> further, but I just diffed against linux-stable v4.12 pxa3xx_nand.c and =
it
>> looks like the problem is still there.
>>
>> As far as I can see, the driver is broken for OOB reads when BCH is
>> enabled because the setup in prepare_set_command() results in drain_fifo=
()
>> not reading enough words from the read fifo in the nfc2 IP block.
>>
>> The patch we are using is below. I have the following in my DTS.
>> nand-keep-config is commented out because I was having some issues with
>> u-boot at the time and it may no longer be relevant:
>> flash@d0000 {
>> status =3D "okay";
>> num-cs =3D <1>;
>> //marvell,nand-keep-config;
>> marvell,nand-enable-arbiter;
>> nand-on-flash-bbt;
>> nand-ecc-strength =3D <4>;
>> nand-ecc-step-size =3D <512>;
>> };
>>
>> --- /home/user/build/linux-stable/drivers/mtd/nand/pxa3xx_nand.c
>> +++
>> /home/user/build/beam/openwrt/build_dir/target-arm_cortex-a9+vfpv3_musl_=
eabi/linux-mvebu/linux-4.9.34/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -668,7 +669,7 @@
>>  static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int
>> len)
>>  {
>> -if (info->ecc_bch) {
>> +if (info->use_ecc && info->ecc_bch) {
>> u32 val;
>> int ret;
>> @@ -1012,7 +1014,11 @@
>> if (info->cur_chunk < info->nfullchunks) {
>> info->step_chunk_size =3D info->chunk_size;
>> -info->step_spare_size =3D info->spare_size;
>> +if (info->use_ecc) {
>> +info->step_spare_size =3D info->spare_size;
>> +} else {
>> +info->step_spare_size =3D info->spare_size + info->ecc_size;
>> +}
>> } else {
>> info->step_chunk_size =3D info->last_chunk_size;
>> info->step_spare_size =3D info->last_spare_size;
>>
>> Regards,
>> Greg
>>
> This patch does indeed fix our issues :-)
> I'm able to run the nanddump command without any timeouts and
> run without bbt (not that i would prefer that).
>
> root@output-module:~# nanddump -oa /dev/mtd1
> ECC failed: 0
> ECC corrected: 0
> Number of bad blocks: 0
> Number of bbt blocks: 8
> Block size 131072, page size 2048, OOB size 64
> Dumping data starting at 0x00000000 and ending at 0x0ff00000...
> UBIXS
>
> Please submit a patch.
>

Greg,

If you prefer, I can re-submit your patch with your author and signed-off-b=
y.
If you want to submit yourself, that's of course better.

Once we have a proper patch, we can start tests an
discuss merging (or not) in its own thread.


Thanks,
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
