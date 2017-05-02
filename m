Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d5Mh8-0008MZ-EA
 for linux-mtd@lists.infradead.org; Tue, 02 May 2017 01:33:40 +0000
Received: by mail-pg0-x241.google.com with SMTP id c2so8033719pga.2
 for <linux-mtd@lists.infradead.org>; Mon, 01 May 2017 18:33:17 -0700 (PDT)
Date: Mon, 1 May 2017 18:33:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH] mtd: nand: don't leak buffers when ->scan_bbt() fails
Message-ID: <20170502013313.GA136952@google.com>
References: <20170502000455.13240-1-computersforpeace@gmail.com>
 <CAAEAJfAvSGz5-B2rLTzr-W-Hmv_m9NSZz_fx9Q-bY_kRc8yaLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAEAJfAvSGz5-B2rLTzr-W-Hmv_m9NSZz_fx9Q-bY_kRc8yaLQ@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 01, 2017 at 09:22:03PM -0300, Ezequiel Garcia wrote:
> On 1 May 2017 at 21:04, Brian Norris <computersforpeace@gmail.com> wrote:
> > This bug seems to have been here forever, although we came close to
> > fixing all of them in [1]!
> >
> > [1] 11eaf6df1cce ("mtd: nand: Remove BUG() abuse in nand_scan_tail")
> >
> 
> Well, we came even closer. See [1] for a patch that fixes this by cleaning
> BBT init and release.

That's a different bug(fix), no?

> Back then Boris suggested on IRC to wait for Peter Pan's BBT, which would
> address this too.

Haha, well bad strategy I guess :)

> It's interesting to note that: (1) the patch never got any formal feedback,
> despite it was a fix; and (2) Peter Pan's work is still under development.

Yes, well you kinda nacked yourself, so (1) isn't that surprising. And
(2) is well...no comment.

> Guess I should have pressed the upstream buttons harder :-)

I suppose.

I'd be happy to see you resubmit, since I definitely would prioritize
bugfixes over years-long refactoring. But I guess I'd defer to Boris, et
al, who are paying much more attention to NAND stuff these days than I
am. I just noticed this when bugfixing some things I noticed in Boris's
pull request.

Brian

> [1] http://lists.infradead.org/pipermail/linux-mtd/2016-April/066834.html,
> [2] http://lists.infradead.org/pipermail/linux-mtd/2016-April/066835.html
> -- 
> Ezequiel García, VanguardiaSur
> www.vanguardiasur.com.ar
