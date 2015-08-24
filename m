Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZToAG-0004f6-6x
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2015 09:35:40 +0000
Message-ID: <1440408895.15510.40.camel@gmail.com>
Subject: Re: [PATCH 2/2] ubifs: Allow O_DIRECT
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Christoph Hellwig <hch@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>, Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 24 Aug 2015 12:34:55 +0300
In-Reply-To: <20150824080350.GA17815@infradead.org>
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <1440016553-26481-2-git-send-email-richard@nod.at>
 <55D542C5.6040500@cn.fujitsu.com> <1440070300.31419.202.camel@gmail.com>
 <55D5BC92.8050903@nod.at> <20150820204933.GG74600@google.com>
 <1440400405.15510.29.camel@gmail.com>
 <20150824075324.GA28336@infradead.org>
 <1440403362.15510.39.camel@gmail.com>
 <20150824080350.GA17815@infradead.org>
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

On Mon, 2015-08-24 at 01:03 -0700, Christoph Hellwig wrote:
> On Mon, Aug 24, 2015 at 11:02:42AM +0300, Artem Bityutskiy wrote:
> > Back when we were writing UBIFS, we did not need direct IO, so we
> > did
> > not implement it. But yes, probably someone who cares could just
> > try
> > implementing this feature.
> 
> So I think the answer here is to implement a real version insted of
> adding hacks to pretend it is supported.

Fair enough, thank for the input!

Artem.
