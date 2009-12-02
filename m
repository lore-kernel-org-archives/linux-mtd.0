Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NFlND-0004PZ-Kt
	for linux-mtd@lists.infradead.org; Wed, 02 Dec 2009 09:19:52 +0000
In-Reply-To: <1259744053.19465.902.camel@macbook.infradead.org>
References: <6b6744400912011811r4cecda08hd0a2502bc3083fc3@mail.gmail.com>
	<1259744053.19465.902.camel@macbook.infradead.org>
Subject: Re: JFFS2: jffs2_symlink/jffs2_mkdir/jffs2_mknod bug?
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <OF44ACA275.CD60CEF4-ONC1257680.0032B876-C1257680.0032E8E7@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Wed, 2 Dec 2009 10:16:04 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: Tao Huang <ulysses.huang@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>
> On Wed, 2009-12-02 at 10:11 +0800, Tao Huang wrote:
> > On jffs2_symlink/jffs2_mkdir/jffs2_mknod, after jffs2_write_dnode,
> > any call jffs2_clear_inode will no call jffs2_mark_node_obsolete because
> > pino_nlink is not zero. This will make kernel BUG on jffs2_garbage_collect_live.
> >
> > Run fsstress on NANDSIM can easy see this bug when no space, for example:
> > fsstress -p 2 -n 100000 -d /data -l 0 -s 100000 on 128KB NANDSIM.
>
> Hm, good catch; thanks.
>
> We _need_ to have a non-zero pino_nlink for new inodes during their
> creation. We can't just create them with zero nlink and then use
> jffs2_do_link() because that would leave an opportunity for the garbage
> collector to delete them in between.
>
> So we need to zero the nlink for a 'failed' creation. Something like
> this...?

> +      mutex_lock(&f->sem);
> +      f->inocache->pino_nlink = 0;
> +      mutex_unlock(&f->sem);

Do you need mutex lock/unlock around a simple assignment?

    Jocke
