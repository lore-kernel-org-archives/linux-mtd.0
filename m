Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OnC3p-0005dN-Jj
	for linux-mtd@lists.infradead.org; Sun, 22 Aug 2010 15:02:14 +0000
Received: by fxm12 with SMTP id 12so3091940fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 22 Aug 2010 08:02:12 -0700 (PDT)
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <1280244117.3021.36.camel@localhost.localdomain>
References: <AANLkTi=nYBryUf8SyNFAcx_PPqTfdmY=x835Q-RhLmAn@mail.gmail.com>
	<1280121714.14917.40.camel@localhost>
	<AANLkTinJbZXx+YY7dxhmuEJ4XgN4Fj77=fFo_2WYL1fJ@mail.gmail.com>
	<1280243535.3021.29.camel@localhost.localdomain>
	<1280244117.3021.36.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 22 Aug 2010 18:02:08 +0300
Message-ID: <1282489328.16502.71.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: stefani@seibold.net, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-07-27 at 18:21 +0300, Artem Bityutskiy wrote:
> On Tue, 2010-07-27 at 18:12 +0300, Artem Bityutskiy wrote:
> > This really does not look like a NAND/MTD driver issue. More look like
> > either an UBIFS bug of some kind of corruption which corrupted an EC or
> > VID header, then UBI decided to erase this PEB, and then UBIFS reads all
> > 0xFFs from there.
> > 
> > The second theory should BTW be fixed. Indeed, when UBI finds a PEB with
> > corrupted headers, it adds this PEB to the 'corr' list, and then just
> > erases. But this is wrong! It should erase them only if there are all
> > 0xFFs in the rest of the block.
> 
> Yeah, indeed looks like a bad bug in UBI. So, when we have some flash
> corruptions which corrupt the VID header, UBI just silently erases this
> PEB! And then we have small chances to find out why on LEB suddenly
> became unmapped (erased).
> 
> UBI logic is - if VID header is corrupted, it is because a sudden power
> cut while writing the header. And we can erase the PEB because if we
> were writing the header, we have not written the data yet.
> 
> But it does not bother checking what goes _after_ the header. If there
> are some data, UBI should not erase the PEB but preserve it and switch
> to R/O mode.
> 
> CCing Stefani, I think here group faced a similar issue recently - one
> of LEB suddenly disappeared. This may be the reason.
> 
> Then the other question - why VID became corrupted? Dunno, but if UBI
> won't erase the PEB we'll have better chances to find this out. Does
> this sound reasonable?

Are you able to reproduce this problem? Are you still interested in
this?

I'm going to teach UBI to be less harsh and avoid erasing PEBs which
have corrupted headers. I'm still thinking how to do this, though.

So, consider UBI is in situation that it is scanning the flash, and
encounters a PEB which has corrupted EC and VID headers. Currently UBI
just wipes blocks like this.

First of all, I do not know how often things like this happen in the
wild, in real systems. This should not happen, but I need to be careful.
This means that solutions like refusing attaching this MTD device or
switching to R/O mode immediately is not really good.

So, what I am thinking to do is to just preserve this PEB. Avoid erasing
it, but also put it aside, not use it for regular UBI I/O purposes,
remove from the wear-leveling cycle.

On NAND, this in most cases is doable, because we anyway have a pool of
PEBs reserved for bad eraseblocks handling. So UBI can use a PEB from
this pool, instead of that corrupted one.

On NOR, we do not have such pool. But many systems still probably use
less PEBs than it is available, so in many cases it is OK on NOR too.

We can allow for several corrupted PEBs like that. But if we have, say,
more than 8 PEBs like that, we can refuse attaching such flash.

But if UBI really runs out of PEBs, and really needs an empty PEB, we
can take the preserve corrupted PEBs and use them. In this case, we'll
have to erase them.

But my hope is that if we really have a nasty corruption, then upper
layers like UBIFS will notice this. Then users will have to look at the
logs, and notice UBI complains, and they will have the corrupted PEB for
investigations.

How does this sound? Ideas?

Artem.
