Date: Mon, 31 Aug 2009 07:47:30 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: maxcir@gmail.com, jamie@shareable.com, linux-mtd@lists.infradead.org
Subject: Re:[PATCH] [MTD] CHIPS: 0xFF intolerance for M29W128G
Message-ID: <alpine.LFD.2.00.0908310724030.10961@casper.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Massimo,

> Jamie,
> I've rewritten the patch: now only the function cfi_qry_mode_off()
> has been patched, and only if the device is a M29W128G (16bit or 8bit)
> a final 0xF0 is given. The fixup_M29W128G_write_buffer() keeps on being
> removed, because the buffer write failure derived from the unstable
> state due to the missing 0xF0 command.
> Please give comments about this new version.

> @@ -308,7 +308,7 @@ static struct cfi_fixup cfi_fixup_table[] = {
>  	{ CFI_MFR_AMD, 0x1301, fixup_s29gl064n_sectors, NULL, },
>  	{ CFI_MFR_AMD, 0x1a00, fixup_s29gl032n_sectors, NULL, },
>  	{ CFI_MFR_AMD, 0x1a01, fixup_s29gl032n_sectors, NULL, },
> -	{ CFI_MFR_ST,  0x227E, fixup_M29W128G_write_buffer, NULL, },
> +	/* { CFI_MFR_ST,  0x227E, fixup_M29W128G_write_buffer, NULL, },
It does not need to be commented. Just remove this line :).

> @@ -81,6 +81,9 @@ void __xipram cfi_qry_mode_off(uint32_t base, struct
> map_info *map,
>  {
>  	cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
>  	cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
> +	/* send a 0xF0 if the device is M29W128G */
> +	if ((cfi->mfr == CFI_MFR_ST) && (cfi->id == 0x227E || cfi->id == 0x7E))
> +		cfi_send_gen_cmd(0xF0, 0, base, map, cfi, cfi->device_type, NULL);
May be it would be better to add comment like this:
 "M29W128G flashes require an additional reset command when exit qry mode".

New version is much better. This implementation does not break
compatibility with other devices. Please add acked-by when update.

Thanks,
Alexey

p/s Mail thread is interrupted because I weren't subscribed. Sorry for that.
