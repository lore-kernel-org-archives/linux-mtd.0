Received: from pizda.ninka.net ([216.101.162.242] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157CoR-0004Q1-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Jun 2001 10:07:43 +0100
From: "David S. Miller" <davem@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <15132.41562.879696.484467@pizda.ninka.net>
Date: Tue, 5 Jun 2001 02:11:54 -0700 (PDT)
To: David Woodhouse <dwmw2@infradead.org>
Cc: Chris Wedgwood <cw@f00f.org>, Jeff Garzik <jgarzik@mandrakesoft.com>,
        bjornw@axis.com, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: Re: Missing cache flush. 
In-Reply-To: <25831.991731935@redhat.com>
References: <15132.40298.80954.434805@pizda.ninka.net>
	<15132.22933.859130.119059@pizda.ninka.net>
	<13942.991696607@redhat.com>
	<3B1C1872.8D8F1529@mandrakesoft.com>
	<15132.15829.322534.88410@pizda.ninka.net>
	<20010605155550.C22741@metastasis.f00f.org>
	<25587.991730769@redhat.com>
	<25831.991731935@redhat.com>
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
 > What shall we call this function? The intuitive "flush_dcache_range" appears
 > to have already been taken.

Call it flush_ecache_full() or something.

Many architectures need to implement this anyways if they have
parity error exception handling.  Most platforms sadly do not.
Sparc64 is one of the exceptions here...

Later,
David S. Miller
davem@redhat.com
