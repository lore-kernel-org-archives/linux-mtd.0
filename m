Received: from smtp10.smtpout.orange.fr ([80.12.242.132]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKIm8-00025j-PH
 for linux-mtd@lists.infradead.org; Mon, 12 Jun 2017 06:24:34 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [PATCH] mtd: Fallback to ->_read/write_oob() when ->_read/write()
 is missing
References: <20170611204255.18622-1-boris.brezillon@free-electrons.com>
Date: Mon, 12 Jun 2017 08:24:04 +0200
In-Reply-To: <20170611204255.18622-1-boris.brezillon@free-electrons.com>
 (Boris Brezillon's message of "Sun, 11 Jun 2017 22:42:55 +0200")
Message-ID: <87poe9vi4b.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> Some MTD sublayers/drivers are implementing ->_read/write_oob() and
> providing dummy wrappers for their ->_read/write() implementations.
> Let the core handle this case instead of duplicating the logic.

Hi Boris,

Unless I'm wrong, you're using mtd_oob_ops structures allocated on the
stack. This means they are not filled with 0/NULL at initialization, and
therefore the code is not equivalent to what was before in docg3 for example.

For example, oobbuf field needs initialization. Is it taken care in the core ?

Cheers.

--
Robert
