Received: from proxima.lp0.eu ([2001:8b0:ffea:0:205:b4ff:fe12:530])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4E7P-00030g-2p
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 20:35:15 +0000
Subject: Re: [PATCH (v6) 1/2] mtd: brcmnand: Add brcm,bcm63268-nand device
 tree binding
To: Brian Norris <computersforpeace@gmail.com>
References: <56523E85.905@simon.arlott.org.uk>
 <56523EFF.9050502@simon.arlott.org.uk> <56535977.9050201@gmail.com>
 <56541BD3.4070202@simon.arlott.org.uk> <5654AF69.7040901@gmail.com>
 <afc6fb02d51a5378e315ade84a134eaf7a58a94f@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
 <20151202190555.GJ64635@google.com> <565F4953.2070206@simon.arlott.org.uk>
 <20151202200036.GL64635@google.com> <565F50B0.4020802@simon.arlott.org.uk>
 <20151202202127.GN64635@google.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Jonas Gorski <jogo@openwrt.org>,
 bcm-kernel-feedback-list@broadcom.com, Kamal Dasu <kdasu.kdev@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
From: Simon Arlott <simon@fire.lp0.eu>
Message-ID: <565F55DE.4050703@simon.arlott.org.uk>
Date: Wed, 2 Dec 2015 20:34:38 +0000
MIME-Version: 1.0
In-Reply-To: <20151202202127.GN64635@google.com>
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

On 02/12/15 20:21, Brian Norris wrote:
> Hi Simon,
> 
> On Wed, Dec 02, 2015 at 08:12:32PM +0000, Simon Arlott wrote:
>> On 02/12/15 20:00, Brian Norris wrote:
>> > On Wed, Dec 02, 2015 at 07:41:07PM +0000, Simon Arlott wrote:
>> >> I've created a bcm963268part driver so there won't need to be any
>> >> partitions in DT for bcm63268.
>> > 
>> > Just curious, do you plan to submit this driver? We're working on
>> 
>> Yes, it's just the most recent one I've been working on. I still have
>> USBH and IUDMA to submit
>> 
>> > matching up partition parsers to flash devices via device tree
>> > of_match_table's, so you could do something like this:
>> > 
>> > 	nand0: nandcs@0 {
>> > 		compatible = "brcm,nandcs";
>> > 		...
>> > 
>> > 		partitions {
>> > 			compatible = "brcm,bcm963268-partitions";
>> > 			...
>> > 		};
>> > 	};
>> 
>> I modified brcmnand to look for a machine matching "brcm,bcm963268", but
> 
> Like this?
> 
> http://patchwork.ozlabs.org/patch/473180/
> 
> I'd like to avoid that (hence the "Rejected" status).

I exported default_mtd_part_types, copied it, and then added to it:
+	for (i = 0; i < nr_types; i++)
+		part_types[i] = default_mtd_part_types[i];
+
+	/* Add partition type based on machine */
+	if (of_machine_is_compatible("brcm,bcm963268"))
+		part_types[i++] = "bcm963268part";
+	else
+		part_types[i++] = NULL;
+
+	part_types[i++] = NULL;

>> that way is ok with me. Presumably "ofpart" defers to another matching
>> partition parser?
> 
> Yes, "ofpart" is for specifying the entire partition table in the device
> tree as subnodes of either the flash node or of the flash's "partitions"
> subnode. It's not the most flexible, but it does work generically.
> 
>> Is there a patch for that method of parser detection available?
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

I'll submit my parser without any means of using it, let me know if you
want me to work on a patch for a match table.

> Regards,
> Brian
> 


-- 
Simon Arlott
