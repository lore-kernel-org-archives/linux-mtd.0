Received: from rv-out-0708.google.com ([209.85.198.245])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKBbC-0002aF-KO
	for linux-mtd@lists.infradead.org; Tue, 06 Jan 2009 13:04:03 +0000
Received: by rv-out-0708.google.com with SMTP id b17so7839366rvf.42
	for <linux-mtd@lists.infradead.org>;
	Tue, 06 Jan 2009 05:03:56 -0800 (PST)
Date: Wed, 7 Jan 2009 08:02:55 -0500
From: Josh Boyer <jwboyer@gmail.com>
To: Carsten Schlote <c.schlote@konzeptpark.de>
Subject: Re: [PATCH][MTD-UTILS][compr_lzo.c] Fix calls to liblzo library
Message-ID: <20090107130255.GA2333@yoda.jdub.homelinux.org>
References: <1231186350.6612.11.camel@kplaws107lx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1231186350.6612.11.camel@kplaws107lx>
Cc: Linux MTD Dev <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 05, 2009 at 09:12:30PM +0100, Carsten Schlote wrote:
>This patch fixes the calls to liblzo. Some things shouldn't ever worked
>before. I noticed the problem on 64bit Linux - suddently 
>mkfs.jffs2 starts segfaulting.
>
>The -t option didn't work as well.
>
>Now LZO compression and -t option of mkfs.jffs2 is functional again.
>
>http://www.vahanus.net/cgi-bin/gitweb.cgi?p=mtd-utils.git;a=commit;h=5cec421106993009ad43e6188ce44906138c2d38
>
>-- 
>Carsten Schlote <c.schlote@konzeptpark.de>
>konzeptpark.de

>commit 5cec421106993009ad43e6188ce44906138c2d38
>Author: Carsten Schlote <c.schlote@konzeptpark.de>
>Date:   Mon Jan 5 18:58:22 2009 +0100
>
>    [PATCH][compr_lzo.c] Fix calls to LZO library
>    
>    Fixed the calls to LZO library. I wonder how this could ever
>    work before.
>    
>    Now LZO compression and -t option in mkfs.jffs2 are working.
>    
>    Signed-off-by: Carsten Schlote <c.schlote@konzeptpark.de>
>
>diff --git a/compr_lzo.c b/compr_lzo.c
>index a0bb362..f4ae697 100644
>--- a/compr_lzo.c
>+++ b/compr_lzo.c
>@@ -48,17 +48,19 @@ static void *lzo_compress_buf;
> static int jffs2_lzo_cmpr(unsigned char *data_in, unsigned char *cpage_out,
> 			  uint32_t *sourcelen, uint32_t *dstlen, void *model)
> {
>-	uint32_t compress_size;
>+	lzo_uint compress_size;

What is the lzo_uint type?  If it's some odd thing that changes
size based on compile options, I'm not overly thrilled.  Anyway,
it's not immediately obvious to me why uint32_t doesn't work.

> 	int ret;
> 
> 	ret = lzo1x_999_compress(data_in, *sourcelen, lzo_compress_buf, &compress_size, lzo_mem);
> 
>-	if (ret != LZO_E_OK)
>+	if (ret != LZO_E_OK) {
>+		printf(__FILE__ ":Got compress error: ret=%d, cl=%ld, destlen=%ld\n",ret,compress_size,(long int)(*dstlen));
> 		return -1;
>+	}
> 
> 	if (compress_size > *dstlen)
> 		return -1;
>-
>+	

Unneeded whitespace change.

> 	memcpy(cpage_out, lzo_compress_buf, compress_size);
> 	*dstlen = compress_size;
> 
>@@ -69,12 +71,15 @@ static int jffs2_lzo_decompress(unsigned char *data_in, unsigned char *cpage_out
> 				 uint32_t srclen, uint32_t destlen, void *model)
> {
> 	int ret;
>-	uint32_t dl;
>+	lzo_uint dl;
> 
>+	dl = destlen;
> 	ret = lzo1x_decompress_safe(data_in,srclen,cpage_out,&dl,NULL);
> 
>-	if (ret != LZO_E_OK || dl != destlen)
>+	if ((ret != LZO_E_OK) || (dl != destlen)) {
>+		printf(__FILE__ ":Got decompress error: ret=%d, dl=%ld, destlen=%ld\n",ret,dl,(long int)destlen);
> 		return -1;
>+	}
> 
> 	return 0;
> }
>@@ -92,12 +97,22 @@ int jffs2_lzo_init(void)
> {
> 	int ret;
> 
>+	lzo_init();
>+	
> 	lzo_mem = malloc(LZO1X_999_MEM_COMPRESS);
> 	if (!lzo_mem)
> 		return -1;
> 
> 	/* Worse case LZO compression size from their FAQ */
>-	lzo_compress_buf = malloc(page_size + (page_size / 16) + 64 + 3);
>+	/* Dangerous: Seems to be wrong for 64bit intel platforms. At least it results
>+                into s SEGV.
>+
>+	lzo_compress_buf = malloc(page_size + (page_size / 16) + 64 + 3); 
>+
>+	   The line below fixes the SEGV. No further work has be done to determine
>+           the smallest possible size for a worstcase scenario (uncompressable data)
>+	*/
>+	lzo_compress_buf = malloc(2*page_size);

Don't leave comments in the code about why things are dangerous and then
leave the code itself commented out.  A comment about why you need to
allocate a certain size is fine, but this is pretty ugly.  For a minute
I thought you were doing two mallocs and ignoring the first one because
I didn't see the multi-line /* comment.

Did you poke around with gdb at all to determine why it segfaults?

josh
