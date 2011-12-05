Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXMPy-0005XK-FE
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 00:28:27 +0000
Received: by bkcje16 with SMTP id je16so3176365bkc.36
 for <linux-mtd@lists.infradead.org>; Sun, 04 Dec 2011 16:28:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1322119614.24797.294.camel@sauron.fi.intel.com>
References: <1321473837-27891-1-git-send-email-computersforpeace@gmail.com>
 <1321568352.2272.33.camel@koala>
 <CAN8TOE8uSW5rHbs8VeTFTNcqNwZGwUZpPJpfOgxtUsGL1PTJZg@mail.gmail.com>
 <1321653636.2141.0.camel@koala> <87k46xrqyr.fsf@macbook.be.48ers.dk>
 <CAN8TOE8Gd97SXK1ACCtatJ97Q8ESZQJNH5mVU0Ej2ruOL0dZRQ@mail.gmail.com>
 <1321735668.2167.2.camel@koala>
 <CAMjpGUfB0OoP_TvQ+eVEwx6_nmJ0p4jrCyu4ceTQBHGeRvUm-Q@mail.gmail.com>
 <1321743864.2167.6.camel@koala>
 <1321790131.15493.85.camel@shinybook.infradead.org>
 <1321794503.2170.3.camel@koala>
 <CAMjpGUdsdppTEOuPdWTGGU=ztbyvoF4_=TiZ1RqQ4W1_wFhbkQ@mail.gmail.com>
 <1321997940.2222.19.camel@koala>
 <CAMjpGUdxGfo7dfSNhzQUHg3QGkKW7rQewiFhDjGyJ0TjjQkdkA@mail.gmail.com>
 <1322034324.24797.230.camel@sauron.fi.intel.com>
 <CAMjpGUfkc7JftBx5uMBDy7YAn2z4yCh6eVYibEZ9pQayphFcsQ@mail.gmail.com>
 <1322119614.24797.294.camel@sauron.fi.intel.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sun, 4 Dec 2011 19:28:02 -0500
Message-ID: <CAMjpGUfCKSLk78t8ULgcm0wGH_2pU6CXwP_UY=iSaC7kTUgpMg@mail.gmail.com>
Subject: Re: [PATCH 0/2] small mtd-utils fixes
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Kevin Cernekee <cernekee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 24, 2011 at 02:26, Artem Bityutskiy wrote:
> On Wed, 2011-11-23 at 20:45 -0500, Mike Frysinger wrote:
>> sure, but we're not taking about options here, we're talking about
>> required arguments:
>> ./make-release.sh <version> [output_dir]
>
> Yes, but my point was that this way is not very normal and not
> "standard" for Unix, at least by my perception of "standard".

for tools installed into $PATH and expected a little "higher" terms of
quality, then sure, it's not standard.  for tiny scripts in repo dirs
that serve specific functions, i think it's fairly common.

i think it should be the way i suggested, but i won't fight over it
too much ... i'm not the one making releases after all.
-mike
