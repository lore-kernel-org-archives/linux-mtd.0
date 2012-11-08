Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TWXRf-0001Ey-95
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2012 19:07:19 +0000
Date: Thu, 8 Nov 2012 20:07:14 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Gerlando Falauto <gerlando.falauto@keymile.com>
Subject: Re: state of support for "external ECC hardware"
Message-ID: <20121108190714.GD28118@parrot.com>
References: <20121029204227.GA32300@harvey-pc.matrox.com>
 <509B9143.4020506@keymile.com>
 <20121108152125.GR2389@harvey-pc.matrox.com>
 <509BDE9B.3080909@keymile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <509BDE9B.3080909@keymile.com>
Cc: "Bigler, Stefan" <Stefan.Bigler@keymile.com>,
 Christopher Harvey <charvey@matrox.com>, "Brunck,
 Holger" <Holger.Brunck@keymile.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 08, 2012 at 04:32:27PM +0000, Gerlando Falauto wrote:
(...)
> Right, datasheets and TNs don't even mention what the threshold actually 
> is. They just say "Rewrite recommended". Perhaps you could get some 
> feeling while running your tests? I mean, if you could get bitflips by 
> using host-software ECC (within a reasonable time), and after enabling 
> on-die ECC you couldn't anymore, it probably means HW ECC won't tell you 
> about bitflips until they reach a number higher than 1. Am I right?
> 
> [Did you ever ask Micron by any chance?]

IIRC, Micron on-die ECC reports a "rewrite recommended" status when the
number of bitflips has reached the internal error correction capability
(4 in my case). In other words, a "rewrite recommended" means you should
rewrite the block ASAP before an additional bitflip triggers an ECC failure.

--
Ivan
