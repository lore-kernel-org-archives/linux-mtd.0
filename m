Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6kx2-0005uK-Mu
 for linux-mtd@lists.infradead.org; Wed, 09 Dec 2015 20:03:01 +0000
Received: by pabur14 with SMTP id ur14so34773182pab.0
 for <linux-mtd@lists.infradead.org>; Wed, 09 Dec 2015 12:02:39 -0800 (PST)
Date: Wed, 9 Dec 2015 12:02:37 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Simon Arlott <simon@fire.lp0.eu>
Cc: Jonas Gorski <jogo@openwrt.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH 1/3] mtd: brcmnand: Add brcm,bcm6368-nand device tree
 binding
Message-ID: <20151209200237.GB144338@google.com>
References: <565F81A6.6060307@simon.arlott.org.uk>
 <CAOiHx=kLrJPfvQUjNiEmvAMVj8v37RMFqaMp=tqzAVe22q+9fQ@mail.gmail.com>
 <b3a23d0b4e1e11c9b71848e0345777cd4163f185@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3a23d0b4e1e11c9b71848e0345777cd4163f185@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 04, 2015 at 09:29:55PM -0000, Simon Arlott wrote:
> On Fri, December 4, 2015 16:04, Jonas Gorski wrote:
> > On Thu, Dec 3, 2015 at 12:41 AM, Simon Arlott <simon@fire.lp0.eu> wrote:
> >> +   * "brcm,nand-bcm6368"
> >> +     - compatible: should contain "brcm,nand-bcm<soc>", "brcm,nand-bcm6368"
> >> +     - reg: (required) the 'NAND_INTR_BASE' register range, with combined status
> >> +       and enable registers, and boot address registers
> >> +     - reg-names: (required) "nand-intr-base"
> >
> > Can't we use the same name as bcm63138, i.e. nand-int-base?
> 
> Brian,
> 
> Before I change this, is there anything else in the patch series that needs to
> be changed?

No, I think you covered my comments in your latest series:

http://lists.infradead.org/pipermail/linux-mtd/2015-December/064004.html

I don't know about Jonas's comments about using bcm6368, even though
bcm6368 is a much older NAND core. I had similar thoughts when Florian
first proposed it, but I'm not sure I have a much better suggestion.
We're trying to describe two slightly different tracks of IP: the core
NAND controller, which has a defined revision (2.x, 4.0, etc.), and the
accessory interrupt bits, which are mostly constant across a product
line / class of SoCs and aren't really versioned.

So I guess I'm OK with the usage of the bcm6368 compatible string.

Regards,
Brian
