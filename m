Received: from mail.windriver.com ([147.11.1.11] helo=mail.wrs.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G6SqR-000203-DL
	for linux-mtd@lists.infradead.org; Fri, 28 Jul 2006 09:57:44 -0400
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.wrs.com (8.13.6/8.13.3) with ESMTP id k6S85fck007117
	for <linux-mtd@lists.infradead.org>;
	Fri, 28 Jul 2006 01:05:41 -0700 (PDT)
Message-ID: <44C9C551.7040109@windriver.com>
Date: Fri, 28 Jul 2006 16:05:37 +0800
From: Mark Zhan <rongkai.zhan@windriver.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Fix the unlock addr lookup BUG in MTD JEDEC probe
References: <44C595ED.7070209@windriver.com>
In-Reply-To: <44C595ED.7070209@windriver.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

cc to linux-mtd

Best Regards,
Mark. Zhan
-----Original Message-----
From: Zhan, Rongkai
Sent: Thursday, July 27, 2006 7:39 PM
To: 'David Woodhouse'
Cc: akpm@osdl.org; 'linux-mtd@lists.infradead.org'
Subject: RE: + fix-the-unlock-addr-lookup-bug-in-mtd-jedec-probe.patchadded to -mm tree

Hi David,

I use AMD AM29LV800BT chips (4 x16 in a 64-bit bank) in my MIPS32 4kc board.

The following are the kernel boot logs before and after applying my patch.
BTW, I turn on MTD DEBUG Level to 3, and add more DEBUG prinks in jedec_probe.c :-)

===================Kernel boot log before patched =====================
physmap flash device: 400000 at 1fc00000
MTD jedec_probe_chip() enter: map phys_mapped_flash, base 0x0, chip_map 0x0, cfi interleave x4, device type 2-bit
reset unlock called 555 2aa
Search for id (01 22da): CFI interleave x4, device type (16-bit), unlock addr (0555 02aa)
MTD jedec_match(): Check fit 0x00000000 + 0x00100000 = 0x00100000
MTD finfo_uaddr(): uaddr_idx 1, uaddr type 1
MTD finfo_uaddr(): uaddr type changes from 1 to 4
MTD jedec_match(): check CFI unlock addrs (0x0555 0x02aa) dev_type 2
MTD jedec_match(): pre-defined unlock addr (0x0aaa 0x0555) (idx: 4) did not match
reset unlock called 555 aaa
Search for id (01 22da): CFI interleave x4, device type (16-bit), unlock addr (0555 0aaa)
MTD jedec_match(): Check fit 0x00000000 + 0x00100000 = 0x00100000
MTD finfo_uaddr(): uaddr_idx 1, uaddr type 1
MTD finfo_uaddr(): uaddr type changes from 1 to 4
MTD jedec_match(): check CFI unlock addrs (0x0555 0x0aaa) dev_type 2
MTD jedec_match(): pre-defined unlock addr (0x0aaa 0x0555) (idx: 4) did not match
reset unlock called 5555 2aaa
Search for id (01 22da): CFI interleave x4, device type (16-bit), unlock addr (5555 2aaa)
MTD jedec_match(): Check fit 0x00000000 + 0x00100000 = 0x00100000
MTD finfo_uaddr(): uaddr_idx 1, uaddr type 1
MTD finfo_uaddr(): uaddr type changes from 1 to 4
MTD jedec_match(): check CFI unlock addrs (0x5555 0x2aaa) dev_type 2
MTD jedec_match(): pre-defined unlock addr (0x0aaa 0x0555) (idx: 4) did not match
reset unlock called aaa 555

