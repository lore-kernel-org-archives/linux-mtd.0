Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19FcXr-0002P6-BD
	for <linux-mtd@lists.infradead.org>; Tue, 13 May 2003 17:22:27 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Daniel Toussaint <daniel@arbor.com.tw>
In-Reply-To: <3EC0A6E3.5070404@arbor.com.tw>
References: <NEBBLJGMNKKEEMNLHGAIEEHGDAAA.mdharm@momenco.com>
	 <1052811622.10222.42.camel@imladris.demon.co.uk>
	 <3EC0A6E3.5070404@arbor.com.tw>
Message-Id: <1052842963.23450.160.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 13 May 2003 17:22:43 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 128Mb problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-05-13 at 09:03, Daniel Toussaint wrote:
> Interesting. My company wants to deploy the DiskOnChip millenium PLUS as 
> a new standard for our x86 embedded pc product line. (so far we were 
> using DIP sockets with a doc2000/mil as an option) . Our other option is 
> to just use raw memory chips of some kind -but then we leave the wince 
> and other embedded os users with more difficulties.  

YAFFS already runs on WinCE. JFFS2 already runs on eCos. Both are easily
portable.

> Also, they don't even want to comment on some issue's (for example
> jffs2 on DiskOnChip).

Put yourself in their shoes -- they're selling you hardware at premium
prices because you get it with their 'translation layer' software to
make it pretend to be a block device, on which you use a 'traditional'
journalling file system.

Now ask them about using a file system designed specifically to be used
directly on flash chips, and what do you _think_ they're going to say?
:)

> I work in support, and whenever a customer has problems with M-systems 
> binary drivers/ lilo install / license questions - I teach them how to 
> use the linux mtd utilities(+grub)  and this always solves all problems.

:)

> For the millenium plus however the only way to go is to use the 
> m-systems binary driver. A while back I saw that www.snapgear.com
> announced they had spend several months in developing open source (mtd 
> based drivers & the new INFTL layer) for the millenium plus - but 
> nothing has been released yet I -  probably licensing/nda issue's.

Until such time as that code is released, the advice remains: avoid this
hardware like the plague. Do not design it into new boards, do not
purchase it to plug into older socketed designs. Use real flash instead.

> To get back to the point: Being able to use the raw nand chips in Doc 
> devices and put jffs2/yaffs on it would be the greatest thing ever.
> My question is , following guidelines in the nand documentation on how 
> to write a "mapping driver for your board" is it theoretically possible 
> to get it to work? I am not an mtd guru - but  given  enough time , and 
> studying the current Doc code ,myself, or someone else might get it to 
> work some day?
> Or is there just no way to make it work due to lack of 
> information/licensing issue's ??

It can work. The only reason the DiskOnChip drivers don't use the
generic NAND code is because they predate it by about three years. It
shouldn't be hard to convert them -- and in fact you may not even need
to convert them to use the generic NAND code, but just make them agree
about the ECC API.

It's probably a few weeks' work, and if you don't want to, or can't do
it yourself, then there are probably quite a few people out there who'd
be willing to quote you for it.

-- 
dwmw2
