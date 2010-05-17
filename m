Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OE45v-0001kg-T8
	for linux-mtd@lists.infradead.org; Mon, 17 May 2010 17:27:12 +0000
Message-ID: <4BF17C5D.1020501@netinsight.net>
Date: Mon, 17 May 2010 19:26:53 +0200
From: =?UTF-8?B?QW5kZXJzIEdyYWZzdHLDtm0=?=
 <anders.grafstrom@netinsight.net>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: cfi_cmdset_0001: Fix max timeout for locking
	operations
References: <4B8834FB.2070004@netinsight.net>
	<1273792018.9999.268.camel@macbook.infradead.org>
In-Reply-To: <1273792018.9999.268.camel@macbook.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2010-05-14 01:06, David Woodhouse wrote:
> On Fri, 2010-02-26 at 21:54 +0100, Anders Grafström wrote:
>> The max timeout is currently too short for some flash chips.
>> This patch increases it to 10 seconds. The typical timeout
>> remains unchanged (the tick period, 1000000/HZ).
>>
>> Specification change #11 in '5 Volt Intel StrataFlash Memory Specification Update'
>> (297848-15) specifies an increase of Clear Block Lock-Bit Time Max to 7 sec.
>> This is contradicted by the table in Specification Change #8 which says .70 sec
>> but a 10 sec timeout doesn't hurt so play it safe.
>>
>> Signed-off-by: Anders Grafström <anders.grafstrom@netinsight.net>
>> ---
>>  drivers/mtd/chips/cfi_cmdset_0001.c |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
>> index 9253043..83e4ae2 100644
>> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
>> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
>> @@ -2077,7 +2077,7 @@ static int __xipram do_xxlock_oneblock(struct map_info *map, struct flchip *chip
>>          */
>>         udelay = (!extp || !(extp->FeatureSupport & (1 << 5))) ? 1000000/HZ : 0;
>>  
>> -       ret = WAIT_TIMEOUT(map, chip, adr, udelay, udelay * 100);
>> +       ret = WAIT_TIMEOUT(map, chip, adr, udelay, udelay * HZ * 10); 
> 
> I don't see how this makes any sense. What is the _unit_ of the argument
> you're changing? Is it µs, is it ticks? You aren't just changing the
> value here; you're actually changing the units. The dimensional analysis
> doesn't make sense.
> 
> AFAICT this really is supposed to be µs, so multiplying by HZ has to be
> wrong.

Hm, I make it:

udelay: 1000000 / HZ = (µs/s) / (ticks/s) = µs/ticks
udelay_max (before): udelay * 100 = (µs/ticks) * ticks = µs
udelay_max (after): udelay * HZ * 10 = (µs/ticks) * (ticks/s) * s = µs

Here's a re-spin, with less HZ involvement:

>From 0ecd111a5cdc37631fa307d85e497075c467a82f Mon Sep 17 00:00:00 2001
From: Anders Grafström <anders.grafstrom@netinsight.net>
Date: Mon, 17 May 2010 15:23:08 +0200
Subject: [PATCH] mtd: cfi_cmdset_0001: Fix timeout for locking operations

The lock/unlock timeout is currently way too short for some flash chips.
This patch increases it to 10 seconds. The typical delay remains unchanged.

Specification change #11 in '5 Volt Intel StrataFlash Memory Specification Update'
(297848-15) specifies an increase of Clear Block Lock-Bit Time Max to 7 sec.
This is contradicted by the table in Specification Change #8 which says .70 sec
but a 10 sec timeout doesn't hurt so play it safe.

Signed-off-by: Anders Grafström <anders.grafstrom@netinsight.net>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 62f3ea9..3a22f47 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2045,7 +2045,8 @@ static int __xipram do_xxlock_oneblock(struct map_info *map, struct flchip *chip
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	struct cfi_pri_intelext *extp = cfi->cmdset_priv;
-	int udelay;
+	unsigned int udelay = 0;
+	unsigned int udelay_max = 0;
 	int ret;
 
 	adr += chip->start;
@@ -2071,12 +2072,15 @@ static int __xipram do_xxlock_oneblock(struct map_info *map, struct flchip *chip
 		BUG();
 
 	/*
-	 * If Instant Individual Block Locking supported then no need
-	 * to delay.
+	 * If Instant Individual Block Locking is unsupported then use
+	 * the tick period as the typical delay and 10 seconds for the timeout.
 	 */
-	udelay = (!extp || !(extp->FeatureSupport & (1 << 5))) ? 1000000/HZ : 0;
+	if (!extp || !(extp->FeatureSupport & (1 << 5))) {
+		udelay = 1000000 / HZ;
+		udelay_max = 10000000;
+	}
 
-	ret = WAIT_TIMEOUT(map, chip, adr, udelay, udelay * 100);
+	ret = WAIT_TIMEOUT(map, chip, adr, udelay, udelay_max);
 	if (ret) {
 		map_write(map, CMD(0x70), adr);
 		chip->state = FL_STATUS;
-- 
1.7.1
