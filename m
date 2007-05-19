Received: from static-71-162-243-5.phlapa.fios.verizon.net ([71.162.243.5]
	helo=grelber.thyrsus.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HpIFc-0001ug-MJ
	for linux-mtd@lists.infradead.org; Sat, 19 May 2007 02:17:14 -0400
From: Rob Landley <rob@landley.net>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] LogFS take three
Date: Sat, 19 May 2007 02:15:33 -0400
References: <20070515151919.GA32510@lazybastard.org>
	<20070515133759.9ee434a2.akpm@linux-foundation.org>
In-Reply-To: <20070515133759.9ee434a2.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-Id: <200705190215.36334.rob@landley.net>
Cc: Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Albert Cahalan <acahalan@gmail.com>,
	Greg KH <greg@kroah.com>,
	=?iso-8859-1?q?J=F6rn_Engel?= <joern@lazybastard.org>,
	linux-kernel@vger.kernel.org, Ingo Oeser <ioe-lkml@rameria.de>,
	Pekka Enberg <penberg@cs.helsinki.fi>, linux-mtd@lists.infradead.org,
	Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 15 May 2007 4:37 pm, Andrew Morton wrote:

> > +static inline struct logfs_super *LOGFS_SUPER(struct super_block *sb)
> > +{
> > +	return sb->s_fs_info;
> > +}
> > +
> > +static inline struct logfs_inode *LOGFS_INODE(struct inode *inode)
> > +{
> > +	return container_of(inode, struct logfs_inode, vfs_inode);
> > +}
> 
> Do these need to be uppercase?

I'm trying to keep it clear in my head...

When do you need to say __always_inline and when can you get away with just 
saying "static inline"?

(I'm attempting to write documentation on a topic I don't understand.  Best 
way to learn it, I've found...)

> > +     buf = kmap(page);
> > +     ret = logfs_write_buf(inode, index, buf);
> > +     kunmap(page);
>
> kmap() is lame.  The preferred approach would be to pass the page* down to
> the lower layers and to use kmap_atomic() at the lowest possible point.

Um, would I read about this in DMA-mapping.txt or cachetlb.txt?  (I don't 
think it's fujitsu/frv/mmu-layout.txt)

Rob
