Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLBDj-0008Ix-RM
 for linux-mtd@lists.infradead.org; Tue, 10 Feb 2015 13:51:20 +0000
Date: Tue, 10 Feb 2015 14:50:30 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: default bitflip-reporting threshold to 75%
 of correction strength
Message-ID: <20150210145030.5987fa63@bbrezillon>
In-Reply-To: <20150121094257.6c9d6214@bbrezillon>
References: <54B38745.70007@atmel.com>
 <1421095889-12717-1-git-send-email-computersforpeace@gmail.com>
 <20150117200137.71c1aca0@bbrezillon>
 <20150121082257.GB5273@norris-Latitude-E6410>
 <20150121094257.6c9d6214@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Richard Weinberger <richard@nod.at>, Steve deRosier <derosier@gmail.com>,
 Josh Wu <josh.wu@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 21 Jan 2015 09:42:57 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi Brian,
> 
> On Wed, 21 Jan 2015 00:22:57 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:

[...]

> 
> > 
> > > Regarding the read-retry code, it currently stops retrying reading the
> > > page once the page has been successfully retrieved (or in other terms
> > > all bitflips have been fixed). But it might stop to soon, because by
> > > changing the bit level threshold (in other term retrying one more time)
> > > it might successfully read the page with less bitflips than the
> > > previous attempt (these are just supposition, I haven't tested it yet).
> > > If we can achieve that we could retry until we reach something below
> > > the bitflips threshold value, and if we fail to find any, just consider
> > > the lower number of bitflips found during those read-retry operations.
> > 
> > I believe I suggested scenarios like this to some flash vendors when
> > speaking to reps in person, but they didn't seem to consider that
> > likely. I think they were implying that there would be only one read
> > retry mode that gives a reasonable result. I'm not sure if they were
> > really the experts on that particular topic, though, or if they were
> > just giving me an answer to make me happy.
> 
> Okay, good to know. I'll try to do some more testing to verify that.

I did some more test on my cubietruck, trying other read-retry if the
threshold limit is reached (here is the code [1]), and it seems that
better read-retry mode are found in most cases (actually in all the
cases I encountered: see those traces [2]).

Note that I configured the bitflips_threshold to 3/4 of the
ecc-strength (exactly what you're doing in this patch).

Given these results I really think we should consider testing other
'read modes' if the succeeding one exceed the threshold value.

Best Regards,

Boris

[1]http://code.bulix.org/lvcs9x-87859
[2]http://code.bulix.org/xii8nw-87860

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
