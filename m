Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I1ekF-0007y7-F7
	for linux-mtd@lists.infradead.org; Fri, 22 Jun 2007 04:43:57 -0400
Date: Fri, 22 Jun 2007 10:26:21 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Martin =?utf-8?Q?D=C3=A4umler?= <martin.daeumler@s2003.tu-chemnitz.de>
Subject: Re: Real-time flash simulator
Message-ID: <20070622082620.GA17988@lazybastard.org>
References: <467B77F7.2000007@informatik.tu-chemnitz.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <467B77F7.2000007@informatik.tu-chemnitz.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 22 June 2007 09:19:19 +0200, Martin Däumler wrote:
> 
> Furthermore, there are some efforts to develop a (scaleable) real-time
> capable flash file system?

LogFS certainly is real-time.  There is an upper bound to any requests
that can be calculated.  Whether you are happy with it is a different
matter, as the bound is some tens of seconds.

And I claim that you fundamentally cannot have a better upper bound.
All you can do is cheat by reserving a pool of pre-erased blocks.  As
long as the pool lasts, you can guarantee relatively low response times.
But you cannot guarantee the pool to last forever under write pressure.

Jörn

-- 
ticks = jiffies;
while (ticks == jiffies);
ticks = jiffies;
-- /usr/src/linux/init/main.c
