Received: from yx-out-1718.google.com ([74.125.44.156])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KWafy-0005KY-Gi
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 17:43:54 +0000
Received: by yx-out-1718.google.com with SMTP id 3so398081yxi.72
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Aug 2008 10:43:54 -0700 (PDT)
Message-ID: <6934efce0808221043i3d463ac2gb54b7dd4cfde4b81@mail.gmail.com>
Date: Fri, 22 Aug 2008 10:43:52 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH 06/10] AXFS: axfs_super.c
In-Reply-To: <200808221852.38950.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <48AD0101.4020505@gmail.com> <48AE19AD.1020209@lougher.demon.co.uk>
	<6934efce0808212005h30fa16d8w48833e8a0becfd8c@mail.gmail.com>
	<200808221852.38950.arnd@arndb.de>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	Phillip Lougher <phillip@lougher.demon.co.uk>,
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

> It certainly sounds like something for your medium-term TODO list,
> although I wouldn't think of it as a show-stopper.

Maybe.  It more of a feature rather than a bug.  It makes stat() and
such fast.  The trade off is RAM...
