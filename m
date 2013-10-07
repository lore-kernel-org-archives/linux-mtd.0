Received: from longford.logfs.org ([213.229.74.203])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTFJG-0004vB-AC
 for linux-mtd@lists.infradead.org; Mon, 07 Oct 2013 18:13:35 +0000
Date: Mon, 7 Oct 2013 12:53:44 -0400
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: phram: Make phram 64-bit compatible
Message-ID: <20131007165344.GA10162@logfs.org>
References: <524C4CF5.7060601@nsn.com>
 <20131007174943.GB23337@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131007174943.GB23337@ld-irv-0074.broadcom.com>
Cc: Joern Engel <joern@lazybastard.org>,
 Alexander Sverdlin <alexander.sverdlin@nsn.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 7 October 2013 10:49:43 -0700, Brian Norris wrote:
> 
> [After more research:] It looks like this topic may be the subject of
> some long-past flame wars. If I am digging up past demons, then I'd
> prefer to let sleeping Balrogs lie.

Most of the time it is obvious from context whether you want base-1000
or base-1024 numbers.  So in the common case the extra letter is plain
annoying.  In less common cases it matters a lot and lack of the extra
letter is rather irritating.

One possible solution would be to have three suffixes.  Ki for
base-1024, Kd for base-1000 and K for "I don't care, you decide for
me".  But I am sure that would simply cause another round of
flamewars.

It is not a hard technical problem.  As a result, noone on this list
has the required expertise to solve it.

Jörn

--
Money can buy bandwidth, but latency is forever.
-- John R. Mashey
