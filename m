Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e6bhj-0001CX-Q5
 for linux-mtd@lists.infradead.org; Mon, 23 Oct 2017 12:19:41 +0000
Date: Mon, 23 Oct 2017 15:12:40 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] spi-nor: intel-spi: Fix Kconfig dependency to LPC_ICH
Message-ID: <20171023121240.GE29656@lahna.fi.intel.com>
References: <1503648771-17514-1-git-send-email-bmeng.cn@gmail.com>
 <3af38787-4542-7a2b-36be-56c11b1b81f2@wedev4u.fr>
 <CAK8P3a3kdJiug1MaUaTzQxqayGuEGQvox-RX+NOtw0EFO7nkag@mail.gmail.com>
 <CAEUhbmXmw9uGwnAQBd2bRYvGfmCAyJFAswp33Y5LvJREB7pjmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmXmw9uGwnAQBd2bRYvGfmCAyJFAswp33Y5LvJREB7pjmA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 15, 2017 at 09:38:57PM +0800, Bin Meng wrote:
> > Also, the 'depends on EXPERT' statement looks misplaced,
> > enabling EXPERT should only be there to allow you to turn
> > extra things *off*, not to hide device drivers.
> >
> 
> I will leave this to Mika to comment the "EXPERT" usage. If we remove
> this, I think that should be another patch and the documentation of
> this driver should be updated too.

Yeah, I guess we can remove that EXPERT dependency. It was added there
exactly because I did not want ordinary users playing with the device
and inadvertently overwrite their BIOSes (if it is not protected). I
also agree it should be a separate patch. Do you want to do that or
should I?
