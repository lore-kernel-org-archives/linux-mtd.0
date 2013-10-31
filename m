Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbukY-00047u-4M
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2013 16:05:34 +0000
Received: by mail-ie0-f178.google.com with SMTP id x13so5287715ief.23
 for <linux-mtd@lists.infradead.org>; Thu, 31 Oct 2013 09:05:12 -0700 (PDT)
Date: Thu, 31 Oct 2013 12:05:06 -0400
From: Brian Norris <computersforpeace@gmail.com>
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [Rebase/PATCHv2] drivers: mtd: m25p80: Add quad read support.
Message-ID: <20131031160506.GC4700@norris.computersforpeace.net>
References: <1383124802-25079-1-git-send-email-sourav.poddar@ti.com>
 <20131030231930.GD20059@norris.computersforpeace.net>
 <5271E423.9030506@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5271E423.9030506@ti.com>
Cc: marex@denx.de, linux-mtd@lists.infradead.org, balbi@ti.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 31, 2013 at 10:31:23AM +0530, Sourav Poddar wrote:
> On Thursday 31 October 2013 04:49 AM, Brian Norris wrote:
> >On Wed, Oct 30, 2013 at 02:50:02PM +0530, Sourav Poddar wrote:
> >>@@ -95,6 +102,7 @@ struct m25p {
> >>  	u8			program_opcode;
> >>  	u8			*command;
> >>  	bool			fast_read;
> >>+	bool                    quad_read;
> >Did you have a response to my earlier suggestion that the fast_read and
> >quad_read fields be combined to a single field? This could easily be an
> >enum, and I think it could help some of the other code. It also wouldn't
> >require us to remember that quad_read takes precedence over fast_read
> >(which you do implicitly in this patch). And we can already foresee
> >additional switches needed if we add the DDR command types (Huang was
> >looking at this?), so we should just get it right now.
> >
> >You could, perhaps, make this two patches: one for converting the bool
> >to an enum, and the other for supporting quad-read.
> >
> I read that, and I was planning to take that as a seperate
> excercise, but yes I
> will cook this into two independent patches.

I think it is good to require the correct design principle (and
appropriate cleanup) before adding new features.

Brian
