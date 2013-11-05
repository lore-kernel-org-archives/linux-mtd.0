Received: from mail-ie0-x233.google.com ([2607:f8b0:4001:c03::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VdXe2-0006ec-FC
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2013 03:49:35 +0000
Received: by mail-ie0-f179.google.com with SMTP id aq17so14486341iec.10
 for <linux-mtd@lists.infradead.org>; Mon, 04 Nov 2013 19:49:13 -0800 (PST)
Date: Mon, 4 Nov 2013 19:49:09 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [Rebase/PATCHv2] drivers: mtd: m25p80: Add quad read support.
Message-ID: <20131105034909.GL20061@ld-irv-0074.broadcom.com>
References: <1383124802-25079-1-git-send-email-sourav.poddar@ti.com>
 <20131030231930.GD20059@norris.computersforpeace.net>
 <5271E423.9030506@ti.com>
 <20131031160506.GC4700@norris.computersforpeace.net>
 <52749222.2000707@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52749222.2000707@ti.com>
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

On Sat, Nov 02, 2013 at 11:18:18AM +0530, Sourav Poddar wrote:
> Hi Brian,
> On Thursday 31 October 2013 09:35 PM, Brian Norris wrote:
> >On Thu, Oct 31, 2013 at 10:31:23AM +0530, Sourav Poddar wrote:
> >>On Thursday 31 October 2013 04:49 AM, Brian Norris wrote:
> >>>On Wed, Oct 30, 2013 at 02:50:02PM +0530, Sourav Poddar wrote:
> >>>>@@ -95,6 +102,7 @@ struct m25p {
> >>>>  	u8			program_opcode;
> >>>>  	u8			*command;
> >>>>  	bool			fast_read;
> >>>>+	bool                    quad_read;
> >>>Did you have a response to my earlier suggestion that the fast_read and
> >>>quad_read fields be combined to a single field? This could easily be an
> >>>enum, and I think it could help some of the other code. It also wouldn't
> >>>require us to remember that quad_read takes precedence over fast_read
> >>>(which you do implicitly in this patch). And we can already foresee
> >>>additional switches needed if we add the DDR command types (Huang was
> >>>looking at this?), so we should just get it right now.
> >>>
> >>>You could, perhaps, make this two patches: one for converting the bool
> >>>to an enum, and the other for supporting quad-read.
> >>>
> >>I read that, and I was planning to take that as a seperate
> >>excercise, but yes I
> >>will cook this into two independent patches.
> >I think it is good to require the correct design principle (and
> >appropriate cleanup) before adding new features.
> >
> True, as per your suggestion, I will cook this up into two seperate patches.
> One for converting bools into enum.
> second for adding quad support.

Sounds good. Thanks.

> Few clarifications here:
> 1, I hope I can use l2-mtd to rebase my patch, I was seeing a mail about
> reverting certain patch, which I suppose is not required now.

I don't believe we are planning to revert any of the m25p80 patches
right now. If we make any further changes, I can reconcile conflicts.

> 2. Your patches were refactoring of the current code, where you were
> defaulting the
>   read opcode to fast read. If you carefully see my quad read patch,
> based on conditions,
>   I am assigning read opcode to quad or fast read, and by default, I
> am keeping it at
>  NORMAL READ. The reason behind this is that I think fast/dual/quad
> are special cases, which needs to
>  be set explicitly based on certain dt parameters and by default, we
> should stick to NORMAL read.

As I read your current patch, it does not actually change any of the
fast-read decisions that Marek and I were discussing.

> I hope you are fine with this approach too?

AFAICT, your current patch was fine (w.r.t. the fast-read problem).

Brian
