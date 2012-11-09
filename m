Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TWkEq-00024s-TE
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2012 08:46:57 +0000
Date: Fri, 9 Nov 2012 09:46:49 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Gerlando Falauto <gerlando.falauto@keymile.com>
Subject: Re: state of support for "external ECC hardware"
In-Reply-To: <509BDE9B.3080909@keymile.com>
Message-ID: <alpine.DEB.2.00.1211090938500.29771@lnxricardw.se.axis.com>
References: <20121029204227.GA32300@harvey-pc.matrox.com><509B9143.4020506@keymile.com>
 <20121108152125.GR2389@harvey-pc.matrox.com> <509BDE9B.3080909@keymile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: "Brunck,
 Holger" <Holger.Brunck@keymile.com>, Christopher Harvey <charvey@matrox.com>,
 "Bigler, Stefan" <Stefan.Bigler@keymile.com>,
 Ivan Djelic <ivan.djelic@parrot.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 8 Nov 2012, Gerlando Falauto wrote:

>> We had BCH8 code running, but it wasn't enough. The main reason we
>> switched away from host side ECC was because we were getting bitflips
>> within the ECC codeword data itself.
>
> Wow... I mean, I figured it wouldn't be that easy to (purposedly) get 
> bitflips in any area, I wonder what kind of test you managed to come up 
> with in order to get bitflips within the ECC area itself. In my case it 
> takes several hours (of continuous reads) to get a single bitflip within 
> a 1Gb (128MB) flash.

There are 1Gb flashes and 1Gb flashes. Depending on the technology used 
during manufacture (essentially the scale of the on-chip structures, 
usually specified as 'xxx nm technology') the bit error probabilities can 
vary.

"Traditional" 1Gb flashes where the manufacturer recommends 1-bit ECC in 
practice very rarely exhibit bit flips. I have seen bit flips in the OOB 
area as well as the main area (there was a bug in nand_ecc.c many years 
ago which didn't handle this correctly which is how I discovered what was 
going on); indeed there's nothing different about the OOB area in terms of 
bit flips, it's just another area of (the same type of) flash. The 
probability for the whole OOB area is of course less than for the rest as 
it is smaller, but it is the same per bit if I understand it correctly.

Some manufacturers (Micron for instance I believe) have started to deliver 
1 Gb chips using a higher density technology where they specify a 
requirement for 4-bit ECC. These naturally exhibit a much higher bitflip 
rate.

At any rate, the ECC algorithm itself should be able to take care of bit 
flips in the ECC codes. For the 1-bit algorithm in nand_ecc.c it does this 
by comparing the computed ECC with the actual ECC; if there's a difference 
of exactly one bit (rather than a more complex diff which after 
calculations points out the flipped bit in the main area), it is assumed 
that the bitflip is in the ECC area rather than the data. I don't know how 
BCH does this though.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
