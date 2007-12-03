Received: from rv-out-0910.google.com ([209.85.198.188])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IzEFW-0000zW-HS
	for linux-mtd@lists.infradead.org; Mon, 03 Dec 2007 16:34:33 +0000
Received: by rv-out-0910.google.com with SMTP id c24so2827815rvf
	for <linux-mtd@lists.infradead.org>;
	Mon, 03 Dec 2007 08:34:24 -0800 (PST)
Message-ID: <62cbdcd90712030834o28f9126fs841b3b9d46324fb7@mail.gmail.com>
Date: Mon, 3 Dec 2007 17:34:23 +0100
From: "massimo cirillo" <maxcir@gmail.com>
To: Nico@cam.org, joern@logfs.org, linux-mtd@lists.infradead.org
Subject: [PATCH][CFI] Wrong cache invalidation bug fix
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We encountered the problem with cache invalidation in CFI driver. It
causes corruptions of data read from flash.

The problem is investigated. The original code performs cache
invalidation from "adr" to "adr + len" in do_write_buffer(). Since len
and adr could be updated in the code before invalidation - it causes
improper setting of cache invalidation regions.
The following patch fixes this problem. This patch has been verified
on our OMAP based platform.
Could you please acknowledge and commit this patch?

Thanks a lot.

Signed-off-by Massimo Cirillo <maxcir@gmail.com> and Giuseppe D'Eliseo
<giuseppedeliseo@gmail.com>

------

diff -aur a/drivers/mtd/chips/cfi_cmdset_0001.c
b/drivers/mtd/chips/cfi_cmdset_0001.c

--- a/drivers/mtd/chips/cfi_cmdset_0001.c	2007-11-20 20:15:02.000000000 +0300
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2007-11-29 19:42:08.000000000 +0300
@@ -1530,9 +1530,12 @@
 	int ret, wbufsize, word_gap, words;
 	const struct kvec *vec;
 	unsigned long vec_seek;
+	unsigned long initial_adr;
+	int initial_len=len;

 	wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
 	adr += chip->start;
+	initial_adr = adr;
 	cmd_adr = adr & ~(wbufsize-1);

 	/* Let's determine this according to the interleave only once */
@@ -1636,7 +1639,7 @@
 	chip->state = FL_WRITING;

 	ret = INVAL_CACHE_AND_WAIT(map, chip, cmd_adr,
-				   adr, len,
+				   initial_adr, initial_len,
 				   chip->buffer_write_time);
 	if (ret) {
 		map_write(map, CMD(0x70), cmd_adr);

------
