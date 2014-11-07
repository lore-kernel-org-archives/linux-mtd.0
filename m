Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xmg8F-0005H7-GR
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 09:47:03 +0000
Message-ID: <1415353596.958.302.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: Block: Add blk-mq support
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Fri, 07 Nov 2014 11:46:36 +0200
In-Reply-To: <54573B72.1060600@nod.at>
References: <1414933255-3795-1-git-send-email-richard@nod.at>
 <20141103081821.GA5261@infradead.org> <54573B72.1060600@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: axboe@fb.com, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, linux-mtd@lists.infradead.org,
 ezequiel.garcia@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-11-03 at 09:23 +0100, Richard Weinberger wrote:
> Am 03.11.2014 um 09:18 schrieb Christoph Hellwig:
> > On Sun, Nov 02, 2014 at 02:00:55PM +0100, Richard Weinberger wrote:
> >> +#define UBIBLOCK_SG_COUNT 64
> > 
> > 
> > Can you document why you choose this number? The default nr_request
> > for the old code would be 128.
> 
> Is 64 a problem? Beside of the fact that I forgot to set blk_queue_max_segments().
> I used this number because 128 seemed a bit high and my goal was to
> keep the memory footprint small.
> This is also why I've set tag_set.queue_depth to 64.

The request was to document, so lets' document the choice.

Artem.
