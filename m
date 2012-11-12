Received: from mail-ea0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TY3HS-0001yu-5g
 for linux-mtd@lists.infradead.org; Mon, 12 Nov 2012 23:19:03 +0000
Received: by mail-ea0-f177.google.com with SMTP id n13so2605322eaa.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Nov 2012 15:18:59 -0800 (PST)
Message-ID: <50A183DF.1000304@gmail.com>
Date: Tue, 13 Nov 2012 00:18:55 +0100
From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
MIME-Version: 1.0
To: Juergen Beisert <jbe@pengutronix.de>
Subject: Re: [oselas] Mini2440 boot failure on kernel 3.7-rc1
References: <5082B755.1070109@gmail.com>
 <201210220928.19538.jbe@pengutronix.de>
In-Reply-To: <201210220928.19538.jbe@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: oselas@community.pengutronix.de, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Juergen, Brian,

On 10/22/2012 09:28 AM, Juergen Beisert wrote:
> Hi Sylwester,
>
> Sylwester Nawrocki wrote:
>> [...]
>> [    2.455000] NAND device: Manufacturer ID: 0xec, Chip ID: 0xf1 (Samsung NAND 128MiB 3,3V 8-bit), 8
>> [    2.460000] 4 cmdlinepart partitions found on MTD device nand
>> [    2.465000] Creating 4 MTD partitions on "nand":
>> [    2.470000] 0x000000000000-0x000000080000 : "barebox"
>> [    2.475000] mtd: partition "barebox" doesn't end on an erase block -- force read-only
>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> This "force read-only" doesn't happen with v3.6.
>
> This looks to me the NAND database uses a wrong block size for this NAND
> device. This device has 128 kiB block sizes. So, a 512 kiB partition
> *is* block aligned.
>
> Maybe you should take a look into the generic code, what block size the
> 3.7-rc1 uses for this NAND.

Thanks a lot for these pointers. I've found that the commit causing this
regression is this one:

commit e2d3a35ee427aaba99b6c68a56609ce276c51270
Author: Brian Norris <computersforpeace@gmail.com>
Date:   Mon Sep 24 20:40:55 2012 -0700

     mtd: nand: detect Samsung K9GBG08U0A, K9GAG08U0F ID

     Datasheets for the following Samsung NAND parts (both MLC and SLC) 
describe
     extensions to the Samsung 6-byte extended ID decoding table:

     K9GBG08U0A (MLC, 6-byte ID)
     K9GAG08U0F (MLC, 6-byte ID)
     K9FAG08U0M (SLC, 6-byte ID)

     The table found in K9GAG08U0F, p.44, contains a superset of the 
information
     found in other previous datasheets.

     This patch adds support for all of these chips, with 512B and 640B 
OOB sizes.
     It also changes the detection pattern such that this table applies 
to all
     Samsung 6-byte ID NAND, not just MLC. This is safe, according to 
the NAND
     parameter data I have collected:

     Note that nand_base.c does not yet support the bad block marker 
scheme defined
     for these chips (i.e., scan 1st and last page for BB markers).

     Signed-off-by: Brian Norris <computersforpeace@gmail.com>
     Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>


When I revert it the crash is gone and everything works well. The Flash
chip is K9F1G08U0C and according to the datasheet it has 5 byte ID.
However nand_id_len() returns 6 and id_data[] is: ec, f1, 00, 95, 40, ec.

I've found a mail thread where similar issue has been discussed [1]. It 
seems
the mentioned chunk in commit
"mtd: nand: add generic READ ID length calculation functions"

is missing. Still it doesn't fix the problem for me.

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ec6841d..93d6df3 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2989,7 +2989,8 @@ static void nand_decode_ext_id(struct mtd_info 
*mtd, struct nand_chip *chip,
          * Check for ID length, cell type, and Hynix/Samsung ID to 
decide what
          * to do.
          */
-       if (id_len == 6 && id_data[0] == NAND_MFR_SAMSUNG) {
+       if (id_len == 6 && id_data[0] == NAND_MFR_SAMSUNG &&
+           id_data[5] != 0x00) {
                 /* Calc pagesize */
                 mtd->writesize = 2048 << (extid & 0x03);
                 extid >>= 2;

With this change erasesize looks still incorrectly calculated (4 MB):
nand_decode_ext_id:3089 mtd writesize: 4096, oobsize: 128, erasesize: 
4194304

writesize also seems wrong, according to the datasheet it is 2 KB.

It looks like this Flash really needs to have id_len = 5 assigned, when 
I forced it:
nand_decode_ext_id:3090 mtd writesize: 2048, oobsize: 64, erasesize: 131072
everything looks as specified in the datasheet.

The following change eliminates the problem for this particular chip,
however it will likely break others.

 From efab2f7d0a9049588c8b155fab21f8f8c2433b19 Mon Sep 17 00:00:00 2001
From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Date: Tue, 13 Nov 2012 00:10:06 +0100
Subject: [PATCH] mtd: Change calculation of length of nand id with 
repeated pattern

Corrects ID length calculation for Samsung K9F1G08U0C NAND Flash,
ID: [ec, f1, 00, 95, 40], ec.

Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
---
  drivers/mtd/nand/nand_base.c |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index ec6841d..884e951 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2954,7 +2954,7 @@ static int nand_id_len(u8 *id_data, int arrlen)

  	/* There's a repeated pattern */
  	if (period < arrlen)
-		return period;
+		return period - 1;

  	/* There are trailing zeros */
  	if (last_nonzero < arrlen - 1)
-- 
1.7.4.1


[1] http://lists.infradead.org/pipermail/linux-mtd/2012-October/044358.html

--
Thanks,
Sylwester
