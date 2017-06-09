Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dJQzr-0005kK-7R
 for linux-mtd@lists.infradead.org; Fri, 09 Jun 2017 20:59:09 +0000
Received: by mail-pf0-x241.google.com with SMTP id u26so9692047pfd.2
 for <linux-mtd@lists.infradead.org>; Fri, 09 Jun 2017 13:58:43 -0700 (PDT)
Date: Fri, 9 Jun 2017 13:58:40 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Andrea Adami <andrea.adami@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mtd: sharpsl: add sharpslpart MTD partition parser
Message-ID: <20170609205840.GO102137@google.com>
References: <1492287078-22369-1-git-send-email-andrea.adami@gmail.com>
 <1492287078-22369-2-git-send-email-andrea.adami@gmail.com>
 <d9ef9878-932c-955a-5ba6-c0f0ec03731c@gmail.com>
 <20170417164412.3dc5b457@bbrezillon>
 <CAAQYJAsOJy=SCpBxvrQvfPt6LJ=FjAxDw2gr=5s-vT+8xM-DPQ@mail.gmail.com>
 <20170418113556.54e25231@bbrezillon>
 <20170609023251.GN102137@google.com>
 <20170609091643.4e70e629@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170609091643.4e70e629@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Fri, Jun 09, 2017 at 09:16:43AM +0200, Boris Brezillon wrote:
> On Thu, 8 Jun 2017 19:32:51 -0700
> Brian Norris <computersforpeace@gmail.com> wrote:
> > On Tue, Apr 18, 2017 at 11:35:56AM +0200, Boris Brezillon wrote:
> > > On Tue, 18 Apr 2017 10:58:02 +0200
> > > Andrea Adami <andrea.adami@gmail.com> wrote:  
> > > > On Mon, Apr 17, 2017 at 4:44 PM, Boris Brezillon <
> > > > boris.brezillon@free-electrons.com> wrote:  
> > > > > I'll try to document myself on the on-flash format of the FTL and
> > > > > partition table before giving a definitive opinion, but I have the
> > > > > feeling this ancient FTL is not 100% safe, and by accepting an old
> > > > > (maybe unreliable?) FTL we are setting a precedent, and refusing other
> > > > > (broken) proprietary/vendor FTLs will be almost impossible after that.  
> > 
> > IIUC, drivers/mtd/*ftl*.c shows several FTLs in the kernel... And I'll
> > admit I've basically never reviewed them. I don't think they've really
> > created much precedent either...except that I'm bringing them up right
> > now ;) and possibly that no good alternatives have been developed,
> > except for UBI (and IMO, UBI doesn't necessarily apply in all the same
> > situations that some "boot partitions" might; you have to bootstrap
> > *somewhere*).
> 
> Okay, so you're fine merging FTLs as long as the code is pretty and
> it's already used on real devices, even if the FTL is badly designed?

No, that's not what I'm saying. What I'm saying is that the slippery
slope argument has not held up here, and that in certain cases, 100%
perfection is not necessary. Particularly (and this is what I tried to
understand below), if this is mostly a read-only mapping, then I don't
see a lot of problem. It's just trying to determine a few
essentially-static parameters from the flash.

...

> Does that mean we should support all vendor FTLs just
> because they are shipped on devices? I'm not against FTLs in general,
> but shouldn't we decide to merge them only after reviewing their design
> and making sure they can be safely used?

I more or less agree. The one part I didn't quite get on board with is
why we have to review the entire FTL to accept a (very limited in scope)
parser for a few relatively static pieces of info.

> > 
> > > > Read only is safe.  
> > > 
> > > This is a lie.  
> > 
> > I don't see where you've disproved the claim of safety. The following
> > all seems to be a non sequitur.
> 
> Just because it's only read-only from the kernel point of view, not in
> general.

OK, I get where you're coming from.

> > But my understanding (about the "safety" question) is that this whole
> > FTL construct is:
> > (a) required by the bootloader and
> > (b) not touched outside the bootloader, except (mostly, barring the
> > advanced tooling that people use infrequently, for installation?) read
> > only in a parser like this proposed one
> 
> Andrea, maybe I'm wrong, but I had the impression you had tools to
> update partitions embedded in the FTL (I'm not talking about partitions
> defined in the partition table, but the FTL embeds several sections,
> including one which is storing a kernel image).

I would also appreciate Andrea's analysis on the volatility here. What
type of data gets written, and by whom? When does the FTL mapping ever
get modified?

I did go read through the FTL R/W code from the github link briefly, and
I think at least this one useful property is true:

Eraseblocks that aren't modified cannot get screwed up by R/W behavior
to other blocks, unless a new block manages to duplicate the logical
block number of the one we care about (this shouldn't happen). So
essentially, this partition parsing is fine with all the other blocks
being garbage.

For *writing*, it looks like it's a pretty stupid sequence: copy old
block to memory; make modifications; find unmapped block; erase block;
write new data; erase old block. When rebuilding the mapping from
scratch, it discards duplicate logical blocks, and accepts only the
first one it finds. There doesn't seem to be much provision for
interruption in between blocks of a higher-level operation. So
presumably, interrupting rewriting the kernel region, for example, is
not power-cut safe.

> > > AFAIU, you have all the necessary tools to update the
> > > partition table from user-space, so even if you only have read-only
> > > support in the kernel, one can corrupt it from userspace, and the
> > > kernel may not be able to recover from this corruption.  
> > 
> > How is this any different from, e.g., GPT on block devices? Just because
> > user space can clobber the partition table doesn't mean we don't allow
> > GPT.
> 
> If you can update other partitions embedded in the FTL (like the kernel
> partition) independently, and those updates can corrupt your partition
> table, then it's a bit different from the example you're giving, because
> the user did not asked for a partition table update and may end up with
> a device that do not boot.

Understood. IIUC, the partition metadata should be relatively well
protected. I don't think their mapping can be corrupted by transactions
on distinct eraseblocks, and from the docs Andrea sent, the adjacent
data is all static. Single-block updates (e.g., for updating the
partition table) make an attempt at safety, but they still look prone to
ending up in a half-programmed state -- the FTL *might* recover from
having 1.5 copies of a logical block (and pick up the intact one), but
that's not very well guaranteed.

> My point is that, if we decide to support this FTL in the kernel, why
> keeping those user-space tools to update the partition table (and other
> parts available in this FTL). Having all the logic maintained in the
> same place makes code maintenance easier (when a bug is detected, you
> don't have to update 2 different code base for example).

We don't have in-kernel GPT programmers. We let user-space deal with
that. (And are GPT updates even power-cut safe? I know there are two
copies of the partition table, but I wasn't sure everyone does a good
job at looking for the alternate, if the primary is corrupt...)

I think I would be quite wary of including the R/W mechanism in the
kernel, especially given the above issues. But I'm not 100% convinced
that's a blocker, given the properties above. By supporting the
partition metadata, I don't think we're guaranteeing that the kernel
update flow is safe, for instance.

> Anyway, I'm glad someone else finally had a look at this code, and as I
> said earlier, I won't block it, so we're all good.

Thanks for your thoughts. I appreciate your concerns, and they made me
think about this a little more closely. And I'd like a little further
response from Andrea (and you too, if you have more thoughts) before
continuing with this.

Brian
