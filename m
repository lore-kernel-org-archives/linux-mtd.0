Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NZiLS-00011q-6j
	for linux-mtd@lists.infradead.org; Tue, 26 Jan 2010 10:08:30 +0000
Subject: Re: UBIFS assert failed in ubifs_dirty_inode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matt Mackall <mpm@selenic.com>
In-Reply-To: <1264500214.3867.21.camel@localhost>
References: <4B591573.60602@theptrgroup.com>
	<1264480808.2401.78.camel@localhost.localdomain>
	<1264484928.3536.1017.camel@calx> <1264500214.3867.21.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 26 Jan 2010 12:07:41 +0200
Message-ID: <1264500461.3867.27.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jeff Angielski <jeff@theptrgroup.com>, linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-01-26 at 12:03 +0200, Artem Bityutskiy wrote:
> On Mon, 2010-01-25 at 23:48 -0600, Matt Mackall wrote:
> > Hmm. I'd just as soon drop it entirely. Here's a patch. Herbert, you
> > want to send this through your crypto tree?
> > 
> > 
> > random: drop weird m_time/a_time manipulation
> > 
> > No other driver does anything remotely like this that I know of except
> > for the tty drivers, and I can't see any reason for random/urandom to do
> > it. In fact, it's a (trivial, harmless) timing information leak. And
> > obviously, it generates power- and flash-cycle wasting I/O, especially
> > if combined with something like hwrngd. Also, it breaks ubifs's
> > expectations.
> > 
> > Signed-off-by: Matt Mackall <mpm@selenic.com>

Just in case anyone wonders where this came from, here is the beginning
of the thread:

http://lists.infradead.org/pipermail/linux-mtd/2010-January/028727.html

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
