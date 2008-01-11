Date: Fri, 11 Jan 2008 10:50:03 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: dwmw2@infradead.org
Subject: Re: [PATCH][CFI] Wrong cache invalidation bug fix
In-Reply-To: <62cbdcd90712050758h36335aa5q176f1c192f18d6a9@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0801111042510.20196@pentafluge.infradead.org>
References: <62cbdcd90712030834o28f9126fs841b3b9d46324fb7@mail.gmail.com>
	<alpine.LFD.0.99999.0712031210180.9605@xanadu.home>
	<62cbdcd90712050758h36335aa5q176f1c192f18d6a9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1831524198-833535474-1200048603=:20196"
Cc: linux-mtd@lists.infradead.org, joern@logfs.org,
	Nicolas Pitre <nico@cam.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1831524198-833535474-1200048603=:20196
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT

Hi David,

Please include patch from Massimo? It fixes bad dug in CFI driver.

Thanks,
Alexey







Signed-off-by Massimo Cirillo <maxcir@gmail.com> and Giuseppe D'Eliseo
<giuseppedeliseo@gmail.com>
Acked-by: Nicolas Pitre <nico@cam.org> and Jörn Engel <joern@logfs.org>

------
diff -aur a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c       2007-12-05 10:45:20.000000000 +0100
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c       2007-11-16 19:14:27.000000000 +0100
@@ -1486,9 +1486,12 @@
       int ret, wbufsize, word_gap, words;
       const struct kvec *vec;
       unsigned long vec_seek;
+       unsigned long initial_adr;
+       int initial_len=len;

       wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
       adr += chip->start;
+       initial_adr = adr;
       cmd_adr = adr & ~(wbufsize-1);

       /* Let's determine this according to the interleave only once */
@@ -1501,7 +1504,7 @@
               return ret;
       }

-       XIP_INVAL_CACHED_RANGE(map, adr, len);
+       XIP_INVAL_CACHED_RANGE(map, initial_adr, initial_len);
       ENABLE_VPP(map);
       xip_disable(map, chip, cmd_adr);

@@ -1592,7 +1595,7 @@
       chip->state = FL_WRITING;

       ret = INVAL_CACHE_AND_WAIT(map, chip, cmd_adr,
-                                  adr, len,
+                                  initial_adr, initial_len,
                                  chip->buffer_write_time);
       if (ret) {
               map_write(map, CMD(0x70), cmd_adr);
---------------
---1831524198-833535474-1200048603=:20196--
