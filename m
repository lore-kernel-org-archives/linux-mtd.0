Received: from smtp.seznam.cz ([77.75.76.43])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ORM1V-0002NV-1i
	for linux-mtd@lists.infradead.org; Wed, 23 Jun 2010 09:13:33 +0000
Date: Wed, 23 Jun 2010 13:13:28 +0200
From: Ladislav Michl <Ladislav.Michl@seznam.cz>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] flash_eraseall: do not use exit()
Message-ID: <20100623111328.GA3059@localhost.localdomain>
References: <20100623104858.GA2442@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20100623104858.GA2442@localhost.localdomain>
Reply-To: Ladislav Michl <ladis@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 23, 2010 at 12:48:58PM +0200, Ladislav Michl wrote:
> Returning from main() instead of using exit() makes code more readable
> and smaller.

Please disregard, I'll send update based on Stanley's patches, which looks
really good and I'm just testing them...

	ladis
