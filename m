Date: Mon, 3 Nov 2014 00:18:21 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] UBI: Block: Add blk-mq support
Message-ID: <20141103081821.GA5261@infradead.org>
References: <1414933255-3795-1-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1414933255-3795-1-git-send-email-richard@nod.at>
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

On Sun, Nov 02, 2014 at 02:00:55PM +0100, Richard Weinberger wrote:
> +#define UBIBLOCK_SG_COUNT 64


Can you document why you choose this number? The default nr_request
for the old code would be 128.

Also I'll send a patch ASAP that allows drivers to ensure their
->queue_rq is always called from a driver-specific workqueue, which
should simplify the bui block driver a lot.
