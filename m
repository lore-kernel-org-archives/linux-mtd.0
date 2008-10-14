Received: from plexity.net ([206.123.115.38])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KpsoL-0005Oc-B1
	for linux-mtd@lists.infradead.org; Tue, 14 Oct 2008 22:56:17 +0000
Date: Tue, 14 Oct 2008 15:56:15 -0700
From: Deepak Saxena <dsaxena@plexity.net>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: Understanding UBIFS flash overhead
Message-ID: <20081014225615.GA4490@trantor.hsd1.or.comcast.net>
References: <20081010210036.GA12173@trantor.hsd1.or.comcast.net>
	<1223880527.3395.53.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1223880527.3395.53.camel@sauron>
Cc: linux-mtd@lists.infradead.org
Reply-To: dsaxena@plexity.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Oct 13 2008, at 09:48, Artem Bityutskiy was caught saying:
> I have several comments.
> 
> 1. We've improved df reporting, but we have not updated the back-port
> trees for long time, so the improvements were not there. I've just
> updated all back-ports and they contain all the recent patches we
> consider stable. It is basically identical to ubifs-2.6.git now. Please,
> update, things will become better. However, do not expect df to tell you
> precise information anyway. See below.

Artem,

Thanks for updating the backport trees.

I pulled these and we go from an 822MiB filesystem to and 878MiB filesystem 
out of 949MiB device. This is definetely an improvement, but still means 
71MiB is being used for the journal (8MiB default in my test) and for 
indexes (or not being properly accounted for).

> 2. Let me first describe JFFS2 experience we have had. In statfs() (and
> thus, df) JFFS2 reports physical flash space. There are some challenges
> in calculating this space, and JFFS2 often lies in df. For example, it
> may say it has 20MiB free, but if you start writing on it, you'll be
> able to write only 16MiB file. Our user-space developers complained
> about this several times. So in UBIFS we decided to report _worst-case_
> flash space because we thought it is better not to tell less, but to be
> honest.
> 
> Please, read here for information about UBIFS flash space prediction
> challenges: http://www.linux-mtd.infradead.org/doc/ubifs.html#L_spaceacc
> This should shed some light.

Thanks. I've read the docs, faqs, and white paper over and my understanding
is that this is refering to free space reporting. I think we can live with 
not-perfectly accurate numbers on this end if our applications fail nicely.

The fact that we're loosing ~8% of space from the start is an issue for 
us b/c we are already running into issues with kids filling the systems 
up quickly, so every page we can save is important. We'll have to some 
performance analysis on tweaking the journal size but I'm wondering what 
else is configurable (or could be made configurable via changes) to 
decrease this? I notice there is an option to mkfs.ubifs to change the 
index fanout and I'll read the code to understand this and see how it
impacts the fs size.

Does the reported filesystem size change dynamically w.r.t w/b and
compression assumptions or is it completely based on static overhead
of journal and index?

Thanks again for the help,
~Deepak

-- 
   _____   __o  Deepak Saxena - Living CarFree and CareFree          (o>
------    -\<,  "When I see an adult on a bicycle, I do not despair  //\
 ----- ( )/ ( )  for the future of the human race." -H.G Wells       V_/_
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
