Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O77rJ-0000y9-Ps
	for linux-mtd@lists.infradead.org; Wed, 28 Apr 2010 14:03:26 +0000
Subject: Re: [PATCH] Fix a huge latency problem in the MTD CFI and LPDDR
	flash drivers.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
In-Reply-To: <20100422230737.95e441ef.akpm@linux-foundation.org>
References: <1271623604.7050.0.camel@wall-e.seibold.net>
	<1271787391.16051.4.camel@wall-e.seibold.net>
	<1272002584.5347.2.camel@wall-e.seibold.net>
	<20100422230737.95e441ef.akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 28 Apr 2010 16:58:16 +0300
Message-ID: <1272463096.7750.41.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Stefani Seibold <stefani@seibold.net>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-04-22 at 23:07 -0400, Andrew Morton wrote:
> On Fri, 23 Apr 2010 08:03:04 +0200 Stefani Seibold <stefani@seibold.net> wrote:
> 
> > David did not respond to my request since more than a month. Can u apply
> > the patch to linux next?
> 
> The patch is rather too fundamental for there to be benefit in me
> carrying it.
> 
> Hopefully Artem can look at it soon, although he's somewhat busy with
> real-life things at present.

Yeah, the patch is in my l2 tree, and David should take it to
mtd-2.6.git at some point, so it will probably be in 2.6.35, unless
David misses the merge window :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
