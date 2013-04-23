Received: from longford.logfs.org ([213.229.74.203])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUhna-0008C0-Rh
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2013 18:18:39 +0000
Date: Tue, 23 Apr 2013 12:51:32 -0400
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] mtd: Convert logging messages
Message-ID: <20130423165132.GA21580@logfs.org>
References: <1366394375.3901.36.camel@joe-AO722>
 <20130419165516.GA19480@logfs.org>
 <1366396053.3901.40.camel@joe-AO722>
 <20130422143118.GA12908@logfs.org>
 <1366739994.2036.1.camel@joe-AO722>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1366739994.2036.1.camel@joe-AO722>
Cc: David Woodhouse <dwmw2@infradead.org>, Joern Engel <joern@lazybastard.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 23 April 2013 10:59:54 -0700, Joe Perches wrote:
> On Mon, 2013-04-22 at 10:31 -0400, Jörn Engel wrote:
> > On Fri, 19 April 2013 11:27:33 -0700, Joe Perches wrote:
> > > On Fri, 2013-04-19 at 12:55 -0400, Jörn Engel wrote:
> > > > On Fri, 19 April 2013 10:59:35 -0700, Joe Perches wrote:
> > > > >  	}
> > > > >  	list_add(&dev->list, &blkmtd_device_list);
> > > > > -	INFO("mtd%d: [%s] erase_size = %dKiB [%d]", dev->mtd.index,
> > > > > -			dev->mtd.name + strlen("block2mtd: "),
> > > > > -			dev->mtd.erasesize >> 10, dev->mtd.erasesize);
> > > > > +	pr_info("mtd%d: [%s] erase_size = %dKiB [%d]\n",
> > > > > +		dev->mtd.index,
> > > > > +		dev->mtd.name + strlen("block2mtd: "),
> > > > > +		dev->mtd.erasesize >> 10, dev->mtd.erasesize);
> > > > 
> > > > I personally dislike the indent-to-braces style because it causes
> > > > unnecessary churn in patches like this.
> > > 
> > > It comes from an automated emacs conversion.
> > 
> > Then please teach your emacs to be a better tool.
> 
> Because you personally dislike something isn't
> enough of a reason for me to change my tools nor
> enough of a reason for me to add a special
> exception to my tools for your preferences.

In that case: NAK.

Because you personally dislike something isn't
enough of a reason for me to take your patch nor
enough of a reason for me to add a special
exception to my standards for your preferences.

Cuts both way, it seems.

Jörn

--
"Translations are and will always be problematic. They inflict violence
upon two languages." (translation from German)
