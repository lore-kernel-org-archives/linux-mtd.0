Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HvDS6-0005xQ-3w
	for linux-mtd@lists.infradead.org; Mon, 04 Jun 2007 10:22:58 -0400
Date: Mon, 4 Jun 2007 10:54:48 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Patch 06/18] fs/logfs/compr.c
Message-ID: <20070604085447.GA14823@lazybastard.org>
References: <20070603183845.GA8952@lazybastard.org>
	<20070603184355.GG8952@lazybastard.org>
	<200706032358.44870.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200706032358.44870.arnd@arndb.de>
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

On Sun, 3 June 2007 23:58:43 +0200, Arnd Bergmann wrote:
> On Sunday 03 June 2007, Jörn Engel wrote:
> > +#define COMPR_LEVEL 3
> > +
> > +static DEFINE_MUTEX(compr_mutex);
> > +static struct z_stream_s stream;
> 
> Is there a particular reason to choose '3' as the only compression
> level? Should this perhaps be a per-superblock option instead?

There is no particular reason.  '3' should be a reasonable value for
most people.  If actual users want to change this value, I can make it a
mount option as well.  Right now I'm just lazy and doubt the merits.

> Also, I thought I saw discussion about making the mutex and
> stream per-superblock, but don't remember if the idea was discarded.
> If it was, you might want to add it to the won't-happen list.

It was more or less discarded.  As long as the sweet spot for LogFS is
small systems, saving memory is more important than multithreaded
performance.  Will add it to the list.

Jörn

-- 
Joern's library part 2:
http://www.art.net/~hopkins/Don/unix-haters/tirix/embarrassing-memo.html
