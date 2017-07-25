Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1da0oT-00029h-V3
 for linux-mtd@lists.infradead.org; Tue, 25 Jul 2017 14:27:55 +0000
Received: by mail-wr0-x242.google.com with SMTP id y67so19182096wrb.3
 for <linux-mtd@lists.infradead.org>; Tue, 25 Jul 2017 07:27:32 -0700 (PDT)
Date: Tue, 25 Jul 2017 16:27:29 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/5] ubi: Allow to use read-only UBI volume with not
 enough PEBs
Message-ID: <20170725142729.GL30901@pali>
References: <1496418222-23483-1-git-send-email-pali.rohar@gmail.com>
 <1496418222-23483-6-git-send-email-pali.rohar@gmail.com>
 <CAFLxGvzg2+wv91HuJCK6Z0U865NvqY2q=e7mmJKOe3_MrQskhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFLxGvzg2+wv91HuJCK6Z0U865NvqY2q=e7mmJKOe3_MrQskhA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 21 July 2017 22:12:51 Richard Weinberger wrote:
> Pali,
> 
> On Fri, Jun 2, 2017 at 5:43 PM, Pali Rohár <pali.rohar@gmail.com> wrote:
> > In read-only mode is skipped auto-resize. For pre-build images ready for
> > auto-resize there can be reserved more PEBs as whole size of pre-build
> > image. In read-only we do not do any write operation therefore this would
> > allow to use read-only UBI volume which is not auto-resized yet.
> >
> > Signed-off-by: Pali Rohár <pali.rohar@gmail.com>
> > ---
> >  drivers/mtd/ubi/vtbl.c |   14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
> > index 263743e..1d708c5 100644
> > --- a/drivers/mtd/ubi/vtbl.c
> > +++ b/drivers/mtd/ubi/vtbl.c
> > @@ -240,8 +240,10 @@ static int vtbl_check(const struct ubi_device *ubi,
> >                 if (reserved_pebs > ubi->good_peb_count) {
> >                         ubi_err(ubi, "too large reserved_pebs %d, good PEBs %d",
> >                                 reserved_pebs, ubi->good_peb_count);
> > -                       err = 9;
> > -                       goto bad;
> > +                       if (!ubi->ro_mode) {
> > +                               err = 9;
> > +                               goto bad;
> > +                       }
> 
> I fear this is not correct, it will disable a legit self-check of UBI volumes.
> If the read-only volume is corrupted/truncated and you miss PEBs, this
> check will no longer
> trigger.
> 
> Especially when dealing with nanddumps, truncation is a common problem.

Any idea how to fix it? Or how to handle read-only images which are
marked for auto-resize?

-- 
Pali Rohár
pali.rohar@gmail.com
