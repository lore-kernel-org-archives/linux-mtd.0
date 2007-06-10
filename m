Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HxT08-0003u0-A6
	for linux-mtd@lists.infradead.org; Sun, 10 Jun 2007 15:24:42 -0400
Date: Sun, 10 Jun 2007 19:40:11 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Patch 10/18] fs/logfs/inode.c
Message-ID: <20070610174011.GB32619@lazybastard.org>
References: <20070603183845.GA8952@lazybastard.org>
	<20070603184636.GK8952@lazybastard.org>
	<200706101924.29927.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200706101924.29927.arnd@arndb.de>
Cc: akpm@osdl.org, David Weinehall <tao@acc.umu.se>,
	Dongjun Shin <djshin90@gmail.com>, Kyle Moffett <mrmacman_g4@mac.com>,
	linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ulisses Furquim <ulissesf@gmail.com>, CaT <cat@zip.com.au>,
	Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Roland Dreier <rdreier@cisco.com>,
	Jamie Lokier <jamie@shareable.org>, Pekka Enberg <penberg@cs.helsinki.fi>,
	Jan Engelhardt <jengelh@linux01.gwdg.de>,
	Thomas Gleixner <tglx@linutronix.de>, Bill Davidsen <davidsen@tmr.com>,
	Albert Cahalan <acahalan@gmail.com>,
	John Stoffel <john@stoffel.org>, linux-kernel@vger.kernel.org,
	Ondrej Zajicek <santiago@crfreenet.org>, linux-fsdevel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 10 June 2007 19:24:28 +0200, Arnd Bergmann wrote:
> On Sunday 03 June 2007, Jörn Engel wrote:
> > +struct inode *logfs_new_inode(struct inode *dir, int mode)
> > +{
> > +       struct super_block *sb = dir->i_sb;
> > +       struct inode *inode;
> > +
> > +       inode = new_inode(sb);
> > +       if (!inode)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       logfs_init_inode(inode);
> > +
> > +       inode->i_mode = mode;
> > +       inode->i_ino = logfs_get_ino(sb);
> > +
> > +       insert_inode_hash(inode);
> > +
> > +       return inode;
> > +}
> 
> I think this is missing code that sets the initial i_uid/i_gid,
> but there may be more missing. Changing the uid value works,
> but creating files as non-root user doesn't.

Eek!  I'll have a look.

Jörn

-- 
When in doubt, punt.  When somebody actually complains, go back and fix it...
The 90% solution is a good thing.
-- Rob Landley
