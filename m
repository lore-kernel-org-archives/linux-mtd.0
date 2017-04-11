Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cxxR3-0002vB-FV
 for linux-mtd@lists.infradead.org; Tue, 11 Apr 2017 15:10:27 +0000
Date: Tue, 11 Apr 2017 17:10:03 +0200
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
Message-ID: <20170411171003.7b14b8a6@bbrezillon>
In-Reply-To: <20170411164952.52357b4f@bbrezillon>
References: <538805ebf8e64015a8b833de755652b3@SIWEX5A.sing.micron.com>
 <8a171dacd20c45bd8285ecc5dbe8854a@SIWEX5A.sing.micron.com>
 <20170322144507.4d80d2cc@bbrezillon>
 <0dccc0abcf234e98be6d340027cf1a30@SIWEX5A.sing.micron.com>
 <20170322155216.319efc3e@bbrezillon>
 <414dd35931814ce38381a251917ad79f@SIWEX5A.sing.micron.com>
 <20170411145102.563fa388@bbrezillon>
 <106593e04c494120b323836b8bc54f7f@SIWEX5A.sing.micron.com>
 <20170411164952.52357b4f@bbrezillon>
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

On Tue, 11 Apr 2017 16:49:52 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Tue, 11 Apr 2017 14:26:02 +0000
> "Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:
> 
> > >
> > >Hi Bean,
> > >
> > >On Mon, 3 Apr 2017 11:31:05 +0000
> > >"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:
> > >    
> > >> Hi, Boris and Thomas
> > >>    
> > >> >>
> > >> >> Ok, but I recommend that 70s should be the first choice on this
> > >> >> single solution, it doesn't need to read twice to detect its bitflips count.    
> > >> >
> > >> >That's exactly why we need to differentiate the 2 chips.    
> > >>
> > >> Sorry for later this response.
> > >> Below is the pseudo codes about how to differentiate these 2 series
> > >> parallel NAND with on-die ECC:
> > >>
> > >> if (NAND == SLC ) { // on-die ECC only exists in SLC //check device ID
> > >> byte 4
> > >>      if ((ID.byte4 & 0x02) == 0x02) {// internal ECC level ==10b    
> > >
> > >So here the MT29F1G08ABADAWP datasheet says 0x2 <=> 4bit/512bytes ECC.
> > >    
> > >> 	if (ID.byte4 & 0x80) {//on-Die ECC enabled    
> > >
> > >Did you read my last reply?
> > >Thomas discovered that ID[4].bit7 is actually reflecting the ECC engine state (1 if
> > >the engine is enabled, 0 if it's disabled), not whether the NAND supports on-die
> > >ECC or not, so no this test is not reliable.
> > >    
> > >>                     if (ONFI.byte112 == 4)
> > >> 		 60s SLC NAND with on-die ECC
> > >> 	    else if (ONFI.byte112 == 8)
> > >>      	              70s SLC NAND with on-die ECC    
> > >
> > >This is completely fucked up! Now the ONFI param page says the NAND requires
> > >8bits/512bytes, while the ID bytes advertised an on-die ECC providing
> > >4bits/512bytes correctability.
> > >So either your algorithm is wrong, or the ID and ONFI param page are contracting
> > >(not sure what solution I'd prefer...).
> > >    
> > >> 	    else
> > >>                           Doesn't support on-die ECC    
> > >
> > >Sorry to say that, but I find it worrisome that even someone from Micron is not
> > >able to get it right.
> > >    
> > 
> > Sorry, would you please specify which one is wrong or confuse you?  
> 
> The initial 'if (ID.byte4 & 0x80)' is wrong, because this bit is only
> set when someone enabled the ECC engine using the SET_FEATURE command
> (this has been verified by Thomas who tried to disable the feature in
> the bootloader and noticed that on-die ECC was reported as
> 'unsupported' by the kernel).
> 
> Maybe I was wrong about your 'if ((ID.byte4 & 0x02) == 0x02)' test,
> because you apparently only mask bit 1 and not bits 0 and 1.
> Anyway, I can't tell if this is valid because I don't have access to
> the M79A datasheets you're referring to.

Okay, I managed to download the MT29F2G08ABAGAWP datasheet (from the
MT79A family), and it seems that the test should be

	if ((ID.byte4 & 0x03) == 0x02)

and not

	if ((ID.byte4 & 0x02) == 0x02)

Also, this field named "Internal ECC level" clearly does not reflect
the on-die ECC strength because it's set to the same value on both
parts (0x2) while MT29F2G08ABAGAWP provides 8bits/512bytes and
MT29F1G08ABADAWP 4bits/512bytes.

See why I say we can't rely on READ_ID information. It's changing all
the time, and nothing clearly say how to differentiate the scheme used
in a specific NAND part.
