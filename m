Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gU5Kc-00057N-8X
 for linux-mtd@lists.infradead.org; Tue, 04 Dec 2018 07:41:24 +0000
Date: Tue, 4 Dec 2018 08:41:09 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Cc: Richard Weinberger <richard@nod.at>, Sasha Levin <sashal@kernel.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Stable <stable@vger.kernel.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Juergen <juergen.lachmann@harman.com>
Subject: Re: [PATCH] ubi: fastmap: Check each mapping only once
Message-ID: <20181204074109.GA27141@kroah.com>
References: <20181126103842.3249-1-martin.kepplinger@ginzinger.com>
 <CADVatmP1h7GJJRVURkinwSM44Y4iooMP-U_7zew4V+zsMva4Vw@mail.gmail.com>
 <20181202143543.GE221015@sasha-vm> <1678636.EYQpd7BODG@blindfold>
 <e977dca6-60f0-ce5b-d116-30acf60058f9@ginzinger.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e977dca6-60f0-ce5b-d116-30acf60058f9@ginzinger.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 04, 2018 at 08:39:16AM +0100, Martin Kepplinger wrote:
> On 02.12.18 16:02, Richard Weinberger wrote:
> > Sasha,
> > 
> > Am Sonntag, 2. Dezember 2018, 15:35:43 CET schrieb Sasha Levin:
> > > On Sun, Dec 02, 2018 at 11:50:33AM +0000, Sudip Mukherjee wrote:
> > > > > > Now queued up for 4.14.y, thanks.
> > > > > 
> > > > > can you *please* slow a little down?
> > > > 
> > > > True. It will really help if you can have some sort of fixed schedule
> > > > for stable release, like maybe stablerc is ready on Thursday or Friday
> > > > and release the stable on Monday. Having a weekend in stablerc will be
> > > > helpful for people like me who only get the time in weekends for
> > > > upstream or stable kernel.
> > > 
> > > Any sort of schedule will never work for everyone (for example, if it's
> > > part of your paid job - you don't necessarily want to review stuff over
> > > the weekend).
> > 
> > a schedule is not needed, but please give maintainers at least a chance
> > to react on stable inclusion request.
> > In this case Martin asked for inclusion on Monday and the patch was applied
> > two days later.
> 
> True, especially when the maintainer is asked a question as part of the
> patch.
> 
> I've already had the feeling that we'd need the other patch too, but in this
> case at least I should have searched for Fixes tags.
> 
> Greg, how about reminding people of Fixes tags in
> Documentation/process/stable-kernel-rules.rst ?

Reminding people how?  Patches to that file are always gladly accepted :)

thanks,

greg k-h
