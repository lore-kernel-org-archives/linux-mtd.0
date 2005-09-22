Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIRL9-0006RO-Mn
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 09:42:27 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050922132104.GA6354@wohnheim.fh-wedel.de>
References: <20050922122052.GB4548@wohnheim.fh-wedel.de>
	<1127394310.3229.8.camel@windu.rchland.ibm.com>
	<20050922132104.GA6354@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Thu, 22 Sep 2005 17:41:44 +0400
Message-Id: <1127396504.28625.7.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: zhao forrest <zhao_fusheng@hotmail.com>, linux-mtd@lists.infradead.org
Subject: Re: 1:1 mapping
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-09-22 at 15:21 +0200, Jörn Engel wrote:
> If you have a better idea, please speak up.  This beats an
> incompatible option by far, imo.  We could also do something like
> this:
> 
> int jffs2_blocks_use_vmalloc(struct jffs2_sb_info *c)
> {
> 	int ret = ((c->flash_size / c->sector_size) * sizeof (struct jffs2_eraseblock)) > (128 * 1024);
> 	if (unlikely(ret)) {
> 		printk(KERN_ERR "Please read up on the virtual mapping stuff");
> 		BUG();
> 	}
> 	return ret;
> }

Agreed, but with 2 notes:

1. a distinct function should be created which is invoked when JFFS2 has
detected that the image is an old image:

int safe_to_mount(struct jffs2_sb_info *c)
{
	int virtual;
	virtual = ((c->flash_size / c->sector_size) * JFFS2_LEGACY_EB_SIZE > (128 * 1024);
	if (virtual)
		return 0;
	return 1;
}

Where JFFS2_LEGACY_EB_SIZE = sizeof(struct jffs2_eraseblock) of old
JFFS2.

2. No need to invoke BUG(), it is enough just to return an error and let
JFFS2 cleanly reject mounting the image.

3. No need to add any additional config option, it is enough to describe
this on the MTD site and in a readme.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
