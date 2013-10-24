Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZFjH-0008St-LU
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 07:53:16 +0000
Received: by mail-pa0-f50.google.com with SMTP id fb1so1752525pad.23
 for <linux-mtd@lists.infradead.org>; Thu, 24 Oct 2013 00:52:54 -0700 (PDT)
Date: Thu, 24 Oct 2013 00:52:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: gpmi: fix the ecc regression
Message-ID: <20131024075249.GB9863@norris.computersforpeace.net>
References: <1382418628-4521-1-git-send-email-b32955@freescale.com>
 <20131022185639.GK23337@ld-irv-0074.broadcom.com>
 <5268C56E.8050806@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5268C56E.8050806@freescale.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 dedekind1@gmail.com, tharvey@gateworks.com, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 24, 2013 at 02:59:58PM +0800, Huang Shijie wrote:
> Hi David & Mark & Brian:
> 
>    thanks for your review and comments.
> >... so why don't you just add a DT property to actually specify the ECC
> >selection itself, rather than indirectly specifying it through a vague
> Do you mean i should add a DT property like "fsl, gpmi-use-new-ecclayout" ?
> 
> I am not understand "the ECC selection itself".

Sorry if that was unclear. I was recommending that the DT property
actually specify what the properties of the ECC layout were. Like ECC
strength (as an integer). Or spare area/step size/whatever else needed
to specify what these legacy and new layouts actually are. Your binding
was too vague; it wasn't describing what the layout is.

David seemed to suggest that something like your current binding might
be OK. (I still thing it was too vague, but if you can describe it
better, it may be sufficient.) A possible starting point:
"fsl,use-minimum-ecc". Does this properly reflect your intention of
using the datasheet's minimum required ECC (from ONFI or from the
driver's full ID table)?

But all that beside, I think your first priority is to fix the
regression for the current release cycle. I'm not keen on trying to
agree on a good DT binding and get it merged immediately.

Can you resend in two patches? The first one will default to using
legacy_set_geometry() to retain the old behavior and prevent
regressions. The second one can add a DT binding to re-introduce support
for your new layout. That way we can take the first one with no
question, and the second one can be taken when it's ready: either for
3.12 or 3.13.

Brian
