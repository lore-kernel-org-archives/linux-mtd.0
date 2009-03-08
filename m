Received: from mx2.suse.de ([195.135.220.15])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LgM8n-00057O-G0
	for linux-mtd@lists.infradead.org; Sun, 08 Mar 2009 16:46:20 +0000
Received: from Relay2.suse.de (mail2.suse.de [195.135.221.8])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id A91F0473B2
	for <linux-mtd@lists.infradead.org>;
	Sun,  8 Mar 2009 17:46:13 +0100 (CET)
Date: Sun, 8 Mar 2009 17:46:10 +0100
From: Stefan Seyfried <seife@suse.de>
To: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2 aborts with MALLOC_CHECK_=2 on x86_64
Message-ID: <20090308164610.GA25396@suse.de>
References: <49710071.3000504@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49710071.3000504@suse.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 16, 2009 at 10:47:29PM +0100, Stefan Seyfried wrote:
> Hi,
> 
> current mtd-utils' mkfs.jffs2 aborts on me:
> seife@stoetzler:~> /dev/shm/mtd-utils/mkfs.jffs2 -L
> mkfs.jffs2:
>        lzo priority:80 disabled
>       zlib priority:60 enabled
>      rtime priority:50 enabled
> 
> seife@stoetzler:~> MALLOC_CHECK_=2 /dev/shm/mtd-utils/mkfs.jffs2 -U -b -e
> 131072 -p -r . -o /tmp/img.jffs2
> Aborted


> I looked around and found out that it happens, when both enabled compressors
> return -1 in compr.c line 246, and then the free in line 258 aborts.
> 
> doing
> 
> #define STREAM_END_SPACE 20
> 
> instead of the default of 12 in compr_zlib.c fixes it for me. However, I'm
> neither shure if this has any bad side effects, nor _why_ it fixes it.
> My host is 64bits (x86_64), maybe this is affecting the buffer sizes or
> something like that.
> Hope this is helpful.

valgrind was much more helpful than gdb in this case.
I'm pretty sure it's an integer underflow: it happens when
jffs2_rtime_compress is called with *dstlen = 1
The same in compr_zlib has not triggered for me yet, but is probably
worth fixing anyway.

diff --git a/compr_rtime.c b/compr_rtime.c
index 131536c..7353024 100644
--- a/compr_rtime.c
+++ b/compr_rtime.c
@@ -32,7 +32,7 @@ static int jffs2_rtime_compress(unsigned char *data_in, unsigned char *cpage_out
 
 	memset(positions,0,sizeof(positions));
 
-	while (pos < (*sourcelen) && outpos <= (*dstlen)-2) {
+	while (pos < (*sourcelen) && outpos+2 <= *dstlen) {
 		int backpos, runlen=0;
 		unsigned char value;
 
diff --git a/compr_zlib.c b/compr_zlib.c
index 400b18a..eb415b9 100644
--- a/compr_zlib.c
+++ b/compr_zlib.c
@@ -71,7 +71,7 @@ int jffs2_zlib_compress(unsigned char *data_in, unsigned char *cpage_out,
 	strm.next_out = cpage_out;
 	strm.total_out = 0;
 
-	while (strm.total_out < *dstlen - STREAM_END_SPACE && strm.total_in < *sourcelen) {
+	while (strm.total_out + STREAM_END_SPACE < *dstlen && strm.total_in < *sourcelen) {
 		strm.avail_out = *dstlen - (strm.total_out + STREAM_END_SPACE);
 		strm.avail_in = min((unsigned)(*sourcelen-strm.total_in), strm.avail_out);
 		ret = deflate(&strm, Z_PARTIAL_FLUSH);


-- 
Stefan Seyfried
R&D Team Mobile Devices            |              "Any ideas, John?"
SUSE LINUX Products GmbH, Nürnberg | "Well, surrounding them's out." 

This footer brought to you by insane German lawmakers:
SUSE Linux Products GmbH, GF: Markus Rex, HRB 16746 (AG Nürnberg)
