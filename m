Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MCmDS-0002aX-Ao
	for linux-mtd@lists.infradead.org; Sat, 06 Jun 2009 03:05:13 +0000
Received: by pzk30 with SMTP id 30so928767pzk.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 05 Jun 2009 20:05:04 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 5 Jun 2009 20:05:04 -0700
Message-ID: <1c3f4270906052005y7a50a810sa60daf5a8850bcec@mail.gmail.com>
Subject: write error while using UBI/UBIFS
From: Manoj <manoj23@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have created a ubi image that I have programmed to NAND flash using
ubiformat. After I mount the ubifs, I am trying to write a 3MB file to
the flash and I am seeing some issues.

Here is the log:
--------------------------------------
# dd if=/dev/urandom of=rand bs=1M count=3
[   49.030000] UBI error: ubi_io_write: cannot write 2048 bytes to PEB
136:10240 (emulated)
[   49.540000] UBI error: ubi_io_write: cannot write 2048 bytes to PEB
48:49152 (emulated)
[   50.030000] UBI error: paranoid_check_all_ff: flash region at PEB
49:4096, length 47104 does not
contain all 0xFF bytes
[   50.050000] UBI error: paranoid_check_all_ff: paranoid check failed
for PEB 49
[   53.650000] UBI error: ubi_io_write: cannot write 2048 bytes to PEB
144:40960 (emulated)
3+0 records in
3+0 records out
# cp rand rand1
[   99.030000] UBI error: ubi_io_write: cannot write 2048 bytes to PEB
69:8192 (emulated)
[  105.130000] VERIFY_WRITE FAILED! read:e0 wrote:8a at 0, page:47d9
[  105.130000] UBI error: ubi_io_write: error -5 while writing 2048
bytes to PEB 159:51200, written
0 bytes
[  107.840000] UBI error: ubi_io_write: cannot write 2048 bytes to PEB
73:18432 (emulated)
[  117.470000] UBI error: ubi_io_write: cannot write 2048 bytes to PEB
171:12288 (emulated)
[  118.390000] UBI error: paranoid_check_all_ff: flash region at PEB
75:81920, length 2048 does not
contain all 0xFF bytes
[  118.410000] UBI error: paranoid_check_all_ff: paranoid check failed
for PEB 75
[  118.450000] UBIFS error (pid 144): ubifs_wbuf_sync_nolock: cannot
write 2048 bytes to LEB 83:7782
4
[  118.500000] UBI error: ubi_io_write: read-only mode
cp: write error: Invalid argument
# [  118.520000] UBI error: erase_worker: failed to erase PEB 171, error -30
[  118.520000] UBI error: do_work: work failed with error code -30
--------------------------------------------

I have enabled UBI debug and CONFIG_MTD_NAND_VERIFY_WRITE.
Also, as an experiment, I used mtd_debug utility to write a 10MB image
to the flash and I don't see any issues there. So, it doesn't sound
like a driver issue?
HW ECC is enabled and I am presuming that no maintenance data is
stored in spare area for UBI/UBIFS (from documentation). I don't see
errors with ECC off.

Any help appreciated. Thanks.
