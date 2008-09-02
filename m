Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KaZTP-0003rk-4I
	for linux-mtd@lists.infradead.org; Tue, 02 Sep 2008 17:15:23 +0000
Date: Tue, 2 Sep 2008 19:15:01 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
Message-ID: <20080902171500.GC19618@logfs.org>
References: <48AD00C4.6060302@gmail.com>
	<Pine.LNX.4.64.0808221650500.17105@vixen.sonytel.be>
	<6934efce0808220951i5a2cd6f9t70f9c522eae6f1d6@mail.gmail.com>
	<Pine.LNX.4.64.0808281737150.28552@vixen.sonytel.be>
	<Pine.LNX.4.64.0809021725480.3986@vixen.sonytel.be>
	<6934efce0809020944s36dd7f82wec77c4189ef1b114@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6934efce0809020944s36dd7f82wec77c4189ef1b114@mail.gmail.com>
Cc: cotte@de.ibm.com, linux-embedded@vger.kernel.org, nickpiggin@yahoo.com.au,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com,
	Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2 September 2008 09:44:19 -0700, Jared Hulbert wrote:
> 
> How is one expected to read those last 4 bytes of a loopbacked file?
> Are they unreadable?  We can add the padding.   I am just wondering if
> this is a bug or a known limitation in the loopback handling or if
> there is a different safer way of reading block devs with truncated
> last blocks.

Can't you just include the final magic into the last block, thereby
making the size a clean multiple of 4k?  It looks as if you have some
padding before the magic anyway.  So you just have to make sure the
padding is at least 4 bytes and write the magic to the end of it.  Apart
from solving this bug, it should also save you some space. ;)


Jörn

-- 
Invincibility is in oneself, vulnerability is in the opponent.
-- Sun Tzu
