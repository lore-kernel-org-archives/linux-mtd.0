Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192vWL-00044w-2F
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 17:00:25 +0100
Date: Tue, 8 Apr 2003 18:00:21 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Steven Scholz <steven.scholz@imc-berlin.de>
Message-ID: <20030408160021.GC5065@wohnheim.fh-wedel.de>
References: <3E92D5C7.8020603@imc-berlin.de>
	<20030408141952.GA30313@wohnheim.fh-wedel.de> <3E92DDC9.7030000@imc-berlin.de>
	<20030408150331.GA32580@wohnheim.fh-wedel.de> <3E92EE0B.4000702@imc-berlin.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3E92EE0B.4000702@imc-berlin.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: David Woodhouse <dwmw2@infradead.org>
cc: MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 uncompressed?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 8 April 2003 17:43:07 +0200, Steven Scholz wrote:
> >
> >Could you post a patch for mkfs.jffs2, when done? Just for the
> >curious.
> 
> Here you are!
> 
> Just a quick hack! :o) Enjoy!

If you call this a quick hack, I'd like to see your clean code.
Thanks!

> Index: util/mkfs.jffs2.c
> ===================================================================
> RCS file: /home/cvs/mtd/util/mkfs.jffs2.c,v
> retrieving revision 1.36
> diff -p -u -r1.36 mkfs.jffs2.c
> --- util/mkfs.jffs2.c	3 Apr 2003 11:49:22 -0000	1.36
> +++ util/mkfs.jffs2.c	8 Apr 2003 15:41:15 -0000
> @@ -98,6 +98,7 @@ static int squash_uids = 0;
>  static int squash_perms = 0;
>  static int fake_times = 0;
>  static int target_endian = __BYTE_ORDER;
> +static int do_compress = 1;
>  static const char *const app_name = "mkfs.jffs2";
>  static const char *const memory_exhausted = "memory exhausted";
>  
> @@ -691,6 +692,9 @@ unsigned char jffs2_compress(unsigned ch
>  {
>  	int ret;
>  
> +	if (! do_compress)
> +		return JFFS2_COMPR_NONE; /* We don't want to compress */
> +
>  	ret = jffs2_zlib_compress(data_in, cpage_out, datalen, cdatalen);
>  	if (!ret) {
>  		return JFFS2_COMPR_ZLIB;
> @@ -1177,6 +1181,7 @@ static struct option long_options[] = {
>  	{"no-cleanmarkers", 0, NULL, 'n'},
>  	{"cleanmarker", 1, NULL, 'c'},
>  	{"squash", 0, NULL, 'q'},
> +	{"no-compression", 0, NULL, 'u'},
>  	{"squash-uids", 0, NULL, 'U'},
>  	{"squash-perms", 0, NULL, 'P'},
>  	{"faketime", 0, NULL, 'f'},
> @@ -1202,6 +1207,7 @@ static char *helptext =
>  	"  -D, --devtable=FILE    Use the named FILE as a device table file\n"
>  	"  -f, --faketime         Change all file times to '0' for regression testing\n"
>  	"  -q, --squash           Squash permissions and owners making all files be owned by root\n"
> +	"  -u, --no-compression   Don't use any compression\n"
>  	"  -U, --squash-uids      Squash owners making all files be owned by root\n"
>  	"  -P, --squash-perms     Squash permissions on all files\n"
>  	"  -h, --help             Display this help text\n"
> @@ -1220,7 +1226,7 @@ int main(int argc, char **argv)
>  	struct filesystem_entry *root;
>  
>  	while ((opt = getopt_long(argc, argv, 
> -					"D:d:r:s:o:qUPfh?vVe:lbp::nc:", long_options, &c)) >= 0) 
> +					"D:d:r:s:o:quUPfh?vVe:lbp::nc:", long_options, &c)) >= 0) 
>  	{
>  		switch (opt) {
>  			case 'D':
> @@ -1256,6 +1262,10 @@ int main(int argc, char **argv)
>  			case 'q':
>  				squash_uids = 1;
>  				squash_perms = 1;
> +				break;
> +
> +			case 'u':
> +				do_compress = 0;
>  				break;
>  
>  			case 'U':

David, I don't see any obvious mistakes. Is it ok to apply?

Jörn

-- 
With a PC, I always felt limited by the software available. On Unix, 
I am limited only by my knowledge.
-- Peter J. Schoenster
