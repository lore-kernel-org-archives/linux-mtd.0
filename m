Received: from mx2.mailbox.org ([80.241.60.215])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZLtn5-0002yP-Dq
 for linux-mtd@lists.infradead.org; Sun, 02 Aug 2015 13:59:04 +0000
Date: Sun, 2 Aug 2015 15:48:45 +0200
From: Hagen Paul Pfeifer <hagen@jauu.net>
To: Tomer Barletz <barletz@gmail.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Avoid compiler warning by storing the result of
 rq_data_dir() in an int variable
Message-ID: <20150802134845.GA31982@virgo.local>
References: <1438511812-5270-1-git-send-email-barletz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438511812-5270-1-git-send-email-barletz@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Tomer Barletz | 2015-08-02 03:36:52 [-0700]:

>With gcc 5.1 I get:
>warning: switch condition has boolean value [-Wswitch-bool]
>
>Signed-off-by: Tomer Barletz <barletz@gmail.com>
>---
> drivers/mtd/mtd_blkdevs.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
>index 41acc50..8c3715c 100644
>--- a/drivers/mtd/mtd_blkdevs.c
>+++ b/drivers/mtd/mtd_blkdevs.c
>@@ -79,6 +79,7 @@ static int do_blktrans_request(struct mtd_blktrans_ops *tr,
> {
> 	unsigned long block, nsect;
> 	char *buf;
>+	int rq;
> 
> 	block = blk_rq_pos(req) << 9 >> tr->blkshift;
> 	nsect = blk_rq_cur_bytes(req) >> tr->blkshift;
>@@ -97,7 +98,8 @@ static int do_blktrans_request(struct mtd_blktrans_ops *tr,
> 	if (req->cmd_flags & REQ_DISCARD)
> 		return tr->discard(dev, block, nsect);
> 
>-	switch(rq_data_dir(req)) {
>+	rq = rq_data_dir(req);
>+	switch(rq) {

Gcc warning seems over the top here, but when then the coding guideline should
be meet:

switch (rw) {
[..]

On the other hand, rq_data_dir() *could* be simplified to:

#define rq_data_dir(rq)         (((rq)->cmd_flags & 1)

Or just re-code the construct into a if else construct.

if (rw == READ) {
[...]
} else {
[...]
}

The default branch is superfluous anyway here.

Hagen
