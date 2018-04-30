Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fD1xN-0004zl-TU
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2018 06:06:39 +0000
Date: Mon, 30 Apr 2018 08:06:25 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Steve deRosier
 <derosier@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Tobi Wulff
 <Tobi.Wulff@alliedtelesis.co.nz>
Subject: Re: NAND ecc-strength (was Re: NAND timeout issues with blank chip
 and Marvell NFC)
Message-ID: <20180430080625.3ae2e324@bbrezillon>
In-Reply-To: <2847aa9260084a6da170afe239a33d36@svr-chch-ex1.atlnz.lc>
References: <2847aa9260084a6da170afe239a33d36@svr-chch-ex1.atlnz.lc>
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

Hi Chris,

On Sun, 29 Apr 2018 22:17:08 +0000
Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:

> Hi Boris & all,
> 
> Permit me a slight tangent.
> 
> On 27/04/18 18:16, Boris Brezillon wrote:
> >> The one problem it does have in this configuration is the familiar
> >> "nand: WARNING: pxa3xx_nand-0: the ECC used on your system is too weak
> >> compared to the one required by the NAND chip". From what I read in the
> >> Marvell datasheet even though the chip requires 8-bits of ECC per 540
> >> bytes of data the 16-bits per 2048 bytes of data implemented by the
> >> controller should satisfy this.  
>  >
> > No, it's not true. Well, it will work for some time, and then fail when
> > too many erase cycles have been done on a block. You should always try
> > to at least meet the chip requirements. Anyway, that's not really the
> > issue here.
> >   
> >> If I set marvell,nand-keep-config or nand-ecc-strength = <8>. I get ECC
> >> errors reported (probably due to the change in configuration) and
> >> ultimately the mount fails "mount: mounting ubi0:user on /flash failed:
> >> Invalid argument" I haven't really dug into where that's coming from.  
>  >
> > For the ECC change, that's not surprising, since u-boot probably writes
> > things in the 4bit/512 config.
> >   
> 
> So this raises a bit of concern. A certain NAND flash vendor has 
> released an end of life notice for some of their chips (I won't name 
> them specifically because I'm not sure if there is a NDA in place). The 
> suggested replacement part requires 8bit/540byte ECC whereas the old one 
> required 4bit/540byte.
> 
> The first problem I face is how do we handle the possibility of having 
> either chip installed. Since the current dtb has ecc-strength = <4> do 
> we need the bootloader to modify this on the fly this based on some 
> identifier that distinguishes old from new? Or is there some way of 
> saying ecc-strength = <pick a value appropriate for the chip>.

Do not define these properties in the DT and the driver should pick the
values extracted during the chip detection
(chip->ecc_{strength,step}_ds). If these values are 0, that means the
detection codes fails to extract the ECC requirements and
nand_<vendor>.c file should be patched to address that.

As an alternative, you could define 'nand-ecc-maximize' in the DT and
patch the driver to auto-select the maximum ECC strength when
NAND_ECC_MAXIMIZE is set in chip->ecc.options. This way you're
guaranteed that, no matter the chip you use, the driver will maximize
the ECC strength.

> 
> The second problem is that, if I understand correctly, the Marvell NFCv2 
> BCH implementation is always 16bit/2048bytes. So even if I get the dts 
> to say the right thing the hardware based ECC will ignore it.

Actually, the controller does 16bits/Xbytes. So, say you have a
requirement of 8bits/512bytes, you can just convert that to
16bits/1024bytes.

Regards,

Boris
