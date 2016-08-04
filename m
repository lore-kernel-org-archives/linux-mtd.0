Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bVCBZ-0006Mw-4Q
 for linux-mtd@lists.infradead.org; Thu, 04 Aug 2016 06:31:17 +0000
Message-ID: <1470292252.2311.48.camel@gmail.com>
Subject: Re: [PATCH 2/2] ubi: attach: do not return -EINVAL if the
 mtd->numeraseregions is 1
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>
Cc: Rajeev Kumar <rajeev_kumar@mentor.com>, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
Date: Thu, 04 Aug 2016 09:30:52 +0300
In-Reply-To: <20160729182449.GA124841@google.com>
References: <1469440019-29358-1-git-send-email-rajeev_kumar@mentor.com>
 <1469440019-29358-2-git-send-email-rajeev_kumar@mentor.com>
 <5795EA8B.2040209@nod.at> <20160729182449.GA124841@google.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2016-07-29 at 11:24 -0700, Brian Norris wrote:
> (Artem, any opinions, since you had the most opinion last time this
> came
> up?)

Hi Brian, 

well, I do not have strong opinion. That UBI translates to "I do not
know how to deal with multiple regions", nothing else.

I think this was my understanding of numeraseregions

1. numaraseregions=0: no regions, just uniform flash.

2. numeraseregions=1: basically same as above, but friendlier to the
region-aware software. Indeed, if I care about regions, I do not want
to handle the special case of numerasereions=0, I want a common case
with numerasereionts>0.

Or to put it this way, from the drivers' writer POW:

numaraseregions=0 - do not know anything about regions, do not care.
Also pre-regions dirivers, old stuff

numeraseregions=1 - I want my driver to be ideal. Non-aware SW won't
look to the regions stuff, the aware SW will work nicely.

So my take is: ban numeraseregions=1 if you feel like, but I recommend
to just document the 0 (don't care/legacy) and 1 (same as 0, but care)
and allow for both.

Artem.
