Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RR9d8-0007g4-RL
 for linux-mtd@lists.infradead.org; Thu, 17 Nov 2011 21:36:23 +0000
Received: by bkat2 with SMTP id t2so3399694bka.36
 for <linux-mtd@lists.infradead.org>; Thu, 17 Nov 2011 13:36:21 -0800 (PST)
Subject: Re: [PATCH 1/3] Add the snappy-c compressor to lib
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Thu, 17 Nov 2011 23:36:17 +0200
In-Reply-To: <4EBA7AC3.4080205@newsguy.com>
References: <1319978255.2126.33.camel@koala>
 <1319978545.2126.37.camel@koala> <4EBA5F7C.6000506@parrot.com>
 <4EBA7AC3.4080205@newsguy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1321565780.2272.12.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-11-09 at 05:06 -0800, Mike Dunn wrote:
> On 11/09/2011 03:09 AM, Matthieu CASTET wrote:
> >> On Sun, 2011-10-30 at 14:37 +0200, Artem Bityutskiy wrote:
> >>> This is a C port of the google snappy compressor. It has roughly
> >>> comparable compression to LZO, but is significantly faster on many file
> >>> types. For example it beats all other compressors on already
> >>> compressed data.
> >> Sounds cool, thanks Andi! Is any UBIFS user interested to try this out?
> >> I think this stuff needs some real users to make it go into mainline
> >> smoothly.
> >>
> > I could be interresting to have benchmarks on arm (or other system where UBIFS
> > is used).
> >
> > snappy use lot's of unaligned access.
> > They need to be emulated on pre-armv6 core.
> 
> 
> I'm currently testing ubifs on armv5 (xscale).  If you'd like me to collect some
> benchmark data, I'd be glad to help if you can provide a little guidance.

Yeah, of course it would be interesting to see. If snappy is a win-win
on ARM, we should merge it.

Artem.
