Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsBxW-0007sB-Kc
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 11:33:11 +0000
Received: by wera10 with SMTP id a10so5295970wer.36
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 03:33:09 -0800 (PST)
From: Marek Vasut <marek.vasut@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Subject: Re: GPMI-NAND: Wrong ECC size in driver
Date: Tue, 31 Jan 2012 12:33:06 +0100
References: <201201040148.32847.marek.vasut@gmail.com>
 <201201050038.39448.marek.vasut@gmail.com> <4F04E558.7000002@freescale.com>
In-Reply-To: <4F04E558.7000002@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201201311233.06949.marek.vasut@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On 01/04/2012 05:38 PM, Marek Vasut wrote:
> > Scott Wood wrote:
> >> On 01/04/2012 03:32 PM, Marek Vasut wrote:
> >>> Scott Wood wrote:
> >>>> Can we just get rid of NAND_CHIPOPTIONS_MSK and trust that drivers
> >>>> won't set options that aren't appropriate?  Possibly replace it with
> >>>> documentation about which options are for chips, which are for
> >>>> drivers, and which (such as NAND_NO_SUBPAGE_WRITE) can be set by
> >>>> either.
> >>> 
> >>> Rather let's just adjust the mask?
> >> 
> >> The way the mask is used means that any given option can only be chip or
> >> driver, not both.  Though, I don't see anywhere this option is set by a
> >> chip -- maybe we can just renumber it to be in the controller half.
> > 
> > I suspect this was meant to allow controllers where one chip can do
> > subpage- write and the other can not.
> 
> What I mean is I don't see any place where this is actually used --
> gpmi-nand is the only place I see this flag being set (though it belongs
> on at least elbc as well).
> 
> >> I still don't see a whole lot of value in the mask, though -- seems to
> >> be just causing problems, especially given that bits set by the "wrong"
> >> component are silently discarded.
> > 
> > Yes. Patch is welcome to remove it and separate these two ;-)
> 
> Do they need to be separated?  Just OR them with no mask.  If either the
> controller or the chip set the flag, then it's set, and subpage writes
> are disallowed.  Obviously you can only do this for certain types of
> options -- for others, just don't set the flag in an inappropriate context.
> 
> -Scott

BUMP?
