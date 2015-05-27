Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxPwz-0001i2-RG
 for linux-mtd@lists.infradead.org; Wed, 27 May 2015 01:16:06 +0000
Received: by paza2 with SMTP id a2so96348560paz.3
 for <linux-mtd@lists.infradead.org>; Tue, 26 May 2015 18:15:44 -0700 (PDT)
Date: Tue, 26 May 2015 18:15:38 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [RFC] ARM: BCM5301X: add NAND flash chip description
Message-ID: <20150527011538.GE27753@ld-irv-0074>
References: <1432492349-18517-1-git-send-email-hauke@hauke-m.de>
 <20150527004144.GC27753@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150527004144.GC27753@ld-irv-0074>
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, rjui@broadcom.com,
 zajec5@gmail.com, jogo@openwrt.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 26, 2015 at 05:41:44PM -0700, Brian Norris wrote:
> > +			linux,part-probe = "ofpart", "bcm47xxpart";
> 
> ^ NAK to this line. You still haven't documented any semantics for this
> property. And I gave you several comments on your previous patch about
> what would need to change before I'd accept this property.

Just noticed you sent v2 of your previous patch over the weekend, which
does include documentation for this. That's a start, but I'm still not
very happy with the property. I'll put my full comments there
eventually.

Brian
