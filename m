Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XlCvM-0006Dk-6b
 for linux-mtd@lists.infradead.org; Mon, 03 Nov 2014 08:23:41 +0000
Message-ID: <54573B72.1060600@nod.at>
Date: Mon, 03 Nov 2014 09:23:14 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] UBI: Block: Add blk-mq support
References: <1414933255-3795-1-git-send-email-richard@nod.at>
 <20141103081821.GA5261@infradead.org>
In-Reply-To: <20141103081821.GA5261@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com, linux-kernel@vger.kernel.org, axboe@fb.com,
 linux-mtd@lists.infradead.org, ezequiel.garcia@free-electrons.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 03.11.2014 um 09:18 schrieb Christoph Hellwig:
> On Sun, Nov 02, 2014 at 02:00:55PM +0100, Richard Weinberger wrote:
>> +#define UBIBLOCK_SG_COUNT 64
> 
> 
> Can you document why you choose this number? The default nr_request
> for the old code would be 128.

Is 64 a problem? Beside of the fact that I forgot to set blk_queue_max_segments().
I used this number because 128 seemed a bit high and my goal was to
keep the memory footprint small.
This is also why I've set tag_set.queue_depth to 64.

> Also I'll send a patch ASAP that allows drivers to ensure their
> ->queue_rq is always called from a driver-specific workqueue, which
> should simplify the bui block driver a lot.

Sounds great!

Thanks,
//richard
