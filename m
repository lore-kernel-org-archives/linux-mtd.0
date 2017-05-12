Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d97gU-0002IR-81
 for linux-mtd@lists.infradead.org; Fri, 12 May 2017 10:20:32 +0000
Date: Fri, 12 May 2017 12:19:08 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Mario Rugiero <mrugiero@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Richard Weinberger
 <richard.weinberger@gmail.com>
Subject: Re: [PATCH] mtd: nand: add option to erase NAND blocks even if
 detected as bad.
Message-ID: <20170512121908.135da352@bbrezillon>
In-Reply-To: <CAKKQwLSwL76mBVbr2-w6mh4RS1bzRGuLCx2TwuQ=fnNjdxsZhg@mail.gmail.com>
References: <20170512053957.10426-1-mrugiero@gmail.com>
 <CAFLxGvyTvqY69AeoSrKWNjea-8u5YxKEBOznpUj9g==_UDnLew@mail.gmail.com>
 <CAKKQwLTGFY+bfFCoPNtvpFK-w-3SnNc_G2xDd_xip3iiwVDM4A@mail.gmail.com>
 <20170512102407.217b805a@bbrezillon>
 <CAKKQwLTVpsu8j50BkqkgBwk9A3rPfrYDUTYDXbAn_OiA-tUd7g@mail.gmail.com>
 <20170512104554.5670bb4d@bbrezillon>
 <CAKKQwLQueea6G4B-cng9QdpjtRWyBWHw1Mq9ai3DVp31xswANg@mail.gmail.com>
 <20170512110230.56e6250d@bbrezillon>
 <CAKKQwLT2n==ta=qjZtxZPyqyjBRBLtBKr_uWBjtjy-yjMPVM+A@mail.gmail.com>
 <982c0331-216c-3096-9349-d18e2247ddac@nod.at>
 <CAKKQwLSkv_bVPxYqjUKqasDzZ6PiZdhiksipDbHmgnmVWPYN7Q@mail.gmail.com>
 <20170512113414.213f515b@bbrezillon>
 <CAKKQwLSwL76mBVbr2-w6mh4RS1bzRGuLCx2TwuQ=fnNjdxsZhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 12 May 2017 07:06:45 -0300
Mario Rugiero <mrugiero@gmail.com> wrote:

> 2017-05-12 6:34 GMT-03:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> > On Fri, 12 May 2017 06:26:14 -0300
> > Mario Rugiero <mrugiero@gmail.com> wrote:
> >  
> >> 2017-05-12 6:19 GMT-03:00 Richard Weinberger <richard@nod.at>:  
> >> > Am 12.05.2017 um 11:15 schrieb Mario Rugiero:  
> >> >> I'll read it carefully later. Is there any rough time estimate for it
> >> >> to hit mainline?
> >> >> I'm not expecting a date, but rather something in the lines of
> >> >> "several weeks, several months, several years".
> >> >> I think we can do with several months, and we'd be happy to start
> >> >> local experiments with that timeframe in mind.
> >> >> Several years might be more than the devices will live, though.  
> >> >
> >> > Since there is currently no funding it might take much longer.  
> >> GSoC sounds like a viable workaround.
> >> It'd hahve to wait for next year, though.
> >> I think I'm elligible, so if I still have access to these boards and
> >> Boris can mentor me, we could get funding to speed up the development.
> >> I'd be happy to donate it to have another developer, as I'm already
> >> kinda being paid for this.
> >> What do you think of that?  
> >
> > Yep, that's a possibility.  
> Great. Could you act as a mentor without GSoC for now?

Sure.

> I think I might be able to help after finishing with the slides, they
> seem clear enough, with proper guidance, and that'd help in my current
> work.
> I think I've read some slides from a previous talk by you, before the
> way to go was as clearly defined.

Actually, most of the development is done already, but we need to
intensively test the implementation and cleanup the code.

I also started to modify mtd-utils [1] to support the new format, but
didn't have time to finish.

[1]https://github.com/bbrezillon/mtd-utils/tree/ubi/mlc
