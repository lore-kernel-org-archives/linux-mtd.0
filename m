Received: from mail.ch.keymile.com ([193.17.201.103])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PmUaE-0001ur-8r
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2011 17:09:03 +0000
Message-ID: <4D502727.5010208@keymile.com>
Date: Mon, 07 Feb 2011 18:08:55 +0100
From: Stefan Bigler <stefan.bigler@keymile.com>
MIME-Version: 1.0
To: Michael Cashwell <mboards@prograde.net>
Subject: Re: Numonyx NOR and chip->mutex bug?
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>
	<OF562F5C46.D2EDB17F-ONC125782C.00358774-C125782C.0036154D@transmode.se>	
	<6FC0E416-EEBD-453F-AAB9-88BB6D90BFAB@prograde.net>
	<4D4AD9ED.8060104@keymile.com> <4D4B37D4.4050204@keymile.com>
	<OF0B032533.FA33B99E-ONC125782D.003AF89B-C125782D.003B43AA@transmode.se>	
	<4D4BDD48.6040600@keymile.com>
	<OF5A6BB547.3462D591-ONC125782D.00475578-C125782D.0047EC74@transmode.se>
	<541E19B8-D428-4F59-B6BB-A3BD8F455AE4@prograde.net>	
	<OF42EF<F66AF016-8A2B-4116-BE49-CE05B91BE50F@prograde.net>
	<OF56DD046D.3279E067
	<9098074B-C8F0-4608-BE25-D99A4C22176B@prograde.net>			
	<0488D3BA-7BA3-4E98-B289-3F3D1DB485D4@prograde.net> <OF2C1ABD39
	<4D5005E4.1040506@keymile.com> <OFFF2C6D34.91E5D6C3-ONC1257	
	<96BD3889-E8AD-408D-8275-ED1A5FD55F1B@prograde.net>
	<OF9738D658.F46DCBA1-ONC1257830.00591756-C1257830.0059F97E@transmode.se>
	<3FD201B7-C633-4D5D-A5D5-42952E6FFC28@prograde.net>
In-Reply-To: <3FD201B7-C633-4D5D-A5D5-42952E6FFC28@prograde.net>
Content-Type: text/plain;
	charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: 7bit
Cc: Holger brunck <holger.brunck@keymile.com>, linux-mtd@lists.infradead.org,
	Joakim Tjernlund <joakim.tjernlund@transmode.se>
Reply-To: stefan.bigler@keymile.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike

I attached a patch for you adding some printk, with those already the 
creation of the first ubivolume goes wrong.
Is this also the case in your setup?

Regards Stefan

Subject: [PATCH 2/2] MTD: cfi_cmdset_0001 driver add tracing

This tracing force in my case a race condition. When I create
a ubivolume.

Signed-off-by: Stefan Bigler <stefan.bigler@keymile.com>
---
  drivers/mtd/chips/cfi_cmdset_0001.c |   15 +++++++++++++++
  1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c 
b/drivers/mtd/chips/cfi_cmdset_0001.c
index d3b2cd3..ea59726 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -37,6 +37,8 @@
  #include <linux/mtd/compatmac.h>
  #include <linux/mtd/cfi.h>

+#include <linux/syscalls.h>
+
  /* #define CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE */
  /* #define CMDSET0001_DISABLE_WRITE_SUSPEND */

@@ -799,6 +801,8 @@ static int chip_ready (struct map_info *map, struct 
flchip *chip, unsigned long

          /* Erase suspend */
          map_write(map, CMD(0xB0), adr);
+        printk("[%10u][%04ld] erase suspend 1         adr=0x%08lx\n",
+               jiffies_to_usecs(jiffies)/1000, sys_gettid(), adr);

          /* If the flash has finished erasing, then 'erase suspend'
           * appears to make some (28F320) flash devices switch to
@@ -1012,6 +1016,10 @@ static void put_chip(struct map_info *map, struct 
flchip *chip, unsigned long ad
             do. */
          map_write(map, CMD(0xd0), adr);
          map_write(map, CMD(0x70), adr);
+
+        printk("[%10u][%04ld] erase resumed 2b        adr=0x%08lx\n",
+               jiffies_to_usecs(jiffies)/1000, sys_gettid(), adr);
+
          chip->oldstate = FL_READY;
          chip->state = FL_ERASING;
          break;
@@ -1884,6 +1892,10 @@ static int __xipram do_erase_oneblock(struct 
map_info *map, struct flchip *chip,
   retry:
      mutex_lock(&chip->mutex);
      ret = get_chip(map, chip, adr, FL_ERASING);
+
+    printk("[%10u][%04ld] do_erase_oneblock start adr=0x%08lx len=0x%x\n",
+           jiffies_to_usecs(jiffies)/1000, sys_gettid(), adr, len);
+
      if (ret) {
          mutex_unlock(&chip->mutex);
          return ret;
@@ -1953,6 +1965,9 @@ static int __xipram do_erase_oneblock(struct 
map_info *map, struct flchip *chip,

      xip_enable(map, chip, adr);
   out:    put_chip(map, chip, adr);
+    printk("[%10u][%04ld] do_erase_oneblock end   adr=0x%08lx len=0x%x 
\n",
+        jiffies_to_usecs(jiffies)/1000, sys_gettid(), adr, len);
+
      mutex_unlock(&chip->mutex);
      return ret;
  }
-- 
1.7.0.5

Am 02/07/2011 05:46 PM, schrieb Michael Cashwell:
> On Feb 7, 2011, at 11:22 AM, Joakim Tjernlund wrote:
>
>> Michael Cashwell<mboards@prograde.net>  wrote on 2011/02/07 16:46:22:
>>
>>> My current workaround from my problem is to do a throw-away status read "(void) map_read(map, addr);" after that 0x50, 0xd0, 0x70 sequence. Since no one else is seeing my problem I expect it's some issue with my specific batch of chips. Ugh.
>>
>> Possibly, or an accident waiting to happen to the rest of us.
>
> That does worry me too.
>
>> The map_read will probably force some HW completion. Perhaps some sync() op. will do the same? Just to nail it down.
>
> Once your patch is handled I will continue to try to fully explain my issue. I'm not giving up yet.
>
>> BTW, do you have CONFIG_MTD_COMPLEX_MAPPINGS=y ? I do
>
> Interesting. I have used that on a different platform where some of the high-order address lines were GPIOs.
>
> But no, I'm not using that in this case. Just a simple linear mapping of the whole part.
>
> -Mike
>
