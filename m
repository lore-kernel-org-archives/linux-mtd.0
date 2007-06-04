Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HvDBo-0005EP-Tc
	for linux-mtd@lists.infradead.org; Mon, 04 Jun 2007 10:06:52 -0400
Date: Mon, 4 Jun 2007 11:07:11 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Patch 14/18] fs/logfs/segment.c
Message-ID: <20070604090711.GD14823@lazybastard.org>
References: <20070603183845.GA8952@lazybastard.org>
	<20070603184850.GO8952@lazybastard.org>
	<200706040021.43485.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200706040021.43485.arnd@arndb.de>
Cc: akpm@osdl.org, David Weinehall <tao@acc.umu.se>,
	Dongjun Shin <djshin90@gmail.com>, Kyle Moffett <mrmacman_g4@mac.com>,
	linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ulisses Furquim <ulissesf@gmail.com>, CaT <cat@zip.com.au>,
	Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Roland Dreier <rdreier@cisco.com>,
	Jamie Lokier <jamie@shareable.org>, Pekka Enberg <penberg@cs.helsinki.fi>,
	Jan Engelhardt <jengelh@linux01.gwdg.de>,
	Thomas Gleixner <tglx@linutronix.de>, Bill Davidsen <davidsen@tmr.com>,
	Albert Cahalan <acahalan@gmail.com>,
	John Stoffel <john@stoffel.org>, linux-kernel@vger.kernel.org,
	Ondrej Zajicek <santiago@crfreenet.org>, linux-fsdevel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 4 June 2007 00:21:41 +0200, Arnd Bergmann wrote:
> On Sunday 03 June 2007, Jörn Engel wrote:
> > +static DEFINE_MUTEX(compr_mutex);
> > +
> 
> It seems you define a static compre_mutex in both segment.c and in compr.c,
> and always lock them both at the same time. Is that a correct observation?
> Is it intentional, or an oversight on your side?

Lame coding on my side.  Seems to have gone lost in my notes, but this
mutex should get removed and the protected memory made per-superblock.
Unlike the zlib workspace it does not consume 300k, so there is no
excuse for it here.

Jörn

-- 
Joern's library part 9:
http://www.scl.ameslab.gov/Publications/Gus/TwelveWays.html
