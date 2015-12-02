Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4Dxb-0003v7-9U
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 20:25:07 +0000
Received: by pacej9 with SMTP id ej9so50362614pac.2
 for <linux-mtd@lists.infradead.org>; Wed, 02 Dec 2015 12:24:46 -0800 (PST)
Date: Wed, 2 Dec 2015 12:24:44 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Simon Arlott <simon@fire.lp0.eu>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Jonas Gorski <jogo@openwrt.org>,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH (v6) 1/2] mtd: brcmnand: Add brcm,bcm63268-nand device
 tree binding
Message-ID: <20151202202444.GO64635@google.com>
References: <56523EFF.9050502@simon.arlott.org.uk> <56535977.9050201@gmail.com>
 <56541BD3.4070202@simon.arlott.org.uk> <5654AF69.7040901@gmail.com>
 <afc6fb02d51a5378e315ade84a134eaf7a58a94f@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <20151202190555.GJ64635@google.com>
 <565F4953.2070206@simon.arlott.org.uk>
 <20151202200036.GL64635@google.com>
 <565F50B0.4020802@simon.arlott.org.uk>
 <20151202202127.GN64635@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151202202127.GN64635@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 02, 2015 at 12:21:27PM -0800, Brian Norris wrote:
> On Wed, Dec 02, 2015 at 08:12:32PM +0000, Simon Arlott wrote:
> > Is there a patch for that method of parser detection available?
> 
> I have something working here, but I haven't had time to finish cleaning
> it up and submitting it. There's an older patch that works similarly,
> though it has some deficiencies:
> 
> http://patchwork.ozlabs.org/patch/475988/
> 
> The main difference between that and my (yet-to-be-submitted) proposal
> is that I'd like parsers to opt in by adding a proper of_match_table
> with non-Linux-specific DT bindings, and then we can drop the
> "linux,..." naming and make it a reasonably generic property.

For other related work: Linus Walleij attempted something similar here:

http://lists.infradead.org/pipermail/linux-mtd/2015-October/062899.html
