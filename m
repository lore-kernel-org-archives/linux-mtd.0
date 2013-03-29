Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ULVCZ-0005TR-LW
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2013 09:02:31 +0000
Date: Fri, 29 Mar 2013 10:02:19 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Aaron Williams <Aaron.Williams@caviumnetworks.com>
Subject: Re: MTD NAND BCH support for 24 bits/1K of ECC correction?
Message-ID: <20130329090219.GB6928@parrot.com>
References: <5154C2C5.5000903@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5154C2C5.5000903@caviumnetworks.com>
Cc: linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 28, 2013 at 10:23:01PM +0000, Aaron Williams wrote:
> Hi all,
> 
> I am trying to clean up our OCTEON NAND flash driver in the Linux kernel 
> and enable support for multi-bit ECC using BCH and am having some 
> issues. I am able to successfully work with NAND flash that requires 4 
> bits ECC per 512 bytes but I am having issues with one of our boards 
> that has a NAND device that requires 24 bits of ECC per 1024 bytes.
> 
> I was wondering if ECC of this magnitude has been successfully tested in 
> the past. By my calculations I should have 42 bytes of ECC per 1K block 
> (m=14, t=24 for 336 bits of ECC data). My problem is that when decoding 
> an encoded block I am seeing that nroots != err in decode_bch() after 
> find_poly_roots(). I am seeing this for all of the blocks I attempt to 
> read. As far as I can tell the data being sent to BCH is good, though it 
> might have a few bad bits but nowhere near 24.
> 
> I am also seeing this same behavior in my U-Boot code which uses the 
> identical bch and nand_bch code.
> 

Hi Aaron,

CC-ing your message to linux-mtd which is the place to go for such questions :-)

Your configuration (m=14 t=24 with 1024 bytes of data) has been tested, and should work
with the BCH library. Could you give some details about your ECC setup:

1. Are you trying to locate and correct errors from hardware-computed syndromes ?

2. If yes, did you provide the BCH lib with the specific primitive polynomial used by
   your hardware ? What is this polynomial ?

3. Could you provide the ECC bytes generated for the following block patterns:
  - a 0xff-filled 1024 bytes block
  - a 0xff-filled 1024 bytes block, except for the first byte set to 0xfe
  This would help me find out how to setup the library to match your hardware.

Regards,
-- 
Ivan
