Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Ho799-0004YP-El
	for linux-mtd@lists.infradead.org; Tue, 15 May 2007 20:13:43 -0400
Date: Wed, 16 May 2007 02:09:05 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Albert Cahalan <acahalan@gmail.com>
Subject: Re: [PATCH] LogFS take three
Message-ID: <20070516000905.GE1220@lazybastard.org>
References: <20070515151919.GA32510@lazybastard.org>
	<787b0d920705151626x3a11b81csf0f3747a695131b0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <787b0d920705151626x3a11b81csf0f3747a695131b0@mail.gmail.com>
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Greg KH <greg@kroah.com>, linux-kernel@vger.kernel.org,
	Ingo Oeser <ioe-lkml@rameria.de>, Pekka Enberg <penberg@cs.helsinki.fi>,
	linux-mtd@lists.infradead.org, Jan Engelhardt <jengelh@linux01.gwdg.de>,
	linux-fsdevel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 15 May 2007 19:26:17 -0400, Albert Cahalan wrote:
> 
> Please don't forget the immutable bit. ("man lsattr")
> Having both, BSD-style, would be even better.
> The immutable bit is important for working around
> software bugs and "features" that damage files.
> 
> I also can't find xattr support.

Not forgotten, just on a different list.  Bugs beat features. :)

Jörn

-- 
Data expands to fill the space available for storage.
-- Parkinson's Law
