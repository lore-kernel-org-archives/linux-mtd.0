Received: from linux2003-temp-17.226.gwc.org.uk ([212.240.17.226]
	helo=lapdancer.baythorne.internal)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19iWfF-0007Rs-Ew
	for <linux-mtd@lists.infradead.org>; Fri, 01 Aug 2003 10:57:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Philippe <philippe@accuitee.com>
In-Reply-To: <000001c35789$aebf6220$6401a8c0@jennifer>
References: <000001c35789$aebf6220$6401a8c0@jennifer>
Message-Id: <1059731746.19396.30.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Fri, 01 Aug 2003 10:55:49 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 and CVS Drivers
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-07-31 at 18:32, Philippe wrote:
> Now I want to use two partitions (there is a similar post but it's
> pretty old and there were no real answer) :
>  - 2Mb (NFTL/EXT2) kernel + initrd.gz (RO)
>  - 30Mb (JFFS/JFFS2) config files, log files etc... (RW)

There _is_ no real answer at the moment. We're working on it though.

The new DiskOnChip translation layer, INFTL, does contain a kind of
partitioning scheme of its own, which makes this kind of thing easier. I
think if we declare a 'binary partition' we should be able to use JFFS2
on it -- we're _supposed_ to have magic stuff in the spare area of each
block but we should be able to omit that since nothing will be actually
checking for it.

So I think what we need to do is make the DiskOnChip/INFTL code register
multiple partitions as separate MTD devices, according to what it finds
in the INFTL media header. 

M-Systems recommend that we use the original (non-partition-capable)
NFTL on the older devices, just as their tools do. I suppose if you're
using JFFS2 then compatibility with the status quo isn't really a
priority for you, so that's not an issue. It may affect the bootstrap
using their BIOS though -- I'm not sure. You may need to use Grub, which
doesn't yet have INFTL support; only NFTL.

> I read (the last two weeks) that setting up JFFS2 on DOC is tricky. 
> I saw several posts (from 2001) with patches to build a
> FAKE_PARTITION_SYSTEM. I wasn't able to set it up with my 2.4.20
> kernel and MTD stuff.

I merged some of that code already; all that remains is the fake
partitioning, and that should be fairly easy to patch in by hand if you
want it -- what did you try and in what way did you fail? That's your
best option for the moment -- use nftl_format with an NFTL size as you
desire, and hack the doc2000.c code to register a second partition on
which you use JFFS2.


> I looked into the MTD stuff and saw that there is a NAND-Driver for the
> DiskOnChip (nand/diskonchip.c). 
> 
> - Is this piece of code usable ?

Not really. I've been mounting JFFS2 on it -- it doesn't handle multiple
NAND devices in a single DiskOnChip yet, and doesn't do hardware ECC --
I've been using it with software ECC instead for now. You're unlikely to
get NFTL working with it for a while.

> - Is there any documentation or any howto which explain how to configure
> the kernel to use the DiskOnChip with it?

No -- I was going to finish the code before attempting to document it,
to prevent people from using it before it's ready :)

-- 
dwmw2
