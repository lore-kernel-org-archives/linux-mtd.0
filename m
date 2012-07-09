Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SoBjp-0001u0-Hf
 for linux-mtd@lists.infradead.org; Mon, 09 Jul 2012 11:02:48 +0000
Received: by bkcji2 with SMTP id ji2so5302153bkc.36
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jul 2012 04:02:37 -0700 (PDT)
Date: Mon, 9 Jul 2012 14:02:32 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: [PATCH 2/5] ubi: Limit amount of reserved eraseblocks for bad
 PEB handling
Message-ID: <20120709140232.7c5a93a3@pixies.home.jungo.com>
In-Reply-To: <CACQ1gAhOtCTVVnSvso1-jq+MyminKC2i244d9je=v0acAzzRBw@mail.gmail.com>
References: <1341389164-24409-1-git-send-email-shmulik.ladkani@gmail.com>
 <1341389164-24409-3-git-send-email-shmulik.ladkani@gmail.com>
 <CACQ1gAhOtCTVVnSvso1-jq+MyminKC2i244d9je=v0acAzzRBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 9 Jul 2012 12:15:17 +0200 Richard Genoud <richard.genoud@gmail.com> wrote:
> 2012/7/4 Shmulik Ladkani <shmulik.ladkani@gmail.com>:
> > +       /*
> > +        * Calculate the actual number of PEBs currently needed to be reserved
> > +        * for future bad eraseblock handling.
> > +        */
> > +       ubi->beb_rsvd_level = ubi->bad_peb_limit - ubi->bad_peb_count;
> > +       if (ubi->beb_rsvd_level < 0) {
> > +               ubi->beb_rsvd_level = 0;
> > +               ubi_warn("number of bad PEBs (%d) is above the expected limit "
> > +                        "(%d), not reserving any PEBs for bad PEB handling, "
> > +                        "will use available PEBs (if any)",
> > +                        ubi->bad_peb_count, ubi->bad_peb_limit);
> > +       }
> >  }
> is it ok for beb_rsvd_level to be in the range [0..x[ instead of [2..x[ ?

Yes, it is ok in my new scheme.
It is even mandatory, otherwise more and more PEBs will attempt to be
reserved for future bad PEB handling (as 'beb_rsvd_pebs' always wishes
to reach 'beb_rsvd_level') even if passed the limit - this is exactly
what I'd like to fix.

Regards
Shmulik
