Received: from mail.ch.keymile.com ([193.17.201.103])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TWQ0M-00010O-D1
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2012 11:10:40 +0000
Message-ID: <509B9143.4020506@keymile.com>
Date: Thu, 08 Nov 2012 12:02:27 +0100
From: Gerlando Falauto <gerlando.falauto@keymile.com>
MIME-Version: 1.0
To: Christopher Harvey <charvey@matrox.com>
Subject: Re: state of support for "external ECC hardware"
References: <20121029204227.GA32300@harvey-pc.matrox.com>
In-Reply-To: <20121029204227.GA32300@harvey-pc.matrox.com>
Content-Type: text/plain;
	charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: 7bit
Cc: stefan.bigler@keymile.com, Ivan Djelic <ivan.djelic@parrot.com>, "Brunck,
 Holger" <Holger.Brunck@keymile.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Chris,

good to hear we're not alone in this thinking... :-)
We're now facing the exact same issue as some Micron NAND chips (most 
likely the same one you're dealing with) can no longer live with the 
default, simple 1-bit ECC implementation used by default 
(NAND_ECC_SOFT), I guess because chances of having multiple bitflips 
within the same page are no longer negligible. So some 4-bit ECC 
mechanism must be used at the very least.

Support for software-based multiple-bit-resilient ECC mechanism (BCH) 
was posted (http://lwn.net/Articles/426856/) by Ivan Djelic (which I 
took liberty to Cc:) and merged in March last year.
I haven't been able to track how the situation evolved, but apparently 
you need to enable it (in addition to within the kernel configuration), 
also within your flash controller setup.
Micron gives an example of how to enable it on a sample NAND host 
controller S3C6410 in this TN (rest of the code, mainly from the above 
patch, would be already present in recent kernels):
http://www.micron.com/~/media/Documents/Products/Technical%20Note/NAND%20Flash/tn2971_software_bch_ecc_on_linux.pdf 


As for hardware-based (or on-die) ECC support, one of the application 
notes from Micron (TN-29-56 Enabling On-Die ECC for OMAP3 on 
Linux/Android OS, 
http://www.micron.com/~/media/Documents/Products/Technical%20Note/NAND%20Flash/tn2956_ondie_ecc_omap3_linux.pdf) 
shows how to enable that (rather, it shows how to disable software ECC 
altogether after enabling it on the chip). However, I haven't been able 
to find a code section where the information returned by the chip 
("Rewrite recommended") is actually used to solicit scrubbing... Neither 
on the TN, nor on the upstream linux kernel... My next step would be to 
give it a go and see what happens.

I'd love to hear some feedback, if anyone has had experience with this.
I know it's not been a long time since your post, but perhaps you've 
heard something in the meantime?

I have one additional question though. Looking at the code I got the 
impression that decisions upon ECC seem to be based on the flash 
controller rather than on the flash chip itself.
I mean, I would think of having a default 1-bit NAND_ECC_SOFT 
implementation; only when it is detected that the flash part either 
supports HW ECC or requires multiple-bit ECC, should the ECC mode get 
switched to NAND_ECC_NONE or NAND_ECC_SOFT_BCH respectively.
No matter what the flash controller, I would say.

Ivan, do you think that makes any sense?

Thank you so much!
Gerlando

On 10/29/2012 09:42 PM, Christopher Harvey wrote:
> I know of at least one Micron NAND chip that has the ability to handle
> ECC completely on the NAND chip itself. All the host has to do is send
> data and the OOB section is updated automatically. The automatic ECC
> hardware can be enabled and disabled with the "Set Feature" command,
> (0xEF) and bit flips are reported via get status after page reads. I
> don't see support for this in 2.6.37, and a quick check in the logs
> doesn't show anything new for these chips in the latest version of the
> kernel. Any idea floating around on this list? Are these chips going
> to be the future for NAND and does Linux care about them?
>
> thanks,
> Chris
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
