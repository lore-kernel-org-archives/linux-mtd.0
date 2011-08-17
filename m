Received: from antispam01.maxim-ic.com ([205.153.101.182])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qtb5X-0000IX-BD
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2011 08:03:00 +0000
From: Brian Foster <brian.foster@maxim-ic.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 5/5] mtdinfo: consolidate help as display_help()
Date: Wed, 17 Aug 2011 10:02:43 +0200
References: <CAMjpGUdR-Z-mSN0oRgeVfWJ7jFjmvaKyKL3aMo-58-HZsmNidQ@mail.gmail.com>
	<201108160918.15975.brian.foster@maxim-ic.com>
	<CAN8TOE9yGBts+8oZ-TZoSH8wRdRmctN5c6w3JQgUdbwmpRNJGw@mail.gmail.com>
In-Reply-To: <CAN8TOE9yGBts+8oZ-TZoSH8wRdRmctN5c6w3JQgUdbwmpRNJGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <201108171002.43683.brian.foster@maxim-ic.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Mike Frysinger <vapier.adi@gmail.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 16 August 2011 19:12:38 Brian Norris wrote:
> On Tue, Aug 16, 2011 at 12:18 AM, Brian Foster <brian.foster@maxim-ic.com> wrote:
>[ ... ]
> >  The other thing I won't worry about is the assumption every
> >  output byte in PROGRAM_NAME is a printing glyph occupying
> >  exactly one cell.  That is true (in this case) ....
> 
> Not sure how often anyone needs to worry about this one...

 In a previous job, this issue(in several variations) was real and live.
 So it's always in the back of my mind....   ;-)

> this particular discussion is mostly an exercise in frivolity

 Agreed!

 Many thanks for your kind and patient help.
cheers,
	-blf-
-- 
Brian FOSTER
Principal MTS, Software
Maxim Integrated Products (Microcontroller BU), formerly Innova Card
Web    : http://www.maxim-ic.com/
