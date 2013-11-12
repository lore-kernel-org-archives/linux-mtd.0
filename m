Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vg3iB-0008Sy-Aq
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 02:28:17 +0000
Message-ID: <528192F1.5040300@freescale.com>
Date: Tue, 12 Nov 2013 10:31:13 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2] mtd: gpmi: Fix NULL pointer dereference
References: <1384197222-23783-1-git-send-email-festevam@gmail.com>
In-Reply-To: <1384197222-23783-1-git-send-email-festevam@gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2013=C4=EA11=D4=C212=C8=D5 03:13, Fabio Estevam =D0=B4=B5=C0:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>
> Currently mx23_check_transcription_stamp() uses chip->buffers->databuf
> as its buffer, which is allocated by nand_scan_tail().
>
> Since commit 720e7ce5 ("mtd: gpmi: remove the nand_scan()"),=20
> mx23_check_transcription_stamp() is called before nand_scan_tail(), whi=
ch causes
> a NULL pointer dereference:
>
> [    1.150000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xd7 (Samsu=
ng NAND 4GiB 3,3V 8-bit), 4096MiB, page size: 4096, OOB size: 8
> [    1.160000] Unable to handle kernel NULL pointer dereference at virt=
ual address 000005d0
> [    1.170000] pgd =3D c0004000
> [    1.170000] [000005d0] *pgd=3D00000000
> [    1.180000] Internal error: Oops: 5 [#1] ARM
> [    1.180000] Modules linked in:
> [    1.180000] CPU: 0 PID: 1 Comm: swapper Not tainted 3.12.0 #89
> [    1.180000] task: c7440000 ti: c743a000 task.ti: c743a000
> [    1.180000] PC is at memcmp+0x10/0x54
> [    1.180000] LR is at gpmi_nand_probe+0x42c/0x894
> [    1.180000] pc : [<c025fcb0>]    lr : [<c02f6a68>]    psr: 20000053
> [    1.180000] sp : c743be2c  ip : 600000d3  fp : ffffffff
> [    1.180000] r10: 000005d0  r9 : c02f5f08  r8 : 00000000
> [    1.180000] r7 : c75858a8  r6 : c75858a8  r5 : c7585b18  r4 : c75858=
00
> [    1.180000] r3 : 000005d0  r2 : 00000004  r1 : c05c33e4  r0 : 000005=
d0
> [    1.180000] Flags: nzCv  IRQs on  FIQs off  Mode SVC_32  ISA ARM  Se=
gment kernel
> [    1.180000] Control: 0005317f  Table: 40004000  DAC: 00000017
> [    1.180000] Process swapper (pid: 1, stack limit =3D 0xc743a1c0)
>
> In order to fix this problem, allocate the buffer locally via kzalloc()=
.
>
> Also, as mx23_check_transcription_stamp() can return en error code now,=
 adapt
> the logic in mx23_boot_init() to take this into account.
>
> Cc: <stable@vger.kernel.org> # 3.12
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
> Changes since v1:
> - Drop sizeof(*buffer) from size calculatio in kzalloc (Brian Norris)
> - Propagate the error if mx23_check_transcription_stamp returns a negat=
ive
> error code (Brian Norris)
>
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/=
gpmi-nand/gpmi-nand.c
> index a9830ff..f99b876 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1342,7 +1342,7 @@ static int mx23_check_transcription_stamp(struct =
gpmi_nand_data *this)
>  	unsigned int search_area_size_in_strides;
>  	unsigned int stride;
>  	unsigned int page;
> -	uint8_t *buffer =3D chip->buffers->databuf;
> +	uint8_t *buffer;
>  	int saved_chip_number;
>  	int found_an_ncb_fingerprint =3D false;
> =20
> @@ -1352,6 +1352,9 @@ static int mx23_check_transcription_stamp(struct =
gpmi_nand_data *this)
>  	saved_chip_number =3D this->current_chip;
>  	chip->select_chip(mtd, 0);
> =20
> +	buffer =3D kzalloc(strlen(fingerprint), GFP_KERNEL);
> +	if (!buffer)
> +		return -ENOMEM;
>  	/*
>  	 * Loop through the first search area, looking for the NCB fingerprin=
t.
>  	 */
> @@ -1380,6 +1383,8 @@ static int mx23_check_transcription_stamp(struct =
gpmi_nand_data *this)
> =20
>  	chip->select_chip(mtd, saved_chip_number);
> =20
> +	kfree(buffer);
> +
>  	if (found_an_ncb_fingerprint)
>  		dev_dbg(dev, "\tFound a fingerprint\n");
>  	else
> @@ -1488,7 +1493,11 @@ static int mx23_boot_init(struct gpmi_nand_data =
 *this)
>  	 * transcription stamp. If we find it, then we don't have to do
>  	 * anything -- the block marks are already transcribed.
>  	 */
> -	if (mx23_check_transcription_stamp(this))
> +
> +	ret =3D mx23_check_transcription_stamp(this);
> +	if (ret < 0)
> +		return ret;
> +	else if (ret)
>  		return 0;
> =20
>  	/*
Thanks Fabio.
In actually, this patch only fixes partial of the bug.

When we login the rootfs, and erase all the mtd partitions, and reboot
the mx23 again,
you will meet a NULL pointer too. Why? because the
mx23_write_transcription_stamp() will work
again.

So my patch is better. :)




thanks
Huang Shijie
