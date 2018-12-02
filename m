Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTTGy-0003IE-4L
 for linux-mtd@lists.infradead.org; Sun, 02 Dec 2018 15:03:05 +0000
From: Richard Weinberger <richard@nod.at>
To: Sasha Levin <sashal@kernel.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 martin.kepplinger@ginzinger.com, Stable <stable@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Juergen <juergen.lachmann@harman.com>
Subject: Re: [PATCH] ubi: fastmap: Check each mapping only once
Date: Sun, 02 Dec 2018 16:02:47 +0100
Message-ID: <1678636.EYQpd7BODG@blindfold>
In-Reply-To: <20181202143543.GE221015@sasha-vm>
References: <20181126103842.3249-1-martin.kepplinger@ginzinger.com>
 <CADVatmP1h7GJJRVURkinwSM44Y4iooMP-U_7zew4V+zsMva4Vw@mail.gmail.com>
 <20181202143543.GE221015@sasha-vm>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sasha,

Am Sonntag, 2. Dezember 2018, 15:35:43 CET schrieb Sasha Levin:
> On Sun, Dec 02, 2018 at 11:50:33AM +0000, Sudip Mukherjee wrote:
> >> > Now queued up for 4.14.y, thanks.
> >>
> >> can you *please* slow a little down?
> >
> >True. It will really help if you can have some sort of fixed schedule
> >for stable release, like maybe stablerc is ready on Thursday or Friday
> >and release the stable on Monday. Having a weekend in stablerc will be
> >helpful for people like me who only get the time in weekends for
> >upstream or stable kernel.
> 
> Any sort of schedule will never work for everyone (for example, if it's
> part of your paid job - you don't necessarily want to review stuff over
> the weekend).

a schedule is not needed, but please give maintainers at least a chance
to react on stable inclusion request.
In this case Martin asked for inclusion on Monday and the patch was applied
two days later.

As you noted not everyone works full time on the kernel and gets paid for that.
So it might take a few days to react and review such a request.

Thanks,
//richard
