Received: from pizda.ninka.net ([216.101.162.242] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15768X-0003vm-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 03:00:01 +0100
From: "David S. Miller" <davem@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <15132.15898.969850.255800@pizda.ninka.net>
Date: Mon, 4 Jun 2001 19:04:10 -0700 (PDT)
To: David Woodhouse <dwmw2@infradead.org>
Cc: Jeff Garzik <jgarzik@mandrakesoft.com>, bjornw@axis.com,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: Missing cache flush. 
In-Reply-To: <14147.991697362@redhat.com>
References: <3B1C1872.8D8F1529@mandrakesoft.com>
	<13942.991696607@redhat.com>
	<14147.991697362@redhat.com>
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

David Woodhouse writes:
 > > What should it do on i386?  mb()? 
 > 
 > For it to have any use in the situation I described, it would need to 
 > writeback and invalidate the dcache for the affected range. It doesn't seem 
 > to do so, so it seems that it isn't what I require.

It only needs to do that on cpus where the cache is not consistent
with the rest of the system.  x86 caches are fully consistent with the
rest of the system, thus no flushing necessary.

Later,
David S. Miller
davem@redhat.com
