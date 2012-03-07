Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5I0Y-0006FE-N4
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 14:38:27 +0000
Message-ID: <1331131250.32316.8.camel@sauron.fi.intel.com>
Subject: Re: UBI/ubifs problem
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Wed, 07 Mar 2012 16:40:50 +0200
In-Reply-To: <Pine.LNX.4.64.1202171107440.13194@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1202161543340.13194@lnxricardw.se.axis.com>
 <Pine.LNX.4.64.1202171107440.13194@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2012-02-17 at 11:13 +0100, Ricard Wanderlof wrote:
> Yesterday I reported a problem I had when flashing a ubifs volume.
> 
> On Thu, 16 Feb 2012, Ricard Wanderlof wrote:
> 
> > ...
> > UBIFS error (pid 2965): validate_sb: bad superblock, error 8
> > mount: Mounting ubi0:rwfs on /mnt/2 failed: Invalid argument
> > ...
> 
> I think I've figured this out part way. I've been specifying a 
> --max-leb-count of 1000 to mkfs.ubifs, thinking that it basically just 
> sets a maximum size for the resulting file system. But it seems that it 
> also sets some sort of bounds for how much space it expects to take up in 
> the volume. If I reduce the --max-leb-count to the size of the target 
> volume, I get no errors and the file system mounts fine.

When you specify --max-leb-count=1000, but not specify the journal size,
mkfs.ubifs defines the journal size to be around 12% of that, but not
larger than 8MiB. This sets the low UBI volume size boundary.

So basically the error you get means that your UBI volume is too small
to fit the journal.

To see the journal size of your image use -v mkfs.ubifs option when you
generate it.

You can define your own journal size using the --jrn-size mkfs.ubifs
option.

> That being so, I think the resulting error message is odd, which indicates 
> there is a bug somewhere, probably in mkfs.ubifs ?

I agree that the message is odd. Below is the patch which I'll push to
linux-ubifs.git as soon as git.infradead.org is available (it is down
now for the reasons I do not know). I am open to additional or different
suggestions. Thanks!

P.S. I did not even compile - test the below patch, but will push out a
tested version.

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
index 6094c5a..4d4ef12 100644
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
+		ubifs_err("too small journal (%lld bytes), must be at least ""
+			  %lld bytes",  c->max_bud_bytes, max_bytes);
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

-- 
Best Regards,
Artem Bityutskiy
