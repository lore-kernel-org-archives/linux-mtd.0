Received: from boisdslgw5poolb76.bois.uswest.net ([65.101.73.76] helo=ridgerun-lx.ridgerun.cxm)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15KPby-00082p-00
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jul 2001 20:25:26 +0100
Message-ID: <3B4CA966.D9B15BF8@ridgerun.com>
Date: Wed, 11 Jul 2001 13:30:46 -0600
From: Steve Kranz <skranz@ridgerun.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org, skranz@ridgerun.com
Subject: Re: MTD/mtdblock.c uclinux 2.0.38?
References: <3B49B4B2.87F7E8A5@ridgerun.com> <18484.994842717@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> uclinux 2.0.38 & MTD?
> Should work. Probably doesn't. Give me individual
> instances of places I broke the 2.0 compile, preferably
> with patches, and we'll deal with it.

Shown below are the problems I encountered when
attempting to build the latest MTD tree for uclinux
2.0.38. For the moment I have suspended efforts to get
this working under 2.0.38 and would be very interested
if someone could provide a MTD version or patch that
will work with that kernel. If so, please let me
know. Thank you!  :-)

Steve Kranz
skranz@ridgerun.com

---------------------------
My choosen config settings:
---------------------------
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
CONFIG_MTD_CHAR=y
CONFIG_NFTL=y
CONFIG_NFTL_RW=y
CONFIG_MTD_NAND=y

----------------
Missing Headers:
----------------
MTD depends on these headers which don't exist
within the uclinux tree.
linux/slab.h
linux/spinlock.h
linux/kmod.h

---------------
Other Problems:
---------------
include/linux/mtd/map.h line 65, generates error:
"field `list' has incomplete type"

Attempts to compile the MTD
statements __MOD_INC_USE_COUNT() and __MOD_DEC_USE_COUNT()
found in various locations with the MTD tree
generate these compile errors:
"structure has no member named `uc'"
"structure has no member named `flags'"

--------------
Version Notes:
--------------
I downloaded via cvs.infradead.org on
July 9, 2001. I placed it into my 2.0.38
uclinux tree and then applied the MTD
supplied patch mtd-uClinux-2.0.38.1pre7.patch.


-----------

David Woodhouse wrote:

> skranz@ridgerun.com said:
> > 1. Anybody know if instruction exist for installing MTD and nftl into
> > an uclinux 2.0.38 tree?
>
> Should work. Probably doesn't. Give me individual instances of places I
> broke the 2.0 compile, preferably with patches, and we'll deal with it.
>
> > 2. I'm interested in getting the SmartMedia slot of this arm7 board
> > working for both read and write -- and I'd like the SmartMedia card to
> > be readable/writable by a Windows machine too. Am I correct that this
> > interoperability constraint will prevent me from using JFFS? I'm
> > assuming that a vfat fs with MTD/nftl will do the trick for me. Yes,
> > no?
>
> You need to implement the SmartMedia translation layer format. It looks like
> there's enough information on the Samsung web site to do that.
>
> > 3. I've been glancing at MTD code and didn't think I saw any logic to
> > deal with the bad (unusable) blocks of a NAND flash device. Did I just
> > miss it?
>
> Done in the SmartMedia translation layer, not in the underlying device
> driver.
>
> --
> dwmw2
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
