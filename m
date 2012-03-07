Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5JpX-0001iM-Ua
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 16:35:12 +0000
Message-ID: <1331138261.3463.19.camel@sauron.fi.intel.com>
Subject: Re: UBI/ubifs problem
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Wed, 07 Mar 2012 18:37:41 +0200
In-Reply-To: <Pine.LNX.4.64.1203071723410.21132@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1202161543340.13194@lnxricardw.se.axis.com>
 <Pine.LNX.4.64.1202171107440.13194@lnxricardw.se.axis.com>
 <1331131250.32316.8.camel@sauron.fi.intel.com>
 <Pine.LNX.4.64.1203071723410.21132@lnxricardw.se.axis.com>
Content-Type: multipart/mixed; boundary="=-pKBTYIBeS6mpTF0IlyMS"
Mime-Version: 1.0
Cc: Ricard =?ISO-8859-1?Q?Wanderl=F6f?= <ricardw@axis.com>,
 Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-pKBTYIBeS6mpTF0IlyMS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-07 at 17:26 +0100, Ricard Wanderlof wrote:
> Is it possible to get mkfs.ubifs to create an image without specifying the 
> max-leb-count ? I.e. just to create an image that is as big as it has to 
> be.

Has to be? :-) Not sure how to find this out. Basically the idea was
that you know how big is has to be and translate that to
--max-leb-count.

> > P.S. I did not even compile - test the below patch, but will push out a
> > tested version.
> 
> Thanks for the patch, I'll try to test it.

It broke compilation, the working one is attached.

-- 
Best Regards,
Artem Bityutskiy

--=-pKBTYIBeS6mpTF0IlyMS
Content-Disposition: attachment; filename="0001-UBIFS-improve-error-messages.patch"
Content-Type: text/x-patch; name="0001-UBIFS-improve-error-messages.patch";
	charset="UTF-8"
Content-Transfer-Encoding: 7bit

>From 5a1f36c90c9b21a7aa31c29a1926b376dd6a11cf Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Wed, 7 Mar 2012 16:29:45 +0200
Subject: [PATCH] UBIFS: improve error messages

Ricard complaints that the following error message is odd:

"UBIFS error (pid 1578): validate_sb: bad superblock, error 8"

and he is right. This patch improves the error messages a bit and makes
them more user-friendly.

Reported-by: Ricard Wanderlof <ricard.wanderlof@axis.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/sb.c |   19 ++++++++++++++-----
 1 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index 6094c5a..771f7fb 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -410,13 +410,23 @@ static int validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup)
 	}
 
 	if (c->main_lebs < UBIFS_MIN_MAIN_LEBS) {
-		err = 7;
+		ubifs_err("too few main LEBs count %d, must be at least %d",
+			  c->main_lebs, UBIFS_MIN_MAIN_LEBS);
 		goto failed;
 	}
 
-	if (c->max_bud_bytes < (long long)c->leb_size * UBIFS_MIN_BUD_LEBS ||
-	    c->max_bud_bytes > (long long)c->leb_size * c->main_lebs) {
-		err = 8;
+	max_bytes = (long long)c->leb_size * UBIFS_MIN_BUD_LEBS;
+	if (c->max_bud_bytes < max_bytes) {
+		ubifs_err("too small journal (%lld bytes), must be at least "
+			  "%lld bytes",  c->max_bud_bytes, max_bytes);
+		goto failed;
+	}
+
+	max_bytes = (long long)c->leb_size * c->main_lebs;
+	if (c->max_bud_bytes > max_bytes) {
+		ubifs_err("too large journal size (%lld bytes), only %lld bytes"
+			  "available in the main area",
+			  c->max_bud_bytes, max_bytes);
 		goto failed;
 	}
 
@@ -450,7 +460,6 @@ static int validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup)
 		goto failed;
 	}
 
-	max_bytes = c->main_lebs * (long long)c->leb_size;
 	if (c->rp_size < 0 || max_bytes < c->rp_size) {
 		err = 14;
 		goto failed;
-- 
1.7.9.1


--=-pKBTYIBeS6mpTF0IlyMS--
