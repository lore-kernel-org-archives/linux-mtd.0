Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1ObWjq-0005Ba-Tp
	for linux-mtd@lists.infradead.org; Wed, 21 Jul 2010 10:41:23 +0000
Subject: Re: [patch 1/4] mtd/sst25l: check for null consistently
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: akpm@linux-foundation.org
In-Reply-To: <201007202224.o6KMO0oR021381@imap1.linux-foundation.org>
References: <201007202224.o6KMO0oR021381@imap1.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Jul 2010 13:34:12 +0300
Message-ID: <1279708452.2306.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, andre@bluewatersys.com, dwmw2@infradead.org,
	error27@gmail.com
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-07-20 at 15:23 -0700, akpm@linux-foundation.org wrote:
> From: Dan Carpenter <error27@gmail.com>
> 
> The rest of the function assumes that "data" can be null.  I don't know
> the code well enough to say whether it can actually be null, but there is
> no harm in checking here.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Cc: Andre Renaud <andre@bluewatersys.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

This patch is also in my l2-mtd-2.6 / master tree.

The tree: http://git.infradead.org/users/dedekind/l2-mtd-2.6.git

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
