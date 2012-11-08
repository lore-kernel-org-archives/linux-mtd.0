Received: from mtxmxout9.matrox.com ([138.11.2.99] helo=mtxmxout7.matrox.com)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TWVSY-0004K1-4k
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2012 17:00:08 +0000
Date: Thu, 8 Nov 2012 12:03:53 -0500
From: Christopher Harvey <charvey@matrox.com>
To: Gerlando Falauto <gerlando.falauto@keymile.com>
Subject: Re: state of support for "external ECC hardware"
Message-ID: <20121108170353.GT2389@harvey-pc.matrox.com>
References: <20121029204227.GA32300@harvey-pc.matrox.com>
 <509B9143.4020506@keymile.com>
 <20121108152125.GR2389@harvey-pc.matrox.com>
 <509BDE9B.3080909@keymile.com> <509BDFBD.3030604@keymile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <509BDFBD.3030604@keymile.com>
Cc: "Brunck, Holger" <Holger.Brunck@keymile.com>,
 Ivan Djelic <ivan.djelic@parrot.com>, "Bigler,
 Stefan" <Stefan.Bigler@keymile.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 08, 2012 at 05:37:17PM +0100, Gerlando Falauto wrote:
> Hi Chris,
> On 11/08/2012 05:32 PM, Gerlando Falauto wrote:
> >
> >> Ran a trace on some manually inserted bitflips, and the block was moved.
> >
> > Could you give some pointers on how to manually insert bitflips?
> > nanddump/nandwrite from mtd-utils perhaps?
> 
> And BTW, wouldn't you also need to explicitly disable on-die ECC in 
> order to force that, anyway?

Depends on the version I think. IIRC, some are "enabled by default",
others are "disabled by default".

-C
