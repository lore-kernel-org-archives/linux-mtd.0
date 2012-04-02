Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SEkIt-0000hs-Bl
 for linux-mtd@lists.infradead.org; Mon, 02 Apr 2012 16:40:27 +0000
Message-ID: <4F79D668.9090903@newsguy.com>
Date: Mon, 02 Apr 2012 09:40:08 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: [PATCH 4/4] MTD: drivers return max_bitflips, mtd returns -EUCLEAN
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331500873-9792-5-git-send-email-mikedunn@newsguy.com>
 <CAN8TOE_Zwg1evBBCSY3zcV6=O07WVyXf2ZOtgf7qgKGLUBcBrQ@mail.gmail.com>
 <4F765873.6090209@newsguy.com> <20120331093752.341037b4@halley>
In-Reply-To: <20120331093752.341037b4@halley>
Content-Type: text/plain; charset=ISO-8859-1
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

Hi Shmulik,

On 03/30/2012 11:37 PM, Shmulik Ladkani wrote:
> Please re-consider having the 'euclean_threshold' comparison within the
> NAND infrastructure (nand_base.c and clones), instead of within the
> generic 'mtd_read()' wrapper, as discussed in [1].


This isn't possible given the intended functionality of the patches.  The plan
is to allow the user to adjust the bitflip_threshold through sysfs, and do it
uniquely for each partition.  Since the driver itself receives as its argument
the mtd_info for the master, not the partition, it can't compare the bitflip
count with the appropriate threshold to determine whether or not to return
-EUCLEAN.  Here, "driver" refers to the nand imfrastructure code or the drivers
for the two nand-with-ecc devices that don't use the nand interface
(nand/alauda.c and devices/docg3.c).

Thanks,
Mike
