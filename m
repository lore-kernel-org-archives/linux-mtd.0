Received: from smtp1.cern.ch ([137.138.128.38])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157K9L-0004zl-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 17:57:48 +0100
Date: Tue, 5 Jun 2001 19:01:28 +0200
From: Jamie Lokier <lk@tantalophile.demon.co.uk>
To: "David S. Miller" <davem@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Chris Wedgwood <cw@f00f.org>,
        Jeff Garzik <jgarzik@mandrakesoft.com>, bjornw@axis.com,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: Missing cache flush.
Message-ID: <20010605190128.A12204@pcep-jamie.cern.ch>
References: <15132.22933.859130.119059@pizda.ninka.net> <13942.991696607@redhat.com> <3B1C1872.8D8F1529@mandrakesoft.com> <15132.15829.322534.88410@pizda.ninka.net> <20010605155550.C22741@metastasis.f00f.org> <25587.991730769@redhat.com> <15132.40298.80954.434805@pizda.ninka.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15132.40298.80954.434805@pizda.ninka.net>; from davem@redhat.com on Tue, Jun 05, 2001 at 01:50:50AM -0700
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David S. Miller wrote:
> Basically if you know the L2 cache size and the assosciativity you can
> do this as long as you can get a "2 * L2 cache size * assosciativity"
> piece of contiguous physical memory.  When you need this "simon says"
> flush, you basically read this physical memory span and this will
> guarentee that all dirty data has exited the L2 cache.

Whether this works depends on the cache line replacement policy.  It
will always work with LRU, for example, and probably everything else
that exists.  But it is not guaranteed, is it?

-- Jamie
