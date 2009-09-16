Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mnopw-00040M-3n
	for linux-mtd@lists.infradead.org; Wed, 16 Sep 2009 07:22:00 +0000
Subject: Re: 2.6.32 -mm merge plans
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <8bd0f97a0909152051s4a25b9eej581c68a3b10fda3@mail.gmail.com>
References: <20090915161535.db0a6904.akpm@linux-foundation.org>
	<20090916000357.GD23923@linux-sh.org>
	<20090915171826.4bd7f1d4.akpm@linux-foundation.org>
	<8bd0f97a0909152051s4a25b9eej581c68a3b10fda3@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 16 Sep 2009 10:21:09 +0300
Message-Id: <1253085669.3778.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kmpark@infradead.org, linux-kernel@vger.kernel.org,
	Paul Mundt <lethal@linux-sh.org>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-09-15 at 23:51 -0400, Mike Frysinger wrote:
> On Tue, Sep 15, 2009 at 20:18, Andrew Morton wrote:
> > On Wed, 16 Sep 2009 09:03:57 +0900 Paul Mundt wrote:
> >> On Tue, Sep 15, 2009 at 04:15:35PM -0700, Andrew Morton wrote:
> >> > mtd-make-onenand-genericc-more-generic.patch
> >> > mtd-nand-add-page-parameter-to-all-read_page-read_page_raw-apis.patch
> >> > mtd-nand-add-new-ecc-mode-ecc_hw_oob_first.patch
> >> > mtd-nand-davinci-add-4-bit-ecc-support-for-large-page-nand-chips.patch
> >> > mtd-nand-davinci-add-4-bit-ecc-support-for-large-page-nand-chips-update.patch
> >> > mtd-jffs2-fix-read-buffer-overflow.patch
> >> > mtd-prevent-a-read-from-eraseregions.patch
> >> > mtd-prevent-a-read-from-regions.patch
> >> > mtd-jedec_probe-fix-nec-upd29f064115-detection.patch
> >> > mtdpart-memory-accessor-interface-for-mtd-layer.patch
> >> >
> >> >   -> dwmw2
> >>
> >> Regarding mtd-make-onenand-genericc-more-generic.patch, I'm not really
> >> sure what happened. To recap:
> >>
> >> It was posted to the mtd list here:
> >>
> >> http://lists.infradead.org/pipermail/linux-mtd/2009-August/026805.html
> >>
> >> Kyungmin objected to the driver name change here:
> >>
> >> http://lists.infradead.org/pipermail/linux-mtd/2009-August/026807.html
> >>
> >> I pointed out that the rough rationale for the name change here:
> >>
> >> http://lists.infradead.org/pipermail/linux-mtd/2009-August/026808.html
> >>
> >> and offered to redo the patch keeping the old name if Kyungmin felt the
> >> rationale wasn't valid, but received no reply. Subsequently, Artem
> >> mentioned that he had merged it in to his l2-mtd-2.6.git tree here:
> >>
> >> http://lists.infradead.org/pipermail/linux-mtd/2009-August/026866.html
> >>
> >> which subsequently seems to not actually have happened.
> >>
> >> This is a pretty trivial patch, and I don't mind respinning it in
> >> whatever form folks are content with. I had assumed given the mention
> >> that it had been merged in to the l2 tree that the rationale was
> >> sufficient for merging.
> >
> > I don't think that Artem's tree is in linux-next, so I have no
> > visibility of what's happening with that patch.
> >
> > I do think that Artem's tree should be in linux-next.
> >
> > I guess I'll just hose the patch at dwmw2 and will see what happens.  I
> > sent it on Aug 6, with no effect.
> 
> i guess i shouldnt try and bounce a few more mtd patches through you huh ...
> 
> http://git.kernel.org/?p=linux/kernel/git/vapier/blackfin.git;a=shortlog;h=for-mtd
> 
> hopefully they make it in this cycle (they were posted a while ago to
> the mtd lists w/feedback addressed)

Well, these patches have been sitting in my tree in dunno for long as
well. They are still there:

http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/commit/951d5f4097ccf8c41ccbab6d4116509b89b705fd
and below.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
