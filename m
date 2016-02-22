Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aXquk-0001WH-Bh
 for linux-mtd@lists.infradead.org; Mon, 22 Feb 2016 13:52:46 +0000
From: David Gstir <david@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	David Gstir <david@sigma-star.at>
Subject: [PATCH 3/3] ubi: tests: Speedup io_paral by using rand_r()
Date: Mon, 22 Feb 2016 14:52:05 +0100
Message-Id: <1456149125-24067-3-git-send-email-david@sigma-star.at>
In-Reply-To: <1456149125-24067-1-git-send-email-david@sigma-star.at>
References: <1456149125-24067-1-git-send-email-david@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Richard Weinberger <richard@nod.at>

rand() is not thread safe, but glibc seems to use a shared state which is
protected by a mutex. io_paral spawns a few threads and they call rand()
more or less in parallel, which causes heavy lock contention. That
makes the test extremely slow on some setups.

Signed-off-by: Richard Weinberger <richard@nod.at>
Signed-off-by: David Gstir <david@sigma-star.at>
---
 tests/ubi-tests/io_paral.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/tests/ubi-tests/io_paral.c b/tests/ubi-tests/io_paral.c
index becbb52..b2b462e 100644
--- a/tests/ubi-tests/io_paral.c
+++ b/tests/ubi-tests/io_paral.c
@@ -55,6 +55,7 @@ static int update_volume(int vol_id, int bytes)
 	char *vol_node = vol_nodes[vol_id];
 	unsigned char *wbuf = wbufs[vol_id];
 	unsigned char *rbuf = rbufs[vol_id];
+	unsigned int seed = seed_random_generator();
 
 	fd = open(vol_node, O_RDWR);
 	if (fd == -1) {
@@ -64,7 +65,7 @@ static int update_volume(int vol_id, int bytes)
 	}
 
 	for (i = 0; i < bytes; i++)
-		wbuf[i] = rand() % 255;
+		wbuf[i] = rand_r(&seed) % 255;
 	memset(rbuf, '\0', bytes);
 
 	ret = ubi_update_start(libubi, fd, bytes);
@@ -75,7 +76,7 @@ static int update_volume(int vol_id, int bytes)
 	}
 
 	while (written < bytes) {
-		int to_write = rand() % (bytes - written);
+		int to_write = rand_r(&seed) % (bytes - written);
 
 		if (to_write == 0)
 			to_write = 1;
@@ -104,7 +105,7 @@ static int update_volume(int vol_id, int bytes)
 
 	/* read data back and check */
 	while (rd < bytes) {
-		int to_read = rand() % (bytes - rd);
+		int to_read = rand_r(&seed) % (bytes - rd);
 
 		if (to_read == 0)
 			to_read = 1;
@@ -136,10 +137,11 @@ err_close:
 static void *update_thread(void *ptr)
 {
 	int vol_id = (long)ptr, i;
+	unsigned int seed = seed_random_generator();
 
 	for (i = 0; i < ITERATIONS; i++) {
-		int ret, bytes = (rand() % (vol_size - 1)) + 1;
-		int remove = !(rand() % 16);
+		int ret, bytes = (rand_r(&seed) % (vol_size - 1)) + 1;
+		int remove = !(rand_r(&seed) % 16);
 
 		/* From time to time remove the volume */
 		if (remove) {
@@ -171,6 +173,7 @@ static void *write_thread(void *ptr)
 	char *vol_node = vol_nodes[vol_id];
 	unsigned char *wbuf = wbufs[vol_id];
 	unsigned char *rbuf = rbufs[vol_id];
+	unsigned int seed = seed_random_generator();
 
 	fd = open(vol_node, O_RDWR);
 	if (fd == -1) {
@@ -186,7 +189,7 @@ static void *write_thread(void *ptr)
 	}
 
 	for (i = 0; i < ITERATIONS * VOL_LEBS; i++) {
-		int j, leb = rand() % VOL_LEBS;
+		int j, leb = rand_r(&seed) % VOL_LEBS;
 		off_t offs = dev_info.leb_size * leb;
 
 		ret = ubi_leb_unmap(fd, leb);
@@ -197,7 +200,7 @@ static void *write_thread(void *ptr)
 		}
 
 		for (j = 0; j < dev_info.leb_size; j++)
-			wbuf[j] = rand() % 255;
+			wbuf[j] = rand_r(&seed) % 255;
 		memset(rbuf, '\0', dev_info.leb_size);
 
 		ret = pwrite(fd, wbuf, dev_info.leb_size, offs);
@@ -233,7 +236,6 @@ int main(int argc, char * const argv[])
 	int i, ret;
 	pthread_t threads[THREADS_NUM];
 
-	seed_random_generator();
 	if (initial_check(argc, argv))
 		return 1;
 
-- 
2.1.4
