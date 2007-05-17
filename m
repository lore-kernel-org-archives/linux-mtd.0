Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Honcm-0000pe-AY
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 17:35:05 -0400
Date: Thu, 17 May 2007 23:30:39 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] LogFS take three
Message-ID: <20070517213038.GF15676@lazybastard.org>
References: <20070515151919.GA32510@lazybastard.org>
	<200705171708.53038.arnd@arndb.de>
	<20070517202139.GD15676@lazybastard.org>
	<200705172300.21694.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200705172300.21694.arnd@arndb.de>
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
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

On Thu, 17 May 2007 23:00:20 +0200, Arnd Bergmann wrote:
> 
> Just using nanoseconds probably doesn't gain you much after all
> then. You could however just have separate 32 bit fields in the
> inode for seconds and nanoseconds, that will result in the exact
> same layout that you have right now, but won't require a conversion
> function.

I could also have a 30bit and a 34bit field.  30bit is enough for
nanoseconds.  So many options.

Jörn

-- 
Time? What's that? Time is only worth what you do with it.
-- Theo de Raadt
