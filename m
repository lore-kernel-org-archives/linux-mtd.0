Received: from gprs189-60.eurotel.cz ([160.218.189.60] helo=spitz.ucw.cz)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HOKtC-0003CP-LX
	for linux-mtd@lists.infradead.org; Mon, 05 Mar 2007 16:38:53 -0500
From: Pavel Machek <pavel@ucw.cz>
To: Richard Purdie <rpurdie@openedhand.com>
Subject: Re: [PATCH 6/9] mtd: Add a 'block unused' ioctl call to provide hints
	to block drivers
Message-ID: <20020101041253.GC4106@ucw.cz>
References: <1172850894.11149.126.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1172850894.11149.126.camel@localhost.localdomain>
Cc: Nick Piggin <nickpiggin@yahoo.com.au>, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org, kernel list <linux-kernel@vger.kernel.org>,
	Hugh Dickins <hugh@veritas.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Mon, 05 Mar 2007 21:38:55 -0000

Hi!

> Knowing that the data in a given block is now unused is a useful
> feature that some block drivers can take advantage of, especially 
> when dealing with devices like flash.
> 
> This adds an ioctl which allows such hints to be passed to the

Maybe Documentation/ piece would be nice if this can be called from
userspace....

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
