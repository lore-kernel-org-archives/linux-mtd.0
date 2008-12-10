Received: from nf-out-0910.google.com ([64.233.182.184])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LATWN-0001l4-DB
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 18:10:52 +0000
Received: by nf-out-0910.google.com with SMTP id d21so124341nfb.22
	for <linux-mtd@lists.infradead.org>;
	Wed, 10 Dec 2008 10:10:50 -0800 (PST)
Message-ID: <49400626.8030408@gmail.com>
Date: Wed, 10 Dec 2008 10:10:46 -0800
From: Don Mullis <don.mullis@gmail.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: CONFIG_MTD_UBI_DEBUG_DISABLE_BGT=y corrupts slab?
References: <493F6ED2.5080402@gmail.com> <1228905714.13686.236.camel@sauron>
In-Reply-To: <1228905714.13686.236.camel@sauron>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> Hmm, I ran integrity test on UBIFS and had this UBI config option
> enabled (as well ass emulate write and erase errors options enabled)
> yesterday, and it worked fine - not slab problems and UBI was able to
> recover from all errors, so the integrity check test worked fine.
> 
> But that was the latest UBIFS from the ubifs-2.6.git tree.

Thanks for testing, that helps me narrow the search.

> We have UBI/UBIFS backport trees, could you try ubifs-v2.6.26.git
> please? It has all the UBI/UBIFS patches back-ported. Or you may just
> take the patches from ubifs-v2.6.26.git and apply them to your tree.

I assume you meant "ubifs-v2.6.25.git" -- I'm stuck at 2.6.25 for
the present due to some out-of-tree drivers.  I'll try extracting
patches from git://git.infradead.org/~dedekind/ubifs-v2.6.25.git
and applying them to my tree.
