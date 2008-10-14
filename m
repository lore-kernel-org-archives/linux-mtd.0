Received: from plexity.net ([206.123.115.38])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kpsov-00077Z-Qs
	for linux-mtd@lists.infradead.org; Tue, 14 Oct 2008 22:56:54 +0000
Date: Tue, 14 Oct 2008 15:56:53 -0700
From: Deepak Saxena <dsaxena@plexity.net>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: Understanding UBIFS flash overhead
Message-ID: <20081014225653.GB4490@trantor.hsd1.or.comcast.net>
References: <20081010210036.GA12173@trantor.hsd1.or.comcast.net>
	<1223883922.3395.62.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1223883922.3395.62.camel@sauron>
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

On Oct 13 2008, at 10:45, Artem Bityutskiy was caught saying:
> On Fri, 2008-10-10 at 14:00 -0700, Deepak Saxena wrote:
> > I'm working on getting UBIFS going on the OLPC XO and am trying to
> > understand what I am seeing in regards to file system size. 
> 
> BTW, consider to try new "bulk_read" mount option which may improve file
> read speed. The "no_chk_data_crc" might be considered as well.
> 
> We'd be interested to get some digits from you to see whether
> "bulk_read" improves things for you. Please, read here:
> http://marc.info/?l=linux-kernel&m=122276053307842&w=2

Thanks, will do.


-- 
   _____   __o  Deepak Saxena - Living CarFree and CareFree          (o>
------    -\<,  "When I see an adult on a bicycle, I do not despair  //\
 ----- ( )/ ( )  for the future of the human race." -H.G Wells       V_/_
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
