Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]
	helo=pug.o-hand.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HjvOn-0005uW-KV
	for linux-mtd@lists.infradead.org; Fri, 04 May 2007 06:52:33 -0400
Subject: Re: [PATCH 2/5] jffs2: Add LZO compression support to jffs2
From: Richard Purdie <rpurdie@openedhand.com>
To: Satyam Sharma <satyam.sharma@gmail.com>
In-Reply-To: <a781481a0705040206jee1c4a7s9822960a7a18d56f@mail.gmail.com>
References: <1178030823.5883.54.camel@localhost.localdomain>
	<a781481a0705040206jee1c4a7s9822960a7a18d56f@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 04 May 2007 11:52:17 +0100
Message-Id: <1178275937.5839.25.camel@localhost.localdomain>
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

On Fri, 2007-05-04 at 14:36 +0530, Satyam Sharma wrote:
> On 5/1/07, Richard Purdie <rpurdie@openedhand.com> wrote:
> > +++ b/fs/jffs2/compr_lzo.c
> > [...]
> > +static void *lzo_mem;
> > +static void *lzo_compress_buf;
> > +static DEFINE_MUTEX(deflate_mutex);
> > +
> > +static void free_workspace(void)
> > +{
> > +       vfree(lzo_mem);
> > +       vfree(lzo_compress_buf);
> > +}
> > +
> > +static int __init alloc_workspace(void)
> > +{
> > +       lzo_mem = vmalloc(LZO1X_MEM_COMPRESS);
> > +       lzo_compress_buf = vmalloc(lzo1x_worst_compress(PAGE_SIZE));
> > +
> > +       if (!lzo_mem || !lzo_compress_buf) {
> > +               printk(KERN_WARNING "Failed to allocate lzo deflate workspace\n");
> > +               free_workspace();
> > +               return -ENOMEM;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int jffs2_lzo_compress(unsigned char *data_in, unsigned char *cpage_out,
> > +                             uint32_t *sourcelen, uint32_t *dstlen, void *model)
> > +{
> > +       unsigned long compress_size;
> > +       int ret;
> > +
> > +       mutex_lock(&deflate_mutex);
> > +       ret = lzo1x_1_compress(data_in, *sourcelen, lzo_compress_buf, &compress_size, lzo_mem);
> > +       mutex_unlock(&deflate_mutex);
> 
> Considering we do have to memcpy() the entire compressed result to the
> destination output buffer later anyway (note that
> fs/jffs2/compr_zlib.c doesn't need to do that), do we really gain much
> by avoiding vmalloc() and vfree() in jffs2_lzo_compress() itself and
> keeping the workspace buffers pre-allocated? I ask because I always
> found these global static workspace buffers ugly, and all the
> associated code + mutex could go away if we make them local to
> jffs2_lzo_compress() -- as long as it doesn't hurt performance
> terribly, of course.

memcpy is relatively fast and I'd expect continually allocing and
freeing buffers to have a significant overhead compared with that and
impact performance. The current approach means you don't get ENOMEM
errors in the uncompress/compress paths either.

Regards,

Richard
