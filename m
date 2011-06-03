Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QSW1o-0001Dz-1s
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2011 15:11:12 +0000
Received: by ewy3 with SMTP id 3so883796ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jun 2011 08:11:08 -0700 (PDT)
Subject: Re: [PATCH 05/10] UBIFS: fix shrinker object count reports
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1307111413.3069.5.camel@localhost>
References: <1307109001-19761-1-git-send-email-dedekind1@gmail.com>
	<1307109001-19761-6-git-send-email-dedekind1@gmail.com>
	<1307108926.3069.0.camel@localhost> <1307111413.3069.5.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jun 2011 18:06:59 +0300
Message-ID: <1307113619.3069.14.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

So,

>From cf610bf4199770420629d3bc273494bd27ad6c1d Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Tue, 31 May 2011 07:03:21 +0300
Subject: [PATCH] UBIFS: fix shrinker object count reports

Sometimes VM asks the shrinker to return amount of objects it can shrink,
and we return the ubifs_clean_zn_cnt in that case. However, it is possible
that this counter is negative for a short period of time, due to the way
UBIFS TNC code updates it. And I can observe the following warnings sometimes:

shrink_slab: ubifs_shrinker+0x0/0x2b7 [ubifs] negative objects to delete nr=-8541616642706119788

This patch makes sure UBIFS never returns negative count of objects.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: stable@kernel.org
---
 fs/ubifs/shrinker.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/shrinker.c b/fs/ubifs/shrinker.c
index ca953a9..9e1d056 100644
--- a/fs/ubifs/shrinker.c
+++ b/fs/ubifs/shrinker.c
@@ -284,7 +284,11 @@ int ubifs_shrinker(struct shrinker *shrink, struct shrink_control *sc)
 	long clean_zn_cnt = atomic_long_read(&ubifs_clean_zn_cnt);
 
 	if (nr == 0)
-		return clean_zn_cnt;
+		/*
+		 * Due to the way UBIFS updates the clean znode counter it may
+		 * temporarily be negative.
+		 */
+		return clean_zn_cnt >= 0 ? clean_zn_cnt : 1;
 
 	if (!clean_zn_cnt) {
 		/*
-- 
1.7.2.3

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
