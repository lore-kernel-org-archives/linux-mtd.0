Received: from out01.mta.xmission.com ([166.70.13.231])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KwA4X-0004AB-FP
	for linux-mtd@lists.infradead.org; Sat, 01 Nov 2008 06:34:58 +0000
From: ebiederm@xmission.com (Eric W. Biederman)
To: David Woodhouse <dwmw2@infradead.org>
References: <20081029195349.imqvyxcajuoko0wo@imap.linux.ibm.com>
	<1225463927.16774.106.camel@macbook.infradead.org>
Date: Fri, 31 Oct 2008 23:33:10 -0700
In-Reply-To: <1225463927.16774.106.camel@macbook.infradead.org> (David
	Woodhouse's message of "Fri, 31 Oct 2008 14:38:47 +0000")
Message-ID: <m1k5bohs61.fsf@frodo.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Re: ST M29W320D incorrectly configured
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

David Woodhouse <dwmw2@infradead.org> writes:

> On Wed, 2008-10-29 at 19:53 -0400, Corinna Schultz wrote:
>> I'm having a problem getting the unlock addresses correctly configured  
>> for the ST M29W320D chip. CFI query data is shown below (from  
>> debugging statements I enabled and/or added to the driver). The chip  
>> is wired so that the #BYTE pin is low, putting the chip into x8 mode.  
>> The data bus is physically 8 bits.
>> 
>> I don't understand everything that's going on in the code, but it  
>> seems to me that the following code (taken from cfi_cmdset_0002.c,  
>> which sets the unlock addresses needed for writing and erasing) has a  
>> logic error. Maybe someone can explain it to me?
>> 
>>   if (    /* x16 in x8 mode */
>>      ((cfi->device_type == CFI_DEVICETYPE_X8) &&
>>       (cfi->cfiq->InterfaceDesc == 2))
>> 
>> 
>> The reason I think this is in error is that both the device type and  
>> the interfaceDesc are defined by the hardware, and not indicative of  
>> the mode. Besides, isn't this conditional actually testing if the chip
>> is an X8 chip and supports x8 and x16 async modes?
>
> That condition is doubly wrong, I think. Not only does it never trigger,
> but it'd do the wrong thing if it _did_ trigger. I think the answer is
> to revert this:
> http://lists.infradead.org/pipermail/linux-mtd-cvs/2004-September/004096.html
>
> It would be nice if we could do it that way, but these ST chips don't
> seem to work. When they're in 16-bit mode, they really do need a byte
> address of 0x555 for the second unlock address, not 0x554 (0x2aa*2) as
> every other chip seems to accept. Although it takes _extra_ logic to
> check the input on the 'A-1' pin, they seem to have it.
>
> So I think the answer is to go back to cfi->addr_unlock[12] being _byte_
> addresses within the chip...

Forget my last I see now how we can try a 16bit device on an 8 bit bus.
I had missed the type <<=1 in gen_probe_new_chip.  Ooops.

With that said I think we need to fix cfi_send_gen_cmd as this problem
applies to all uses of it.

Unless I've missed something the patch below completely fixes the problem.

From: Eric W. Biederman <ebiederm@maxwell.arastra.com>
Subject: [PATCH] mtd: Fix cfi_send_gen_cmd the handling of x16 devices in x8 mode

cfi_send_gen_cmd is only passed in the addresses:
0, 0x55, 0x2aa, 0x555 and the addresses addr_unlock1 and addr_unlock2
from jeded_probe.  The address 0, 0x55, and 0x555 will not be
effected by this patch.

For 16bit devices in 8bit compatibility mode we need to use the
byte address:  0xaaa and 0x555.  Which effectively match
the word address 0x555 and 0x2aa.  Except the last has it's low byte
set.  We need to set the low bit to maintain the alternating bit
sequence.

Likewise the addresses in jedec_probe whose word address ends
in the bits 10 also need their low bit set.

So generically modify cfi_build_cmd_addr to extend alternating bit
sequences in addresses.  And every current cfi_send_gen_cmd that
assumes cfi_cmd_set_0002 (i.e. uses addresses 0x2aa and 0x555)
needs to be updated.

Signed-off-by: Eric W. Biederman <ebiederm@maxwell.arastra.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   13 -------------
 include/linux/mtd/cfi.h             |    9 ++++++++-
 2 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index a972cc6..9e7a236 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -362,19 +362,6 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map, int primary)
 		/* Set the default CFI lock/unlock addresses */
 		cfi->addr_unlock1 = 0x555;
 		cfi->addr_unlock2 = 0x2aa;
-		/* Modify the unlock address if we are in compatibility mode */
-		if (	/* x16 in x8 mode */
-			((cfi->device_type == CFI_DEVICETYPE_X8) &&
-				(cfi->cfiq->InterfaceDesc ==
-					CFI_INTERFACE_X8_BY_X16_ASYNC)) ||
-			/* x32 in x16 mode */
-			((cfi->device_type == CFI_DEVICETYPE_X16) &&
-				(cfi->cfiq->InterfaceDesc ==
-					CFI_INTERFACE_X16_BY_X32_ASYNC)))
-		{
-			cfi->addr_unlock1 = 0xaaa;
-			cfi->addr_unlock2 = 0x555;
-		}
 
 	} /* CFI mode */
 	else if (cfi->cfi_mode == CFI_MODE_JEDEC) {
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index d6fb115..0b62217 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -283,7 +283,14 @@ struct cfi_private {
  */
 static inline uint32_t cfi_build_cmd_addr(uint32_t cmd_ofs, int interleave, int type)
 {
-	return (cmd_ofs * type) * interleave;
+	uint32_t addr = cmd_ofs * type;
+	/* Modify the unlock address if we are in compatiblity mode.
+	 * For 16bit devices on 8 bit busses
+	 * and 32bit devices on 16 bit busses
+	 * set the low bit of the alternating bit sequence of the address.
+	 */
+	addr |= ((cmd_ofs & 2) * type) >> 2;
+	return addr * interleave;
 }
 
 /*
-- 
1.5.6.5
