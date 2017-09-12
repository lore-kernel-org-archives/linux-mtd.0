Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1drhIU-00040k-Ks
 for linux-mtd@lists.infradead.org; Tue, 12 Sep 2017 09:16:13 +0000
Date: Tue, 12 Sep 2017 11:15:25 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Richard Weinberger <richard@sigma-star.at>
CC: <dedekind1@gmail.com>, Jonas Holmberg <jonashg@axis.com>, Linux mtd
 <linux-mtd@lists.infradead.org>, Cristian Ionescu-Idbohrn <cii@axis.com>
Subject: Re: Actual usage of files in ubifs
In-Reply-To: <1682206.lC8nDS1gi7@blindfold>
Message-ID: <alpine.DEB.2.11.1709121106370.14549@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.11.1709111143420.14549@lnxricardw1.se.axis.com>
 <alpine.DEB.2.11.1709111711400.14549@lnxricardw1.se.axis.com>
 <1505144649.14367.85.camel@gmail.com> <1682206.lC8nDS1gi7@blindfold>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
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

> Am Montag, 11. September 2017, 17:44:09 CEST schrieb Artem Bityutskiy:
> > > Good point. I was solely thinking along the lines of how much space
> > > the
> > > actual file occupied, not considering metadata. That would be a good
> > > starting point. I'm guessing that for moderate file sizes the
> > > metadata
> > > would be relatively small compared to the file itself?
> > 
> > I would think a "slow" version of this would not be that hard to
> > implement - walk the index and sum up node sizes. Subtract header sizes
> > if you do not want metadata.
> > 
> > I am not sure what would be the API? Do other FSes implement something
> > like this?
> 
> I think a "show MTD usage by inode" should be implementable via debugfs.
> Maybe, after a discussion on linux-fsdevel a per-file ioctl().
> 
> But first I'd like to know more about the use-case and where to draw the 
> border. e.g. If a file as xattrs, do you also account them? UBIFS 
> modules xattrs via inodes. So, they have a rather huge space overhead.

In our specific situation the use case is basically that given a specific 
set files (in the root file system), how much flash is actually needed, 
also considering that different types of files have different compression 
ratios depending on the content. I.e. a large text file might not hurt as 
much as a large binary since the former compresses better.

So primarily it is the total amount needed for the whole file system, but 
it quickly comes down how much individual files consume. In our case it's 
not necessary to do the operation on a running file system, but in the 
more general case that might be more useful.

I would think that this is something that is known somewhere inside 
mkfs.ubifs, or is the information too convoluted to be easily extractable?

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
