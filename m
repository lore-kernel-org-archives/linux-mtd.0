Subject: Re: Bad assumption about ID field definition for Samsung NAND?
From: David Woodhouse <dwmw2@infradead.org>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <4C6EED3B.4000001@broadcom.com>
References: <20100818180538.GA12238@code-monkey.de>
	<4C6C6BFC.9020408@broadcom.com> <20100819171558.GA8536@code-monkey.de>
	<AANLkTikiTX6US09pVu+uYm_U5=70WVbF+eH9wBtDeWKM@mail.gmail.com>
	<4C6DAFFD.4040602@broadcom.com>
	<AANLkTi=9RmDvzx-5n0UbnMUj2zMm41b1VA=PQqXK_Wgc@mail.gmail.com>
	<20100820134316.GA437@code-monkey.de> <4C6EBE90.2090604@broadcom.com>
	<1282334008.25239.91.camel@localhost> <4C6EED3B.4000001@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 Aug 2010 22:34:41 +0100
Message-ID: <1282340081.25239.134.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "r64343@freescale.com" <r64343@freescale.com>,
	Kevin Cernekee <cernekee@gmail.com>,
	Tilman Sauerbeck <tilman@code-monkey.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-08-20 at 14:01 -0700, Brian Norris wrote:
> > Can I have a signed-off-by for it?
> 
> I don't know what's "legal" here. I'm appending the patch with a
> sign-off for me and Tilman (since Tilman authored it). Hopefully that's
> ok.

You have to cut and paste Tilman's own Signed-off-by: header; the magic
doesn't work if you type it yourself. :)

> > Brian, I have a distinct impression that there's at least one more patch
> > from you that I really ought to be sending to Linus for 2.6.36, but I
> > can't find it right now. Other than this and what's already in
> > mtd-2.6.git, is there anything else?
> 
> I'm really no expert on how inclusion for different versions goes; I
> just send 'em to you! Anyway, this patch is *very* important:
> 	* [PATCH] mtd: nand: Fix regression in BBM detection
> 	http://lists.infradead.org/pipermail/linux-mtd/2010-August/031594.html
> It addresses issues I overlooked with a lot of Hynix small-page NAND
> (and others).

That's in the tree already:
http://git.infradead.org/mtd-2.6.git/commitdiff/065a1ed8 

It's also https://bugzilla.kernel.org/show_bug.cgi?id=16639

> Other patches - they are ready, but not as important:
> 	* Spansion ORNAND
> 	http://lists.infradead.org/pipermail/linux-mtd/2010-August/031603.html
> 	* New Samsung MLC OOB sizes
> 	http://lists.infradead.org/pipermail/linux-mtd/2010-August/031621.html

Those aren't regressions or important bug-fixes, so given the timing I
think they've missed the merge window and are now candidates for 2.6.37
rather than 2.6.36?

I'll merge them as soon as I've asked Linus to pull what's in the tree
right now. Unless you object to my classification?

> No one has decided between these two (it's a "choose one or the other"
> situation). They may or may not be ready:
> 	mtd: nand: Expand nand_ecc_layout, deprecate ioctl ECCGETLAYOUT
> 	Cover page: http://lists.infradead.org/pipermail/linux-mtd/2010-August/031591.html
> 	Choice 1: http://lists.infradead.org/pipermail/linux-mtd/2010-August/031593.html
> 	Choice 2: http://lists.infradead.org/pipermail/linux-mtd/2010-August/031598.html
> 	Explanation: http://lists.infradead.org/pipermail/linux-mtd/2010-August/031619.html

Yeah, definitely 2.6.37 material.

> And since you asked, the trivial...
> 	Indentation errors :)
> 	http://lists.infradead.org/pipermail/linux-mtd/2010-August/031588.html

That can wait for 2.6.37 too.

> You already got this one, I believe:
> 	Fixing a typo in on a buswidth option
> 	http://lists.infradead.org/pipermail/linux-mtd/2010-August/031518.html

Yep, that's already in 2.6.36-rc1.

> Thanks for looking out for me :)
> 
> Brian
>
> ----------------------------------------------------------------
> 
> Apparently, the check for a 6-byte ID string is NOT sufficient to
> determine whether or not a Samsung chip uses their new MLC detection
> scheme or the old, standard scheme. This adds a condition to check cell
> type.
> 
> Signed-off-by: Tilman Sauerbeck <tilman@code-monkey.de>
> Signed-off-by: Brian Norris <norris@broadcom.com>
> ---

Just FYI; not to criticise when you're doing such excellent work -- this
would ideally have a From: and Subject: "header" indicating that Tilman
is the author, and giving the first line of the commit comment. That
way, running 'git-am' on it would fairly much work. Not that it's a
problem for me to do it either, of course.

Thanks again.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
