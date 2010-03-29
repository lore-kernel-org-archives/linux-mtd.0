Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NwAF0-0005lG-22
	for linux-mtd@lists.infradead.org; Mon, 29 Mar 2010 08:22:38 +0000
Subject: Re: UBI bootloader support, any progress?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Frank de Lange <frank@unternet.org>
In-Reply-To: <4B7EB448.8090402@unternet.org>
References: <4B7EB448.8090402@unternet.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 29 Mar 2010 11:20:26 +0300
Message-ID: <1269850826.28259.3.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-02-19 at 16:54 +0100, Frank de Lange wrote:
> Hiya,
> 
> I'm in the process of reviving a piece of dot-bomb history in the form 
> of a Virgin WebPlayer [1]. The thing is based around a Geode GLlv@200MHz 
> + CS5530 and a 48 MB M-Systems DOC. When launched it ran a modified 
> Redhat Linux distribution. Video and sound were handled through 
> VSA-emulated drivers so performance was not super.
> 
> This webplayer - one of four around here - has been used on a canoe 
> expedition over the Yukon [2], after that as a dialup server and for the 
> last 5 years as a file/print/web/mail server. This task has now been 
> taken over by something slightly more beefy so it is looking for a new 
> task. It will spend the foreseeable time as an NX terminal with some 
> local processing capability intended mainly for my 5 y old daughter.
> 
> After a week of hacking the thing now runs a native framebuffer, native 
> X server and native audio and performs like it never did. It does still 
> run from a harddrive though, one of the first batch of 'magical pixie 
> dust' 20 GB travelstar drives which has been in continuous use for ten 
> years now. The plan is to move the salient bits to the DOC and get rid 
> of the drive. Moving the bits is easy but booting the thing will be 
> harder given that I plan to use UBIFS.
> 
> The DOC was supported in LILO so it still runs a patched, ancient LILO 
> 21.7. Grub can be made to see the DOC with a bit of work so that would 
> also be an option. The problem lies in UBI and UBIFS... this is not 
> supported in either. Das U-Boot supports UBI but not this board. Porting 
> it to the board is feasible - especially since I ignore all VSA stuff - 
> but more work than I care for.
> 
> The question then is whether there has been any progress in getting 
> bootloader support for UBI. I have searched the archives and looked at 
> the code but not found what I'm looking for: potential working 
> bootloader (grub/lilo/something similar) support for UBI on nand mtd 
> devices. Has anyone started implementing (read-only) UBI support in GRUB 
> or another similar BIOS-loaded bootloader?
> 
> I have also considered Linuxbios/Coreboot. That might be an option for 
> the long term but short-term I'd like to use the existing BIOS and just 
> replace the harddrive with the DOC. So... any pointers?

Hi,

it looks like U-boot is the only option. You might as well just put the
kernel to a separate partition any format supported by your boot-loader.
Then you can load and run the kernel, and make the kernel mount the rest
of your flash.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
