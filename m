Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4Dm2-0006wJ-GW
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 20:13:11 +0000
Subject: Re: [PATCH (v6) 1/2] mtd: brcmnand: Add brcm,bcm63268-nand device
 tree binding
To: Brian Norris <computersforpeace@gmail.com>
References: <56506D55.3000907@simon.arlott.org.uk>
 <20151122215945.GA5930@rob-hp-laptop> <56523E85.905@simon.arlott.org.uk>
 <56523EFF.9050502@simon.arlott.org.uk> <56535977.9050201@gmail.com>
 <56541BD3.4070202@simon.arlott.org.uk> <5654AF69.7040901@gmail.com>
 <afc6fb02d51a5378e315ade84a134eaf7a58a94f@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <20151202190555.GJ64635@google.com> <565F4953.2070206@simon.arlott.org.uk>
 <20151202200036.GL64635@google.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Jonas Gorski <jogo@openwrt.org>,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>
From: Simon Arlott <simon@fire.lp0.eu>
Message-ID: <565F50B0.4020802@simon.arlott.org.uk>
Date: Wed, 2 Dec 2015 20:12:32 +0000
MIME-Version: 1.0
In-Reply-To: <20151202200036.GL64635@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/12/15 20:00, Brian Norris wrote:
> Hi,
> 
> On Wed, Dec 02, 2015 at 07:41:07PM +0000, Simon Arlott wrote:
>> >> +	nand0: nandcs@0 {
>> >> +		compatible = "brcm,nandcs";
>> >> +
>> >> +		#address-cells = <0>;
>> >> +		#size-cells = <0>;
> 
>> I think they're also implicit so you can just remove those two lines.
> 
> From ePAPR: "The #address-cells and #size-cells properties are not
> inherited from ancestors in the device tree. They shall be explicitly
> defined."
> 
> But we don't want to define them. I'd drop them, at least from the
> example, as they're not relevant.

Ok.

>> I've created a bcm963268part driver so there won't need to be any
>> partitions in DT for bcm63268.
> 
> Just curious, do you plan to submit this driver? We're working on

Yes, it's just the most recent one I've been working on. I still have
USBH and IUDMA to submit

> matching up partition parsers to flash devices via device tree
> of_match_table's, so you could do something like this:
> 
> 	nand0: nandcs@0 {
> 		compatible = "brcm,nandcs";
> 		...
> 
> 		partitions {
> 			compatible = "brcm,bcm963268-partitions";
> 			...
> 		};
> 	};

I modified brcmnand to look for a machine matching "brcm,bcm963268", but
that way is ok with me. Presumably "ofpart" defers to another matching
partition parser?

Is there a patch for that method of parser detection available?

-- 
Simon Arlott
