Received: from mail-ea0-f169.google.com ([209.85.215.169])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vu7yF-0000sW-BC
 for linux-mtd@lists.infradead.org; Fri, 20 Dec 2013 21:51:01 +0000
Received: by mail-ea0-f169.google.com with SMTP id l9so1119619eaj.28
 for <linux-mtd@lists.infradead.org>; Fri, 20 Dec 2013 13:50:02 -0800 (PST)
Sender: Leon Pollak <leon.pollak@gmail.com>
From: Leon Pollak <leonp@plris.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: U-Boot <-> Kernel; NAND operation proposal
Date: Fri, 20 Dec 2013 23:49:59 +0200
Message-ID: <1633642.Djqyt1X79r@leonp.plris.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA588CF@DBDE04.ent.ti.com>
References: <15767373.ASaqbyTd0J@leonp.plris.com>
 <44755689.5hBTTXJrYo@leonp.plris.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA588CF@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, Pekon and others.

As for the example of the NANDs with different block policy, please, see 
the "Features" first page of, for example, 
http://download.micron.com/pdf/datasheets/flash/nand/2gb_nand_m29b.pdf

And yes, I already reworked all components to have one ECC type and 
layout, thank you. Although it is VERY difficult now to upgrade the 
systems in the field, I think I will find the way to do this...

But the main idea of my turn to the list was not to solve my personal 
problem, but to raise the question of finding some technique to 
synchronize all components to one way of flash treatment.

This will allow to avoid such problems as mine in the future and will 
also simplify embedded systems configuration. IMHO.

My case was because of the fact that components were collected by some 
vendor who did not take care of this synchronization.
As the result the system looked like working perfect, while...
And as these kinds of problems are almost impossible to predict and 
test, my unification approach may be useful, I think.




On Thursday 19 December 2013 19:59:03 Gupta, Pekon wrote:
> Hi Leon,
> 
> >From: Leon Pollak
> >
> >>On Wednesday 18 December 2013 12:54:45 Ricard Wanderlof wrote:
> >>> On Wed, 18 Dec 2013, Leon Pollak wrote:
> >> It would seem to me that if parameters such as ECC strength and BBT
> >> were configured differently between the boot loader and kernel, you
> >> would get a system which wouldn't boot even the first time, not
> >> work
> >> for a while and then fail.
> >
> >It worked...:-(
> >And confused everybody.
> >Fro example - ROM boot loader used HW 4bit ECC to burn and bring up
> >U- Boot, but U-Boot itself used 1-Bit SW ECC to burn YAFFS.
> >Everything worked till there was a second error in YAFFS partition.
> >
> >OOB layout was also different.
> >
> >BBT was not used at all.
> >
> >There were more issues...:(
> 
> So the problem is that you had used 1-bit Hamming for kernel and
> file-system, and it failed due to wear-n-tear in NAND.
> Therefore, it's always advisable to use highest possible ecc-scheme
> available to increase the life-time of your product on field.
> 
> In-case you can still up-grade your kernel and u-boot to mainline
> versions, then you have the opportunity to use BCH8_SW ecc-scheme as
> of today.
> >> > The major issue here is that such inconsistencies are not
> >> > manifested
> >> > in some way, until the unit suddenly refuse to boot up after 2
> >> > weeks or 2 years.
> >> > 
> >> > All this lead me to the following thought (very draftly):
> >> > 
> >> > Each NAND has the "spare free" area in the first (zero) block,
> >> > which
> >> > is used for storing CIS information. This information does not
> >> > occupy all the block, which usually is several hundreds of
> >> > kilobytes.
> >> > So, this "spare" place may be used for storing some descriptive
> >> > information of ALL possible NAND flash and its service
> >> > parameters.
> >> > I am speaking about ECC bits, Sw/HW, OOB layout, BBT layout,
> >> > patter
> >> > places, bad block marks, and everything else you can imagine.
> >> > 
> >> > Further, this information must be used both by u-boot and kernel.
> >> > Or
> >> > even by other components, for example, RBL/UBL in DM36x from TI.
> 
> There are other alternatives to do dynamic switching of ecc-scheme:
> 
> *for u-boot*
> In earlier versions of u-boot, there was a 'nandecc' command which
> could be used to switch ecc-schemes on the fly in u-boot.
> So, if you could flash the above information on _any_ NAND block
> as raw data. You could use 'nand read.raw' command to read the
> information back without depending on ecc-scheme. And then
> dynamically change your ecc-scheme based on it.
> 
> *for kernel*
> You can keep multiple DTB flashed into NAND, each selecting a
> different ecc-scheme. And based on 'raw' data read from NAND
> in u-boot, you can pre-load the DTB of your choice of ecc-scheme.
> 
> >> I'm not sure I follow you. First of all, what is CIS ?
> >
> >CIS stands for Card Information Structure.
> >
> >> Secondly, the
> >> first block in a NAND flash is no different from the other blocks
> >> when it comes to the data it can hold.
> >
> >Well, I am not a big guru in this.
> >But I saw that all of the vendors I worked with declare the first
> >block to be more robust and require only 1-bit ECC.
> >For example, our Micron chip promises block 0 to work with 1-bit ECC,
> >while all the rest require 4-bit.
> 
> Is it possible for you to share the datasheet of such NAND device.
> (along with section where this detail is mentioned, I'll like to
> understand the background of this approach).
> In most of the device I have encountered, all the NAND blocks are
> same. However, it may happen that vendors may have a separate memory
> array (as OTP Memory Array, along normal NAND Memory Array) which can
> be programmed just once, and hence has more endurance.
> However you can do this for any other block as well.
> Refer to "Block Lock" and "Block Unlock" commands in Micron datasheet.
> >> True, in systems where NAND
> >> flash is the boot media, the boot loader out of necessity resides
> >> in
> >> the first block, but a boot loader could fill out the whole block
> >> leaving no free space there.
> >
> >Hmmm... You probably have much more experience then me.
> >But in my case (DM36x CPU from TI) the CPU ROM boot loader reads
> >block #1(!!! - not 0) to look for User Boot Loader (UBL) which
> >normally has 14-16 KiB size.
> >
> >But I am speaking about the block zero, which contains the CIS and
> >some left space.
> >
> >Again, the whole idea is to have some standard description which
> >unify all components.
> >May be the place to store it in the block zero is not ideal - I have
> >too small experience to judge here...
> 
> There are many alternative to do what you want.
> But is it possible for you to upgrade to kernel and u-boot ?
> because these may at-least require DT based kernel and
> u-boot supporting 'nandecc' command.
> 
> 
> with regards, pekon

-- 
Leon
