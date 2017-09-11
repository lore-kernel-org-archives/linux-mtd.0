Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1drUq9-0004oe-UW
 for linux-mtd@lists.infradead.org; Mon, 11 Sep 2017 19:57:56 +0000
From: Richard Weinberger <richard@sigma-star.at>
To: dedekind1@gmail.com, Jonas Holmberg <jonashg@axis.com>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Linux mtd <linux-mtd@lists.infradead.org>,
 Cristian Ionescu-Idbohrn <cii@axis.com>
Subject: Re: Actual usage of files in ubifs
Date: Mon, 11 Sep 2017 21:57:44 +0200
Message-ID: <1682206.lC8nDS1gi7@blindfold>
In-Reply-To: <1505144649.14367.85.camel@gmail.com>
References: <alpine.DEB.2.11.1709111143420.14549@lnxricardw1.se.axis.com>
 <alpine.DEB.2.11.1709111711400.14549@lnxricardw1.se.axis.com>
 <1505144649.14367.85.camel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Montag, 11. September 2017, 17:44:09 CEST schrieb Artem Bityutskiy:
> > Good point. I was solely thinking along the lines of how much space
> > the
> > actual file occupied, not considering metadata. That would be a good
> > starting point. I'm guessing that for moderate file sizes the
> > metadata
> > would be relatively small compared to the file itself?
> 
> I would think a "slow" version of this would not be that hard to
> implement - walk the index and sum up node sizes. Subtract header sizes
> if you do not want metadata.
> 
> I am not sure what would be the API? Do other FSes implement something
> like this?

I think a "show MTD usage by inode" should be implementable via debugfs.
Maybe, after a discussion on linux-fsdevel a per-file ioctl().

But first I'd like to know more about the use-case and where to draw the 
border.
e.g. If a file as xattrs, do you also account them? UBIFS modules xattrs
via inodes. So, they have a rather huge space overhead.

Thanks,
//richard

-- 
sigma star gmbh - Eduard-Bodem-Gasse 6 - 6020 Innsbruck - Austria
ATU66964118 - FN 374287y
