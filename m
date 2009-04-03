Received: from moutng.kundenserver.de ([212.227.126.188])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LphwO-0005c1-3e
	for linux-mtd@lists.infradead.org; Fri, 03 Apr 2009 11:52:15 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Kevin Cernekee <kpc.mtd@gmail.com>
Subject: Re: [PATCHv5] MTD: New ioctl calls for >4GiB device support
Date: Fri, 3 Apr 2009 13:52:02 +0200
References: <a95a62fe0904021750m7fd01695q3724be49b66a82d@mail.gmail.com>
In-Reply-To: <a95a62fe0904021750m7fd01695q3724be49b66a82d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200904031352.03271.arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 03 April 2009, Kevin Cernekee wrote:
> 2) Use __u64 to store the MEMREADOOB64/MEMWRITEOOB64 user pointer, so
> that no compat_ioctl handler is needed.


Thanks for the change,

Acked-by: Arnd Bergmann <arnd@arndb.de>
