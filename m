Received: from pizda.ninka.net ([216.101.162.242] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1577xx-00045X-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 04:57:13 +0100
From: "David S. Miller" <davem@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <15132.22933.859130.119059@pizda.ninka.net>
Date: Mon, 4 Jun 2001 21:01:25 -0700 (PDT)
To: Chris Wedgwood <cw@f00f.org>
Cc: Jeff Garzik <jgarzik@mandrakesoft.com>,
        David Woodhouse <dwmw2@infradead.org>, bjornw@axis.com,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: Missing cache flush.
In-Reply-To: <20010605155550.C22741@metastasis.f00f.org>
References: <13942.991696607@redhat.com>
	<3B1C1872.8D8F1529@mandrakesoft.com>
	<15132.15829.322534.88410@pizda.ninka.net>
	<20010605155550.C22741@metastasis.f00f.org>
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

Chris Wedgwood writes:
 > On Mon, Jun 04, 2001 at 07:03:01PM -0700, David S. Miller wrote:
 > 
 >     The x86 doesn't have dumb caches, therefore it really doesn't
 >     need to flush anything.  Maybe a mb(), but that is it.
 > 
 > What if the memory is erased underneath the CPU being aware of this?
 > In such a way ig generates to bus traffic...

This doesn't happen on x86.  The processor snoops all transactions
done by other agents to/from main memory.  The processor caches are
always up to date.

Later,
David S. Miller
davem@redhat.com
