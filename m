Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNUqZ-0003gR-PD
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 23:45:16 +0000
Received: by pabxd6 with SMTP id xd6so55454866pab.2
 for <linux-mtd@lists.infradead.org>; Thu, 06 Aug 2015 16:44:54 -0700 (PDT)
Date: Thu, 6 Aug 2015 16:44:50 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Jaiprakash Singh <b44839@freescale.com>
Subject: Re: [PATCH v5 RESEND] IFC: Change IO accessor based on endianness
Message-ID: <20150806234450.GU10676@google.com>
References: <1432174631-30091-1-git-send-email-scottwood@freescale.com>
 <20150806165220.GS10676@google.com>
 <1438903478.2097.196.camel@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438903478.2097.196.camel@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 06, 2015 at 06:24:38PM -0500, Scott Wood wrote:
> On Thu, 2015-08-06 at 09:52 -0700, Brian Norris wrote:
> > Who takes patches for drivers/memory/ again? I can take it via MTD if
> > no one else steps up.
>  There's no maintainer listed.  IIRC, when we previously discussed the patch 
> we both said that it could go via either of our trees.  I'll take it via mine.

I recall the conversation. I was just confused (again) by there being no
maintainer entry. Have at it.

> > It's nothing new, but this patch continues the pattern of using a global
> > pointer to the IFC device structure. Not pretty, but not worth holding
> > this up over.
> 
> It's not pretty, but I see little reason to come up with more complicated 
> infrastructure for the drivers finding each other given the low odds of ever 
> seeing a single-kernel system with more than one IFC.  It's impossible with 
> current chips.  If it ever does happen we can do something fancier.

Yep, I figured as much.

Brian
