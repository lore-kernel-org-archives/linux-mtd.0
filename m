Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTmig-0004zp-OG
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2015 08:03:07 +0000
Message-ID: <1440403362.15510.39.camel@gmail.com>
Subject: Re: [PATCH 2/2] ubifs: Allow O_DIRECT
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Christoph Hellwig <hch@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>, Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 24 Aug 2015 11:02:42 +0300
In-Reply-To: <20150824075324.GA28336@infradead.org>
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <1440016553-26481-2-git-send-email-richard@nod.at>
 <55D542C5.6040500@cn.fujitsu.com> <1440070300.31419.202.camel@gmail.com>
 <55D5BC92.8050903@nod.at> <20150820204933.GG74600@google.com>
 <1440400405.15510.29.camel@gmail.com>
 <20150824075324.GA28336@infradead.org>
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

On Mon, 2015-08-24 at 00:53 -0700, Christoph Hellwig wrote:
> On Mon, Aug 24, 2015 at 10:13:25AM +0300, Artem Bityutskiy wrote:
> > 1. we are the only FS erroring out on O_DIRECT
> > 2. other file-systems not supporting direct IO just fake it
> 
> There are lots of file systems not supporting O_DIRECT, but ubifs
> might
> be the most common one.  Given that O_DIRECT implementations aren't
> hard, so what's holding back a real implementation?

Back when we were writing UBIFS, we did not need direct IO, so we did
not implement it. But yes, probably someone who cares could just try
implementing this feature.

Artem.
