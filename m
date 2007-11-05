Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1Ip4o7-0002MO-Gj
	for linux-mtd@lists.infradead.org; Mon, 05 Nov 2007 11:28:17 -0500
Date: Mon, 5 Nov 2007 17:23:21 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
Subject: Re: [PATCH] [MTD] [OneNAND] Do not stop reading for ECC errors
Message-ID: <20071105162321.GA21533@lazybastard.org>
References: <472B0A3C.4010103@nokia.com>
	<20071105132512.GA19232@lazybastard.org>
	<472F2CB5.6090409@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <472F2CB5.6090409@nokia.com>
Cc: linux-mtd@lists.infradead.org,
	ext =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>, kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 5 November 2007 16:46:13 +0200, Adrian Hunter wrote:
> 
> -EBADMSG is an ECC error.
> 
> ret must be non-zero to indicate that the bufferram is invalid.  Otherwise
> if we read from the same location again, the data would be taken from 
> bufferram
> and no ECC error would be reported.  However we need to keep reading (see 
> nand_base.c)
> so ret is set to zero as though no error occured.  Finally 
> mtd->ecc_stats.failed
> is examined to determine ECC errors. i.e.

Hmm.

> static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,
> 	size_t *retlen, u_char *buf)
> {
> 	...
> 	stats = mtd->ecc_stats;
> 	...
> 	while (!ret) {
> 		...
> 		ret = this->wait(mtd, FL_READING);
> 		onenand_update_bufferram(mtd, from, !ret);
> 		if (ret == -EBADMSG)
> 			ret = 0;
> 	}
> 	*retlen = read;
> 	if (mtd->ecc_stats.failed - stats.failed)
> 		return -EBADMSG;
> 	if (ret)
> 		return ret;

Those two conditionals should have reversed order, imo.

> >What about -EUCLEAN?
> 
> The wait function doesn't return -EUCLEAN.  It increments 
> mtd->ecc_stats.corrected and returns
> zero for correctable ECC errors.
> 
> File systems (like say JFFS2 for example) don't expect -EUCLEAN from 
> mtd->read_oob and would treat
> it as a fatal error, so it must not be returned in this case.

Such an interface sure looks strange.  But since read_oob is strange
anyway I don't care very much either way.

Jörn

-- 
There's nothing that will change someone's moral outlook quicker
than cash in large sums.
-- Larry Flynt
