Received: from [207.189.120.14] (helo=smtp2.linux-foundation.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoLhu-0007y2-46
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 16:46:31 +0100
Date: Wed, 16 May 2007 08:34:08 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] LogFS take three
Message-Id: <20070516083408.dcd9dd78.akpm@linux-foundation.org>
In-Reply-To: <1179317240.2859.222.camel@shinybook.infradead.org>
References: <20070515151919.GA32510@lazybastard.org>
	<20070515133759.9ee434a2.akpm@linux-foundation.org>
	<1179317240.2859.222.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Thomas,
	Albert Cahalan <acahalan@gmail.com>, Greg KH <greg@kroah.com>,
	=?ISO-8859-1?B?SvZybg==?= Engel <joern@lazybastard.org>,
	linux-kernel@vger.kernel.org, Ingo Oeser <ioe-lkml@rameria.de>,
	Pekka Enberg <penberg@cs.helsinki.fi>, linux-mtd@lists.infradead.org,
	Jan Engelhardt <jengelh@linux01.gwdg.de>,
	linux-fsdevel@vger.kernel.org, Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 16 May 2007 20:07:18 +0800 David Woodhouse <dwmw2@infradead.org> wrote:

> > It's strange and a bit regrettable that an fs would have dependency on MTD,
> > really.
> 
> Why? Other file systems has dependencies on BLOCK or on NET. It seems
> entirely normal to me.

Reduced testability, mainly. Also potentially reduced usefulness.