===================Kernel boot log After patched =====================
physmap flash device: 400000 at 1fc00000
MTD jedec_probe_chip() enter: map phys_mapped_flash, base 0x0, chip_map 0x0, cfi interleave x4, device type 2-bit
reset unlock called 555 2aa
Search for id (01 22da): CFI interleave x4, device type (16-bit), unlock addr (0555 02aa)
MTD jedec_match(): Check fit 0x00000000 + 0x00100000 = 0x00100000
MTD finfo_uaddr(): uaddr_idx 1, uaddr type 1
MTD jedec_match(): check CFI unlock addrs (0x0555 0x02aa) dev_type 2
MTD jedec_match(): check ID's disappear when not in ID mode
reset unlock called 555 2aa
MTD jedec_match(): return to ID mode
MTD jedec_probe_chip(): matched device 0x1,0x22da unlock_addrs: 0x0555 0x02aa
Found: AMD AM29LV800BT
=====================================================================

Best Regards,
Mark. Zhan

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Wednesday, July 26, 2006 3:25 PM
To: akpm@osdl.org
Cc: Zhan, Rongkai
Subject: Re: + fix-the-unlock-addr-lookup-bug-in-mtd-jedec-probe.patchadded to -mm tree

On Wed, 2006-07-26 at 00:08 -0700, akpm@osdl.org wrote:
 > However, the later 'if' sentence will force that the first unlock addr type
 > is always returned.  If a chip has two device types (x8 x16) and the chip
 > works in x16 mode, this bug will result in that the chip can't be probed
 > correctly because the unlock addr doesn't match.

Chip probe code makes my head hurt. I have vague memories that this was
done on purpose -- we want to drop the magic unlock addresses for
different modes and _calculate_ them instead. The difference between x8
and x16 mode is just a simple shift. I think the best answer is probably
to fix your chip's entry in the table instead.

Please post to the linux-mtd list, giving precise details of the chip
you're using.

--
dwmw2

Mark Zhan wrote:
> Hi All,
> 
> This patch fixes a BUG in the function finfo_uaddr() in 
> driver/mtd/chips/jedec_probe.c.
> This function will fetch the unlock addr type from the pre-defined flash 
> chip info.
> 
> static inline __u8 finfo_uaddr(const struct amd_flash_info *finfo, int 
> device_type)
> {
>     int uaddr_idx;
>     __u8 uaddr = MTD_UADDR_NOT_SUPPORTED;
> 
>     switch ( device_type ) {
>     case CFI_DEVICETYPE_X8:  uaddr_idx = 0; break;
>     case CFI_DEVICETYPE_X16: uaddr_idx = 1; break;
>     case CFI_DEVICETYPE_X32: uaddr_idx = 2; break;
>     default:
>         printk(KERN_NOTICE "MTD: %s(): unknown device_type %d\n",
>                __func__, device_type);
>         goto uaddr_done;
>     }
> 
>     uaddr = finfo->uaddr[uaddr_idx];
> 
>     if (uaddr != MTD_UADDR_NOT_SUPPORTED ) {
>         /* ASSERT("The unlock addresses for non-8-bit mode
>            are bollocks. We don't really need an array."); */
>         uaddr = finfo->uaddr[0];
>     }
> 
>  uaddr_done:
>     return uaddr;
> }
> 
> However, the later 'if' sentence will force that the first unlock addr 
> type is always returned.
> If a chip has two device types (x8 x16) and the chip works in x16 mode, 
> this bug will result in
> that the chip can't be probed correctly because the unlock addr doesn't 
> match.
> 
> This patch fixes this bug.
> 
> Signed-off-by: Rongkai.Zhan <rongkai.zhan@windriver.com>
> 
> ----
> diff --git a/drivers/mtd/chips/jedec_probe.c 
> b/drivers/mtd/chips/jedec_probe.c
> index 8f39d0a..a0ab0df 100644
> --- a/drivers/mtd/chips/jedec_probe.c
> +++ b/drivers/mtd/chips/jedec_probe.c
> @@ -1804,7 +1804,7 @@ static inline __u8 finfo_uaddr(const str
> 
>      uaddr = finfo->uaddr[uaddr_idx];
> 
> -    if (uaddr != MTD_UADDR_NOT_SUPPORTED ) {
> +    if (uaddr == MTD_UADDR_NOT_SUPPORTED ) {
>          /* ASSERT("The unlock addresses for non-8-bit mode
>             are bollocks. We don't really need an array."); */
>          uaddr = finfo->uaddr[0];
> 
