Received: from mail-bn1bon0141.outbound.protection.outlook.com
 ([157.56.111.141] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNUXA-0003xQ-Bv
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 23:25:13 +0000
Message-ID: <1438903478.2097.196.camel@freescale.com>
Subject: Re: [PATCH v5 RESEND] IFC: Change IO accessor based on endianness
From: Scott Wood <scottwood@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>,
 Jaiprakash Singh <b44839@freescale.com>
Date: Thu, 6 Aug 2015 18:24:38 -0500
In-Reply-To: <20150806165220.GS10676@google.com>
References: <1432174631-30091-1-git-send-email-scottwood@freescale.com>
 <20150806165220.GS10676@google.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2015-08-06 at 09:52 -0700, Brian Norris wrote:
> On Wed, May 20, 2015 at 09:17:11PM -0500, Scott Wood wrote:
> > From: Jaiprakash Singh <b44839@freescale.com>
> > 
> > IFC IO accressor are set at run time based
> > on IFC IP registers endianness.IFC node in
> > DTS file contains information about
> > endianness.
> > 
> > Signed-off-by: Jaiprakash Singh <b44839@freescale.com>
> > Signed-off-by: Scott Wood <scottwood@freescale.com>
> > ---
> > v5: I'm assuming it's the same as v4, but I didn't send v4, and this
> > comes from a versionless [RESEND] that never made it to the mailing list,
> > so bumping the version just in case.
> 
> Acked-by: Brian Norris <computersforpeace@gmail.com>
> 
> Who takes patches for drivers/memory/ again? I can take it via MTD if
> no one else steps up.
 There's no maintainer listed.  IIRC, when we previously discussed the patch 
we both said that it could go via either of our trees.  I'll take it via mine.

> It's nothing new, but this patch continues the pattern of using a global
> pointer to the IFC device structure. Not pretty, but not worth holding
> this up over.

It's not pretty, but I see little reason to come up with more complicated 
infrastructure for the drivers finding each other given the low odds of ever 
seeing a single-kernel system with more than one IFC.  It's impossible with 
current chips.  If it ever does happen we can do something fancier.

-Scott
