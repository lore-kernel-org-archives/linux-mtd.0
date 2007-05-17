Received: from mail.shareable.org ([81.29.64.88])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hop7U-0002G0-GA
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 19:10:53 -0400
Date: Thu, 17 May 2007 23:01:44 +0100
From: Jamie Lokier <jamie@shareable.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>
Subject: Re: [PATCH] LogFS take three
Message-ID: <20070517220144.GB10756@mail.shareable.org>
References: <20070515151919.GA32510@lazybastard.org>
	<200705171708.53038.arnd@arndb.de>
	<20070517202139.GD15676@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070517202139.GD15676@lazybastard.org>
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Arnd Bergmann <arnd@arndb.de>,
	Albert Cahalan <acahalan@gmail.com>, Greg KH <greg@kroah.com>,
	linux-kernel@vger.kernel.org, Ingo Oeser <ioe-lkml@rameria.de>,
	Pekka Enberg <penberg@cs.helsinki.fi>, linux-mtd@lists.infradead.org,
	Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:
> > Almost all your static functions start with logfs_, why not this one?
> 
> Because after a while I discovered how silly it is to start every
> function with logfs_.  That prefix doesn't add much unless the function
> has global scope.  What I didn't do was remove the prefix from older
> functions.

It's handy when debugging or showing detailed backtraces.  Not that
I'm advocating it (or not), just something I've noticed in other
programs.

-- Jamie
