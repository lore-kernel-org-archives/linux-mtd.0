Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1drQsz-0000Ji-Uk
 for linux-mtd@lists.infradead.org; Mon, 11 Sep 2017 15:44:35 +0000
Message-ID: <1505144649.14367.85.camel@gmail.com>
Subject: Re: Actual usage of files in ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Ricard Wanderlof <ricard.wanderlof@axis.com>, Richard Weinberger
 <richard.weinberger@gmail.com>
Cc: Jonas Holmberg <jonashg@axis.com>, Linux mtd
 <linux-mtd@lists.infradead.org>,  Cristian Ionescu-Idbohrn <cii@axis.com>
Date: Mon, 11 Sep 2017 18:44:09 +0300
In-Reply-To: <alpine.DEB.2.11.1709111711400.14549@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.11.1709111143420.14549@lnxricardw1.se.axis.com>
 <CAFLxGvz+_m0u6naPErkYMH2o53muj5TxNVSH82uKF-_FX9SesA@mail.gmail.com>
 <alpine.DEB.2.11.1709111711400.14549@lnxricardw1.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2017-09-11 at 17:18 +0200, Ricard Wanderlof wrote:
> On Mon, 11 Sep 2017, Richard Weinberger wrote:
> 
> > On Mon, Sep 11, 2017 at 11:47 AM, Ricard Wanderlof
> > <ricard.wanderlof@axis.com> wrote:
> > > 
> > > Is there a (simple) way to find out exactly how much space each
> > > specific
> > > file uses in an ubifs fils system?
> > > 
> > > I looked into running mkfs.ubifs with some form of option to give
> > > me the
> > > info, the closest I got was -g 3 which output a lot of sizes but
> > > it was
> > > not obvious exactly what they meant.
> > > 
> > > I suppose it would be fully possible to add code to mkfs.ubifs to
> > > output
> > > this information, as it surely must be there at some point, since
> > > it
> > > selects the compression algorithm on a file per file basis,
> > > debending on
> > > the amount of compression acheived for each algorithm.
> > 
> > Well, how exactly should it be?
> > I guess you want more than the compressed size on flash.
> > Do you also want to know how much bytes a file occupies in the
> > index
> > tree and the inode itself?
> > This is non-trivial.
> 
> Good point. I was solely thinking along the lines of how much space
> the 
> actual file occupied, not considering metadata. That would be a good 
> starting point. I'm guessing that for moderate file sizes the
> metadata 
> would be relatively small compared to the file itself?

I would think a "slow" version of this would not be that hard to
implement - walk the index and sum up node sizes. Subtract header sizes
if you do not want metadata.

I am not sure what would be the API? Do other FSes implement something
like this?
