Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OC7Qy-0002NV-Jk
	for linux-mtd@lists.infradead.org; Wed, 12 May 2010 08:36:53 +0000
Subject: Re: UBIL design doc
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brijesh Singh <brijesh.s.singh@gmail.com>
In-Reply-To: <AANLkTilSqtxewM9WNSu814FT9qsctuuxNiK4pboX2xjr@mail.gmail.com>
References: <m2l6b5362aa1005081239ne9eea253jc66c61822c4c1502@mail.gmail.com>
	<1273475736.2209.88.camel@localhost>
	<alpine.LFD.2.00.1005102011400.3401@localhost.localdomain>
	<1273650099.22706.41.camel@localhost>
	<AANLkTilSqtxewM9WNSu814FT9qsctuuxNiK4pboX2xjr@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 12 May 2010 11:35:41 +0300
Message-ID: <1273653341.22706.46.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-mtd@lists.infradead.org,
	rohitvdongre@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-05-12 at 13:33 +0530, Brijesh Singh wrote:
> Hi,
> 
> On Wed, May 12, 2010 at 1:11 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Tue, 2010-05-11 at 21:17 +0200, Thomas Gleixner wrote:
> >> B1;2005;0cOn Mon, 10 May 2010, Artem Bityutskiy wrote:
> >>
> >> > On Sun, 2010-05-09 at 01:09 +0530, Brijesh Singh wrote:
> >> > > Hi,
> >> > >   I am forwarding you the design document for ubi with log. Please
> >> > > find the ubil document at
> >> > > http://git.infradead.org/users/brijesh/ubil_results/blob_plain/HEAD:/UBIL
> >> > > design document.pdf
> >>
> >> @Brijesh, thanks for tackling this !
> >>
> >> > Hi guys,
> >> >
> >> > I've read the document. Looks very promising. Here some feed-back.
> >> >
> >> > 1. SB PEB wear-out. What if the reaseblock lifetime is, say, 10000
> >> > erease cycles? Won't the SB PEB wear out very quickly? Why you did not
> >> > go for the chaining approach which I described in the old JFFS3 design
> >> > doc?
> >> >
> >> > If we do not implement chaining, we should at least design it and make
> >> > sure UBIL can be extended later so that SB chaining could be added.
> >>
> >> The super block needs to be scanned for from the beginning of flash
> >> anyway due to bad blocks. Putting it into a fixed position (first good
> >> erase block) is a very bad design decision vs. wear leveling.
> >>
> >> The super block must be moveable like any other block, though we can
> >> keep it as close to the start of flash as possible.
> >>
> >> Also chaining has a tradeoff. The more chains you need to walk the
> >> closer you get to the point where you are equally bad as a full scan.
> >
> > Well, every new chain member reduces the superblock wear speed by order
> > 2, so I the chain would have 2-4 eraseblocks in most cases, I guess,
> > which is not bad.
> >
> > In the opposite, moving the SB 3-4 eraseblocks further only reduces the
> > load merely by factor 3-4.
> >
> >> > 2. SB PEB at the end. I think this is a very bad idea. Imagine you have
> >> > to do UBIL images for production on the factory. With your design you
> >> > have the following bad drawbacks:
> >> >
> >> >   a. NAND flash has initial bad blocks, and you do not know how many,
> >> >      and where they sit. These may be the last 8 eraseblocks. So, when
> >> >      you prepare an image (say, with the ubinize user-space tool), where
> >> >      will you put the second SB PEB?
> >> >
> >> >   b. Currently, UBI/UBIFS images are small. E.g., if you make an
> >> >      UBI/UBIFS image for 1GiB flash, and you have just few KiB of files,
> >> >      your image will be few megs - it will contain the files, and all
> >> >      the needed UBI/UBIFS meta-data.
> >> >
> >> >      So now what will be image size for UBIL - 1GiB, and this is bad.
> >> >      You then will transfer 1GiB of data to the devices during flashing
> >> >      or you will have to invent ways to work around this. Do you need
> >> >      these complexities?
> >> >
> >> > I think the second SB PEB should not be at the end.
> >>
> >> I think we do not need a second SB at all. UBI should not depend on
> >> the super block in any way. The super block is an optimization for the
> >> common case - nothing more.
> >
> > Yeah, if we preserve the headers we can always fall-back to scanning
> > should something be broken.
> >
> >>
> >> > 3. Backward-compatibility. In UBIL you removed EC anc VID headers in
> >> >    PEBs. That's fine for optimization purposes. But it has draw-backs:
> >> >
> >> >    a. If any of the UBIL meta-data blocks like SB, CMT or log are
> >> >       corrupted - that's it - we are screwed. You cannot anymore
> >> >       re-consturct the data by scanning. The robustness goes down.
> >> >
> >> >    c. Backward compatibility - UBI will not be able to attach UBIL
> >> >       images. This is not very nice.
> >> >
> >> > So, I think you should keep EC and VID headers in PEBs. And you should
> >> > make the SB/CMT/log blocks to be a new type of UBI volume with
> >> > UBI_COMPAT_DELETE or UBI_COMPAT_PRESERVE or UBI_COMPAT_RO type. In this
> >> > case UBI will attach UBIL volumes just fine.
> >> >
> >> > Then, you can add an _option_ to have no EC/VID headers in PEBs. This
> >> > then can be used for performance, if one wants to sacrifice robustness.
> >> > But this should be the second step. In this case, you will just need to
> >> > put a VID header with UBI_COMPAT_REJECT flag to the first PEB.
> >>
> >> I don't think it's a good idea to kill the EC/VID headers. It not only
> >> violates the backwards compability it also fundamentally weakens UBIs
> >> reliability for no good reason and I doubt that the performance win is
> >> big enough to make it worth.
> >>
> >> The performance gain is at attach time by getting rid of the flash
> >> scan, but not by getting rid of writing the EC/VID headers.
> >
> > Well, there are some space savings as well.
> >
> >>
> >> The logging is a speed up / optimization for the common case, but it
> >> needs to preserve full reconstruction via scanning all eraseblocks and
> >> checking the EC/VID headers. That also allows retrofitting on existing
> >> devices.
> >>
> >> I'd rather see the super block / log volume as a checkpointing
> >> mechanism which provides a snapshot of the EC/VID headers at a given
> >> point and a list of eraseblocks which need to be scanned at attach
> >> time.
> >>
> >>
> >> That has two main advantages:
> >>  1) It limits the number of log writes
> >>  2) It allows full backward and forward compatibility
> >
> > I think this is what they do, but they for some reasons removed the
> > headers. If they add them back, it should look like you described.
> >
> > We should preserve the headers. It is always easy to disable them later,
> > if someone needs this for optimization purposes. E.g., we can add an
> > ubi_compat=0 option or something like that.
> >
> >> Looking at
> >> http://git.infradead.org/users/brijesh/ubil_results/blob/HEAD:/nand_mount_time.pdf
> >> I still see a linear - though less steep - attach time. For the 1GB
> >> flash size it's still 0.8s which is nice progress vs. the 2s for the
> >> non logging case. But that's surprising as one would expect that
> >> logging would provide a more aggressive and non linear gain.
> >>
> >> Just doing the simple math:
> >>
> >> 1GB FLASH with erase block size 128K and page size 2k, that
> >> translates to 8192 erase blocks
> >>
> >> So UBI scans 8192 erase block EC/VID headers in 2 seconds. That
> >> equals to 8192 FLASH pages.
> >>
> >> UBIL needs 0.8 seconds. That means that UBIL still scans ~3236 FLASH
> >> pages (or spends the equivivalent time) to achieve the same result.
> >>
> >> That looks wrong. Care to explain ?
> >
> > I suspect these are implementation issues. I did not look at the code,
> > but I suspect they read whole CMT block and populate the all EB
> > associations at scan time. However, they could populate them lazily,
> > which would optimize things.
> I am trying to summarize what I have understood.
> I will send the patches if this is correct.
> 1) Commit will have ec and vid headers just as any other UBI block.
> The compat flag helps in backword compatibility,
> 2)chained sb will locate commit. It will be part of internal volume as well.
> 3) Commit will be called on unmount.
> 4) Any unclean un-mount will lead to flash scanning just as UBI.

No! Why you have the log then? Unclean reboots are handled by the log.

Scanning happens only when you have _corrupted_ SB, or corrupted cmt, or
log. Then you fall-back to scanning.

> Any thing goes bad, normal scanning becomes recovery.
> 5) Not sure if log is required in first place. But it could be an option.
> Is that correct?

No, at least I did not suggest you to get rid of the log. It is needed
to handle unclean reboots.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
