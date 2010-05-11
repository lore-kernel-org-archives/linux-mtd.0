Received: from mika.eatserver.nl ([195.20.9.75])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OBqrr-0004c7-IT
	for linux-mtd@lists.infradead.org; Tue, 11 May 2010 14:55:33 +0000
Message-ID: <4BE96FD7.7020005@aimvalley.nl>
Date: Tue, 11 May 2010 16:55:19 +0200
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Thorsten_M=FChlfelder?= <muehlfelder@enertex.de>
Subject: Re: Some questions on bit-flips and JFFS2
References: <201005031505.18604.muehlfelder@enertex.de>
	<201005041659.26262.muehlfelder@enertex.de>
	<4BE12D86.2070605@aimvalley.nl>
	<201005111009.06724.muehlfelder@enertex.de>
In-Reply-To: <201005111009.06724.muehlfelder@enertex.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thorsten Mühlfelder wrote:
> Am Wednesday 05 May 2010 10:34:14 schrieb Norbert van Bolhuis:
>> It much more easier to let UBI/UBIFS deal with this suff. It's designed for
>> this.
>> u-boot support UBIFS (read-only). This means you can put a kernel image
>> on UBIFS and make u-boot read/boot it.
> 
> How would I do this? The only thing I've found about it is this discussion of 
> April 2008:
> http://lists.infradead.org/pipermail/linux-mtd/2008-April/021268.html
> 
> Thanks for any tip
> Thorsten
> 

What I meant was to keep the NAND flash partitions the same and
use UBIFS (i.s.o. JFFS2) and of course also put the kernel uImage on
UBIFS.
The goal here is to make u-boot read and boot the kernel image from UBIFS
(i.s.o. from bare NAND).
But I understand Linux cannot read whatever Sam-Ba 2.5 writes, so I guess
it's not even possible to read the kernel image and put it on UBIFS.

Or can you put a kernel image on it beforehand ? are we talking about
deployed systems or to be deployed systems ?

Maybe you first have to find a solution for the Sam-Ba Linux
incompatibility. I guess u-boot can read the kernel uImage, so u-boot
does seem to understand whatever Sam-Ba 2.5 writes.

Anyway, if you switch to UBIFS and *can* put the kernel image on UBIFS
fatal bit flips in the uImage on bare NAND don't matter.
On the other hand: fatal bit flips in bootstrap/u-boot/u-boot_env will still
prevent the system to boot. So maybe also refreshing those images is necessary.

You need a recent linux kernel and u-boot for them to support UBIFS.

Note that: if you would upgrade your system with a new u-boot/linux and
UBIFS i.s.o. JFFS2, *everything* on flash will change. If you want to do
this for deployed systems you need a huge upgrade script.


I don't use NAND+UBIFS myself, so I have no experience there.

The below pointers should have some relevant info though:

- u-boot home-page: http://www.denx.de/wiki/U-Boot/WebHome
- u-boot mailing list: http://lists.denx.de/pipermail/u-boot/
- u-boot source code GIT tree: http://git.denx.de/cgi-bin/gitweb.cgi?p=u-boot.git;a=tree
   (checkout boards with NAND and boot-from-NAND support)
- specialized GIT trees for NAND and UBI: http://www.denx.de/wiki/U-Boot/Custodians


Regards,
Norbert.
