Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HvDBG-0005EA-Pl
	for linux-mtd@lists.infradead.org; Mon, 04 Jun 2007 10:06:26 -0400
Date: Mon, 4 Jun 2007 11:12:45 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Patch 04/18] include/linux/logfs.h
Message-ID: <20070604091245.GF14823@lazybastard.org>
References: <20070603183845.GA8952@lazybastard.org>
	<20070603184205.GE8952@lazybastard.org>
	<200706032342.27252.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200706032342.27252.arnd@arndb.de>
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

On Sun, 3 June 2007 23:42:25 +0200, Arnd Bergmann wrote:
> On Sunday 03 June 2007, Jörn Engel wrote:
> > +struct logfs_je_spillout {
> > +       __be64  so_segment[0];
> > +}__packed;
> 
> All the on-disk data structures you define in this file have naturally
> aligned members, so the __packed attribute is not needed.

Amen.  It is purely paranoia and I don't even know who is out to get me.

> However, I think it causes gcc to generate larger and slower code
> on some architectures, because now it has to assume that the data
> structure itself has no more than byte alignment.
> 
> I'd simply remove all instances of __packed therefore. In order
> to verify that you got it right in all cases, build with
> '-Wpadded -Wpacked'.

Fine with me.  Will do.

Jörn

-- 
Ninety percent of everything is crap.
-- Sturgeon's Law
