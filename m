Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIR12-0005qC-2o
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 09:21:40 -0400
Date: Thu, 22 Sep 2005 15:21:04 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jdub@us.ibm.com>
Message-ID: <20050922132104.GA6354@wohnheim.fh-wedel.de>
References: <20050922122052.GB4548@wohnheim.fh-wedel.de>
	<1127394310.3229.8.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1127394310.3229.8.camel@windu.rchland.ibm.com>
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>,
	zhao forrest <zhao_fusheng@hotmail.com>, linux-mtd@lists.infradead.org
Subject: Re: 1:1 mapping
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 22 September 2005 08:05:10 -0500, Josh Boyer wrote:
> On Thu, 2005-09-22 at 14:20 +0200, Jörn Engel wrote:
> > 
> > Or we tell users very clearly about the problem.  In a way they can't
> > ignore.  Proposed patch below.
> 
> Erm... I hope that was a bit sarcastic.  Actually putting something like
> that into the kernel would look a bit ridiculous.

Apart from a missing dependency on CONFIG_MTD, no.  With the BIG FAT
WARNING mail sent to the list, everyone tracking CVS should know about
the problem.  But the remaining people who upgrade via -linus might
still have a problem.  This way, they also get forced to notice.

If you have a better idea, please speak up.  This beats an
incompatible option by far, imo.  We could also do something like
this:

int jffs2_blocks_use_vmalloc(struct jffs2_sb_info *c)
{
	int ret = ((c->flash_size / c->sector_size) * sizeof (struct jffs2_eraseblock)) > (128 * 1024);
	if (unlikely(ret)) {
		printk(KERN_ERR "Please read up on the virtual mapping stuff");
		BUG();
	}
	return ret;
}

Then all people who depend on Ferenc's virtual mapping patch to work
will see a warning message.  Others don't notice.  People may remove
the BUG and printk if they know what they're doing.

Then after a couple of kernel versions, we'll turn it into a one-time
warning and a bit later completely remove it.

Jörn

PS: I really don't care about looking ridiculous here.  As long as it
solved people's problems, that's just fine.

-- 
Linux is more the core point of a concept that surrounds "open source"
which, in turn, is based on a false concept. This concept is that
people actually want to look at source code.
-- Rob Enderle
