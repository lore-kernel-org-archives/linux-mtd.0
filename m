Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QtEOH-0007mo-Ew
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2011 07:48:50 +0000
Received: by iyf13 with SMTP id 13so9251666iyf.16
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Aug 2011 00:48:45 -0700 (PDT)
MIME-Version: 1.0
Sender: vipals@gmail.com
In-Reply-To: <1313424117.8691.19.camel@sauron>
References: <CAKa7sPRir5YTdPCYAHEYvPGA5GhfTuyv0Z9ynDUtEmy=YHA2XQ@mail.gmail.com>
	<1313424117.8691.19.camel@sauron>
From: Viktar Palstsiuk <viktar.palstsiuk@promwad.com>
Date: Tue, 16 Aug 2011 10:48:05 +0300
Message-ID: <CAKa7sPSB+p6Zxk8uM9famKsg_Bhdv7=LirUimaV+Jti2aRRPZA@mail.gmail.com>
Subject: Re: UBI FS on 2MiB eraseblock Hynix MLC NAND
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The problem was caused by behavior of H27UBG8T2ATR Hynix MLC NAND
while UBI FS was trying to do page write operation. UBI FS was trying
to write data to the first empty page assuming that 0xFF page is
erased and writable. But this type of NAND returns error on page write
operation even if it was entirely written with 0xFF before. As far as
I'm using U-boot's 'nand write' to flash UBI image I've added skip if
U-boot trying to write 0xFF-page.

--- drivers/mtd/nand/nand_base.c
+++ drivers/mtd/nand/nand_base.c	(working copy)
@@ -1761,7 +1761,18 @@
 			   const uint8_t *buf, int page, int cached, int raw)
 {
 	int status;
+	int i;

+	/* Skip empty page */
+	for (i = 0; i < mtd->writesize; i++)
+                if (buf[i] != 0xFF)
+                        break;
+	
+	if (i == mtd->writesize) {
+		printf ("nand_write_page: Skip 0xFF page\n");
+		return 0;
+	}
+	
 	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);

 	if (unlikely(raw))

So it works fine now.

I also had to increase PEB size limit in mtd-utils to create UBI image.

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index dcdb722..307edff 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -390,7 +390,7 @@ static int validate_options(void)
 		return err_msg("LEB should be multiple of min. I/O units");
 	if (c->leb_size % 8)
 		return err_msg("LEB size has to be multiple of 8");
-	if (c->leb_size > 1024*1024)
+	if (c->leb_size > 2*1024*1024)
 		return err_msg("too large LEB size %d", c->leb_size);
 	if (c->max_leb_cnt < UBIFS_MIN_LEB_CNT)
 		return err_msg("too low max. count of LEBs, minimum is %d",
diff --git a/ubi-utils/ubinize.c b/ubi-utils/ubinize.c
index 453494d..a71d067 100644
--- a/ubi-utils/ubinize.c
+++ b/ubi-utils/ubinize.c
@@ -253,7 +253,7 @@ static int parse_opt(int argc, char * const argv[])
 	if (args.peb_size < 0)
 		return errmsg("physical eraseblock size was not specified (use -h
for help)");

-	if (args.peb_size > 1024*1024)
+	if (args.peb_size > 2*1024*1024)
 		return errmsg("too high physical eraseblock size %d", args.peb_size);

 	if (args.min_io_size < 0)

Best regards,
Viktar Palstsiuk

On Mon, Aug 15, 2011 at 7:01 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2011-08-04 at 16:59 +0300, Viktar Palstsiuk wrote:
>> Hello,
>>
>> While trying to use UBI FS on Hynix MLC NAND (2MiB eraseblock, 8k
>> pagesize) I faced with the problem that root mounts well only during
>> first boot after it was flashed.
>> On the second boot it reports that it failed to recover master node.
>> If some one has tested UBI FS on devices with large eraseblock?
>
> Well, in theory it should work, but I've never heard about such huge
> eraseblock so probably you are the first trying it, and probably there
> is a bug.
>
>> NET: Registered protocol family 17
>> lib80211: common routines for IEEE802.11 drivers
>> rtc-mv rtc-mv: setting system clock to 2000-02-26 02:34:28 UTC (951532468)
>> UBIFS error (pid 1): ubifs_recover_master_node: failed to recover master node
>
> Could you please enable UBIFS debugging, reproduce the issue and send me
> all the kernel output - e.g., by typing dmesg or booting with the
> ignore_loglevel kernel option?
>
> --
> Best Regards,
> Artem Bityutskiy
>
>
