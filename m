Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SIl4U-0008U0-RZ
 for linux-mtd@lists.infradead.org; Fri, 13 Apr 2012 18:18:11 +0000
Message-ID: <4F886DDB.20003@newsguy.com>
Date: Fri, 13 Apr 2012 11:18:03 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 4/4] MTD: drivers return max_bitflips, mtd returns -EUCLEAN
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
 <1331500873-9792-5-git-send-email-mikedunn@newsguy.com>
 <CAN8TOE_Zwg1evBBCSY3zcV6=O07WVyXf2ZOtgf7qgKGLUBcBrQ@mail.gmail.com>
 <4F765873.6090209@newsguy.com> <20120331093752.341037b4@halley>
 <4F79D668.9090903@newsguy.com>
 <20120403114818.1cea9f2b@pixies.home.jungo.com>
 <1334332456.13160.1.camel@sauron.fi.intel.com>
In-Reply-To: <1334332456.13160.1.camel@sauron.fi.intel.com>
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

Sorry Shmulik, I didn't get your post again.  (Why?? I get a blizzard of emails
from various lists, but seem to lose the important ones!)

On 04/13/2012 08:54 AM, Artem Bityutskiy wrote:
> On Tue, 2012-04-03 at 11:48 +0300, Shmulik Ladkani wrote:
>> Anyway, looking on it in a broader perspective, can you please state
>> use-case examples where one might set different thresholds for
>> different
>> partitions of same device?
>> I mean, do we really need that granularity?
> 
> Current MTD partitions support is very simple and makes it difficult to
> distinguished between partitions and not partitions.

Yes, the way the mtd code is structured, I think going through the partitions is
the correct way for the sake of cleanliness alone.

BTW, I haven't forgotten this.  I hope to have patches ready in a couple days.

Thanks,
Mike
