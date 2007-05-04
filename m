Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]
	helo=pug.o-hand.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HjtKD-0003fe-2x
	for linux-mtd@lists.infradead.org; Fri, 04 May 2007 04:39:38 -0400
Subject: Re: [PATCH 5/5] crypto: Add LZO compression support to the crypto
	interface
From: Richard Purdie <rpurdie@openedhand.com>
To: Satyam Sharma <satyam.sharma@gmail.com>
In-Reply-To: <a781481a0705040109r45cbf472i4094dd2ebf7841e8@mail.gmail.com>
References: <1178030843.5883.57.camel@localhost.localdomain>
	<a781481a0705040109r45cbf472i4094dd2ebf7841e8@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 04 May 2007 09:39:23 +0100
Message-Id: <1178267963.5839.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-crypto@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	LKML <linux-kernel@vger.kernel.org>, herbert@gondor.apana.org.au
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-05-04 at 13:39 +0530, Satyam Sharma wrote:
> On 5/1/07, Richard Purdie <rpurdie@openedhand.com> wrote:
> > +static int lzo_init(struct crypto_tfm *tfm)
> > +{
> > +       struct lzo_ctx *ctx = crypto_tfm_ctx(tfm);
> > +
> > +       ctx->lzo_mem = vmalloc(LZO1X_MEM_COMPRESS);
> > +
> > +       if (!ctx->lzo_mem) {
> > +               vfree(ctx->lzo_mem);
> 
> Heh. What's (why's) this? You _can_ {k, v}free NULL but doing so after
> explicitly checking for it is ... ... insane!

True, there used to be two buffers allocated there and I've missed a
sensible cleanup when I removed one. I'll fix it, thanks.

Cheers,

Richard
