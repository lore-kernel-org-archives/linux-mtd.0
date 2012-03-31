Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SDmwo-0003tq-Rh
 for linux-mtd@lists.infradead.org; Sat, 31 Mar 2012 01:17:43 +0000
Message-ID: <4F765B2D.5040604@newsguy.com>
Date: Fri, 30 Mar 2012 18:17:33 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 4/4] MTD: drivers return max_bitflips, mtd returns -EUCLEAN
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331500873-9792-5-git-send-email-mikedunn@newsguy.com>
 <CAN8TOE_Zwg1evBBCSY3zcV6=O07WVyXf2ZOtgf7qgKGLUBcBrQ@mail.gmail.com>
 <1333109630.5440.18.camel@sauron.fi.intel.com>
In-Reply-To: <1333109630.5440.18.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/30/2012 05:13 AM, Artem Bityutskiy wrote:
> On Thu, 2012-03-29 at 10:30 -0700, Brian Norris wrote:
>> Did you test any non-NAND devices? I'm getting the feeling that some
>> of this is misguided or at least needs some fixing. See below.
> 
> you are right, these 2 should be reverted and Mike should come back with
> a better patch-set. I was not careful enough, and thanks for the review.


At least you were not the author.  Yes, thank you Brian.

Artem, I don't think you pushed the offending patches (3 and 4).  If you want to
leave the first two patches in, I'll be happy to fix them (they currently don't
do anything) when the whole efort is done.  Or else you can pull them and I'll
start from scratch.  Or slink away in shame :)  But I'd prefer to get this done
right.

Mike
