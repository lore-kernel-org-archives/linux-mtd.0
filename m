Received: from mailserver5.natinst.com ([130.164.80.5]
 helo=spamkiller05.natinst.com)
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T606m-0004F6-ON
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2012 14:16:05 +0000
In-Reply-To: <CAN8TOE-aU=Z2CXiV0RO_zudbivCwnyQhghr5S7FdgHCe4cMZug@mail.gmail.com>
References: <1344893730-11345-1-git-send-email-jeff.westfahl@ni.com>	<1345809360.2848.296.camel@sauron.fi.intel.com>
 <CAN8TOE-aU=Z2CXiV0RO_zudbivCwnyQhghr5S7FdgHCe4cMZug@mail.gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: nand: Added a device flag for subpage read support
From: Jeff Westfahl <jeff.westfahl@ni.com>
Message-ID: <OF93A97265.F26E7182-ON86257A67.004C537E-86257A67.004E26A3@ni.com>
Date: Mon, 27 Aug 2012 09:13:36 -0500
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian Norris <computersforpeace@gmail.com> wrote on 08/24/2012 07:05:45 
PM:

> From: Brian Norris <computersforpeace@gmail.com>
> To: dedekind1@gmail.com
> Cc: Jeff Westfahl <jeff.westfahl@ni.com>, linux-mtd@lists.infradead.org
> Date: 08/24/2012 07:06 PM
> Subject: Re: [PATCH] mtd: nand: Added a device flag for subpage read 
support
> 
> On Fri, Aug 24, 2012 at 4:56 AM, Artem Bityutskiy <dedekind1@gmail.com> 
wrote:
> > On Mon, 2012-08-13 at 16:35 -0500, Jeff Westfahl wrote:
> >> Added a NAND device flag for subpage read support. Previously this 
was
> >> hard coded based on large page and soft ECC.
> >> Updated base NAND driver to use the new subpage read flag if the NAND 
is
> >> large page and soft ECC.
> >>
> >> Signed-off-by: Jeff Westfahl <jeff.westfahl@ni.com>
> >
> > Brian, would you have a chance to review this patch?
> 
> Yes, I can try. I'll give it a little more thought on Monday.
> 
> But I have an initial question: why do you need this patch?
> Specifically, is there a driver you have that supports/needs this
> change? Right now, your new flag won't be used for anything new.
> 
> Side note: I have always thought that it was strange to have
> subpage-read support only baked into SOFT_ECC mode. There are
> presumably many potential applications in which a non-SOFT_ECC system
> could read partial pages safely.
> 
> Brian

Brian,

Your guess is correct. We're using an ARM SoC that isn't yet in mainline. 
Our
design is using NAND with on-die ECC. With on-die ECC enabled, partial 
pages
can be safely read. This patch helps cut UBI mount time on our board from
about 8 seconds to about 1 second.

Jeff
