Date: Tue, 13 Jan 2015 08:25:53 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 2/2 v2] UBI: Block: Add blk-mq support
Message-ID: <20150113162553.GA24351@infradead.org>
References: <1420926734-16417-1-git-send-email-richard@nod.at>
 <1420926734-16417-2-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1420926734-16417-2-git-send-email-richard@nod.at>
Cc: axboe@fb.com, dedekind1@gmail.com, tom.leiming@gmail.com,
 linux-kernel@vger.kernel.org, hch@infradead.org, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> +	struct ubi_sgl usgl;

Btw, what's in struct ubi_sgl?  Can't find that in my tree.

> +static void ubiblock_do_work(struct work_struct *work)
> +{
> +	int ret;
> +	struct ubiblock_pdu *pdu = container_of(work, struct ubiblock_pdu, work);
> +	struct request *req = blk_mq_rq_from_pdu(pdu);
> +
> +	blk_mq_start_request(req);
> +	blk_rq_map_sg(req->q, req, pdu->usgl.sg);

blk_rq_map_sg returns the number of entries actually mapped, which
might be smaller than the number passed in due to merging.
