Received: from mail-wi0-f169.google.com ([209.85.212.169])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T8rcb-0003nw-NN
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 11:48:46 +0000
Received: by wibhm2 with SMTP id hm2so3798399wib.0
 for <linux-mtd@lists.infradead.org>; Tue, 04 Sep 2012 04:48:43 -0700 (PDT)
Date: Tue, 4 Sep 2012 14:48:26 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/3] mtd: cmdlinepart: make the partitions rule more strict
Message-ID: <20120904144826.7b9b7518@halley>
In-Reply-To: <1346686544.3061.75.camel@sauron.fi.intel.com>
References: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
 <1346656701.3061.8.camel@sauron.fi.intel.com>
 <CAMiH66GX7h5tve9CLHzj8MMrUv90fL+4BWYPZ6KQkP5bbXY9ag@mail.gmail.com>
 <1346686544.3061.75.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 03 Sep 2012 18:35:44 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> With the logic I suggested, for this case what I said would basically:
> 
> 1. Sort. This leads to
> 
> 100m@100m(kernel)
> 1g@200m(rootfs)
> 100m(boot)
> 
> "OFFSET_CONTINOUS" is always the largest and will be at the end when
> sorting.
> 
> 2. Verification.
> 
> We verify for overlaps and gaps. And refuse this one.

Artem, Huang,

Sorry for the long delay, got busy with urgent matters (found out I need
to go thru some surgery), I will probably not be available in the
upcoming days, but I've read the correspondance and wanted to share my
two cents...

My POV is that sorting and verification is not needed, is troublesome,
and might affect users in ways they don't expect.

So far, mtdparts commandline parsing has been very lenient and liberal.
I think we should keep this approach; give the user the flexibility,
he'll be responsible to provide meaningful cmdline parts for his
system.

Actually, Huang's initial complaint was that 'parse_cmdline_partitions'
was too strict - the truncated partition was not registered!

Now, philosophy aside, let's talk about some usecases that might break.

I remember overlapping partitions (more precisely, partition that is a
subset of another) being common in some embedded systems, where the
"rootfs" and "kernel" partitions are a subset of the "overall image"
partition.
Why break this? if users enjoy the flexibility, and careful not to
create silly partitions, I'm in favor of keeping the flexibility.

Same goes for sorting.
If one has a system hacked to work with mtd0 hardcodedly, but mtd0's
physical location is somewhere at the end of the device, why reorder the
partitions enumeration affecting this system?

I'd say keep it simple and flexible.
I trust the user to provide meaningful partitions in the cmdline.

Anyways, please consider this approach.

My patch suggestion might look as (and might need some rework):

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index 17b0bd4..f5df613 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -324,7 +324,6 @@ static int parse_cmdline_partitions(struct mtd_info *master,
                                               "%s: partitioning exceeds flash size, truncating\n",
                                               part->mtd_id);
                                        part->parts[i].size = master->size - offset;
-                                       part->num_parts = i;
                                }
                                offset += part->parts[i].size;
                        }

Regards,
Shmulik
