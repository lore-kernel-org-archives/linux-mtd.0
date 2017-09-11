Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1drQUb-0006AX-6h
 for linux-mtd@lists.infradead.org; Mon, 11 Sep 2017 15:19:23 +0000
Date: Mon, 11 Sep 2017 17:18:52 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
CC: Linux mtd <linux-mtd@lists.infradead.org>, Jonas Holmberg
 <jonashg@axis.com>, Cristian Ionescu-Idbohrn <cii@axis.com>
Subject: Re: Actual usage of files in ubifs
In-Reply-To: <CAFLxGvz+_m0u6naPErkYMH2o53muj5TxNVSH82uKF-_FX9SesA@mail.gmail.com>
Message-ID: <alpine.DEB.2.11.1709111711400.14549@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.11.1709111143420.14549@lnxricardw1.se.axis.com>
 <CAFLxGvz+_m0u6naPErkYMH2o53muj5TxNVSH82uKF-_FX9SesA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 11 Sep 2017, Richard Weinberger wrote:

> On Mon, Sep 11, 2017 at 11:47 AM, Ricard Wanderlof
> <ricard.wanderlof@axis.com> wrote:
> >
> > Is there a (simple) way to find out exactly how much space each specific
> > file uses in an ubifs fils system?
> >
> > I looked into running mkfs.ubifs with some form of option to give me the
> > info, the closest I got was -g 3 which output a lot of sizes but it was
> > not obvious exactly what they meant.
> >
> > I suppose it would be fully possible to add code to mkfs.ubifs to output
> > this information, as it surely must be there at some point, since it
> > selects the compression algorithm on a file per file basis, debending on
> > the amount of compression acheived for each algorithm.
> 
> Well, how exactly should it be?
> I guess you want more than the compressed size on flash.
> Do you also want to know how much bytes a file occupies in the index
> tree and the inode itself?
> This is non-trivial.

Good point. I was solely thinking along the lines of how much space the 
actual file occupied, not considering metadata. That would be a good 
starting point. I'm guessing that for moderate file sizes the metadata 
would be relatively small compared to the file itself?

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
