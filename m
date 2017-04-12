Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cyCJd-0000uC-QU
 for linux-mtd@lists.infradead.org; Wed, 12 Apr 2017 07:03:47 +0000
Date: Wed, 12 Apr 2017 09:03:13 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "pawel.moll@arm.com" <pawel.moll@arm.com>, Campbell
 <ijc+devicetree@hellion.org.uk>, "richard@nod.at" <richard@nod.at>, "Mark
 Rutland" <mark.rutland@arm.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "galak@codeaurora.org" <galak@codeaurora.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
Subject: Re: [PATCH 4/5] mtd: nand: add support for Micron on-die ECC
Message-ID: <20170412090313.539f81b2@bbrezillon>
In-Reply-To: <5a96e73ef951414a82c01b67088b24d3@SIWEX5A.sing.micron.com>
References: <538805ebf8e64015a8b833de755652b3@SIWEX5A.sing.micron.com>
 <8a171dacd20c45bd8285ecc5dbe8854a@SIWEX5A.sing.micron.com>
 <20170322144507.4d80d2cc@bbrezillon>
 <0dccc0abcf234e98be6d340027cf1a30@SIWEX5A.sing.micron.com>
 <20170322155216.319efc3e@bbrezillon>
 <414dd35931814ce38381a251917ad79f@SIWEX5A.sing.micron.com>
 <20170411145102.563fa388@bbrezillon>
 <90300f14cd2a4ae6967d8be0f7dff4e9@SIWEX5A.sing.micron.com>
 <20170411173051.7aafb717@bbrezillon>
 <5a96e73ef951414a82c01b67088b24d3@SIWEX5A.sing.micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 11 Apr 2017 17:01:51 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> >On Tue, 11 Apr 2017 15:02:22 +0000
> >"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:
> >  
> >> Hi, Boris and Thomas
> >> Let me do some explanation.
> >>  
> >> >> if (NAND == SLC ) { // on-die ECC only exists in SLC //check device
> >> >> ID byte 4
> >> >>      if ((ID.byte4 & 0x02) == 0x02) {// internal ECC level ==10b  
> >> >
> >> >So here the MT29F1G08ABADAWP datasheet says 0x2 <=> 4bit/512bytes ECC.
> >> >  
> >>
> >> If the NAND supports on-die ECC, here should be 10b, not matter it is
> >> 8bit or 4bit, You are correct, MT29F1G08ABADAWP is 0x2, its explanation is  
> >4bit/512bytes ECC.  
> >> But for the 70s, it is 8bit on-die ECC, but it is still 10b.
> >> So that why here using these two bits to determine if exist on-die ECC.
> >> What's more, for some old products, they don't support on-die ECC,
> >> Sometimes, here is still 01b, so still need following codes to do
> >> further determinations.  
> >
> >Okay, then here is the differentiator. Did you check that on SLC NANDs there's no
> >collision on ID[4].bits[1:0]. I've seen NAND vendors changing their ID scheme in
> >incompatible ways (old fields were replaced by new ones with completely
> >different meanings).  
> 
> 
> Yes, this is true, there is no one standard to define and formalize ID.byte4,
> It is always changing. Also, sometimes it definitely conflicts with other NAND without
> On-die ECC. For the Micron both serials SLC NAND with on-die ECC, bits[1:0] is defined
> Internal ECC level. 
> 
> >I'd really like to make sure we're not mis-interpreting READ_ID information, so
> >maybe we should restrict the test on ONFI NANDs if all NANDs supporting on-die
> >ECC are ONFI compliant. We should probably also check that chip->id.len >= 5.
> >
> >  
> >>  
> >> >> 	if (ID.byte4 & 0x80) {//on-Die ECC enabled  
> >> >
> >> >Did you read my last reply?
> >> >Thomas discovered that ID[4].bit7 is actually reflecting the ECC
> >> >engine state (1 if the engine is enabled, 0 if it's disabled), not
> >> >whether the NAND supports on-die ECC or not, so no this test is not reliable.
> >> >  
> >> For the on-die ECC, it is not always default enabled. It depends on requirement  
> >from costumers.  
> >> If on-die ECC is not enabled, bit7 is 0. It can be switched through "Feature  
> >Operations".
> >
> >So this check is not needed, right?  
> 
> Here is much complicated. One question is that what main purpose of on-die ECC.
> there are two types of usage model:
> 1.  on-die ECC default enabled:
> Normally before bootloader and kernel, there is no any ECC to correct and maintain
> Bootloader reliability.  For this kind of customer, I think, they mainly want to have reliable booting.
> Rather than for store user data. Per this kind of condition, we don't check, because on-die ECC
> Always be enabled, cannot be disabled.
> 
> 2. on-die ECC default disabled:
> I think this is used for some important user data. Unless the bootrom of CPU can issue 
> SET_FEATURE to enable on-die ECC, and until Linux running, on-die ECC is still enabled.
> Otherwise, we need to check if it enables or not.

Well, knowing whether the NAND has on-die ECC or not and determining if
it's enabled by default are 2 different things. Until now, we were
trying to detect the former.

> 
> >BTW, do you have NANDs where the on-die ECC is always enabled, and if this is
> >the case, what happens when you call
> >SET_FEATURE(disable/enable-ECC) on these NANDs?  
> 
> If this NAND is on-die ECC defaulted enabled, the on-die ECC cannot
> Disabled later. Why? This is related to specific user model.

Erf, this changes a bit what Thomas and I had in mind, because that
means read/write_page_raw() are not supported in this case, and more
importantly, that means users should by no mean enable external ECC
engines.

> We have one PPT on Micron domain website, it is "on die ECC training",
> It opens and can freely download. It clearly describes this.

Okay, I'll try to download this document.

One last question. Is it dangerous to call
SET_FEATURE(disable/enable-ECC) on a NAND that has ECC enabled by
default? We could use that to detect whether on-die ECC can be turned
off or not and adjust the chip->ecc init steps accordingly.

Thanks,

Boris
