Received: from pasmtpb.tele.dk ([80.160.77.98])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KZ0YP-0005EQ-Us
	for linux-mtd@lists.infradead.org; Fri, 29 Aug 2008 09:46:07 +0000
Date: Fri, 29 Aug 2008 11:45:38 +0200
From: Jens Axboe <jens.axboe@oracle.com>
To: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Subject: Re: MTD kobject warnings due to block layer changes
Message-ID: <20080829094537.GR20055@kernel.dk>
References: <20080829065029.GK20055@kernel.dk>
	<20080829165542L.fujita.tomonori@lab.ntt.co.jp>
	<20080829080123.GO20055@kernel.dk>
	<20080829171936Z.fujita.tomonori@lab.ntt.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080829171936Z.fujita.tomonori@lab.ntt.co.jp>
Cc: linux-ide@vger.kernel.org, mano@roarinelk.homelinux.net,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 29 2008, FUJITA Tomonori wrote:
> On Fri, 29 Aug 2008 10:01:24 +0200
> Jens Axboe <jens.axboe@oracle.com> wrote:
> 
> > What about eg ide-cd?
> 
> I'm always SCSI biased.

:-)

Thanks, applied!

-- 
Jens Axboe
