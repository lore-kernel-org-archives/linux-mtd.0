Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T2VUh-00041L-4u
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 22:58:19 +0000
Received: by yenq9 with SMTP id q9so4759418yen.36
 for <linux-mtd@lists.infradead.org>; Fri, 17 Aug 2012 15:58:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345114118.3393.199.camel@sauron.fi.intel.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-3-git-send-email-computersforpeace@gmail.com>
 <1345029870.3393.128.camel@sauron.fi.intel.com>
 <CAN8TOE9wC6_NQ=DMX70ovWzP4JuFZKsORgn53Jq9ZNSGcFiCig@mail.gmail.com>
 <1345114118.3393.199.camel@sauron.fi.intel.com>
Date: Fri, 17 Aug 2012 15:58:18 -0700
Message-ID: <CAN8TOE825Hoo=MGBFOb344D+G54pt6OZP5F4pcGc+_+2EXMKew@mail.gmail.com>
Subject: Re: [PATCH 2/8] mtd: check for max_bitflips in mtd_read_oob()
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, Mike Dunn <mikedunn@newsguy.com>,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 16, 2012 at 3:48 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Wed, 2012-08-15 at 12:15 -0700, Brian Norris wrote:
>> Note that there was a v2 of this patch, although the difference was
>> very minor (the comments and the Reviewed-by's). The end result is
>> almost the same as your amendments.
>
> Reviewed-by tags are important for me, because people spent time and
> they should be credited in some form in git log.

Right, I understood this, and those tags were reflected in my v2.

> I actually collected
> all the tags from the thread and added them when applying your patches.

Yes, I was only commenting that while you took and amended my v1, it
ended up being nearly identical to my v2 - including the Reviewed-by
tags. They only differed by some punctuation or something else
trivial.

Thanks!

Brian
