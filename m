Received: from youngberry.canonical.com ([91.189.89.112])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1URiRJ-0000er-Mz
 for linux-mtd@lists.infradead.org; Mon, 15 Apr 2013 12:23:18 +0000
Date: Mon, 15 Apr 2013 13:23:08 +0100
From: Luis Henriques <luis.henriques@canonical.com>
To: Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [stable] mtdchar: fix offset overflow detection
Message-ID: <20130415122308.GA12615@hercules>
References: <1365985630.2783.90.camel@deadeye.wl.decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1365985630.2783.90.camel@deadeye.wl.decadent.org.uk>
Cc: Brad Spengler <spender@grsecurity.net>,
 Linus Torvalds <torvalds@linux-foundation.org>, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, Sasha Levin <levinsasha928@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 15, 2013 at 01:27:10AM +0100, Ben Hutchings wrote:
> Brad Spengler pointed out this fix from 3.6 was missing from the earlier
> stable branches:
> 
> commit 9c603e53d380459fb62fec7cd085acb0b74ac18f
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sat Sep 8 12:57:30 2012 -0700
> 
>     mtdchar: fix offset overflow detection
> 
> It looks cleanly cherry-pickable, although I haven't yet tested this.

Thanks, I'll queue it for 3.5 as well.

Cheers,
--
Luis
