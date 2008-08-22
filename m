Received: from yx-out-1718.google.com ([74.125.44.153])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWaeu-0005G4-PQ
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 17:42:49 +0000
Received: by yx-out-1718.google.com with SMTP id 3so397776yxi.72
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Aug 2008 10:42:48 -0700 (PDT)
Message-ID: <6934efce0808221042u6d0c21eft6f8cdf67f0217a85@mail.gmail.com>
Date: Fri, 22 Aug 2008 10:42:47 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Phillip Lougher" <phillip@lougher.demon.co.uk>
Subject: Re: [PATCH 06/10] AXFS: axfs_super.c
In-Reply-To: <48AEF976.1010705@lougher.demon.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD0101.4020505@gmail.com> <48AE19AD.1020209@lougher.demon.co.uk>
	<6934efce0808212005h30fa16d8w48833e8a0becfd8c@mail.gmail.com>
	<200808221852.38950.arnd@arndb.de>
	<48AEF976.1010705@lougher.demon.co.uk>
Cc: cotte@de.ibm.com, Arnd Bergmann <arnd@arndb.de>,
	linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	=?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>,
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

> Squashfs and AXFS should be seen as complementary filesystems, and there
> should be room in the Linux kernel for both.

Exactly.  We had different design assumptions.  One is not _better_
than the other, they are just different.
