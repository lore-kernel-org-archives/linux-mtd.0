Received: from moutng.kundenserver.de ([212.227.126.186])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NCXsi-0000HD-2W
	for linux-mtd@lists.infradead.org; Mon, 23 Nov 2009 12:19:05 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Joern Engel <joern@logfs.org>
Subject: Re: [PATCH 0/17] [LogFS] New flash filesystem
Date: Mon, 23 Nov 2009 13:18:39 +0100
References: <20091120181113.GA2159@logfs.org>
In-Reply-To: <20091120181113.GA2159@logfs.org>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <200911231318.39685.arnd@arndb.de>
Cc: linux-fsdevel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 20 November 2009, Joern Engel wrote:
> Mails are purely for review and comments.  If this is deemed
> merge-ready, please the git tree at
> http://git.kernel.org/?p=linux/kernel/git/joern/logfs.git
> instead.

I think merging is overdue, the code looks great and if you're
happy with it to go in, it's hard for anyone to argue with
that.

It should definitely be included in linux-next, and I guess it
should have been in there for some time, to get better
compile-time coverage across architectures, and some
more testing.

I can't find it in linux-next right now, but I could be
looking at the wrong stuff again, as I have before.

	Arnd <><
