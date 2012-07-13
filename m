Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Spija-0008A4-Nw
 for linux-mtd@lists.infradead.org; Fri, 13 Jul 2012 16:28:52 +0000
From: Marek Vasut <marex@denx.de>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH] mtd: add a new macro about the subpage write
Date: Fri, 13 Jul 2012 18:28:31 +0200
References: <1341293533-2214-1-git-send-email-b32955@freescale.com>
 <201207131740.10668.marex@denx.de>
 <CAMiH66FNn3YrqiCdYj7aAP8qR3VtH5r7q4Gza=0=vQtOoj_5bw@mail.gmail.com>
In-Reply-To: <CAMiH66FNn3YrqiCdYj7aAP8qR3VtH5r7q4Gza=0=vQtOoj_5bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201207131828.31880.marex@denx.de>
Cc: dedekind1@gmail.com, Jan Weitzel <j.weitzel@phytec.de>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Scott Wood <scottwood@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> On Fri, Jul 13, 2012 at 11:40 AM, Marek Vasut <marex@denx.de> wrote:
> > Dear Huang Shijie,
> > 
> >> On Fri, Jul 13, 2012 at 6:35 AM, Marek Vasut <marex@denx.de> wrote:
> >> > Dear Huang Shijie,
> >> > 
> >> >> Hi Brian:
> >> >> > Wood [1]; I don't see a good reason not to just kill the
> >> >> > NAND_CHIPOPTIONS_MSK instead of adding more flags. As long as we
> >> >> > perform a few sanity tests, I think it'd be safe.
> >> >> 
> >> >> I think it's more clear in logic to add this new macro:
> >> >>     The NAND_NO_SUBPAGE_WRITE can be used only by the MLC nands which
> >> >>     do
> >> >> 
> >> >> no support the subpage write;
> >> >> 
> >> >>     The NAND_CONTROLLER_NO_SUBPAGE_WRITE only used by the nand
> >> >> 
> >> >> controller such as gpmi nand.
> >> > 
> >> > It's not clearer at all. It's just more error-prone.
> >> 
> >> ok, thanks. But I do not how to fix it now. I hope some one could give a
> >> patch.
> > 
> > Why not remove the mask?
> 
> I do not understand why this line was added here,  was it added on purpose?
> so I am not sure whether we can just remove this line.

Investigate, you're the author and you have an unresolved bug sitting there for 
a while ;-)

Check where the masked values are used and if they has to be masked at all, if 
it can't be done in some easier way.

> Best Regards
> Huang Shijie

Best regards,
Marek Vasut
