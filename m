Received: from ernst.netinsight.se ([212.247.11.2])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jok9u-0002g2-5p
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 18:57:34 +0000
Message-ID: <480F8695.2050804@users.sourceforge.net>
Date: Wed, 23 Apr 2008 20:57:25 +0200
From: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: abelbg@m2grp.com, linux-mtd@lists.infradead.org
Subject: Re: PATCH: solving a hang while waiting in FL_STATUS
References: <15577be70804230157g35941393m599fd5fc2ad895c3@mail.gmail.com>	<1208946790.9212.782.camel@pmac.infradead.org>	<Pine.LNX.4.64.0804231408140.28908@pentafluge.infradead.org>
	<15577be70804230935q252b90a5td60b9a7de1d2da46@mail.gmail.com>
In-Reply-To: <15577be70804230935q252b90a5td60b9a7de1d2da46@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, abel.bernabeu@gmail.com,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Abel Bernabeu wrote:
> Image you have a broken sector which will never respond... that could
> hang the process while unlocking the sectors of a partition. In my
> case the problem prevents our board to complete the kernel start-up.

I have seen a case with a faulty Intel 28F128J3 that had a sector that
wouldn't erase. What happened was that the device kept trying to erase
the sector until the max specified erase time had passed then it set
the ready and error bits. The max erase time in this case was 25 seconds.
(early chip revision suffering from errata #2, I believe)
inval_cache_and_wait_for_operation() timed out already after 8 seconds
and set chip->state to FL_STATUS. It thus lost the actual state of the chip.
All operations within the next 17 seconds failed. The unit was impossble
to boot since it just kept panicing.

The error message I saw at that time (2.6.18) was
"Waiting for chip to be ready timed out. Status xxxx"
then JFFS2 got very unhappy.

A patched kernel with proper timeouts later booted this unit with just a
warning message about the bad sector. I'll post the patch shortly.

I've added this patch below as a safeguard. (Any thoughts on it?)
You could try it and see if it gets you out of the loop.

Anders

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index e812df6..e8a880c 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -706,6 +706,7 @@ static int chip_ready (struct map_info *map, struct flchip *chip, unsigned long

  	case FL_STATUS:
  		for (;;) {
+			map_write(map, CMD(0x70), adr);
  			status = map_read(map, adr);
  			if (map_word_andequal(map, status, status_OK, status_OK))
  				break;
