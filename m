Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIRRM-0006e5-Md
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 09:48:50 -0400
Date: Thu, 22 Sep 2005 15:48:11 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Message-ID: <20050922134811.GA6854@wohnheim.fh-wedel.de>
References: <20050922122052.GB4548@wohnheim.fh-wedel.de>
	<1127394310.3229.8.camel@windu.rchland.ibm.com>
	<20050922132104.GA6354@wohnheim.fh-wedel.de>
	<1127396504.28625.7.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1127396504.28625.7.camel@sauron.oktetlabs.ru>
Cc: zhao forrest <zhao_fusheng@hotmail.com>, linux-mtd@lists.infradead.org
Subject: Re: 1:1 mapping
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 22 September 2005 17:41:44 +0400, Artem B. Bityutskiy wrote:
> On Thu, 2005-09-22 at 15:21 +0200, Jörn Engel wrote:
> > If you have a better idea, please speak up.  This beats an
> > incompatible option by far, imo.  We could also do something like
> > this:
> > 
> > int jffs2_blocks_use_vmalloc(struct jffs2_sb_info *c)
> > {
> > 	int ret = ((c->flash_size / c->sector_size) * sizeof (struct jffs2_eraseblock)) > (128 * 1024);
> > 	if (unlikely(ret)) {
> > 		printk(KERN_ERR "Please read up on the virtual mapping stuff");
> > 		BUG();
> > 	}
> > 	return ret;
> > }
> 
> Agreed, but with 2 notes:
> 
> 1. a distinct function should be created which is invoked when JFFS2 has
> detected that the image is an old image:

Can you explain "when JFFS2 has detected that the image is an old
image" in C?

> int safe_to_mount(struct jffs2_sb_info *c)
> {
> 	int virtual;
> 	virtual = ((c->flash_size / c->sector_size) * JFFS2_LEGACY_EB_SIZE > (128 * 1024);
> 	if (virtual)
> 		return 0;
> 	return 1;
> }
> 
> Where JFFS2_LEGACY_EB_SIZE = sizeof(struct jffs2_eraseblock) of old
> JFFS2.

32bit or 64bit?  I guess using the size of 64bit, possibly adding a
little for safety, should be fine.

> 2. No need to invoke BUG(), it is enough just to return an error and let
> JFFS2 cleanly reject mounting the image.

Fine with me.

> 3. No need to add any additional config option, it is enough to describe
> this on the MTD site and in a readme.

Fine with me.

Jörn

-- 
Homo Sapiens is a goal, not a description.
-- unknown
