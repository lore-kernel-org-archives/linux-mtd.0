Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GzsEj-0007oT-6a
	for linux-mtd@lists.infradead.org; Thu, 28 Dec 2006 05:11:48 -0500
Subject: Re: OneNAND: soft lockup
From: Artem Bityutskiy <dedekind@infradead.org>
To: kyungmin.park@samsung.com
In-Reply-To: <1167300503.4217.21.camel@sauron>
References: <3032008.882331167270436184.JavaMail.weblogic@ep_ml22>
	<1167300503.4217.21.camel@sauron>
Content-Type: multipart/mixed; boundary="=-eB3l4UicjVxxGc4i1eWy"
Date: Thu, 28 Dec 2006 12:11:29 +0200
Message-Id: <1167300689.4217.23.camel@sauron>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-eB3l4UicjVxxGc4i1eWy
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 2006-12-28 at 12:08 +0200, Artem Bityutskiy wrote:
> Well, it's about calling cond_resched() in JFFS2's loops. Please, try
> this patch.
Attached now.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)

--=-eB3l4UicjVxxGc4i1eWy
Content-Disposition: attachment; filename=reschedule-in-loops.diff
Content-Type: application/mbox; name=reschedule-in-loops.diff
Content-Transfer-Encoding: 7bit

>From 21b717500463ab32c18f81882510bec1aa05e3ae Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <dedekind@infradead.org>
Date: Thu, 28 Dec 2006 12:01:41 +0200
Subject: [JFFS2] Reschedule in loops

Make JFFS2 nicer and teach it to call cond_resched() in loops
which may be quite large.

Signed-off-by: Artem Bityutskiy <dedekind@infradead.org>
---
 fs/jffs2/scan.c    |    2 ++
 fs/jffs2/summary.c |    2 ++
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index ee4fc50..354ac2f 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -138,6 +138,8 @@ int jffs2_scan_medium(struct jffs2_sb_info *c)
 	for (i=0; i<c->nr_blocks; i++) {
 		struct jffs2_eraseblock *jeb = &c->blocks[i];
 
+		cond_resched();
+
 		/* reset summary info for next eraseblock scan */
 		jffs2_sum_reset_collected(s);
 
diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
index c4f7e47..2526596 100644
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -396,6 +396,8 @@ static int jffs2_sum_process_sum_data(struct jffs2_sb_info *c, struct jffs2_eras
 	for (i=0; i<je32_to_cpu(summary->sum_num); i++) {
 		dbg_summary("processing summary index %d\n", i);
 
+		cond_resched();
+
 		/* Make sure there's a spare ref for dirty space */
 		err = jffs2_prealloc_raw_node_refs(c, jeb, 2);
 		if (err)
-- 
1.4.4.2


--=-eB3l4UicjVxxGc4i1eWy--
