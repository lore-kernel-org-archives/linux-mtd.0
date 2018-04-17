Received: from secvs01.rockwellcollins.com ([205.175.225.240])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8RRp-0002Ko-6m
 for linux-mtd@lists.infradead.org; Tue, 17 Apr 2018 14:19:07 +0000
From: Ronak Desai <ronak.desai@rockwellcollins.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubihealthd : Updated ubihealthd to handle large UBI volumes
 and fix some issues
Date: Tue, 17 Apr 2018 09:18:45 -0500
Message-Id: <1523974725-9860-1-git-send-email-ronak.desai@rockwellcollins.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch updates ubihealthd for the following things,
1) Do statistic updates in chunk of 500 erase blocks.
2) Updated logic to read stats from the pre-existing stat file.
3) Checked shutdown flag before doing read or scrub work
4) Fixed incorrect value of peb number passing to read_peb and scrub_peb.
5) Added some sleep in loops so that processor can have scheduling time.

Note : This is an update to the work which Richard did in past
(https://lwn.net/Articles/663751/). Without these changes, ubihealthd
will cause heavy CPU load and won't respond to user signals when running
with large UBI volumes.  I have tested these changes on target HW
where UBI volume size is greater than 60 GB.

Signed-off-by: Ronak Desai <ronak.desai@rockwellcollins.com>
---
 ubihealthd.c | 83 ++++++++++++++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 69 insertions(+), 14 deletions(-)

diff --git a/ubihealthd.c b/ubihealthd.c
index 4be15d5..c82c077 100644
--- a/ubihealthd.c
+++ b/ubihealthd.c
@@ -55,6 +55,9 @@
 #define log_info(M, ...) _log(3, "[INFO]" M, ##__VA_ARGS__);
 #define log_debug(M, ...) _log(4, "[DEBUG]" M, ##__VA_ARGS__);
 
+#define STAT_PEB_CHUNK  (500)
+static int peb_start;
+static int peb_end;
 
 int log_level;
 
@@ -215,6 +218,9 @@ static int init_stats(int fd, struct list_head *head, int pnum)
 {
 	int i, err = 0;
 	size_t req_size = pnum * sizeof(struct ubi_stats_entry);
+	struct timespec wait;
+	wait.tv_sec = 0;
+	wait.tv_nsec = 2; /* 2ns */
 	struct ubi_stats_req *req = malloc(sizeof(struct ubi_stats_req) + req_size);
 	if (!req) {
 		log_err("Could not alloc ubi_stats_req: %s", strerror(errno));
@@ -253,6 +259,7 @@ static int init_stats(int fd, struct list_head *head, int pnum)
 		}
 		p->peb = peb;
 		list_add_tail(&p->list, head);
+		(void)nanosleep(&wait, NULL);
 	}
 	free(req);
 	return 0;
@@ -273,6 +280,9 @@ static void free_list(struct peb_list *head)
 
 static int update_stats(int fd, struct peb_list *head, int pnum)
 {
+	struct timespec wait;
+	wait.tv_sec = 0;
+	wait.tv_nsec = 2; /* 2ns */
 	if (list_empty(&head->list)) {
 		log_fatal("PEB list not initialized");
 		return -1;
@@ -295,8 +305,23 @@ static int update_stats(int fd, struct peb_list *head, int pnum)
 		return -1;
 	}
 	log_debug("Kernel reported stats for %d PEBs", err);
+
+	/* Divide the total number of PEBs in a small chunk(STAT_PEB_CHUNK) for
+	 * statistic updates so that statistic updates can be done in parts.
+	 */
+	if (err > STAT_PEB_CHUNK)
+	{
+		if ((peb_start + STAT_PEB_CHUNK) < err)
+			peb_end = (peb_start + STAT_PEB_CHUNK);
+		else
+			peb_end = err;
+	}
+	else
+		peb_end = err;
+
+	log_debug("--> peb_start = %d, peb_end = %d PEBs", peb_start, peb_end);
 	time_t now = time(NULL);
-	for (i = 0; i < err; i++) {
+	for (i = peb_start; i < peb_end; i++) {
 		struct ubi_stats_entry *s = &req->stats[i];
 		struct peb_list *p = NULL;
 		struct peb_info *peb = NULL;
@@ -319,6 +344,18 @@ static int update_stats(int fd, struct peb_list *head, int pnum)
 			peb->prev_read_cnt = peb->read_cnt;
 		peb->last_stat_update = now;
 	}
+
+	if (err > STAT_PEB_CHUNK)
+	{
+		if (peb_end == err)
+		{
+			peb_start = 0;
+			peb_end = 0;
+		}
+		else
+			peb_start += STAT_PEB_CHUNK;
+	}
+
 	free(req);
 	return 0;
 }
@@ -326,8 +363,9 @@ static int update_stats(int fd, struct peb_list *head, int pnum)
 static int read_peb(int fd, struct peb_info *peb)
 {
 	time_t now = time(NULL);
+	int32_t peb_num = (int32_t)peb->peb_num;
 	log_debug("Reading PEB %"PRIu64 , peb->peb_num);
-	int err = ioctl(fd, UBI_IOCRPEB, &peb->peb_num);
+	int err = ioctl(fd, UBI_IOCRPEB, &peb_num);
 	if (err < 0) {
 		log_err("Error while reading PEB %" PRIu64, peb->peb_num);
 		return -1;
@@ -339,8 +377,9 @@ static int read_peb(int fd, struct peb_info *peb)
 static int scrub_peb(int fd, struct peb_info *peb)
 {
 	time_t now = time(NULL);
+	int32_t peb_num = (int32_t)peb->peb_num;
 	log_debug("Scrubbing PEB %"PRIu64, peb->peb_num);
-	int err = ioctl (fd, UBI_IOCSPEB, &peb->peb_num);
+	int err = ioctl (fd, UBI_IOCSPEB, &peb_num);
 	if (err < 0) {
 		log_err("Error while scrubbing PEB %" PRIu64, peb->peb_num);
 		return -1;
@@ -427,6 +466,9 @@ static int read_stats_file(const char *filename, struct peb_list *peb_head, stru
 	uint64_t magic_version;
 	FILE *file = fopen(filename, "rb");
 	ssize_t i;
+	struct timespec wait;
+	wait.tv_sec = 0;
+	wait.tv_nsec = 2; /* 2ns */
 	if (file == NULL)
 		return -1;
 	fread(&magic_version, sizeof(magic_version), 1, file);
@@ -438,20 +480,20 @@ static int read_stats_file(const char *filename, struct peb_list *peb_head, stru
 	fread(&num_pebs, sizeof(num_pebs), 1, file);
 	fread(&next_read_peb, sizeof(next_read_peb), 1, file);
 	fread(&next_scrub_peb, sizeof(next_scrub_peb), 1, file);
-	for (i = 0; i < num_pebs; i++) {
+
+	struct peb_list *q = NULL;
+	list_for_each_entry(q, &peb_head->list, list) {
 		struct peb_info *peb = malloc(sizeof(struct peb_info));
 		if (!peb) {
 			log_err("Could not allocate peb_info");
 			return -1;
 		}
-		struct peb_list *p = NULL;
 		fread(peb, sizeof(struct peb_info), 1, file);
-		list_for_each_entry(p, &peb_head->list, list) {
-			if (p->peb && (p->peb->peb_num == peb->peb_num)) {
-				free(p->peb);
-				p->peb = peb;
-			}
+		if (q->peb && (q->peb->peb_num == peb->peb_num)) {
+			free(q->peb);
+			q->peb = peb;
 		}
+		(void)nanosleep(&wait, NULL);
 	}
 	/* init read and scrub lists */
 	struct peb_list *p = NULL;
@@ -460,6 +502,7 @@ static int read_stats_file(const char *filename, struct peb_list *peb_head, stru
 			schedule_peb(&sched_read_head->list, p->peb, SCHED_READ);
 		if (p->peb->peb_num >= next_scrub_peb)
 			schedule_peb(&sched_scrub_head->list, p->peb, SCHED_SCRUB);
+		(void)nanosleep(&wait, NULL);
 	}
 	p = NULL;
 	list_for_each_entry(p, &peb_head->list, list) {
@@ -467,6 +510,7 @@ static int read_stats_file(const char *filename, struct peb_list *peb_head, stru
 			schedule_peb(&sched_read_head->list, p->peb, SCHED_READ);
 		if (p->peb->peb_num < next_scrub_peb)
 			schedule_peb(&sched_scrub_head->list, p->peb, SCHED_SCRUB);
+		(void)nanosleep(&wait, NULL);
 	}
 
 	return 0;
@@ -506,6 +550,9 @@ int main(int argc, char **argv)
 	struct peb_list *peb_head;
 	const char *stats_file = "/tmp/ubihealth_stats";
 	const char *ubi_dev = "/dev/ubi0";
+	struct timespec wait;
+	wait.tv_sec = 0;
+	wait.tv_nsec = 2; /* 2 ns */
 	log_level = 4;
 
 	while ((c = getopt_long(argc, argv, opt_string, options, &i)) != -1) {
@@ -597,6 +644,7 @@ int main(int argc, char **argv)
 		list_for_each_entry(p, &peb_head->list, list) {
 			schedule_peb(&sched_read_head->list, p->peb, SCHED_READ);
 			schedule_peb(&sched_scrub_head->list, p->peb, SCHED_SCRUB);
+			(void)nanosleep(&wait, NULL);
 		}
 	}
 
@@ -652,7 +700,7 @@ int main(int argc, char **argv)
 			}
 		}
 		/* stats timer */
-		if (pfd[1].revents & POLLIN) {
+		if ((pfd[1].revents & POLLIN) && !shutdown) {
 			uint64_t tmp;
 			read(stats_timer, &tmp, sizeof(tmp));
 			/* update stats */
@@ -671,13 +719,20 @@ int main(int argc, char **argv)
 				/* read whole PEB if number of reads since last check is above threshold */
 				if (read_stats >= read_threshold) {
 					log_info("Too many reads for PEB %" PRIu64 " between stats updates, scheduling READ", peb->peb_num);
-					read_peb(fd, peb);
+					if (!read_peb(fd, peb))
+					{
+						/* No need to wait to update previous read count as
+						 * read is performed successfully.
+						 */
+						peb->prev_read_cnt = peb->read_cnt;
+					}
 				}
+				(void)nanosleep(&wait, NULL);
 			}
 		}
 
 		/* read_peb_timer */
-		if (pfd[2].revents & POLLIN) {
+		if ((pfd[2].revents & POLLIN) && !shutdown) {
 			uint64_t tmp;
 			read(pfd[2].fd, &tmp, sizeof(tmp));
 			/* do next peb read */
@@ -687,7 +742,7 @@ int main(int argc, char **argv)
 		}
 
 		/* scrub pebs */
-		if (pfd[3].revents & POLLIN) {
+		if ((pfd[3].revents & POLLIN) && !shutdown) {
 			uint64_t tmp;
 			read(pfd[3].fd, &tmp, sizeof(tmp));
 			/* do next peb scrub */
-- 
1.9.1
