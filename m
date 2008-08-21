Received: from smtp1.stealer.net ([88.198.224.204])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KWBaQ-0002I6-7Q
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 14:56:30 +0000
Date: Thu, 21 Aug 2008 16:53:04 +0200 (CEST)
From: Sven Wegener <sven.wegener@stealer.net>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH 10/10] AXFS: axfs_uncompress.c
In-Reply-To: <6934efce0808210737w16b5f8dcr1657ea46099e4901@mail.gmail.com>
Message-ID: <alpine.LNX.1.10.0808211647500.12259@titan.stealer.net>
References: <48AD0126.1050609@gmail.com>
	<alpine.LNX.1.10.0808211028150.12259@titan.stealer.net>
	<6934efce0808210737w16b5f8dcr1657ea46099e4901@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 21 Aug 2008, Jared Hulbert wrote:

> > Use DEFINE_MUTEX and drop the mutex_init() down in the init function.
> 
> okay.  by drop you mean delete?

Yes.

> > axfs_uncompress_init() and axfs_uncompress_exit() are only called during
> > init and exit of the module, no need for the initialized variable and the
> > functions can be annotated with __init and __exit.
> 
> can be annotated or should be?

Should be. We only need them once during init and cleanup. If you want to 
call axfs_uncompress_exit() from init_axfs_fs() to clean up in case of 
register_filesystem failing, you can't annotate axfs_uncompress_exit() 
with __exit.

Sven
