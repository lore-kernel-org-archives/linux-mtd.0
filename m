Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MZF93-0004C2-Dk
	for linux-mtd@lists.infradead.org; Fri, 07 Aug 2009 02:25:29 +0000
Date: Thu, 6 Aug 2009 19:25:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: mmotm 2009-08-06-00-30 uploaded (mtd)
Message-Id: <20090806192513.53f6488b.akpm@linux-foundation.org>
In-Reply-To: <20090806190233.6d4b4e28.randy.dunlap@oracle.com>
References: <200908060733.n767X6mN023120@imap1.linux-foundation.org>
	<20090806190233.6d4b4e28.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Magnus Damm <damm@igel.co.jp>, Paul Mundt <lethal@linux-sh.org>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 6 Aug 2009 19:02:33 -0700 Randy Dunlap <randy.dunlap@oracle.com> wrote:

> On Thu, 06 Aug 2009 00:33:06 -0700 akpm@linux-foundation.org wrote:
> 
> > The mm-of-the-moment snapshot 2009-08-06-00-30 has been uploaded to
> > 
> >    http://userweb.kernel.org/~akpm/mmotm/
> > 
> > and will soon be available at
> > 
> >    git://git.zen-sources.org/zen/mmotm.git
> > 
> > It contains the following patches against 2.6.31-rc5:
> 
> 
> 
> drivers/built-in.o: In function `generic_onenand_remove':
> generic.c:(.devexit.text+0x1b8e): undefined reference to `del_mtd_partitions'
> 
> config attached.

Thanks.  It's mtd-make-onenand-genericc-more-generic.patch.

There's a bit of a bunfight happening over on linux-mtd but I'll hang
onto the patch for now.
