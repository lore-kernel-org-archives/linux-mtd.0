Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SEzPg-0001V5-IE
 for linux-mtd@lists.infradead.org; Tue, 03 Apr 2012 08:48:29 +0000
Received: by werp11 with SMTP id p11so2689775wer.36
 for <linux-mtd@lists.infradead.org>; Tue, 03 Apr 2012 01:48:26 -0700 (PDT)
Date: Tue, 3 Apr 2012 11:48:18 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 4/4] MTD: drivers return max_bitflips, mtd returns -EUCLEAN
Message-ID: <20120403114818.1cea9f2b@pixies.home.jungo.com>
In-Reply-To: <4F79D668.9090903@newsguy.com>
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331500873-9792-5-git-send-email-mikedunn@newsguy.com>
 <CAN8TOE_Zwg1evBBCSY3zcV6=O07WVyXf2ZOtgf7qgKGLUBcBrQ@mail.gmail.com>
 <4F765873.6090209@newsguy.com> <20120331093752.341037b4@halley>
 <4F79D668.9090903@newsguy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 02 Apr 2012 09:40:08 -0700 Mike Dunn <mikedunn@newsguy.com> wrote:
> Hi Shmulik,
> 
> On 03/30/2012 11:37 PM, Shmulik Ladkani wrote:
> > Please re-consider having the 'euclean_threshold' comparison within the
> > NAND infrastructure (nand_base.c and clones), instead of within the
> > generic 'mtd_read()' wrapper, as discussed in [1].
> 
> 
> This isn't possible given the intended functionality of the patches.  The plan
> is to allow the user to adjust the bitflip_threshold through sysfs, and do it
> uniquely for each partition.  Since the driver itself receives as its argument
> the mtd_info for the master, not the partition, it can't compare the bitflip
> count with the appropriate threshold to determine whether or not to return
> -EUCLEAN.  

Ok.

Now I understand why you submitted [l2-mtd ac5b1dd mtd: fix partition
wrapper functions]...
You rely on ac5b1dd in order for the comparison to be executed per
partition.
Reasnoable, however delicate. The reslationship between the
'euclean_threeshold' feature and this patch is implicit and not obvious.
It raises a concern that one might later change the behavior of
'part_read' to use the mtd_read wrapper for some reason, without
understanding the affects.

Anyway, looking on it in a broader perspective, can you please state
use-case examples where one might set different thresholds for different
partitions of same device?
I mean, do we really need that granularity?

Regards,
Shmulik
