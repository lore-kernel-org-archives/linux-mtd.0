Subject: Re: [PATCH 1/2] mtd: Fix cfi_send_gen_cmd the handling of x16
	devices in x8 mode
From: David Woodhouse <dwmw2@infradead.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
In-Reply-To: <m163n7hh8i.fsf_-_@frodo.ebiederm.org>
References: <20081029195349.imqvyxcajuoko0wo@imap.linux.ibm.com>
	<1225463927.16774.106.camel@macbook.infradead.org>
	<m1k5bohs61.fsf@frodo.ebiederm.org>
	<1225524813.16774.140.camel@macbook.infradead.org>
	<m1skqbhmh2.fsf@frodo.ebiederm.org>
	<1225529384.16774.162.camel@macbook.infradead.org>
	<m1d4hfhhim.fsf@frodo.ebiederm.org>
	<m163n7hh8i.fsf_-_@frodo.ebiederm.org>
Content-Type: text/plain
Date: Sat, 01 Nov 2008 10:43:02 +0000
Message-Id: <1225536182.16774.166.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: jwboyer@gmail.com, linux-mtd@lists.infradead.org,
	Corinna Schultz <cschultz@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2008-11-01 at 03:29 -0700, Eric W. Biederman wrote:
> @@ -1808,9 +1808,7 @@ static inline u32 jedec_read_mfr(struct map_info *map, uint32_t base,
>          * several first banks can contain 0x7f instead of actual ID
>          */
>         do {
> -               uint32_t ofs = cfi_build_cmd_addr(0 + (bank << 8),
> -                                                 cfi_interleave(cfi),
> -                                                 cfi->device_type);
> +               uint32_t ofs = cfi_build_cmd_addr(0 + (bank << 8), map, cfi);
>                 mask = (1 << (cfi->device_type * 8)) - 1;
>                 result = map_read(map, base + ofs);
>                 bank++;

I think this one is still broken by your patch -- it's the exception to
your observation that we only ever use addresses ending in 00, 55 or aa.

> 
> +       /* Modify the unlock address if we are in compatiblity mode.
> +        * For 16bit devices on 8 bit busses
> +        * and 32bit devices on 16 bit busses
> +        * set the low bit of the alternating bit sequence of the address.
> +        */
> +       if (((type * interleave) > bankwidth) && (cmd_addr & 2))
> +               addr |= (type >> 1)*interleave;

Perhaps '&& ((cmd_addr & 0xff) == 0xaa)' is the answer?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
