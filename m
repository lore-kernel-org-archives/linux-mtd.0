Received: from wr-out-0506.google.com ([64.233.184.230])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hjsqw-0003F0-Hg
	for linux-mtd@lists.infradead.org; Fri, 04 May 2007 04:09:23 -0400
Received: by wr-out-0506.google.com with SMTP id 55so835729wri
	for <linux-mtd@lists.infradead.org>;
	Fri, 04 May 2007 01:09:21 -0700 (PDT)
Message-ID: <a781481a0705040109r45cbf472i4094dd2ebf7841e8@mail.gmail.com>
Date: Fri, 4 May 2007 13:39:20 +0530
From: "Satyam Sharma" <satyam.sharma@gmail.com>
To: "Richard Purdie" <rpurdie@openedhand.com>
Subject: Re: [PATCH 5/5] crypto: Add LZO compression support to the crypto
	interface
In-Reply-To: <1178030843.5883.57.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1178030843.5883.57.camel@localhost.localdomain>
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

On 5/1/07, Richard Purdie <rpurdie@openedhand.com> wrote:
> +static int lzo_init(struct crypto_tfm *tfm)
> +{
> +       struct lzo_ctx *ctx = crypto_tfm_ctx(tfm);
> +
> +       ctx->lzo_mem = vmalloc(LZO1X_MEM_COMPRESS);
> +
> +       if (!ctx->lzo_mem) {
> +               vfree(ctx->lzo_mem);

Heh. What's (why's) this? You _can_ {k, v}free NULL but doing so after
explicitly checking for it is ... ... insane!

> +               return -ENOMEM;

Yeah. Just return -ENOMEM; and be done with it.
