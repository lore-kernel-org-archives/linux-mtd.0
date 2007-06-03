Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HuvgI-00034m-0T
	for linux-mtd@lists.infradead.org; Sun, 03 Jun 2007 15:25:02 -0400
Date: Sun, 3 Jun 2007 21:19:17 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, akpm@osdl.org,
	Sam Ravnborg <sam@ravnborg.org>, John Stoffel <john@stoffel.org>,
	David Woodhouse <dwmw2@infradead.org>, Jamie Lokier <jamie@shareable.org>,
	Artem Bityutskiy <dedekind@infradead.org>, CaT <cat@zip.com.au>,
	Jan Engelhardt <jengelh@linux01.gwdg.de>,
	Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	David Weinehall <tao@acc.umu.se>, Arnd Bergmann <arnd@arndb.de>,
	Willy Tarreau <w@1wt.eu>, Kyle Moffett <mrmacman_g4@mac.com>,
	Dongjun Shin <djshin90@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Bill Davidsen <davidsen@tmr.com>, Thomas Gleixner <tglx@linutronix.de>,
	Albert Cahalan <acahalan@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>,
	Roland Dreier <rdreier@cisco.com>, Ondrej Zajicek <santiago@crfreenet.org>,
	Ulisses Furquim <ulissesf@gmail.com>
Subject: Re: LogFS take four
Message-ID: <20070603191917.GB12110@lazybastard.org>
References: <20070603183845.GA8952@lazybastard.org>
	<20070603191744.GU2649@lug-owl.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070603191744.GU2649@lug-owl.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 3 June 2007 21:17:44 +0200, Jan-Benedict Glaw wrote:
> On Sun, 2007-06-03 20:38:46 +0200, Jörn Engel <joern@lazybastard.org> wrote:
> > This round the patch is split into file-sized hunks.  There actually
> > seem to be kernel developers not manly enough to digest 6000+ lines of
> > code at once.  An I thought I was the only wimp around.
> 
> Though it would be nice to have them as a pile of patches so that
> after applying them one-by-one, the kernel still compiles.
> 
> Eg. if the first patches wire up the new feature into the build
> system, but the actual .c file aren't yet there, that won't compile
> and thus make git-bisect'ing harder...

The patch split was done purely for review purposes.  A single patch
will be merged, whenever people agree that it's ready.

If you want a single patch for testing, you will find the current one
here:
http://logfs.org/logfs/patches

Jörn

-- 
If System.PrivateProfileString("",
"HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <>
"" Then  CommandBars("Macro").Controls("Security...").Enabled = False
-- from the Melissa-source
