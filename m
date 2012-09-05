Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T98CC-0006Kt-95
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2012 05:30:36 +0000
Received: by weyr3 with SMTP id r3so96808wey.36
 for <linux-mtd@lists.infradead.org>; Tue, 04 Sep 2012 22:30:34 -0700 (PDT)
Date: Wed, 5 Sep 2012 08:30:20 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 1/3] mtd: cmdlinepart: make the partitions rule more strict
Message-ID: <20120905083020.0bf6b0bd@halley>
In-Reply-To: <5046B504.6000608@freescale.com>
References: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
 <1346656701.3061.8.camel@sauron.fi.intel.com>
 <CAMiH66GX7h5tve9CLHzj8MMrUv90fL+4BWYPZ6KQkP5bbXY9ag@mail.gmail.com>
 <1346686544.3061.75.camel@sauron.fi.intel.com>
 <20120904144826.7b9b7518@halley> <5046B504.6000608@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <shijie8@gmail.com>, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 5 Sep 2012 10:12:20 +0800 Huang Shijie <b32955@freescale.com> wrote:
> yes, it's really simple and flexible.
> But I think it's not wise to export the 0-size partition to user.
> The user may confused at this.
> 
> And the mtd-utils, such as mtd-info/mtd-debug, do they can work with a 
> 0-size partition?

I think the 0 sized partition case is really seldom, don't worth the
trouble, the user will probably observe something went wrong in his
cmdline parts specification.

But nevertheless, if we think it's a MUST to forbid the 0 sized
partitions, then amend my patch as follows:

(sorry, didn't even compile tested this, please review and test, if the
approach is acceptible)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 17b0bd4..aed1b8a 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -319,12 +319,22 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 				if (part->parts[i].size == SIZE_REMAINING)
 					part->parts[i].size = master->size - offset;
 
+				if (part->parts[i].size == 0) {
+					printk(KERN_WARNING ERRP
+					       "%s: skipping zero sized partition\n",
+					       part->mtd_id);
+					part->num_parts--;
+					memmove(&part->parts[i],
+						&part->parts[i + 1],
+						sizeof(*part->parts) * (part->num_parts - i));
+					continue;
+				}
+
 				if (offset + part->parts[i].size > master->size) {
 					printk(KERN_WARNING ERRP
 					       "%s: partitioning exceeds flash size, truncating\n",
 					       part->mtd_id);
 					part->parts[i].size = master->size - offset;
-					part->num_parts = i;
 				}
 				offset += part->parts[i].size;
 			}

Also, I'll send a short coding cleanup patch, this loop's indent level
is horrible...

Regards,
Shmulik
