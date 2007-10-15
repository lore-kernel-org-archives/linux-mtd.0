Received: from smtp-vbr2.xs4all.nl ([194.109.24.22])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IhTgm-0006Jk-TS
	for linux-mtd@lists.infradead.org; Mon, 15 Oct 2007 18:25:17 +0100
Message-ID: <4713A28A.8040905@aimsys.nl>
Date: Mon, 15 Oct 2007 19:25:30 +0200
From: "N. van Bolhuis" <nvbolhuis@aimsys.nl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, linuxppc-embedded@ozlabs.org
Subject: Re: jedec probe for AMD/Spansion flash (16 bit) device in 8 bit mode
	fails
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


OK, so there's nothing wrong with the linux-mtd mailing
list. It's alive.
I guess the archives are moved to
www.infradead.org/pipermail/linux-mtd and many existing
pages still refer to list.infradead.org/pipermail/linux-mtd

To be complete and to provide an answer (to my own question)
I'll show what I did to make things work.

Btw. in my previous post I mentioned somewhere

"It wants to match with unlock address 0x0aaa 0x0555 (because this is the one
 listed in the jedec_table[] entry for cfi->device_type=2=X16) and both pair
 of unlock addresses (which do get the chip in autoselect mode) do not match."

This is incorrect.
"0x0aaa 0x0555" is not listed in the jedec_table[] entry for x16. It's selected
because of the finfo_uaddr function having this if statement:

 
if (uaddr != MTD_UADDR_NOT_SUPPORTED ) {
    uaddr = finfo->uaddr[0];
}

return uaddr;

So, in x16 always "0x0aaa 0x0555" (entry for x8) is considered to be the unlock
address.

But this doesn't hurt me since our 16 bit AMD/Spansion flash device needs to
be recognized in 8 bit mode anyway since (obviously) it is used in 8 bit mode.


Looking through the archives shows more developers have dealt with this problem.
The unlock_addr function is suspicious. There's even a patch for this function
to make things work, but dwmw2 rejected it because things are supposed to be shifted
automatically for different device modes (x8, x16, x32).
Somewhere in the archives it is mentioned the device id should be read from
address 2 (and not 1) (for an AM29LV800 in byte mode). I suffer from this problem too.
Also somewhere in the archives the finfo_uaddr function is blamed, in particular
the if statement I showed above.

Obviously the jedec_probe simply doesn't work for all possible flash device and
(embedded) board configurations. This is exactly what the comment
in jedec_probe.c (above the function jedec_match) suggests.

I added the following to jedec_probe.c to make things work:

#define AM29LV160DTBYTE 0x0001

        }, {
                .mfr_id         = MANUFACTURER_AMD,
                .dev_id         = AM29LV160DTBYTE,
                .name           = "S29AL016D TB (byte mode)",
                .uaddr          = {
                        [0] = MTD_UADDR_0x0AAA_0x0555 /* x8 */
                },
                .DevSize        = SIZE_2MiB,
                .CmdSet         = P_ID_AMD_STD,
                .NumEraseRegions= 4,
                .regions        = {
                        ERASEINFO(0x10000,31),
                        ERASEINFO(0x08000,1),
                        ERASEINFO(0x02000,2),
                        ERASEINFO(0x04000,1)
                }




Not wanting to break functionality for some native 8 bit flash devices we use
(which do read their device id on address 1) I added device id 0x0001 since
it is guaranteed to be the same as the manfacturer id and was still free.


BR, 
N. van Bolhuis. 

-- 
This message has been scanned for viruses and is believed to be clean
