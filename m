Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuSRe-0003PS-TP
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 17:01:23 +0000
Received: by pzk4 with SMTP id 4so7194695pzk.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 10:01:17 -0700 (PDT)
Subject: Re: [BUG] mtd-utils: nandwrite: invalid erase after page write failure
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Fryar, Jeff" <jeff.fryar@hp.com>
Date: Fri, 19 Aug 2011 20:02:58 +0300
In-Reply-To: <EBEBA6C3BD40EF4B8C0A5B8AD5A28F993B6C6EB71A@GVW0547EXC.americas.hpqcorp.net>
References: <EBEBA6C3BD40EF4B8C0A5B8AD5A28F993B6C6EB71A@GVW0547EXC.americas.hpqcorp.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1313773387.6607.83.camel@sauron>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-08-11 at 16:30 +0100, Fryar, Jeff wrote:
> mtd-utils nandwrite.c: After a page write failure, the calculation
> of the block number to erase is incorrect.  The erase block size is 
> being passed as the erase block number in the call to mtd_erase().
> 
> Jeff Fryar <jeff.fryar@hp.com>
> 
> 
> --- mtd-utils-f1fe865/nandwrite.c.ORIG  2011-07-20 00:28:52.000000000 -0500
> +++ mtd-utils-f1fe865/nandwrite.c       2011-08-11 09:19:12.000000000 -0500
> @@ -659,7 +659,7 @@
>                         fprintf(stderr, "Erasing failed write from %#08llx to %#08llx\n",
>                                 blockstart, blockstart + ebsize_aligned - 1);
>                         for (i = blockstart; i < blockstart + ebsize_aligned; i += mtd.eb_size) {
> -                               if (mtd_erase(mtd_desc, &mtd, fd, mtd.eb_size)) {
> +                               if (mtd_erase(mtd_desc, &mtd, fd, (i/mtd.eb_size))) {

Looks like correct fix, thanks! Your patch is not very well formatted,
but I've amended it and applied to mtd-utils, thanks!

-- 
Best Regards,
Artem Bityutskiy
