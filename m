Received: from out02.mta.xmission.com ([166.70.13.232])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KwC6L-0005T7-Rx
	for linux-mtd@lists.infradead.org; Sat, 01 Nov 2008 08:44:58 +0000
From: ebiederm@xmission.com (Eric W. Biederman)
To: David Woodhouse <dwmw2@infradead.org>
References: <20081029195349.imqvyxcajuoko0wo@imap.linux.ibm.com>
	<1225463927.16774.106.camel@macbook.infradead.org>
	<m1k5bohs61.fsf@frodo.ebiederm.org>
	<1225524813.16774.140.camel@macbook.infradead.org>
Date: Sat, 01 Nov 2008 01:36:09 -0700
In-Reply-To: <1225524813.16774.140.camel@macbook.infradead.org> (David
	Woodhouse's message of "Sat, 01 Nov 2008 07:33:33 +0000")
Message-ID: <m1skqbhmh2.fsf@frodo.ebiederm.org>
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

> On Fri, 2008-10-31 at 23:33 -0700, Eric W. Biederman wrote:
>> Forget my last I see now how we can try a 16bit device on an 8 bit
>> bus. I had missed the type <<=1 in gen_probe_new_chip.  Ooops.
>> 
>> With that said I think we need to fix cfi_send_gen_cmd as this problem
>> applies to all uses of it.
>> 
>> Unless I've missed something the patch below completely fixes the
>> problem.
>
> Yeah, that looks better. I had looked at the possibility of continuing
> to use 'word' addresses and fixing up cfi_build_cmd_addr(), but for some
> reason I hadn't noticed that it was used _only_ for the unlock addresses
> (or zero). I thought I was going to need to put a special case in for
> when it was being used with unlock addresses, and it all got a bit
> complex. So I switched to using byte addresses in the variables instead.
>
> I prefer your approach, although I think the patch isn't quite correct.

> You have to make sure we properly handle the case of a 16-bit device in
> 16-bit mode. We mustn't set the byte address to 0x555 there; it has to
> remain 0x554. We need to do the 'addr |= ....' bit _only_ if the device
> is in compatibility mode (i.e. interleave * type > map_bankwidth(map)).

Good point.

From: Eric W. Biederman <ebiederm@xmission.com>
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

So generically modify cfi_send_gen_cmd to extend alternating bit
sequences in addresses.  And every current cfi_send_gen_cmd that
assumes cfi_cmd_set_0002 (i.e. uses addresses 0x2aa and 0x555)
needs to be updated.

Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>
---
 drivers/mtd/chips/cfi_cmdset_0002.c |   13 -------------
 include/linux/mtd/cfi.h             |   12 +++++++++++-
 2 files changed, 11 insertions(+), 14 deletions(-)

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
index d6fb115..70499e2 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -429,7 +429,17 @@ static inline uint32_t cfi_send_gen_cmd(u_char cmd, uint32_t cmd_addr, uint32_t
 				int type, map_word *prev_val)
 {
 	map_word val;
-	uint32_t addr = base + cfi_build_cmd_addr(cmd_addr, cfi_interleave(cfi), type);
+	unsigned bankwidth = map_bankwidth(map);
+	unsigned interleave = cfi_interleave(cfi);
+	uint32_t addr = cfi_build_cmd_addr(cmd_addr, interleave, type);
+
+	/* Modify the unlock address if we are in compatiblity mode.
+	 * For 16bit devices on 8 bit busses
+	 * and 32bit devices on 16 bit busses
+	 * set the low bit of the alternating bit sequence of the address.
+	 */
+	if (((type * interleave) > bankwidth) && (cmd_addr & 2))
+		addr |= (type >> 1)*interleave;
 
 	val = cfi_build_cmd(cmd, map, cfi);
 
-- 
1.5.6.5
