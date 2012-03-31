Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SDrx2-0001Oz-Pz
 for linux-mtd@lists.infradead.org; Sat, 31 Mar 2012 06:38:17 +0000
Received: by wibhj13 with SMTP id hj13so946270wib.0
 for <linux-mtd@lists.infradead.org>; Fri, 30 Mar 2012 23:38:14 -0700 (PDT)
Date: Sat, 31 Mar 2012 09:37:52 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 4/4] MTD: drivers return max_bitflips, mtd returns -EUCLEAN
Message-ID: <20120331093752.341037b4@halley>
In-Reply-To: <4F765873.6090209@newsguy.com>
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331500873-9792-5-git-send-email-mikedunn@newsguy.com>
 <CAN8TOE_Zwg1evBBCSY3zcV6=O07WVyXf2ZOtgf7qgKGLUBcBrQ@mail.gmail.com>
 <4F765873.6090209@newsguy.com>
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

Hi Mike,

On Fri, 30 Mar 2012 18:05:55 -0700 Mike Dunn <mikedunn@newsguy.com> wrote:
> > This seems wrong in the case that mtd->euclean_threshold == 0. 
> 
> > This could be the case for any of the following:
> > (1) NAND that uses ECC_NONE
> > (2) NAND drivers with HW_ECC that don't initialize chip->ecc.strength
> > (3) MTD without ECC (e.g., NOR)
> > (4) Other drivers that might have missed initializing mtd->ecc_strength
> > 
> 
> 
> > If I'm correct, (3) is quite significant, since non-ECC'd MTDs would
> > produce EUCLEAN statuses on every read.
> 
> 
> Yup.  Again, oops!
> 

Please re-consider having the 'euclean_threshold' comparison within the
NAND infrastructure (nand_base.c and clones), instead of within the
generic 'mtd_read()' wrapper, as discussed in [1].

This would inherently fix (3).

For code unification, we can have a small inlined function that does the
comparison, which may be used by nand_base.c and the clones.

[1]
http://lists.infradead.org/pipermail/linux-mtd/2012-March/040371.html
http://lists.infradead.org/pipermail/linux-mtd/2012-March/040343.html

Regards,
Shmulik
