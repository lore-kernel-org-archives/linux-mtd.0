Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OdlpV-0002cd-Jb
	for linux-mtd@lists.infradead.org; Tue, 27 Jul 2010 15:12:33 +0000
Received: by fxm3 with SMTP id 3so770814fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Jul 2010 08:12:28 -0700 (PDT)
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <AANLkTinJbZXx+YY7dxhmuEJ4XgN4Fj77=fFo_2WYL1fJ@mail.gmail.com>
References: <AANLkTi=nYBryUf8SyNFAcx_PPqTfdmY=x835Q-RhLmAn@mail.gmail.com>
	<1280121714.14917.40.camel@localhost>
	<AANLkTinJbZXx+YY7dxhmuEJ4XgN4Fj77=fFo_2WYL1fJ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 27 Jul 2010 18:12:15 +0300
Message-Id: <1280243535.3021.29.camel@localhost.localdomain>
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

On Mon, 2010-07-26 at 17:13 -0400, Matthew L. Creech wrote:
> Hi Artem, thanks for the reply.  Responses below:
> 
> On Mon, Jul 26, 2010 at 1:21 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >
> > UBI wants 1% of PEBs to be reserved for bad block handling.
> >
> 
> OK, so with my flash layout it wants to reserve 81 blocks for bad PEB
> handling, and does so when first initialized.  Then during the course
> of normal device operation (lots of reads & writes), let's say 8 more
> of them go bad that weren't factory bad blocks.  Will it now print
> this warning because it only has 73 reserve PEBs left?  (In which case
> it seems fairly innocuous, right?)

OK, you are right, UBI should not bug you so early, there are still
plenty of reserved PEBs left. What do you think about the following
algorithm:

1. If this is a new image, preserve current behavior and warn.
2. If we see that this is a system which has already been used, we warn
only when the reserve is really about to end, say, 5% of the reserve is
left.

> > Yes. But in the log you sent I do not see any message about autoresize
> > happening - UBI prints them.
> >
> 
> Correct, this device was running for a while (several months) before
> it started having problems.  I've never seen the warning printed on a
> brand new device (which is the only time autoresize happens, right?),
> but I've seen it on several that have been in operation for a while.

OK, I see. So the problem is that UBI does not distinguish between a new
image and an used one, AFAICS.

> I just wanted to be sure that I'm using autoresize properly, and that
> it's not somehow screwing up the # of reserved PEBs.  But it doesn't
> seem like that's the case.  (Unless the sequence # or non-erased flash
> are to blame - below).

Yes, it looks like the warning should be fixed.

> > Does it erase whole flash before writing the image? I see that your
> > image sequence number is 0, which means you probably use old ubi tools.
> > Please, use the latest ubinize - it should pick random sequence number,
> > or you may use -Q option.
> >
> 
> I am using up to date mtd-utils now, but this device has been in the
> field for months.  We were using a mtd-utils git snapshot from 4/29/09
> to generate the UBI image.

Ok, I see.

> I didn't know about the sequence number, I'll be sure we use an
> updated mtd-utils for our next firmware version.

Yeah, it is new, we introduced it when we faced the problems when users
for some reasons interrupt flashing or an error occur during flashing,
but then users still can boot, but have various interesting issues.

> Could this account for the warning and/or the UBIFS error below?  Or
> would these kinds of problems manifest in a different way entirely?

Well, theoretically they can. But if users did not re-flash your
devices, then obviously not.

> >
> > When you see this warning, can you mount UBIFS? Does it look OK?
> >
> 
> So far I've only noticed it on 3 devices.  All 3 had UBIFS errors
> (below) later on in the boot process, which is what prompted me to
> wonder what the warning meant.  I'm not entirely sure that the UBI
> warning and UBIFS error are related, but so far I haven't noticed the
> warning on any other devices.

I do not think the warning is related to those issues.

> > Can you please enable UBI debugging messages and also "Additional UBI
> > initialization and build messages" and attach a log? See this writing
> > for help: http://www.linux-mtd.infradead.org/faq/ubi.html#L_how_debug
> >
> 
> Certainly.  I enabled all the relevant UBI and UBIFS debugging options
> that I saw, along with internal self-checks, but there's still not a
> whole lot of output.  Full console dump is attached - this is a
> different device than the first, but exhibits the same problem.

I'm sure your ring buffer contains more information. This is one of the
reasons I gave you the above link - it explains that not all messages go
to console and how to get all meassages. Try to use dmesg. In UBIFS code
I see that 'ubifs_read_node()' calls 'dbg_dump_node()' which should dump
the node.

But '255' is 0xFF, so probably UBIFS read all 0xFF. This may be an UBIFS
bug, or some corruption, difficult to say. For some reason the place
where a valid znode should live is erased.

May be if I have a NAND dump of your broken device I can look at it, but
do not promise anything, and I'm also on holiday :-)

> Unfortunately I'm not yet sure what causes the devices to get into
> this state, so I can't easily reproduce whatever makes it get into
> this state in the first place.  However I own one of them and have it
> at my desk, so I can perform any tests & gather any additional info
> that would be helpful.

What is your kernel? If it is old, make sure you have fixes from the
back-port trees.

> 
> FYI, I did build & run all of the MTD test modules to prove out the
> platform-level NAND code (MPC 8313), and encountered no problems.
> However, that was on a different device (one that works fine), since
> the nature of the tests means that I have to re-partition my flash so
> that there's a spare MTD to work with.

This really does not look like a NAND/MTD driver issue. More look like
either an UBIFS bug of some kind of corruption which corrupted an EC or
VID header, then UBI decided to erase this PEB, and then UBIFS reads all
0xFFs from there.

The second theory should BTW be fixed. Indeed, when UBI finds a PEB with
corrupted headers, it adds this PEB to the 'corr' list, and then just
erases. But this is wrong! It should erase them only if there are all
0xFFs in the rest of the block.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
