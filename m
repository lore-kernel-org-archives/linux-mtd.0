Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoMdw-0002nA-73
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 12:46:29 -0400
Date: Wed, 16 May 2007 18:41:59 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] LogFS take three
Message-ID: <20070516164158.GB8113@lazybastard.org>
References: <20070515151919.GA32510@lazybastard.org>
	<20070515133759.9ee434a2.akpm@linux-foundation.org>
	<1179317240.2859.222.camel@shinybook.infradead.org>
	<20070516083408.dcd9dd78.akpm@linux-foundation.org>
	<1179330596.2859.248.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1179330596.2859.248.camel@shinybook.infradead.org>
Cc: Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Albert Cahalan <acahalan@gmail.com>,
	Greg KH <greg@kroah.com>, linux-kernel@vger.kernel.org,
	Ingo Oeser <ioe-lkml@rameria.de>, Pekka Enberg <penberg@cs.helsinki.fi>,
	linux-mtd@lists.infradead.org, Jan Engelhardt <jengelh@linux01.gwdg.de>,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 16 May 2007 23:49:55 +0800, David Woodhouse wrote:
> 
> Utility is a factor of the underlying design -- a filesystem designed
> for flash really isn't suited to block devices.

I can think of at least three examples where LogFS would indeed make
sense on block devices.

Jörn

-- 
Happiness isn't having what you want, it's wanting what you have.
-- unknown
