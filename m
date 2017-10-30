Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e96LZ-0000DC-6p
 for linux-mtd@lists.infradead.org; Mon, 30 Oct 2017 09:27:08 +0000
Date: Mon, 30 Oct 2017 10:26:33 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Chen Bin <chenbin5635@163.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger
 <richard@nod.at>, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Joe Perches <joe@perches.com>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: fix Cypress S29GL flash erase
 suspend
Message-ID: <20171030102633.26c00bfe@bbrezillon>
In-Reply-To: <1505397491-4493-1-git-send-email-chenbin5635@163.com>
References: <1505397491-4493-1-git-send-email-chenbin5635@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Chen,

On Thu, 14 Sep 2017 21:58:11 +0800
Chen Bin <chenbin5635@163.com> wrote:

> On UBIFS, Cypress S29GL01GT flash is failed to access occasionally
> , and throw below error information and call trace:
> MTD get_chip(): chip not ready after erase suspend
> UBI error: ubi_io_write: error -5 while writing 512 bytes to
> PEB 932:36992, written 0 bytes
> Call Trace: [jiffies: 0x10000ad9b]
> [<ffffffffc0be76cc>] dump_stack+0x8/0x34
> [<ffffffffc0a0b624>] ubi_io_write+0x52c/0x670
> [<ffffffffc0a079e8>] ubi_eba_write_leb+0xd8/0x758
> [<ffffffffc0897470>] ubifs_leb_write+0xd0/0x178
> [<ffffffffc0898cd0>] ubifs_wbuf_write_nolock+0x430/0x798
> [<ffffffffc088b16c>] ubifs_jnl_write_data+0x1e4/0x348
> [<ffffffffc088e5a8>] do_writepage+0xc8/0x258
> [<ffffffffc0714d70>] __writepage+0x18/0x78
> [<ffffffffc0715ab8>] write_cache_pages+0x1e0/0x4c8
> [<ffffffffc0715de0>] generic_writepages+0x40/0x78
> [<ffffffffc0784620>] __writeback_single_inode+0x58/0x370
> [<ffffffffc0785b84>] writeback_sb_inodes+0x2e4/0x498
> [<ffffffffc0785df8>] __writeback_inodes_wb+0xc0/0x118
> [<ffffffffc07862fc>] wb_writeback+0x234/0x3c0
> [<ffffffffc0786918>] wb_do_writeback+0x230/0x2b0
> [<ffffffffc0786a1c>] bdi_writeback_workfn+0x84/0x268
> [<ffffffffc0670300>] process_one_work+0x180/0x4d0
> [<ffffffffc0671848>] worker_thread+0x158/0x420
> [<ffffffffc06786c0>] kthread+0xa8/0xb0
> [<ffffffffc06204c8>] ret_from_kernel_thread+0x10/0x18
>=20
> After issue erase suspend command, flash don't go to ready state,
> and fail to access consequently.
> In Cypress S29GL01GT/S29GL512T flash datasheet, the type value of
> Erase Resume to next Erase suspend(tERS) is 100 =C2=B5s.
> If Erase Suspend followed Erase Resume without enough delay time,
> Erase Suspend would fail to work.
> 500 =CE=BCs is chosen because it works well and the latency is acceptable.
>=20
> Signed-off-by: Chen Bin <chenbin5635@163.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_=
cmdset_0002.c
> index 56aa6b7..c7d18ec 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -513,6 +513,22 @@ static void cfi_fixup_m29ew_delay_after_resume(struc=
t cfi_private *cfi)
>  		cfi_udelay(500);
>  }
> =20
> +static void cfi_fixup_delay_after_resume(struct cfi_private *cfi)
> +{
> +	cfi_fixup_m29ew_delay_after_resume(cfi);

Can we move the content of cfi_fixup_m29ew_delay_after_resume()
directly in this function?

> +
> +	/*
> +	 * For Cypress S29GL01GT/S29GL512T flash, the type value of
> +	 * Erase Resume to next Erase suspend(tERS) is 100 =C2=B5s.
> +	 * If Erase Suspend followed Erase Resume without enough delay time,
> +	 * Erase Suspend would fail to work.
> +	 * 500 =CE=BCs is chosen because it works well and the latency
> +	 * is acceptable.
> +	 */
> +	if (cfi->mfr =3D=3D CFI_MFR_AMD && (cfi->id =3D=3D 0x2801 || cfi->id =
=3D=3D 0x2301))
> +		cfi_udelay(500);
> +}
> +
>  struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
>  {
>  	struct cfi_private *cfi =3D map->fldrv_priv;
> @@ -890,7 +906,7 @@ static void put_chip(struct map_info *map, struct flc=
hip *chip, unsigned long ad
>  		cfi_fixup_m29ew_erase_suspend(map,
>  			chip->in_progress_block_addr);
>  		map_write(map, cfi->sector_erase_cmd, chip->in_progress_block_addr);
> -		cfi_fixup_m29ew_delay_after_resume(cfi);
> +		cfi_fixup_delay_after_resume(cfi);
>  		chip->oldstate =3D FL_READY;
>  		chip->state =3D FL_ERASING;
>  		break;
