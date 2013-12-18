Received: from extern.plris.com ([212.199.10.23] helo=plris.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VtFz8-0004Jj-Fd
 for linux-mtd@lists.infradead.org; Wed, 18 Dec 2013 12:12:20 +0000
From: Leon Pollak <leonp@plris.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: U-Boot <-> Kernel; NAND operation proposal
Date: Wed, 18 Dec 2013 14:11:51 +0200
Message-ID: <44755689.5hBTTXJrYo@leonp.plris.com>
In-Reply-To: <alpine.DEB.2.00.1312181251480.9627@lnxricardw.se.axis.com>
References: <15767373.ASaqbyTd0J@leonp.plris.com>
 <alpine.DEB.2.00.1312181251480.9627@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 18 December 2013 12:54:45 Ricard Wanderlof wrote:
> On Wed, 18 Dec 2013, Leon Pollak wrote:
> > I beg your pardon ahead for possible stupidity and inconsistency of
> > what I am going to say - this may be simply because of the lack of
> > experience. Below is my story and proposal as the result.
> > 
> > During the last 2 years, my product, which is based on DM368 (ARM7
> > based TI CPU) and Micron's NAND flashes (256MiB, 2K page) behaves
> > unstably. This means that some units from time to time refuse to
> > boot for different reasons.
> > 
> > Today, after so long time and so many corrections, I can say that
> > most of the problems (not all!), which lead to the unit unable to
> > start to the end (to the application) where because of the
> > incompatible modes of NAND operating between u-boot and kernel.
> > 
> > For example, in the configuration I started from, which was supplied
> > by some vendor as evaluation board, u-boot was configured to use
> > 4-bit HW ECC, while kernel used 1-bit SW ECC.
> > 
> > The OOB layouts used in both systems were different.
> > Also BBT were configured differently.
> > 
> > There were several other "small things", which combination was
> > inconsistent and produced the incorrect NAND functioning, which
> > finally in some cases made the unit inoperative.
> 
> It would seem to me that if parameters such as ECC strength and BBT
> were configured differently between the boot loader and kernel, you
> would get a system which wouldn't boot even the first time, not work
> for a while and then fail.
It worked...:-( 
And confused everybody.
Fro example - ROM boot loader used HW 4bit ECC to burn and bring up U-
Boot, but U-Boot itself used 1-Bit SW ECC to burn YAFFS.
Everything worked till there was a second error in YAFFS partition.

OOB layout was also different.

BBT was not used at all.

There were more issues...:(

 
> > The major issue here is that such inconsistencies are not manifested
> > in some way, until the unit suddenly refuse to boot up after 2
> > weeks or 2 years.
> > 
> > All this lead me to the following thought (very draftly):
> > 
> > Each NAND has the "spare free" area in the first (zero) block, which
> > is used for storing CIS information. This information does not
> > occupy all the block, which usually is several hundreds of
> > kilobytes.
> > So, this "spare" place may be used for storing some descriptive
> > information of ALL possible NAND flash and its service parameters.
> > I am speaking about ECC bits, Sw/HW, OOB layout, BBT layout, patter
> > places, bad block marks, and everything else you can imagine.
> > 
> > Further, this information must be used both by u-boot and kernel. Or
> > even by other components, for example, RBL/UBL in DM36x from TI.
> 
> I'm not sure I follow you. First of all, what is CIS ? 
CIS stands for Card Information Structure.


> Secondly, the
> first block in a NAND flash is no different from the other blocks
> when it comes to the data it can hold. 
Well, I am not a big guru in this.
But I saw that all of the vendors I worked with declare the first block 
to be more robust and require only 1-bit ECC.
For example, our Micron chip promises block 0 to work with 1-bit ECC, 
while all the rest require 4-bit.


> True, in systems where NAND
> flash is the boot media, the boot loader out of necessity resides in
> the first block, but a boot loader could fill out the whole block
> leaving no free space there.
Hmmm... You probably have much more experience then me.
But in my case (DM36x CPU from TI) the CPU ROM boot loader reads block 
#1(!!! - not 0) to look for User Boot Loader (UBL) which normally has 
14-16 KiB size.

But I am speaking about the block zero, which contains the CIS and some 
left space.

Again, the whole idea is to have some standard description which unify 
all components.
May be the place to store it in the block zero is not ideal - I have too 
small experience to judge here...

Thank you.
-- 
Leon
