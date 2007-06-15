Received: from [212.112.238.170] (helo=longford.lazybastard.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HzB0Z-0005Zn-JG
	for linux-mtd@lists.infradead.org; Fri, 15 Jun 2007 13:34:32 +0100
Date: Fri, 15 Jun 2007 13:10:42 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Evgeniy Polyakov <johnpol@2ka.mipt.ru>
Subject: Re: LogFS take four
Message-ID: <20070615111041.GA6791@lazybastard.org>
References: <20070603183845.GA8952@lazybastard.org>
	<20070615083732.GA20361@2ka.mipt.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070615083732.GA20361@2ka.mipt.ru>
Cc: akpm@osdl.org, David Weinehall <tao@acc.umu.se>,
	Dongjun Shin <djshin90@gmail.com>, Kyle Moffett <mrmacman_g4@mac.com>,
	linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ulisses Furquim <ulissesf@gmail.com>, CaT <cat@zip.com.au>,
	Roland Dreier <rdreier@cisco.com>, Arnd Bergmann <arnd@arndb.de>,
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

On Fri, 15 June 2007 12:37:32 +0400, Evgeniy Polyakov wrote:
> On Sun, Jun 03, 2007 at 08:38:46PM +0200, Jörn Engel (joern@lazybastard.org) wrote:
> > This round the patch is split into file-sized hunks.  There actually
> > seem to be kernel developers not manly enough to digest 6000+ lines of
> > code at once.  An I thought I was the only wimp around.
> > 
> > Again, anyone giving comments in the last round is on Cc:.
> > 
> > I'll try to respond to comments but the next round of patches may take a
> > while longer, due to other responsibilities.
> 
> Hi Jorn.
> 
> Sorry for late reply (and wrong non-utf latter in the name :).

I have been called worse. :)

> I have couple of minor nits I will answer another mails, but in general
> I think it should be included in -mm so that people could start using
> it report real bugs, but not handwaving about possible problems.

Thank you for the confidence.

Jörn

-- 
Mundie uses a textbook tactic of manipulation: start with some
reasonable talk, and lead the audience to an unreasonable conclusion.
-- Bruce Perens
