Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TallX-00020k-No
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2012 11:13:20 +0000
Received: by mail-pb0-f49.google.com with SMTP id un15so3911462pbc.36
 for <linux-mtd@lists.infradead.org>; Tue, 20 Nov 2012 03:13:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.00.1211090938500.29771@lnxricardw.se.axis.com>
References: <20121029204227.GA32300@harvey-pc.matrox.com>
 <509B9143.4020506@keymile.com>
 <20121108152125.GR2389@harvey-pc.matrox.com>
 <509BDE9B.3080909@keymile.com>
 <alpine.DEB.2.00.1211090938500.29771@lnxricardw.se.axis.com>
Date: Tue, 20 Nov 2012 16:43:16 +0530
Message-ID: <CAEhpT-UNGhyG5gtbw8hDTpQ7nueOem-V3H=V9QPA_f6fiEKwTQ@mail.gmail.com>
Subject: Re: state of support for "external ECC hardware"
From: Calvin Johnson <linux.cj@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "Bigler, Stefan" <Stefan.Bigler@keymile.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Gerlando Falauto <gerlando.falauto@keymile.com>, "Brunck,
 Holger" <Holger.Brunck@keymile.com>, Christopher Harvey <charvey@matrox.com>,
 Ivan Djelic <ivan.djelic@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I thought of sharing my recent experience with MLC NAND which requires
24-bit ECC.

On Fri, Nov 9, 2012 at 2:16 PM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> On Thu, 8 Nov 2012, Gerlando Falauto wrote:
>
>>> We had BCH8 code running, but it wasn't enough. The main reason we
>>> switched away from host side ECC was because we were getting bitflips
>>> within the ECC codeword data itself.
>>
>>
>> Wow... I mean, I figured it wouldn't be that easy to (purposedly) get
>> bitflips in any area, I wonder what kind of test you managed to come up with
>> in order to get bitflips within the ECC area itself. In my case it takes
>> several hours (of continuous reads) to get a single bitflip within a 1Gb
>> (128MB) flash.
>
>
> There are 1Gb flashes and 1Gb flashes. Depending on the technology used
> during manufacture (essentially the scale of the on-chip structures, usually
> specified as 'xxx nm technology') the bit error probabilities can vary.
>
> "Traditional" 1Gb flashes where the manufacturer recommends 1-bit ECC in
> practice very rarely exhibit bit flips. I have seen bit flips in the OOB
> area as well as the main area (there was a bug in nand_ecc.c many years ago
> which didn't handle this correctly which is how I discovered what was going
> on); indeed there's nothing different about the OOB area in terms of bit
> flips, it's just another area of (the same type of) flash. The probability
> for the whole OOB area is of course less than for the rest as it is smaller,
> but it is the same per bit if I understand it correctly.
>
> Some manufacturers (Micron for instance I believe) have started to deliver 1
> Gb chips using a higher density technology where they specify a requirement
> for 4-bit ECC. These naturally exhibit a much higher bitflip rate.
>

I'm using Micron's MT29F16G08CBACA.
Minimum required ECC :-      24-bit ECC per 1080 bytes of data
The H/W ECC controller(external to NAND flash) I'm using supports 24-bit ECC.
Had a tough time initially when I started working on this NAND flash.
Without being aware of the minimum required ECC, I was using
Hamming(1-bit) correction. This showed inconsistency at a level of
1/6, i.e 1 boot out of 6 failed.

When I switched to 24-bit ECC with UBIFS, everything seems to work
properly without any issue so far.

But with JFFS2 still there are many issues. I assume that this can be
due to the bit flips in the OOB area which are not covered by ECC.
Also for the erased pages, there is no ECC protection and JFFS2 reads
first 256 bytes of data and checks for all 0xFF to confirm it is an
erased page along with the checking of clean marker it read from the
OOB.

>From various articles in the internet, it seems that NAND flashes are
going to get more denser and the bit flips are going to increase.
Hence the H/W ECC controllers are going to have more demand. The S/W
BCH algorithm available in Linux will consume plenty of cycles which
can be offloaded to the H/W ECC controller.

> At any rate, the ECC algorithm itself should be able to take care of bit
> flips in the ECC codes. For the 1-bit algorithm in nand_ecc.c it does this
> by comparing the computed ECC with the actual ECC; if there's a difference
> of exactly one bit (rather than a more complex diff which after calculations
> points out the flipped bit in the main area), it is assumed that the bitflip
> is in the ECC area rather than the data. I don't know how BCH does this
> though.
>
regards,
Calvin
