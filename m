Received: from 1wt.eu ([62.212.114.60])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HxSym-0003pt-UE
	for linux-mtd@lists.infradead.org; Sun, 10 Jun 2007 15:21:39 -0400
Date: Sun, 10 Jun 2007 21:20:16 +0200
From: Willy Tarreau <w@1wt.eu>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>
Subject: Re: [Patch 15/18] fs/logfs/super.c
Message-ID: <20070610192016.GB5755@1wt.eu>
References: <20070603183845.GA8952@lazybastard.org>
	<200706101827.50948.arnd@arndb.de>
	<20070610173828.GA32619@lazybastard.org>
	<200706102033.11211.arnd@arndb.de>
	<20070610191015.GC32619@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070610191015.GC32619@lazybastard.org>
Cc: akpm@osdl.org, David Weinehall <tao@acc.umu.se>,
	Dongjun Shin <djshin90@gmail.com>, Kyle Moffett <mrmacman_g4@mac.com>,
	linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ulisses Furquim <ulissesf@gmail.com>, CaT <cat@zip.com.au>,
	Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Roland Dreier <rdreier@cisco.com>, Arnd Bergmann <arnd@arndb.de>,
	Jamie Lokier <jamie@shareable.org>, Pekka Enberg <penberg@cs.helsinki.fi>,
	Jan Engelhardt <jengelh@linux01.gwdg.de>,
	Thomas Gleixner <tglx@linutronix.de>, Bill Davidsen <davidsen@tmr.com>,
	Albert Cahalan <acahalan@gmail.com>,
	John Stoffel <john@stoffel.org>, linux-kernel@vger.kernel.org,
	Ondrej Zajicek <santiago@crfreenet.org>, linux-fsdevel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jun 10, 2007 at 09:10:15PM +0200, Jörn Engel wrote:
 
> I don't think logfs on block devices makes too much sense yet, so my
> personal priority for this is low.  Still, an obvious improvement.

I see it as a good candidate to replace JFFS2 on CompactFlash. That
one is becoming painfully slow with nowadays' smallest devices (around
64..128 MB). But since it considerably reduces the number of writes,
and it can transparently compress, it's still worth using it in some
environments.

Regards,
Willy
